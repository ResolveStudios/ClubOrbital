#ifndef COMMON
#define COMMON


#include "UnityCG.cginc"

// Seed for PRNG
float _RandomSeed;

// Common color animation
half _BaseHue;
half _HueRandomness;
half _Saturation;
half _Brightness;
half _EmissionProb;
half _HueShift;
half _BrightnessOffs;

// PRNG function
float UVRandom(float2 uv, float salt)
{
    uv += float2(salt, _RandomSeed);
    return frac(sin(dot(uv, float2(12.9898, 78.233))) * 43758.5453);
}

float4 quaternion(float rad, float3 axis)
{
    return float4(normalize(axis) * sin(rad * 0.5), cos(rad * 0.5));
}

float3 rotateQuaternion(float rad, float3 axis, float3 pos)
{
    float4 q = quaternion(rad, axis);
    return (q.w*q.w - dot(q.xyz, q.xyz)) * pos + 2.0 * q.xyz * dot(q.xyz, pos) + 2 * q.w * cross(q.xyz, pos);
}



float UnpackFloat(fixed4 col)
{
    uint R = uint(col.r * 255) << 0;
    uint G = uint(col.g * 255) << 8;
    uint B = uint(col.b * 255) << 16;
    uint A = uint(col.a * 255) << 24;
    return asfloat(R | G | B | A);
}

fixed4 Pack(float value)
{
    uint uintVal = asuint(value);
    uint4 elements = uint4(uintVal >> 0, uintVal >> 8, uintVal >> 16, uintVal >> 24);
    fixed4 color = ((elements & 0x000000FF) + 0.5) / 255.0;
    return color;
}





// Hue to RGB convertion
half3 HueToRGB(half h)
{
    h = frac(h);
    half r = abs(h * 6 - 3) - 1;
    half g = 2 - abs(h * 6 - 2);
    half b = 2 - abs(h * 6 - 4);
    half3 rgb = saturate(half3(r, g, b));
#if UNITY_COLORSPACE_GAMMA
    return rgb;
#else
    return GammaToLinearSpace(rgb);
#endif
}

half3 ColorAnimation(float id, half intensity)
{
    // Low frequency oscillation with half-wave rectified sinusoid.
    half phase = UVRandom(id, 30) * 32 + _Time.x * 4;
    half lfo = abs(sin(phase * UNITY_PI));

    // Switch LFO randomly at zero-cross points.
    lfo *= UVRandom(id + floor(phase), 31) < _EmissionProb;

    // Hue animation.
    half hue = _BaseHue + UVRandom(id, 32) * _HueRandomness + _HueShift * intensity;

    // Convert to RGB.
    half3 rgb = lerp(1, HueToRGB(hue), _Saturation);

    // Apply brightness.
    return rgb * (_Brightness * lfo + _BrightnessOffs * intensity);
}

#endif 