Shader "Custom/HackerShader"
{
	Properties
	{
		_MainTex("Error Texture", 2D) = "" {}
		_Color1("Default Color", Color) = (0,1,1,0.5)
		_Color2("Error Color", Color) = (1,0,0,0.7)
		_Amount("Amount", float) = 0.01
		_Size("Size", float) = 1.0
		_Radius("Radius", float) = 1.3
		_MaxHeight("Max Height", float) = 1.0
		_DeltaY("Delta Y", float) = 0.0
		_HeightRatio("Height Radio", float) = 0.8
		_DispWidth("Display Width Resolution", int) = 64
		_DispHeight("Display Height Resolution", int) = 36
		_ErrAnim("Error Animation State", range(0.0, 1.0)) = 0.0
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Transparent" }
		LOD 100
		Cull Off
		Blend SrcAlpha One
		ZWrite Off

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2g {
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct g2f
			{
				float4 vertex : SV_POSITION;
				float2 uv : TEXCOORD0;
				float2 randuv : TEXCOORD1;
				float4 color : COLOR;
			};

			sampler2D _MainTex;
			float4 _Color1;
			float4 _Color2;
			float _Amount;
			float _Size;
			float _Radius;
			float _MaxHeight;
			float _DeltaY;
			float _HeightRatio;
			float _ErrAnim;
			int _DispWidth;
			int _DispHeight;

			float rand(float2 co){
				return frac(sin(dot(co.xy, float2(12.9898,78.233))) * 43758.5453);
			}

			v2g vert (appdata v)
			{
				v2g o;
				o.vertex = v.vertex;
				o.uv = v.uv.xy;
				return o;
			}
			
			[maxvertexcount(4)]
			void geom (triangle v2g IN[3], inout TriangleStream<g2f> stream) {
				float2 uv = (IN[0].uv + IN[1].uv + IN[2].uv) / 3;
				uv.x = (floor(uv.x * 256) + 0.5) / 256.0;
				uv.y = (floor(uv.y * 128) + 0.5) / 128.0;
				g2f o;
				//o.color = float3(1,1,1);
				
				float timing = 0.1 + 0.8 * rand(uv+0.5);
				
				float fruv = frac(_Time.x + rand(uv+0.5));
				uv.x += floor(_Time.x + rand(uv+0.5));
				
				//uv.x += _Time.x/10000;
				
				float r0 = rand(uv+0), r1 = rand(uv+1), r2 = rand(uv+2), r3 = rand(uv+3), r4 = rand(uv+4);
				float theta = r0 * 2 * 3.141592;
				float height = r1 * _MaxHeight + _DeltaY;
				float radius = _Radius * (1 + 0.01 * cos(r2 * 3.141592));
				float3 p = float3(radius * sin(theta), height, radius * cos(theta));
				
				float size = (0.5 + 0.3 * cos(r3 * 3.141592))/2 * _Size;
				float sizey = _HeightRatio;
				if(fruv < 0.01 || 0.99 < fruv) sizey *= (0.5 - abs(0.5 - fruv)) * 100;
				if(abs(_ErrAnim - timing) < 0.1) sizey *= abs(_ErrAnim - timing) * 10;
				
				o.color = _ErrAnim < timing ? _Color1 : _Color2;

				//o.d = 0;

				o.randuv = uv;

				if(r4 < _Amount){
					float3 vp = p + float3(-size * cos(theta), -size*sizey, size * sin(theta));
					o.uv = float2(0,0);
					o.vertex = UnityObjectToClipPos(float4(vp, 1));
					stream.Append(o);
					vp = p + float3(-size * cos(theta), size*sizey, size * sin(theta));
					o.uv = float2(0,1);
					o.vertex = UnityObjectToClipPos(float4(vp, 1));
					stream.Append(o);
					vp = p + float3(size * cos(theta), -size*sizey, -size * sin(theta));
					o.uv = float2(1,0);
					o.vertex = UnityObjectToClipPos(float4(vp, 1));
					stream.Append(o);
					vp = p + float3(size * cos(theta), size*sizey, -size * sin(theta));
					o.uv = float2(1,1);
					o.vertex = UnityObjectToClipPos(float4(vp, 1));
					stream.Append(o);
				}
				
				stream.RestartStrip();
			}
			
			fixed4 frag (g2f i) : SV_Target
			{
				float2 coord = float2(floor(i.uv.x*_DispWidth), floor(i.uv.y*_DispHeight));
				if(coord.x < 1 || _DispWidth-2 < coord.x || coord.y < 1 || _DispHeight-2 < coord.y) return i.color;
				if(coord.x < 2 || _DispWidth-3 < coord.x || coord.y < 2 || _DispHeight-3 < coord.y) return 0;
				if(22./64*_DispWidth < coord.x && coord.x < 41./64*_DispWidth && 8./36*_DispHeight < coord.y && coord.y < 28./36*_DispHeight && i.color.x > 0) {
					float4 color = tex2D(_MainTex, float2((i.uv.x - 0.5) * 64 / 18 + 0.5, (i.uv.y - 0.5) * 2 + 0.5));
					if(color.w > 0) return color;
				}
				if(frac(coord.y / 2) < 0.5) return 0;
				coord.x -= 2;
				coord.y = floor(coord.y / 2);
				float seedtime = floor((_Time.y + frac(i.randuv.x)) * 70) - coord.y * 60;
				float len = rand(i.randuv + floor(seedtime/60)) * (_DispWidth-4);
				if(coord.x < len && (coord.y > 1 || coord.x < fmod(seedtime, 60)) && rand(i.randuv + 100*floor(seedtime/60) + coord.x) < .9) return i.color;
				return 0;
			}
			ENDCG
		}
	}
}
