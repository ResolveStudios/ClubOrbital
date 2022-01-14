Shader "SkelGeomAnim/Memory"
{
    Properties
    {
        [NoScaleOffset]_AnimTex("Animation Texture", 2D) = "white" {}
        [NoScaleOffset]_VertPosTex("Vert Pos Texture", 2D) = "white" {}
        [NoScaleOffset]_BoneIndexTex("Bone Index Texture", 2D) = "white" {}
        [NoScaleOffset]_BoneWeitghTex("Bone Weight Texture", 2D) = "white" {}

        _TimeMax("Time Max", FLoat) = 100
        _StartFrame("Start Frame", Float) = 1
        _FrameCount("Frame Count", Float) = 699
        _OffsetSeconds("Offset Seconds", Float) = 0
        _PixelsPerFrame("Pixels Per Frame", Float) = 192

        _Gravity("Gravity", Vector) = (0, 0, 0, 0)
        _GravityY("GravityY", Float) = -0.5
        _Damper("Damper", Vector) = (1, 1, 0, 0)  




    }
    SubShader
    {
        Name "Update"

        Tags { "RenderType"="Opaque" }
        LOD 100
        Cull Off ZWrite Off ZTest Always


        Pass
        {

            CGPROGRAM
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
            #include "UnityCustomRenderTexture.cginc"
            #include "SimplexNoiseGrad3D.cginc"
            #include "Common.cginc"
            #include "Layout.cginc"

            sampler2D _AnimTex, _VertPosTex, _BoneIndexTex, _BoneWeitghTex;
            float4 _AnimTex_TexelSize, _VertPosTex_TexelSize, _BoneIndexTex_TexelSize, _BoneWeitghTex_TexelSize;

            #define dt (float)1/120
            // #define dt unity_DeltaTime.x
            #define gravity 9.81

            float3 _Gravity;
            float _GravityY;
            float2 _Damper;

            uint _StartFrame;
            uint _FrameCount;
            uint _OffsetSeconds;
            uint _PixelsPerFrame;
            float _TimeMax;

            float4 GetUV(uint index, float4 texelSize)
            {
                float col = index % (uint)texelSize.z + 0.5;
                float row = index / (uint)texelSize.z + 0.5;

                return float4(col  / texelSize.z, row / texelSize.w, 0.0, 0.0);
            }

            float4x4 GetMatrix(uint startIndex, float boneIndex, sampler2D tex, float4 texelSize)
            {
                uint index = startIndex + boneIndex * 3;

                float4 row0 = tex2Dlod(tex, GetUV(index, texelSize));
                float4 row1 = tex2Dlod(tex, GetUV(index + 1, texelSize));
                float4 row2 = tex2Dlod(tex, GetUV(index + 2, texelSize));
                float4 row3 = float4(0.0, 0.0, 0.0, 1.0);

                return float4x4(row0, row1, row2, row3);
            }


            inline float4 GetMotPos(float2 st, uint frame)
            {
                float4 vertPos = tex2D(_VertPosTex, st);
                vertPos.w = 1.0f;

                float4 boneIndex = tex2D(_BoneIndexTex, st);
                float4 boneWeight = tex2D(_BoneWeitghTex, st);

                uint currentFrame = _StartFrame + frame % _FrameCount;
                uint clampedIndex = currentFrame * _PixelsPerFrame;
                float4x4 bone1Mat = GetMatrix(clampedIndex, boneIndex.x, _AnimTex, _AnimTex_TexelSize);
                float4x4 bone2Mat = GetMatrix(clampedIndex, boneIndex.y, _AnimTex, _AnimTex_TexelSize);
                float4x4 bone3Mat = GetMatrix(clampedIndex, boneIndex.z, _AnimTex, _AnimTex_TexelSize);
                float4x4 bone4Mat = GetMatrix(clampedIndex, boneIndex.w, _AnimTex, _AnimTex_TexelSize);

                float4 pos = 
                    mul(bone1Mat, vertPos) * boneWeight.x + 
                    mul(bone2Mat, vertPos) * boneWeight.y + 
                    mul(bone3Mat, vertPos) * boneWeight.z + 
                    mul(bone4Mat, vertPos) * boneWeight.w;

                return float4(pos.xyz, boneIndex.x);
            }

            inline float4 GetMotVel(float2 st, uint frame)
            {
                float dt2 = 1.0 / 30.0;
                float4 pos = GetMotPos(st, frame);
                float4 posPrev = GetMotPos(st, frame - 1);
                return (pos - posPrev) / dt2;

            }

            inline float4 InitParticlePos(float4 motionPos, float2 uv, float frame)
            {

                motionPos = GetMotPos(uv *2, frame);
                float4 particlePos = motionPos;
                particlePos.w = 0.5 + UVRandom(motionPos.xy, 17) * 0.5;
                particlePos.w = 1.0;

                return particlePos;
            }

            inline float4 InitParticleVel(float4 motionVel, float2 uv)
            {
                float4 particleVel = motionVel;
                particleVel.xyz *= 1.0 - UVRandom(uv, 17) * 0.5;

                particleVel.w = length(particleVel.xyz); // initial velocity 
                
                
                // ,particleVel.xyz = 0;


                return particleVel;
            }
            
            inline float4 UpdateParticlePos(float4 particlePos, float4 particleVel, float2 uv)
            {

                float2 _Life = float2(2, 2);
                float lv = max(length(particleVel.xyz), 1e-6);
                
                particleVel.xyz *= min(lv, _Damper.x) / lv;
                // particleVel.xyz *= _Damper.x;

                particlePos.xyz +=  dt * particleVel.xyz;

                float rnd = UVRandom(uv, 17);
                particlePos.w -= max(_Life.x, _Life.y / particleVel.w) * rnd * 0.01 ;
                particlePos.w -= 0.01 * exp( - particlePos.w);
                // particlePos.w -= 0.01;

                return particlePos;
            }

            inline float4 UpdateParticleVel(float4 particlePos, float4 particleVel)
            {  
                float2 _NoiseParams = float2(10.0,  0.5);
                float3 np = particlePos.xyz * _NoiseParams.x;
                float3 n1 = snoise_grad(np);
                float3 n2 = snoise_grad(np + float3(21.83, 13.28, 7.32));

                particleVel.xyz *= _Damper.y;

                particleVel.y += dt * _GravityY;
                particleVel.xyz += dt * cross(n1, n2) * _NoiseParams.y;

                return particleVel;
            }

            float4 frag (v2f_customrendertexture i) : SV_Target
            {
                // offset per 1pixel
                float dx = 1 / _CustomRenderTextureWidth;
                float dy = 1 / _CustomRenderTextureHeight;
                
                float2 uv = i.globalTexcoord;
                float4 col = float4(0.0, 0.0, 0.0, 1.0);

                uint4 area = uint4(0, 0, _CustomRenderTextureWidth, _CustomRenderTextureHeight);
                uint2 coord = uv * area.zw;
                uint id = coord.y  * area.z + coord.x;
                
                
                float4 timePack = tex2D(_SelfTexture2D, float2(1.0 - 0.5 * dx, 1.0 - 0.5 * dy));             
                // float time = UnpackFloat(timePack);
                float time = _Time.y;
                // time = 10;
                uint offsetFrame = (uint)((time + _OffsetSeconds) * 30.0);

                AreaUV aUV;
                aUV = SetAreaUV(uv, coord);


                float4 posPrev = tex2D(_SelfTexture2D, aUV.pos);
                float4 velPrev = tex2D(_SelfTexture2D, aUV.vel);

                float4 pos = GetMotPos(2 * aUV.pos, offsetFrame);
                float4 vel = GetMotVel(2 * aUV.vel, offsetFrame);


                float4 particlePosPrev = tex2D(_SelfTexture2D, aUV.particlePos);
                float4 particleVelPrev = tex2D(_SelfTexture2D, aUV.particleVel);

                bool initFlag = (time < 0.1 || particlePosPrev.w < -0.5 || particlePosPrev.y < -0.2);
                float4 particlePos = (initFlag) ? InitParticlePos(posPrev, aUV.pos, offsetFrame) : UpdateParticlePos(particlePosPrev, particleVelPrev, aUV.particlePos);
                float4 particleVel = (initFlag) ? InitParticleVel(velPrev, aUV.particleVel) : UpdateParticleVel(particlePosPrev, particleVelPrev);

                /* OLD VERSION */
                // float2 st = 2 * uv;
                // float4 posPrev = (InsideArea(coord, areaMotPos)) ? tex2D(_SelfTexture2D, uv) : tex2D(_SelfTexture2D, uv - float2(0.0, 0.5));
                // float4 velPrev = (InsideArea(coord, areaMotVel)) ? tex2D(_SelfTexture2D, uv) : tex2D(_SelfTexture2D, uv + float2(0.0, 0.5));
                
                // // [TODO] st is different from pos, vel 
                // float4 pos = GetMotPos(st, offsetFrame);
                // float4 vel = GetMotVel(st, offsetFrame);

                // float4 particlePosPrev = (InsideArea(coord, areaParticlePos)) ? tex2D(_SelfTexture2D, uv) : tex2D(_SelfTexture2D, uv - float2(0.0, 0.5));
                // float4 particleVelPrev = (InsideArea(coord, areaParticleVel)) ? tex2D(_SelfTexture2D, uv) : tex2D(_SelfTexture2D, uv + float2(0.0, 0.5));

                
                // float4 particlePos = particlePosPrev;
                // float4 particleVel = particleVelPrev;
                // bool initFlag = (time < 0.1 || particlePos.w < -0.5 || particlePos.y < -0.2);
                // particlePos = (initFlag) ? InitParticlePos(pos) : UpdateParticlePos(particlePosPrev, particleVelPrev, uv);
                // particleVel = (initFlag) ? InitParticleVel(vel, uv) : UpdateParticleVel(particlePosPrev, particleVelPrev);

                // time update 
                // time = (time > _TimeMax) ? 0.0 : time + dt;
                /* */


                col = (InsideArea(coord, areaMotPos)) ? pos : col;
                col = (InsideArea(coord, areaMotVel)) ? vel : col;
                col = (InsideArea(coord, areaParticlePos)) ? particlePos : col;
                col = (InsideArea(coord, areaParticleVel)) ? particleVel : col;
                col = (uv.x >= 1.0 - dx && uv.y >= 1.0 - dy) ? Pack(time) : col;


                return col;

            }
            ENDCG
        }
    }
}
