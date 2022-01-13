Shader "Custom/KeyboardShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" }
        LOD 200
        Cull Off
        Blend SrcAlpha One
        ZWrite Off

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

		float rand(float2 co){
			return frac(sin(dot(co.xy, float2(12.9898,78.233))) * 43758.5453);
		}
		
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = 0; //tex2D (_MainTex, IN.uv_MainTex) * _Color;
            if(IN.uv_MainTex.x < 1./20 || 19./20 < IN.uv_MainTex.x || IN.uv_MainTex.y < 1./10 || 9./10 < IN.uv_MainTex.y) c = float4(0,1,1,.7);
            else{
            	float2 coord = float2(floor(IN.uv_MainTex.x*20), floor(IN.uv_MainTex.y*10));
            	float2 fracs = float2(frac(IN.uv_MainTex.x*20), frac(IN.uv_MainTex.y*10));
            	if(0.1 < fracs.x && fracs.x < 0.9 && 0.1 < fracs.y && fracs.y < 0.9) {
            		if(rand(coord + 10*floor(_Time.x * 50)) > 0.2) c = float4(0,1,1,.7);
            	}
            }
            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
