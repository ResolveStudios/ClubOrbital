Shader "Custom/HackerDisplay"
{
    Properties
    {
		_WarnTex("Error Texture", 2D) = "" {}
		_Color1("Default Color", Color) = (0,1,1,0.5)
		_Color2("Error Color", Color) = (1,0,0,0.7)
		_DispWidth("Display Width Resolution", int) = 64
		_DispHeight("Display Height Resolution", int) = 36
		_ErrAnim("Error Animation State", range(0.0, 1.0)) = 0.0
        _RandUv ("Time Seed", range(0.0,1.0)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }
        LOD 100
		Blend SrcAlpha One
		
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

			sampler2D _WarnTex;
			float4 _Color1;
			float4 _Color2;
			int _DispWidth;
			int _DispHeight;
			float _ErrAnim;
            float _RandUv;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                o.uv.y = (o.uv.y - 0.5) / 2 / abs(0.5 - _ErrAnim) + 0.5;
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

			float rand(float2 co){
				return frac(sin(dot(co.xy, float2(12.9898,78.233))) * 43758.5453);
			}

            fixed4 frag (v2f i) : SV_Target
            {
            	if(i.uv.y < 0 || i.uv.y > 1) discard;
            	float4 color = _ErrAnim < 0.5 ? _Color1 : _Color2;
                float2 coord = float2(floor(i.uv.x*_DispWidth), floor(i.uv.y*_DispHeight));
                float2 randuv = _RandUv;
				if(coord.x < 1 || _DispWidth-2 < coord.x || coord.y < 1 || _DispHeight-2 < coord.y) return color;
				if(coord.x < 2 || _DispWidth-3 < coord.x || coord.y < 2 || _DispHeight-3 < coord.y) return 0;
				if(22./64*_DispWidth < coord.x && coord.x < 41./64*_DispWidth && 8./36*_DispHeight < coord.y && coord.y < 28./36*_DispHeight && color.x > 0) {
					float4 color = tex2D(_WarnTex, float2((i.uv.x - 0.5) * 64 / 18 + 0.5, (i.uv.y - 0.5) * 2 + 0.5));
					if(color.w > 0) return color;
				}
				if(frac(coord.y / 2) < 0.5) return 0;
				coord.x -= 2;
				coord.y = floor(coord.y / 2);
				float seedtime = floor((_Time.y + frac(randuv.x)) * 70) - coord.y * 60;
				float len = rand(randuv + floor(seedtime/60)) * (_DispWidth-4);
				if(coord.x < len && (coord.y > 1 || coord.x < fmod(seedtime, 60)) && rand(randuv + 100*floor(seedtime/60) + coord.x) < .9) return color;
				return 0;
            }
            ENDCG
        }
    }
}
