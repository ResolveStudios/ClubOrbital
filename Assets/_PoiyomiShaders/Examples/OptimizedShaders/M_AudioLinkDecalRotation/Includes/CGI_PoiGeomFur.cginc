float _FurLength;
float _FurGravityStrength;
[instance(4)]
[maxvertexcount(16)]
void geomFur(triangle v2f IN[3], inout TriangleStream < v2f > tristream, uint InstanceID : SV_GSInstanceID)
{
	float4 fur_worldPos[3];
	v2f o_fur[3];
	float3 offset = (float3(0, -1, 0) * (float(0.2)) *float(0));
	for (int i = 0; i < 3; i++)
	{
		if (InstanceID == 0) {
			IN[i].furAlpha = 0;
			tristream.Append(IN[i]);
		}
		o_fur[i] = IN[i];
		fur_worldPos[i] = float4(IN[i].worldPos + IN[i].normal * float(0.2), 1);
	}
	if (InstanceID == 0) {
		tristream.RestartStrip();
	}
	int Total_FurLayers = clamp(floor(float(23) * (1 - smoothstep(float(2), float(10), distance(IN[0].worldPos, getCameraPosition())))), min(1, float(23)), float(23));
	int startLayer = max(int(InstanceID) * 6 - 1, 0);
	for (int layer = startLayer; layer < Total_FurLayers; layer++) {
		for (int i = 0; i < 3; i++) {
			o_fur[i].furAlpha = float(layer+1) / (Total_FurLayers+1);
			o_fur[i].worldPos = float4(lerp(IN[i].worldPos, fur_worldPos[i] + offset * o_fur[i].furAlpha, o_fur[i].furAlpha),1);
			o_fur[i].pos = UnityWorldToClipPos(o_fur[i].worldPos);
			o_fur[i].furAlpha += .01;
			tristream.Append(o_fur[i]);
		}
		tristream.RestartStrip();
	}
}
