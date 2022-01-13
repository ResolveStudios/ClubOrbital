Shader "AnimationGpuInstancing/Custom"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Main Texture", 2D) = "white" {}
        _BumpMap("Normal Map", 2D) = "bump" {}
        _Shininess ("Shininess", Range(0.0, 1.0)) = 0.078125
    

        [Toggle] _INSTANCING("Gpu Instancing", Float) = 1


        _MemoryPosTex("Memory Pos Texture", 2D) = "white" {}
        

        [Header(Self Illumination)]
        _BaseHue("Base Hue", Range(0, 1)) = 0
        _HueRandomness("Hue Randomness", Range(0, 1)) = 0.2
        _Saturation("Saturation", Range(0, 1)) = 1
        _Brightness("Brightness", Range(0, 6)) = 0.8
        _EmissionProb("Probability", Range(0, 1)) = 0.2

        [Header(Color Modifier (By Speed))]
        _CutoffSpeed("Cutoff Speed", Float) = 0.5
        _SpeedToIntensity("Sensitivity", Range(0, 1)) = 0.3
        _BrightnessOffs("Brightness Offset", Range(0, 6)) = 1.0
        _HueShift("Hue Shift", Range(-1, 1)) = 0.2

        _Ratio("Ratio", Range(0, 1)) = 1

    }


    CGINCLUDE

    #include "UnityCG.cginc"
    #include "Utils.cginc"
    #include "Common.cginc"
    

    struct appdata
    {
        float4 vertex : POSITION;
        float3 normal : NORMAL;
        float4 texcoord : TEXCOORD0;
        float4 texcoord1 : TEXCOORD1;
        half4 boneIndex : TEXCOORD2;
        fixed4 boneWeight : TEXCOORD3;
        float4 tangent : TANGENT;
    };

    struct v2g
    {
        float2 uv : TEXCOORD0;
        float4 vertex : SV_POSITION;
        float4 vel : TEXCOORD1;
        float4 uvParticlePos : TEXCOORD2;
        float4 uvParticleVel : TEXCOORD3;
    
    };

    struct g2f
    {
        float2 uv : TEXCOORD0;
        float4 vertex : SV_POSITION;
        float4 color : TEXCOORD1;
        uint mode : TEXCOORD2;
    };


    sampler2D _MainTex;
    float4 _MainTex_ST;
    
    sampler2D _BumpMap;

    sampler2D _AnimTex;
    float4 _AnimTex_TexelSize;

    #define Mat4x4Identity float4x4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)

    float4 _Color;
    half _CutoffSpeed;
    half _SpeedToIntensity;

    sampler2D _MemoryPosTex;
    float4 _MemoryPosTex_TexelSize;

    float _Ratio;

    inline float3 hsv(float h, float s, float v){
        float4 t = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
        float3 p = abs(frac(float3(h,h,h) + t.xyz) * 6.0 - float3(t.w, t.w, t.w));
        return v * lerp(float3(t.x, t.x, t.x), clamp(p - float3(t.x, t.x, t.x), 0.0, 1.0), s);
    }

    v2g vert (appdata v, uint vid : SV_VertexID)
    {
        v2g o;


        uint2 coord = v.vertex * _MemoryPosTex_TexelSize.zw;
        
        float4 texelSize = float4(0, 0, 128, 128);
        float4 st = GetUV(vid, texelSize);
        st.xy = st.xy;
        st.xy /= 2;
        float4 pos = tex2Dlod(_MemoryPosTex, st);
        float4 vel = tex2Dlod(_MemoryPosTex, st + float4(0.0, 0.5, 0.0, 0.0));
        
        float4 uvParticle = GetUV(vid, texelSize);
        float4 uvParticlePos = uvParticle;
        uvParticlePos.xy += float2(1.0, 0.0);
        uvParticlePos.xy /= 2;

        float4 uvParticleVel = uvParticle;
        uvParticleVel.xy += float2(1.0, 1.0);
        uvParticleVel.xy /= 2;        

        o.uvParticlePos = uvParticlePos;
        o.uvParticleVel = uvParticleVel;

        o.vertex = pos;
        o.vel = vel;
        o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);

        return o;
    }


    [maxvertexcount(8)]
    void geom (triangle v2g IN[3], uint pid : SV_PrimitiveID, inout TriangleStream<g2f> stream) {


        float4 particlePos_0 = tex2Dlod(_MemoryPosTex, IN[0].uvParticlePos);
        float4 particlePos_1 = tex2Dlod(_MemoryPosTex, IN[1].uvParticlePos);
        float4 particlePos_2 = tex2Dlod(_MemoryPosTex, IN[2].uvParticlePos);

        float4 particlePos = (particlePos_0 + particlePos_1 + particlePos_2) / 3;.0;

        float4 particleVel_0 = tex2Dlod(_MemoryPosTex, IN[0].uvParticleVel);
        float4 particleVel_1 = tex2Dlod(_MemoryPosTex, IN[1].uvParticleVel);
        float4 partcileVel_2 = tex2Dlod(_MemoryPosTex, IN[2].uvParticleVel);

        float4 particleVel = (particleVel_0 + particleVel_1 + partcileVel_2) / 3.0;

        float particleLv = length(particleVel.xyz);

        float3 originViewPos = UnityObjectToViewPos(particlePos);

        half intensity = saturate((particleLv - _CutoffSpeed) * _SpeedToIntensity);

        

        //////////////////////////////////
        [unroll]
        for (uint i = 0; i < 4; i ++)
        {
            g2f output;
            float x = i % 2 == 0 ? - 0.5: 0.5;
            float y = i / 2 == 0 ? - 0.5: 0.5;
            float size = max(particlePos.w, 0.0) + intensity * intensity;
            size *= 0.02;
            size *= _Ratio;
            float3 viewPos = originViewPos + float3(x, y, 0) * size;
            output.vertex = mul(UNITY_MATRIX_P, float4(viewPos, 1));

            output.uv = float2(x, y);
        //   output.color = float4(hsv(0.1, 3 - particleLv, 0.9), particlePos.w);
            output.color.rgb = ColorAnimation(pid, intensity);
            output.color.a = 0;


            output.mode = 1;
            stream.Append(output);
        }

        stream.RestartStrip();



        g2f o;
        o.uv = (IN[0].uv + IN[1].uv) / 2.0;
        o.mode = 0;
        float3 baseColor = (float3)0.2;
        float3 baseColor0 = (float3)1.0;

        float3 p0 = IN[0].vertex.xyz;
        float3 p1 = IN[1].vertex.xyz;
        float3 p2 = IN[2].vertex.xyz;
        float3 pmid = (p0 + p1 + p2) / 3.0;
        float3 right = p0 - p1;
        right /= max(length(right), 1e-3);

        float3 v0 = IN[0].vel.xyz;
        float3 v1 = IN[1].vel.xyz;
        float3 v2 = IN[2].vel.xyz;
        float3 v = (v0 + v1 + v2) / 3.0;
        float lv = length(v);
        float3 up = - v / max(lv, 1e-3);

        intensity = saturate((lv - _CutoffSpeed) * _SpeedToIntensity);

        float widthScale = 0.02;
        float lineScale  = 0.25;

        float3 p;
        p = pmid + right * intensity * widthScale;
        
        float3 _pos;

        float3 _col = lerp(baseColor0, baseColor, _Ratio);
        _col = ColorAnimation(pid, intensity) * 0.9;
        _pos = lerp(p0, p, _Ratio);
        o.color = float4(_col, 1.0);
        o.vertex = UnityObjectToClipPos(float4(_pos, 1.0));
        stream.Append(o);
        
        p = pmid - right * intensity * widthScale;
        _pos = lerp(p1, p, _Ratio);
        o.color = float4(_col, 1.0);
        o.vertex = UnityObjectToClipPos(float4(_pos, 1.0));
        stream.Append(o);

        p = pmid + up * intensity * lineScale;
        _pos = lerp(p2, p, _Ratio);
        o.color.r = lerp(baseColor.r, 1.0, lv);
        o.color.gba = lerp(0.0, 0.1, lv);
        o.color = lerp(float4(baseColor0, 1.0), o.color, _Ratio);
        o.vertex = UnityObjectToClipPos(float4(_pos, 1.0));
        stream.Append(o);

        stream.RestartStrip();

    }

    fixed4 frag (g2f i) : SV_Target
    {

        fixed4 tex = tex2D(_MainTex, i.uv);
        float d = length(i.uv);
		clip(i.mode < 0.5 ? 1 : 0.5-d);

        fixed4 col = i.color;

        col = (_Ratio == 0) ? (fixed4)1 : col;
        col *= lerp(1, _Color, _Ratio);
        col.a = (i.mode < 0.5) ? 1 : col.a;


        return col;
    }


    ENDCG

    SubShader 
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent"}
        LOD 100
        Cull Off
        Blend One One

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geom
            // make fog work
            #pragma multi_compile_fog
            #pragma multi_compile_instancing
            #pragma target 4.5
            ENDCG
        }

    }

}
