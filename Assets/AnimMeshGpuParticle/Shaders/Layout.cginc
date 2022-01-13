#ifndef LAYOUT
#define LAYOUT

#define areaMotPos uint4(0, 0, 128, 128)
#define areaMotVel uint4(0, 128, 128, 128)
#define areaParticlePos uint4(128, 0, 128, 128)
#define areaParticleVel uint4(128, 128, 128, 128)
// #define areaUVOffset (float)0.5

struct AreaUV {
    float2 pos;
    float2 vel;
    float2 particlePos;
    float2 particleVel;
};


inline bool InsideArea(uint2 px, uint4 area)
{
    return px.x >= area.x && px.x < (area.x + area.z) && px.y >= area.y && px.y < (area.y + area.w);
}

inline AreaUV InitAreaUV(float2 uv)
{
    AreaUV aUV;
    aUV.pos = uv;
    aUV.vel = uv;
    aUV.particlePos = uv;
    aUV.particleVel = uv;

    return aUV;
}

inline AreaUV SetAreaUVPos(float2 uv)
{
    float areaUVOffset = 0.5;
    AreaUV aUV;
    aUV.pos = uv;
    aUV.vel = uv + float2(0.0, areaUVOffset);
    aUV.particlePos = uv + float2(areaUVOffset, 0.0);
    aUV.particleVel = uv + float2(areaUVOffset, areaUVOffset);

    return aUV;
}

inline AreaUV SetAreaUVVel(float2 uv)
{
    float areaUVOffset = 0.5;
    AreaUV aUV;
    aUV.pos = uv + float2(0.0, - areaUVOffset);
    aUV.vel = uv;
    aUV.particlePos = uv + float2(areaUVOffset, - areaUVOffset);
    aUV.particleVel = uv + float2(areaUVOffset, 0.0);

    return aUV;
}

inline AreaUV SetAreaUVParticlePos(float2 uv)
{
    float areaUVOffset = 0.5;
    AreaUV aUV;
    aUV.pos = uv + float2(- areaUVOffset, 0.0);
    aUV.vel = uv + float2(- areaUVOffset, + areaUVOffset);
    aUV.particlePos = uv;
    aUV.particleVel = uv + float2(0.0, areaUVOffset);

    return aUV;
}

inline AreaUV SetAreaUVParticleVel(float2 uv)
{
    float areaUVOffset = 0.5;
    AreaUV aUV;
    aUV.pos = uv + float2(- areaUVOffset, - areaUVOffset);
    aUV.vel = uv + float2(- areaUVOffset, 0.0);
    aUV.particlePos = uv + float2(0.0, - areaUVOffset);
    aUV.particleVel = uv;

    return aUV;
}

inline AreaUV SetAreaUV(float2 uv, uint2 coord)
{
    AreaUV aUV = InitAreaUV(uv);

    AreaUV aUVPos = SetAreaUVPos(uv);
    AreaUV aUVVel = SetAreaUVVel(uv);
    AreaUV aUVParticlePos = SetAreaUVParticlePos(uv);
    AreaUV aUVParticleVel = SetAreaUVParticleVel(uv);

    bool flg;
    // AreaPos
    flg = InsideArea(coord, areaMotPos);
    aUV.pos = flg ? aUVPos.pos : aUV.pos;
    aUV.vel =  flg ? aUVPos.vel : aUV.vel;
    aUV.particlePos = flg ? aUVPos.particlePos : aUV.particlePos;
    aUV.particleVel = flg ? aUVPos.particleVel : aUV.particleVel;

    // AreaVel 
    flg = InsideArea(coord, areaMotVel);
    aUV.pos = flg ? aUVVel.pos : aUV.pos;
    aUV.vel = flg ? aUVVel.vel : aUV.vel;
    aUV.particlePos = flg ? aUVVel.particlePos : aUV.particlePos;
    aUV.particleVel = flg ? aUVVel.particleVel : aUV.particleVel;

    // // AreaParticlePos 
    flg = InsideArea(coord, areaParticlePos);
    aUV.pos = flg ? aUVParticlePos.pos : aUV.pos;
    aUV.vel = flg ? aUVParticlePos.vel : aUV.vel;
    aUV.particlePos = flg ? aUVParticlePos.particlePos : aUV.particlePos;
    aUV.particleVel = flg ? aUVParticlePos.particleVel : aUV.particleVel;

    // AreaParticleVel
    flg = InsideArea(coord, areaParticleVel);
    aUV.pos = flg ? aUVParticleVel.pos : aUV.pos;
    aUV.vel = flg ? aUVParticleVel.vel : aUV.vel;
    aUV.particlePos = flg ? aUVParticleVel.particlePos : aUV.particlePos;
    aUV.particleVel = flg ? aUVParticleVel.particleVel : aUV.particleVel;

    return aUV;
}

#endif 