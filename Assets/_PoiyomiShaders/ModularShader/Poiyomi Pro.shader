Shader ".poiyomi/ProV8a"
{
	Properties
	{
		[HideInInspector] shader_master_label ("<color=#E75898ff>Poiyomi Pro V8α</color>", Float) = 0
		[HideInInspector] shader_is_using_thry_editor ("", Float) = 0
		[HideInInspector] footer_youtube ("{texture:{name:icon-youtube,height:32},action:{type:URL,data:https://www.youtube.com/poiyomi},hover:YOUTUBE}", Float) = 0
		[HideInInspector] footer_twitter ("{texture:{name:icon-twitter,height:32},action:{type:URL,data:https://twitter.com/poiyomi},hover:TWITTER}", Float) = 0
		[HideInInspector] footer_patreon ("{texture:{name:icon-patreon,height:32},action:{type:URL,data:https://www.patreon.com/poiyomi},hover:PATREON}", Float) = 0
		[HideInInspector] footer_discord ("{texture:{name:icon-discord,height:32},action:{type:URL,data:https://discord.gg/Ays52PY},hover:DISCORD}", Float) = 0
		[HideInInspector] footer_github ("{texture:{name:icon-github,height:32},action:{type:URL,data:https://github.com/poiyomi/PoiyomiToonShader},hover:GITHUB}", Float) = 0
		
		// Keyword to remind users in the VRChat SDK that this material hasn't been locked.  Inelegant but it works.
		[HideInInspector] _ForgotToLockMaterial (";;YOU_FORGOT_TO_LOCK_THIS_MATERIAL;", Int) = 1
		[ThryShaderOptimizerLockButton] _ShaderOptimizerEnabled ("", Int) = 0
		[Helpbox(1)] _LockTooltip ("Animations don't work by default when locked in. Right click a property if you want to animate it. The shader will lock in automatically at upload time.", Int) = 0
		
		[ThryWideEnum(Opaque, 0, Cutout, 1, TransClipping, 9, Fade, 2, Transparent, 3, Additive, 4, Soft Additive, 5, Multiplicative, 6, 2x Multiplicative, 7)]_Mode("Rendering Preset--{on_value_actions:[
		{value:0,actions:[{type:SET_PROPERTY,data:render_queue=2000}, {type:SET_PROPERTY,data:render_type=Opaque},            {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:1,actions:[{type:SET_PROPERTY,data:render_queue=2450}, {type:SET_PROPERTY,data:render_type=TransparentCutout}, {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=.5}, {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_AlphaToMask=1},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:9,actions:[{type:SET_PROPERTY,data:render_queue=2450}, {type:SET_PROPERTY,data:render_type=TransparentCutout}, {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=5}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:2,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=5}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:3,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=1}]},
		{value:4,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=1},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:5,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:RenderType=Transparent},        {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=4}, {type:SET_PROPERTY,data:_DstBlend=1},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:6,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=2}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
		{value:7,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=2}, {type:SET_PROPERTY,data:_DstBlend=3},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]}
		}]}]}", Int) = 0
		
		// Main
		[HideInInspector] m_mainCategory ("Color & Normals", Float) = 0
		//Main-main
		_Color ("Color, Alpha & Normals", Color) = (1, 1, 1, 1)
		_MainTex ("Texture--{reference_properties:[_MainTexPan, _MainTexUV]}", 2D) = "white" { }
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _MainTexUV ("UV", Int) = 0
		[HideInInspector][Vector2]_MainTexPan ("Panning", Vector) = (0, 0, 0, 0)
		[Normal]_BumpMap ("Normal Map--{reference_properties:[_BumpMapPan, _BumpMapUV, _BumpScale]}", 2D) = "bump" { }
		[HideInInspector][Vector2]_BumpMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _BumpMapUV ("UV", Int) = 0
		[HideInInspector]_BumpScale ("Intensity", Range(0, 10)) = 1
		_ClippingMask ("Alpha Map--{reference_properties:[_ClippingMaskPan, _ClippingMaskUV, _Inverse_Clipping]}", 2D) = "white" { }
		[HideInInspector][Vector2]_ClippingMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _ClippingMaskUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_Inverse_Clipping ("Invert", Float) = 0
		_Cutoff ("Alpha Cuttoff--{condition_showS:(_Mode==1)}", Range(0, 1.001)) = 0.5
		
		[HideInInspector] m_start_Alpha ("Alpha Options", Float) = 0
		[ToggleUI]_AlphaForceOpaque ("Force Opaque", Float) = 0
		_AlphaMod ("Alpha Mod", Range(-1, 1)) = 0.0
		
		[Space(10)]
		[ThryToggleUI(true)] _AlphaToCoverage ("<size=13><b>  Alpha To Coverage</b></size>", Float) = 0
		[ToggleUI]_AlphaSharpennedA2C ("Sharpenned A2C--{condition_showS:(_AlphaToCoverage==1)}", Float) = 0
		_AlphaMipScale ("Mip Level Alpha Scale--{condition_showS:(_AlphaToCoverage==1)}", Range(0, 1)) = 0.25
		
		[Space(10)]
		[ThryToggleUI(true)] _AlphaDithering ("<size=13><b>  Dithering</b></size>", Float) = 0
		_AlphaDitherGradient ("Dither Gradient--{condition_showS:(_AlphaDithering==1)}", Range(0, 1)) = .1
		
		[Space(10)]
		[ThryToggleUI(true)] _AlphaDistanceFade ("<size=13><b>  Distance Alpha</b></size>", Float) = 0
		[Enum(Object Position, 0, Pixel Position, 1)] _AlphaDistanceFadeType ("Pos To Use--{condition_showS:(_AlphaDistanceFade==1)}", Int) = 1
		_AlphaDistanceFadeMinAlpha ("Min Distance Alpha--{condition_showS:(_AlphaDistanceFade==1)}", Range(0, 1)) = 0
		_AlphaDistanceFadeMaxAlpha ("Max Distance Alpha--{condition_showS:(_AlphaDistanceFade==1)}", Range(0, 1)) = 1
		_AlphaDistanceFadeMin ("Min Distance--{condition_showS:(_AlphaDistanceFade==1)}", Float) = 0
		_AlphaDistanceFadeMax ("Max Distance--{condition_showS:(_AlphaDistanceFade==1)}", Float) = 0
		
		[Space(10)]
		[ThryToggleUI(true)] _AlphaFresnel ("<size=13><b>  Fresnel Alpha</b></size>", Float) = 0
		_AlphaFresnelAlpha ("Intensity--{condition_showS:(_AlphaFresnel==1)}", Range(0, 1)) = 0
		_AlphaFresnelSharpness ("Sharpness--{condition_showS:(_AlphaFresnel==1)}", Range(0, 1)) = .5
		_AlphaFresnelWidth ("Width--{condition_showS:(_AlphaFresnel==1)}", Range(0, 1)) = .5
		[ToggleUI]_AlphaFresnelInvert ("Invert--{condition_showS:(_AlphaFresnel==1)}", Float) = 0
		
		[Space(10)]
		[ThryToggleUI(true)] _AlphaAngular ("<size=13><b>  Angular Alpha</b></size>", Float) = 0
		[Enum(Camera Face Model, 0, Model Face Camera, 1, Face Each Other, 2)] _AngleType ("Angle Type--{condition_showS:(_AlphaAngular==1)}", Int) = 0
		[Enum(Model, 0, Vertex, 1)] _AngleCompareTo ("Model or Vert Positon--{condition_showS:(_AlphaAngular==1)}", Int) = 0
		[Vector3]_AngleForwardDirection ("Forward Direction--{condition_showS:(_AlphaAngular==1)}", Vector) = (0, 0, 1)
		_CameraAngleMin ("Camera Angle Min--{condition_showS:(_AlphaAngular==1)}", Range(0, 180)) = 45
		_CameraAngleMax ("Camera Angle Max--{condition_showS:(_AlphaAngular==1)}", Range(0, 180)) = 90
		_ModelAngleMin ("Model Angle Min--{condition_showS:(_AlphaAngular==1)}", Range(0, 180)) = 45
		_ModelAngleMax ("Model Angle Max--{condition_showS:(_AlphaAngular==1)}", Range(0, 180)) = 90
		_AngleMinAlpha ("Min Alpha--{condition_showS:(_AlphaAngular==1)}", Range(0, 1)) = 0
		[HideInInspector] m_end_Alpha ("Alpha Options", Float) = 0
		
		// Back Face Textures and Emission
		[HideInInspector] m_start_backFace ("Back Face--{reference_property:_BackFaceEnabled}", Float) = 0
		[HideInInspector][ThryToggle(POI_BACKFACE)]_BackFaceEnabled ("Backface Enabled", Float) = 0
		_BackFaceColor ("Color", Color) = (1, 1, 1, 1)
		_BackFaceEmissionStrength ("Emission Strength", Range(0, 20)) = 0
		_BackFaceAlpha ("Alpha", Range(0,1)) = 1
		_BackFaceTexture ("Texture--{reference_properties:[_BackFaceTexturePan, _BackFaceTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_BackFaceTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_BackFaceTextureUV ("UV#", Int) = 0
		_BackFaceMask ("Mask--{reference_properties:[_BackFaceMaskPan, _BackFaceMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_BackFaceMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_BackFaceMaskUV ("UV#", Int) = 0
		_BackFaceDetailIntensity ("Detail Intensity", Range(0, 5)) = 1
		[ToggleUI]_BackFaceReplaceAlpha ("Replace Alpha", Float) = 0
		[Space(10)]
		[ThryToggleUI(true)]_BackFaceHueShiftEnabled ("<size=13><b>  Hue Shift</b></size>", Float) = 0
		_BackFaceHueShift ("Hue Shift--{condition_showS:(_BackFaceHueShiftEnabled==1)}", Range(0, 1)) = 0
		_BackFaceHueShiftSpeed ("Hue Shift Speed--{condition_showS:(_BackFaceHueShiftEnabled==1)}", Float) = 0
		[HideInInspector] m_end_backFace ("Back Face", Float) = 0
		
		[HideInInspector] m_start_DetailOptions ("Details--{reference_property:_DetailEnabled}", Float) = 0
		[HideInInspector][ThryToggle(FINALPASS)]_DetailEnabled ("Enable", Float) = 0
		_DetailMask ("Detail Mask (R:Texture, G:Normal)--{reference_properties:[_DetailMaskPan, _DetailMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DetailMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _DetailMaskUV ("UV", Int) = 0
		_DetailTint ("Detail Texture Tint", Color) = (1, 1, 1)
		_DetailTex ("Detail Texture--{reference_properties:[_DetailTexPan, _DetailTexUV]}", 2D) = "gray" { }
		[HideInInspector][Vector2]_DetailTexPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _DetailTexUV ("UV", Int) = 0
		_DetailTexIntensity ("Detail Tex Intensity", Range(0, 10)) = 1
		_DetailBrightness ("Detail Brightness:", Range(0, 2)) = 1
		[Normal]_DetailNormalMap ("Detail Normal--{reference_properties:[_DetailNormalMapPan, _DetailNormalMapUV, _DetailNormalMapScale]}", 2D) = "bump" { }
		[HideInInspector]_DetailNormalMapScale ("Detail Normal Intensity", Range(0, 10)) = 1
		[HideInInspector][Vector2]_DetailNormalMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _DetailNormalMapUV ("UV", Int) = 0
		[HideInInspector] m_end_DetailOptions ("Details", Float) = 0
		
		// RGBA Masking
		[HideInInspector] m_start_RGBMask ("RGBA Color Masking--{reference_property:_RGBMaskEnabled}", Float) = 0
		[HideInInspector][ThryToggle(VIGNETTE)]_RGBMaskEnabled ("RGB Mask Enabled", Float) = 0
		[ToggleUI]_RGBUseVertexColors ("Use Vertex Colors", Float) = 0
		[ToggleUI]_RGBBlendMultiplicative ("Multiplicative?", Float) = 0
		_RGBMask ("Mask--{reference_properties:[_RGBMaskPan, _RGBMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_RGBMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_RGBMaskUV ("UV", int) = 0
		_RedColor ("R Color", Color) = (1, 1, 1, 1)
		_RedTexure ("R Texture--{reference_properties:[_RedTexurePan, _RedTexureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_RedTexurePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_RedTexureUV ("UV", int) = 0
		_GreenColor ("G Color", Color) = (1, 1, 1, 1)
		_GreenTexture ("G Texture--{reference_properties:[_GreenTexturePan, _GreenTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_GreenTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_GreenTextureUV ("UV", int) = 0
		_BlueColor ("B Color", Color) = (1, 1, 1, 1)
		_BlueTexture ("B Texture--{reference_properties:[_BlueTexturePan, _BlueTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_BlueTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_BlueTextureUV ("UV", int) = 0
		_AlphaColor ("A Color", Color) = (1, 1, 1, 1)
		_AlphaTexture ("A Texture--{reference_properties:[_AlphaTexturePan, _AlphaTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_AlphaTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_AlphaTextureUV ("UV", int) = 0
		
		// RGB MASKED NORMALS
		[ThryToggle(GEOM_TYPE_MESH)]_RgbNormalsEnabled ("Enable Normals", Float) = 0
		[ToggleUI]_RGBNormalBlend ("Blend with Base--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Float) = 0
		[Normal]_RgbNormalR ("R Normal--{reference_properties:[_RgbNormalRPan, _RgbNormalRUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
		[HideInInspector][Vector2]_RgbNormalRPan ("Pan", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_RgbNormalRUV ("UV", int) = 0
		_RgbNormalRScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0, 10)) = 0
		[Normal]_RgbNormalG ("G Normal--{reference_properties:[_RgbNormalGPan, _RgbNormalGUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
		[HideInInspector][Vector2]_RgbNormalGPan ("Pan", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_RgbNormalGUV ("UV", int) = 0
		_RgbNormalGScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0, 10)) = 0
		[Normal]_RgbNormalB ("B Normal--{reference_properties:[_RgbNormalBPan, _RgbNormalBUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
		[HideInInspector][Vector2]_RgbNormalBPan ("Pan", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_RgbNormalBUV ("UV", int) = 0
		_RgbNormalBScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0, 10)) = 0
		[Normal]_RgbNormalA ("A Normal--{reference_properties:[_RgbNormalAPan, _RgbNormalAUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
		[HideInInspector][Vector2]_RgbNormalAPan ("Pan", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_RgbNormalAUV ("UV", int) = 0
		_RgbNormalAScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0, 10)) = 0
		[HideInInspector] m_end_RGBMask ("RGB Color Masking", Float) = 0
		
		// Decal Texture
		[HideInInspector] m_start_DecalSection ("Decals--{button_help:{text:Tutorial,action:{type:URL,data:https://www.youtube.com/watch?v=xHoQVN_F7JE&list=PL4_Gy3VRJSmbXfQSldzUiChgABQsoBlLw},hover:YouTube},reference_property:_DecalEnabled}", Float) = 0
		_DecalMask ("Decal RGBA Mask--{reference_properties:[_DecalMaskPan, _DecalMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DecalMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalMaskUV ("UV", Int) = 0
		// Decal 0
		[HideInInspector] m_start_Decal0 ("Decal 0", Float) = 0
		[HideInInspector][ThryToggle(GEOM_TYPE_BRANCH)]_DecalEnabled ("Enable", Float) = 0
		_DecalColor ("Color", Color) = (1, 1, 1, 1)
		_DecalEmissionStrength ("Emission Strength", Range(0, 20)) = 0
		_DecalTexture ("Decal--{reference_properties:[_DecalTexturePan, _DecalTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DecalTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTextureUV ("UV", Int) = 0
		[ToggleUI]_DecalTiled ("Tiled?", Float) = 0
		_Decal0Depth ("Depth", Float) = 0
		[Vector2]_DecalScale ("Scale", Vector) = (1, 1, 0, 0)
		[Vector2]_DecalPosition ("Position", Vector) = (.5, .5, 0, 0)
		_DecalRotation ("Rotation", Range(0, 360)) = 0
		_DecalRotationSpeed ("Rotation Speed", Float) = 0
		[ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType ("Blending", Range(0, 1)) = 0
		_DecalBlendAlpha ("Alpha", Range(0,1)) = 1
		[ToggleUI]_DecalHueShiftEnabled ("Hue Shift Enabled", Float) = 0
		_DecalHueShiftSpeed ("Shift Speed", Float) = 0
		_DecalHueShift ("Hue Shift", Range(0,1)) = 0
		// Decal 0 Audio Link
		[HideInInspector] m_start_Decal0AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0ScaleBand ("Scale Band", Int) = 0
		_AudioLinkDecal0Scale ("Scale Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0RotationBand ("Rotation Band", Int) = 0
		[Vector2]_AudioLinkDecal0Rotation ("Rotation Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0AlphaBand ("Alpha Band", Int) = 0
		[Vector2]_AudioLinkDecal0Alpha ("Alpha Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0EmissionBand ("Emission Band", Int) = 0
		[Vector2]_AudioLinkDecal0Emission ("Emission Mod", Vector) = (0,0,0,0)
		[HideInInspector] m_end_Decal0AudioLink ("Audio Link", Float) = 0
		[HideInInspector] m_end_Decal0 ("Decal 0", Float) = 0
		// Decal 1
		//"GEOM_TYPE_FROND"
		//"DEPTH_OF_FIELD_COC_VIEW"
		[HideInInspector] m_start_Decal1 ("Decal 1--{reference_property:_DecalEnabled1}", Float) = 0
		[HideInInspector][ThryToggle(GEOM_TYPE_BRANCH_DETAIL)]_DecalEnabled1 ("Enable", Float) = 0
		_DecalColor1 ("Color", Color) = (1, 1, 1, 1)
		_DecalEmissionStrength1 ("Emission Strength", Range(0, 20)) = 0
		_DecalTexture1 ("Decal--{reference_properties:[_DecalTexture1Pan, _DecalTexture1UV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DecalTexture1Pan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTexture1UV ("UV", Int) = 0
		[ToggleUI]_DecalTiled1 ("Tiled?", Float) = 0
		_Decal1Depth ("Depth", Float) = 0
		[Vector2]_DecalScale1 ("Scale", Vector) = (1, 1, 0, 0)
		[Vector2]_DecalPosition1 ("Position", Vector) = (.5, .5, 0, 0)
		_DecalRotation1 ("Rotation", Range(0, 360)) = 0
		_DecalRotationSpeed1 ("Rotation Speed", Float) = 0
		[ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType1 ("Blending", Range(0, 1)) = 0
		_DecalBlendAlpha1 ("Alpha", Range(0,1)) = 1
		[ToggleUI]_DecalHueShiftEnabled1 ("Hue Shift Enabled", Float) = 0
		_DecalHueShiftSpeed1 ("Shift Speed", Float) = 0
		_DecalHueShift1 ("Hue Shift", Range(0,1)) = 0
		// Decal 1 Audio Link
		[HideInInspector] m_start_Decal1AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1ScaleBand ("Scale Band", Int) = 0
		_AudioLinkDecal1Scale ("Scale Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1RotationBand ("Rotation Band", Int) = 0
		[Vector2]_AudioLinkDecal1Rotation ("Rotation Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1AlphaBand ("Alpha Band", Int) = 0
		[Vector2]_AudioLinkDecal1Alpha ("Alpha Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1EmissionBand ("Emission Band", Int) = 0
		[Vector2]_AudioLinkDecal1Emission ("Emission Mod", Vector) = (0,0,0,0)
		[HideInInspector] m_end_Decal1AudioLink ("Audio Link", Float) = 0
		[HideInInspector] m_end_Decal1 ("Decal 0", Float) = 0
		// Decal 2
		[HideInInspector] m_start_Decal2 ("Decal 2--{reference_property:_DecalEnabled2}", Float) = 0
		[HideInInspector][ThryToggle(GEOM_TYPE_FROND)]_DecalEnabled2 ("Enable", Float) = 0
		_DecalColor2 ("Color", Color) = (1, 1, 1, 1)
		_DecalEmissionStrength2 ("Emission Strength", Range(0, 20)) = 0
		_DecalTexture2 ("Decal--{reference_properties:[_DecalTexture2Pan, _DecalTexture2UV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DecalTexture2Pan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTexture2UV ("UV", Int) = 0
		[ToggleUI]_DecalTiled2 ("Tiled?", Float) = 0
		_Decal2Depth ("Depth", Float) = 0
		[Vector2]_DecalScale2 ("Scale", Vector) = (1, 1, 0, 0)
		[Vector2]_DecalPosition2 ("Position", Vector) = (.5, .5, 0, 0)
		_DecalRotation2 ("Rotation", Range(0, 360)) = 0
		_DecalRotationSpeed2 ("Rotation Speed", Float) = 0
		[ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType2 ("Blending", Range(0, 1)) = 0
		_DecalBlendAlpha2 ("Alpha", Range(0,1)) = 1
		[ToggleUI]_DecalHueShiftEnabled2 ("Hue Shift Enabled", Float) = 0
		_DecalHueShiftSpeed2 ("Shift Speed", Float) = 0
		_DecalHueShift2 ("Hue Shift", Range(0,1)) = 0
		// Decal 2 Audio Link
		[HideInInspector] m_start_Decal2AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2ScaleBand ("Scale Band", Int) = 0
		_AudioLinkDecal2Scale ("Scale Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2RotationBand ("Rotation Band", Int) = 0
		[Vector2]_AudioLinkDecal2Rotation ("Rotation Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2AlphaBand ("Alpha Band", Int) = 0
		[Vector2]_AudioLinkDecal2Alpha ("Alpha Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2EmissionBand ("Emission Band", Int) = 0
		[Vector2]_AudioLinkDecal2Emission ("Emission Mod", Vector) = (0,0,0,0)
		[HideInInspector] m_end_Decal2AudioLink ("Audio Link", Float) = 0
		[HideInInspector] m_end_Decal2 ("Decal 0", Float) = 0
		// Decal 3
		[HideInInspector] m_start_Decal3 ("Decal 3--{reference_property:_DecalEnabled3}", Float) = 0
		[HideInInspector][ThryToggle(DEPTH_OF_FIELD_COC_VIEW)]_DecalEnabled3 ("Enable", Float) = 0
		_DecalColor3 ("Color", Color) = (1, 1, 1, 1)
		_DecalEmissionStrength3 ("Emission Strength", Range(0, 20)) = 0
		_DecalTexture3 ("Decal--{reference_properties:[_DecalTexture3Pan, _DecalTexture3UV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DecalTexture3Pan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTexture3UV ("UV", Int) = 0
		[ToggleUI]_DecalTiled3 ("Tiled?", Float) = 0
		_Decal3Depth ("Depth", Float) = 0
		[Vector2]_DecalScale3 ("Scale", Vector) = (1, 1, 0, 0)
		[Vector2]_DecalPosition3 ("Position", Vector) = (.5, .5, 0, 0)
		_DecalRotation3 ("Rotation", Range(0, 360)) = 0
		_DecalRotationSpeed3 ("Rotation Speed", Float) = 0
		[ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType3 ("Blending", Range(0, 1)) = 0
		_DecalBlendAlpha3 ("Alpha", Range(0,1)) = 1
		[ToggleUI]_DecalHueShiftEnabled3 ("Hue Shift Enabled", Float) = 0
		_DecalHueShiftSpeed3 ("Shift Speed", Float) = 0
		_DecalHueShift3 ("Hue Shift", Range(0,1)) = 0
		// Decal 3 Audio Link
		[HideInInspector] m_start_Decal3AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3ScaleBand ("Scale Band", Int) = 0
		_AudioLinkDecal3Scale ("Scale Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3RotationBand ("Rotation Band", Int) = 0
		[Vector2]_AudioLinkDecal3Rotation ("Rotation Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3AlphaBand ("Alpha Band", Int) = 0
		[Vector2]_AudioLinkDecal3Alpha ("Alpha Mod", Vector) = (0,0,0,0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3EmissionBand ("Emission Band", Int) = 0
		[Vector2]_AudioLinkDecal3Emission ("Emission Mod", Vector) = (0,0,0,0)
		[HideInInspector] m_end_Decal3AudioLink ("Audio Link", Float) = 0
		[HideInInspector] m_end_Decal3 ("Decal 0", Float) = 0
		[HideInInspector] m_end_DecalSection ("Decal", Float) = 0
		
		// Lighting
		[HideInInspector] m_lightingCategory ("Shading", Float) = 0
		
		[HideInInspector] m_start_PoiLightData ("Light Data ", Float) = 0
		// Lighting Data
		_LightingMapsTex ("Light Maps (expand)--{reference_properties:[_LightingMapsTexPan, _LightingMapsTexUV,_LightingMapHelp,_LightDataAOStrength,_LightDataDetailStrength,_LightDataShadowMaskStrength]}", 2D) = "white" { }
		[HideInInspector][Helpbox(1)] _LightingMapHelp ("(R-AO, G-DETAIL SHADOW, B-SHADOW MASK, A-TBD)     Tools>Poi>Texture Utility to help pack textures", Int) = 0
		[HideInInspector][Vector2]_LightingMapsTexPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _LightingMapsTexUV ("UV", Int) = 0
		[HideInInspector]_LightDataAOStrength ("AO Strength", Range(0, 1)) = 1
		[HideInInspector]_LightDataDetailStrength ("Detail Strength", Range(0, 1)) = 1
		[HideInInspector]_LightDataShadowMaskStrength ("Shadow Mask Strength", Range(0, 1)) = 1
		// Base Pass
		[Space(15)]
		[ThryHeaderLabel(Base Pass Lighting, 13)]
		[Space(4)]
		[Enum(Poi Custom, 0, Standard, 1)] _LightingColorMode ("Light Color Mode", Int) = 0
		[Enum(Poi Custom, 0, Normalized NDotL, 1, Saturated NDotL, 2)] _LightingMapMode ("Light Map Mode", Int) = 0
		[Enum(Poi Custom, 0, Forced Local Direction, 1, Forced World Direction, 2)] _LightingDirectiongMode ("Light Direction Mode", Int) = 0
		[Vector3]_LightngForcedDirection ("Forced Direction--{condition_showS:(_LightingDirectiongMode!=0)}", Vector) = (0, 0, 0)
		[ToggleUI]_LightingForceColorEnabled ("Force Light Color", Float) = 0
		_LightingForcedColor ("Forced Color--{condition_showS:(_LightingForceColorEnabled==1)}", Color) = (1, 1, 1)
		[ToggleUI]_LightingCapEnabled ("Limit Brightness", Float) = 1
		_LightingCap ("Max Brightness--{condition_showS:(_LightingCapEnabled==1)}", Range(0, 10)) = 1
		_LightingMinLightBrightness ("Min Brightness", Range(0, 1)) = 0
		_LightingIndirectUsesNormals ("Indirect Uses Normals--{condition_showS:(_LightingColorMode==0)}", Range(0, 1)) = 0
		_LightingCastedShadows ("Receive Casted Shadows", Range(0, 1)) = 0
		_LightingMonochromatic ("Monochromatic Lighting?", Range(0, 1)) = 0
		// Lighting Additive
		[Space(15)]
		[ThryHeaderLabel(Add Pass Lighting, 13)]
		[Space(4)]
		[ToggleUI]_LightingAdditiveEnable ("Enable Additive", Float) = 1
		[ThryToggle(POI_LIGHT_DATA_ADDITIVE_ENABLE)]_DisableDirectionalInAdd ("Ignore Directional--{condition_showS:(_LightingAdditiveEnable==1)}", Float) = 1
		[ToggleUI]_LightingAdditiveLimited ("Limit Brightness?--{condition_showS:(_LightingAdditiveEnable==1)}", Float) = 0
		_LightingAdditiveLimit ("Max Brightness--{ condition_showS:(_LightingAdditiveLimited==1&&_LightingAdditiveEnable==1)}", Range(0, 10)) = 1
		_LightingAdditivePassthrough ("Point Light Passthrough--{condition_showS:(_LightingAdditiveEnable==1)}", Range(0, 1)) = .5
		// Vertex Lighting
		[Space(15)]
		[ThryHeaderLabel(Vertex Lighting, 13)]
		[Space(4)]
		[ThryToggle(POI_VERTEXLIGHT_ON)]_LightingVertexLightingEnabled ("Enabled", Float) = 1
		// Lighting Data Debug
		[Space(15)]
		[ThryHeaderLabel(Debug Visualization, 13)]
		[Space(4)]
		[ThryToggle(POI_LIGHT_DATA_DEBUG)]_LightDataDebugEnabled ("Debug", Float) = 0
		[ThryWideEnum(Direct Color, 0, Indirect Color, 1, Light Map, 2, Attenuation, 3, N Dot L, 4, Half Dir, 5, Add Color, 6, Add Attenuation, 7, Add Shadow, 8, Add N Dot L, 9)] _LightingDebugVisualize ("Visualize--{condition_showS:(_LightDataDebugEnabled==1)}", Int) = 0
		
		[HideInInspector] m_end_PoiLightData ("Light Data", Float) = 0
		
		[HideInInspector] m_start_PoiShading (" Shading--{reference_property:_ShadingEnabled}", Float) = 0
		[HideInInspector][ThryToggle(VIGNETTE_MASKED)]_ShadingEnabled ("Enable Shading", Float) = 1
		[ThryHeaderLabel(Base Pass Shading, 13)]
		[Space(4)]
		[KeywordEnum(TextureRamp, MathRamp, Wrapped, Skin, ShadeMap, Flat, Realistic, )] _LightingMode ("Lighting Type", Float) = 5
		_LightingShadowColor ("Shadow Tint--{condition_showS:(_LightingMode!=4)}", Color) = (1, 1, 1)
		[Gradient]_ToonRamp ("Lighting Ramp--{texture:{width:512,height:4,filterMode:Bilinear,wrapMode:Clamp},force_texture_options:true,condition_showS:(_LightingMode==0)}", 2D) = "white" { }
		_ShadowOffset ("Ramp Offset--{condition_showS:(_LightingMode==0)}", Range(-1, 1)) = 0
		_LightingGradientStart ("Gradient Start--{condition_showS:(_LightingMode==1)}", Range(0, 1)) = 0
		_LightingGradientEnd ("Gradient End--{condition_showS:(_LightingMode==1)}", Range(0, 1)) = .5
		[ThryWideEnum(Linear, 0, Smooth, 1)]_LightingMathLinearSmooth ("Gradient Type--{condition_showS:(_LightingMode==1)}", Float) = 1
		// Shade Maps
		_1st_ShadeColor ("1st ShadeColor--{condition_showS:(_LightingMode==4)}", Color) = (1, 1, 1)
		_1st_ShadeMap ("1st ShadeMap--{reference_properties:[_1st_ShadeMapPan, _1st_ShadeMapUV, _Use_1stShadeMapAlpha_As_ShadowMask, _1stShadeMapMask_Inverse],condition_showS:(_LightingMode==4)}", 2D) = "white" { }
		[HideInInspector][Vector2]_1st_ShadeMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _1st_ShadeMapUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_Use_1stShadeMapAlpha_As_ShadowMask ("1st ShadeMap.a As ShadowMask", Float) = 0
		[HideInInspector][ToggleUI]_1stShadeMapMask_Inverse ("1st ShadeMapMask Inverse", Float) = 0
		[ToggleUI] _Use_BaseAs1st ("Use BaseMap as 1st ShadeMap--{condition_showS:(_LightingMode==4)}", Float) = 0
		_2nd_ShadeColor ("2nd ShadeColor--{condition_showS:(_LightingMode==4)}", Color) = (1, 1, 1, 1)
		_2nd_ShadeMap ("2nd ShadeMap--{reference_properties:[_2nd_ShadeMapPan, _2nd_ShadeMapUV, _Use_2ndShadeMapAlpha_As_ShadowMask, _2ndShadeMapMask_Inverse],condition_showS:(_LightingMode==4)}", 2D) = "white" { }
		[HideInInspector][Vector2]_2nd_ShadeMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _2nd_ShadeMapUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_Use_2ndShadeMapAlpha_As_ShadowMask ("2nd ShadeMap.a As ShadowMask", Float) = 0
		[HideInInspector][ToggleUI]_2ndShadeMapMask_Inverse ("2nd ShadeMapMask Inverse", Float) = 0
		[ToggleUI] _Use_1stAs2nd ("Use 1st ShadeMap as 2nd_ShadeMap--{condition_showS:(_LightingMode==4)}", Float) = 0
		_BaseColor_Step ("BaseColor_Step--{condition_showS:(_LightingMode==4)}", Range(0.01, 1)) = 0.5
		_BaseShade_Feather ("Base/Shade_Feather--{condition_showS:(_LightingMode==4)}", Range(0.0001, 1)) = 0.0001
		_ShadeColor_Step ("ShadeColor_Step--{condition_showS:(_LightingMode==4)}", Range(0.01, 1)) = 0
		_1st2nd_Shades_Feather ("1st/2nd_Shades_Feather--{condition_showS:(_LightingMode==4)}", Range(0.0001, 1)) = 0.0001
		// Realistic
		_LightingStandardSmoothness ("Smoothness--{condition_showS:(_LightingMode==6)}", Range(0, 1)) = 0
		// Skin Shading
		_SkinLUT ("LUT--{condition_showS:(_LightingMode==3)}", 2D) = "white" { }
		_SssScale ("Scale--{condition_showS:(_LightingMode==3)}", Range(0, 1)) = 1
		[HideInInspector]_SssBumpBlur ("Bump Blur--{condition_showS:(_LightingMode==3)}", Range(0, 1)) = 0.7
		[HideInInspector][Vector3]_SssTransmissionAbsorption ("Absorption--{condition_showS:(_LightingMode==3)}", Vector) = (-8, -40, -64, 0)
		[HideInInspector][Vector3]_SssColorBleedAoWeights ("AO Color Bleed--{condition_showS:(_LightingMode==3)}", Vector) = (0.4, 0.15, 0.13, 0)
		// Generic
		_ShadowStrength ("Shadow Strength--{condition_showS:(_LightingMode<=3)}", Range(0, 1)) = 1
		_LightingIgnoreAmbientColor ("Ignore Ambient Color--{condition_showS:(_LightingMode<=3)}", Range(0, 1)) = 0
		
		// Additive
		[Space(15)]
		[ThryHeaderLabel(Add Pass Shading, 13)]
		[Space(4)]
		[Enum(Realistic, 0, Toon, 1, Wrapped soon.jpg, 2)] _LightingAdditiveType ("Lighting Type", Int) = 1
		_LightingAdditiveGradientStart ("Gradient Start", Range(0, 1)) = 0
		_LightingAdditiveGradientEnd ("Gradient End", Range(0, 1)) = .5
		//_LightingAdditiveDetailStrength ("Detail Shadow Strength", Range(0, 1)) = 1 //TODO-implement this
		[ToggleUI]_LightingAdditiveLimitIntensity ("Limit Intensity", Float) = 0
		_LightingAdditiveMaxIntensity ("Max Intensity--{condition_show:{type:PROPERTY_BOOL,data:_LightingAdditiveLimitIntensity==1}}", Range(0, 10)) = 1
		
		[HideInInspector] m_end_PoiShading ("Shading", Float) = 0
		
		[HideInInspector] m_start_brdf(" Reflections & Specular--{reference_property:_MochieBRDF}", Float) = 0
		[HideInInspector][ThryToggle(VIGNETTE_CLASSIC)]_MochieBRDF("Enable", Float) = 0
		
		_MochieReflectionStrength("Reflections", Range(0,1)) = 1
		_MochieSpecularStrength("Specular", Range(0,1)) = 1
		_MochieMetallicMultiplier("Metallic", Range(0,1)) = 0
		_MochieRoughnessMultiplier("Roughness", Range(0,1)) = 1
		_MochieReflectionTint("Reflection Tint", Color) = (1,1,1,1)
		_MochieSpecularTint("Specular Tint", Color) = (1,1,1,1)
		
		_MochieMetallicMap("Metallic Map--{reference_properties:[_MochieMetallicMapPan, _MochieMetallicMapUV, _MochieMetallicMapToolTip]}", 2D) = "white" { }
		[HideInInspector][Helpbox(1)]_MochieMetallicMapToolTip("(B)", Int) = 0
		[HideInInspector][Vector2]_MochieMetallicMapPan("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_MochieMetallicMapUV("UV", Int) = 0
		
		_MochieRoughnessMap("Roughness Map--{reference_properties:[_MochieRoughnessMapPan, _MochieRoughnessMapUV, _MochieRoughnessMapToolTip]}", 2D) = "white" { }
		[HideInInspector][Helpbox(1)]_MochieRoughnessMapToolTip("(G)", Int) = 0
		[HideInInspector][Vector2]_MochieRoughnessMapPan("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_MochieRoughnessMapUV("UV", Int) = 0
		
		_MochieReflectionMask("Reflection Mask--{reference_properties:[_MochieReflectionMaskPan, _MochieReflectionMaskUV, _MochieReflectionMaskToolTip]}", 2D) = "white" { }
		[HideInInspector][Helpbox(1)]_MochieReflectionMaskToolTip("(R)", Int) = 0
		[HideInInspector][Vector2]_MochieReflectionMaskPan("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_MochieReflectionMaskUV("UV", Int) = 0
		
		_MochieSpecularMask("Specular Mask--{reference_properties:[_MochieSpecularMaskPan, _MochieSpecularMaskUV, _MochieSpecularMaskToolTip]}", 2D) = "white" { }
		[HideInInspector][Helpbox(1)]_MochieSpecularMaskToolTip("(R)", Int) = 0
		[HideInInspector][Vector2]_MochieSpecularMaskPan("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)]_MochieSpecularMaskUV("UV", Int) = 0
		
		[NoScaleOffset]_MochieReflCube("Fallback Cubemap", Cube) = "" {}
		
		[HideInInspector] m_end_brdf("", Float) = 0
		
		// First Matcap
		[HideInInspector] m_start_matcap ("Matcap / Sphere Textures--{reference_property:_MatcapEnable}", Float) = 0
		[HideInInspector][ThryToggle(_COLORADDSUBDIFF_ON)]_MatcapEnable ("Enable Matcap", Float) = 0
		_MatcapColor ("Color", Color) = (1, 1, 1, 1)
		[TextureNoSO]_Matcap ("Matcap", 2D) = "white" { }
		_MatcapBorder ("Border", Range(0, .5)) = 0.43
		_MatcapMask ("Mask--{reference_properties:[_MatcapMaskPan, _MatcapMaskUV, _MatcapMaskInvert]}", 2D) = "white" { }
		[HideInInspector][Vector2]_MatcapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _MatcapMaskUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_MatcapMaskInvert ("Invert", Float) = 0
		_MatcapEmissionStrength ("Emission Strength", Range(0, 20)) = 0
		_MatcapIntensity ("Intensity", Range(0, 5)) = 1
		_MatcapLightMask ("Hide in Shadow", Range(0, 1)) = 0
		_MatcapReplace ("Replace With Matcap", Range(0, 1)) = 1
		_MatcapMultiply ("Multiply Matcap", Range(0, 1)) = 0
		_MatcapAdd ("Add Matcap", Range(0, 1)) = 0
		[Enum(Vertex, 0, Pixel, 1)] _MatcapNormal ("Normal to use", Int) = 1
		
		[Space(10)]
		[ThryHeaderLabel(Custom Normal, 13)]
		[Space(4)]
		[ThryToggle(POI_MATCAP0_CUSTOM_NORMAL)]_Matcap0CustomNormal ("Custom Normal", Float) = 0
		[Normal]_Matcap0NormalMap ("Normal Map--{reference_properties:[_Matcap0NormalMapPan, _Matcap0NormalMapUV, _Matcap0NormalMapScale]}", 2D) = "bump" { }
		[HideInInspector][Vector2]_Matcap0NormalMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _Matcap0NormalMapUV ("UV", Int) = 0
		[HideInInspector]_Matcap0NormalMapScale ("Intensity", Range(0, 10)) = 1
		
		[Space(10)]
		[ThryHeaderLabel(Hue Shift, 13)]
		[Space(4)]
		[ToggleUI]_MatcapHueShiftEnabled ("Enabled", Float) = 0
		_MatcapHueShiftSpeed ("Shift Speed", Float) = 0
		_MatcapHueShift ("Hue Shift", Range(0, 1)) = 0
		[HideInInspector] m_end_matcap ("Matcap", Float) = 0
		
		// Second Matcap
		[HideInInspector] m_start_Matcap2 ("Matcap 2--{reference_property:_Matcap2Enable}", Float) = 0
		[ThryToggle(COLOR_GRADING_HDR_3D)]_Matcap2Enable ("Enable Matcap 2", Float) = 0
		_Matcap2Color ("Color", Color) = (1, 1, 1, 1)
		[TextureNoSO]_Matcap2 ("Matcap", 2D) = "white" { }
		_Matcap2Border ("Border", Range(0, .5)) = 0.43
		_Matcap2Mask ("Mask--{reference_properties:[_Matcap2MaskPan, _Matcap2MaskUV, _Matcap2MaskInvert]}", 2D) = "white" { }
		[HideInInspector][Vector2]_Matcap2MaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _Matcap2MaskUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_Matcap2MaskInvert ("Invert", Float) = 0
		_Matcap2EmissionStrength ("Emission Strength", Range(0, 20)) = 0
		_Matcap2Intensity ("Intensity", Range(0, 5)) = 1
		_Matcap2LightMask ("Hide in Shadow", Range(0, 1)) = 0
		_Matcap2Replace ("Replace With Matcap", Range(0, 1)) = 0
		_Matcap2Multiply ("Multiply Matcap", Range(0, 1)) = 0
		_Matcap2Add ("Add Matcap", Range(0, 1)) = 0
		[Enum(Vertex, 0, Pixel, 1)] _Matcap2Normal ("Normal to use", Int) = 1
		
		[Space(10)]
		[ThryHeaderLabel(Custom Normal, 13)]
		[Space(4)]
		[ThryToggle(POI_MATCAP1_CUSTOM_NORMAL)]_Matcap1CustomNormal ("Custom Normal", Float) = 0
		[Normal]_Matcap1NormalMap ("Normal Map--{reference_properties:[_Matcap1NormalMapPan, _Matcap1NormalMapUV, _Matcap1NormalMapScale]}", 2D) = "bump" { }
		[HideInInspector][Vector2]_Matcap1NormalMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7)] _Matcap1NormalMapUV ("UV", Int) = 0
		[HideInInspector]_Matcap1NormalMapScale ("Intensity", Range(0, 10)) = 1
		
		[Space(10)]
		[ThryHeaderLabel(Hue Shift, 13)]
		[Space(4)]
		[ToggleUI]_Matcap2HueShiftEnabled ("Enabled", Float) = 0
		_Matcap2HueShiftSpeed ("Shift Speed", Float) = 0
		_Matcap2HueShift ("Hue Shift", Range(0, 1)) = 0
		[HideInInspector] m_end_Matcap2 ("Matcap 2", Float) = 0
		
		// Rim Lighting
		[HideInInspector] m_start_rimLightOptions ("Rim Lighting--{reference_property:_EnableRimLighting}", Float) = 0
		[HideInInspector][ThryToggle(_GLOSSYREFLECTIONS_OFF)]_EnableRimLighting ("Enable Rim Lighting", Float) = 0
		[Enum(vertex, 0, pixel, 1)] _RimLightNormal ("Normal Select", Int) = 1
		[ToggleUI]_RimLightingInvert ("Invert Rim Lighting", Float) = 0
		_RimLightColor ("Rim Color", Color) = (1, 1, 1, 1)
		_RimWidth ("Rim Width", Range(0, 1)) = 0.8
		_RimSharpness ("Rim Sharpness", Range(0, 1)) = .25
		_RimStrength ("Rim Emission", Range(0, 20)) = 0
		_RimBrighten ("Rim Color Brighten", Range(0, 3)) = 0
		_RimLightColorBias ("Rim Color Bias", Range(0, 1)) = 1
		_RimTex ("Rim Texture--{reference_properties:[_RimTexPan, _RimTexUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_RimTexPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _RimTexUV ("UV", Int) = 0
		_RimMask ("Rim Mask--{reference_properties:[_RimMaskPan, _RimMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_RimMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _RimMaskUV ("UV", Int) = 0
		
		[Space(10)]
		[ThryToggleUI(true)] _RimHueShiftEnabled ("<size=13><b>  Hue Shift</b></size>", Float) = 0
		_RimHueShiftSpeed ("Shift Speed--{condition_showS:(_RimHueShiftEnabled==1)}", Float) = 0
		_RimHueShift ("Hue Shift--{condition_showS:(_RimHueShiftEnabled==1)}", Range(0, 1)) = 0
		[HideInInspector] m_end_rimLightOptions ("Rim Lighting", Float) = 0
		
		// Outlines
		[HideInInspector] m_OutlineCategory ("Outlines", Float) = 0
		// Outline Vertex
		[ToggleUI]_EnableOutlines ("Enable Outlines", float) = 0
		[Enum(Basic, 0, Tint, 1, Rim Light, 2, Directional, 3, DropShadow, 4)]_OutlineMode ("Mode", Int) = 0
		_OutlineTintMix ("Tint Mix--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==1}}", Range(0, 1)) = 0
		_OutlineRimLightBlend ("Rim Light Blend--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==2}}", Range(0, 1)) = 0
		_OutlinePersonaDirection ("directional Offset XY--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==3}}", Vector) = (1, 0, 0, 0)
		_OutlineDropShadowOffset ("Drop Direction XY--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==4}}", Vector) = (1, 0, 0, 0)
		[ToggleUI]_OutlineFixedSize ("Fixed Size?", Float) = 0
		_OutlinesMaxDistance ("Fixed Size Max Distance", Float) = 9999
		[Enum(Off, 0, Normals, 1, Mask VC.r, 2)]_OutlineUseVertexColors ("Vertex Color", Float) = 0
		[ToggleUI]_OutlineLit ("Enable Lighting", Float) = 1
		_LineWidth ("Width", Float) = 0
		_LineColor ("Color", Color) = (1, 1, 1, 1)
		_OutlineEmission ("Outline Emission", Float) = 0
		_OutlineTexture ("Outline Texture--{reference_properties:[_OutlineTexturePan, _OutlineTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_OutlineTexturePan ("Outline Texture Pan", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _OutlineTextureUV ("UV", Int) = 0
		_OutlineMask ("Outline Mask--{reference_properties:[_OutlineMaskPan, _OutlineMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_OutlineMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _OutlineMaskUV ("UV", Int) = 0
		_OutlineShadowStrength ("Shadow Strength", Range(0, 1)) = 1
		[Header(Hue Shift)]
		[ToggleUI]_OutlineHueShift ("Hue Shift?", Float) = 0
		_OutlineHueOffset ("Shift", Range(0, 1)) = 0
		_OutlineHueOffsetSpeed ("Shift Speed", Float) = 0
		[HideInInspector] m_start_outlineAdvanced ("Advanced", Float) = 0
		[Vector2]_OutlineFadeDistance ("Outline distance Fade", Vector) = (0, 0, 0, 0)
		[Enum(UnityEngine.Rendering.CullMode)] _OutlineCull ("Cull", Float) = 1
		_OutlineOffsetFactor ("Offset Factor", Float) = 0
		_OutlineOffsetUnits ("Offset Units", Float) = 0
		[HideInInspector] m_end_outlineAdvanced ("Advanced", Float) = 0
		
		// Rendering Options
		[HideInInspector] m_specialFXCategory ("Special FX", Float) = 0
		//TODO Add inverts to the masks
		//Emission 1
		[HideInInspector] m_start_emissionOptions ("Emission / Glow--{reference_property:_EnableEmission}", Float) = 0
		[HideInInspector][ThryToggle(_EMISSION)]_EnableEmission ("Enable Emission", Float) = 0
		[ToggleUI]_EmissionReplace ("Replace Base Color", Float) = 0
		[HDR]_EmissionColor ("Emission Color", Color) = (1, 1, 1, 1)
		[Gradient]_EmissionMap ("Emission Map--{reference_properties:[_EmissionMapPan, _EmissionMapUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_EmissionMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )] _EmissionMapUV ("UV", Int) = 0
		[ToggleUI]_EmissionBaseColorAsMap ("Base Color as Map?", Float) = 0
		_EmissionMask ("Emission Mask--{reference_properties:[_EmissionMaskPan, _EmissionMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_EmissionMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )] _EmissionMaskUV ("UV", Int) = 0
		_EmissionStrength ("Emission Strength", Range(0, 20)) = 0
		
		[Space(10)]
		[ThryToggleUI(true)]_EmissionHueShiftEnabled ("<size=13><b>  Hue Shift</b></size>", Float) = 0
		_EmissionHueShift ("Hue Shift--{condition_showS:(_EmissionHueShiftEnabled==1)}", Range(0, 1)) = 0
		_EmissionHueShiftSpeed ("Hue Shift Speed--{condition_showS:(_EmissionHueShiftEnabled==1)}", Float) = 0
		
		// Center out emission
		[Space(10)]
		[ThryToggleUI(true)]_EmissionCenterOutEnabled ("<size=13><b>  Center Out</b></size>", Float) = 0
		_EmissionCenterOutSpeed ("Flow Speed--{condition_showS:(_EmissionCenterOutEnabled==1)}", Float) = 5
		
		// Glow in the dark Emission
		[Space(10)]
		[ThryToggleUI(true)]_EnableGITDEmission ("<size=13><b>  Light Based</b></size>", Float) = 0
		[Enum(World, 0, Mesh, 1)] _GITDEWorldOrMesh ("Lighting Type--{condition_showS:(_EnableGITDEmission==1)}", Int) = 0
		_GITDEMinEmissionMultiplier ("Min Emission Multiplier--{condition_showS:(_EnableGITDEmission==1)}", Range(0, 1)) = 1
		_GITDEMaxEmissionMultiplier ("Max Emission Multiplier--{condition_showS:(_EnableGITDEmission==1)}", Range(0, 1)) = 0
		_GITDEMinLight ("Min Lighting--{condition_showS:(_EnableGITDEmission==1)}", Range(0, 1)) = 0
		_GITDEMaxLight ("Max Lighting--{condition_showS:(_EnableGITDEmission==1)}", Range(0, 1)) = 1
		
		// Blinking Emission
		[Space(10)]
		[ThryToggleUI(true)]_EmissionBlinkingEnabled ("<size=13><b>  Blinking</b></size>", Float) = 0
		_EmissiveBlink_Min ("Emissive Blink Min--{condition_showS:(_EmissionBlinkingEnabled==1)}", Float) = 0
		_EmissiveBlink_Max ("Emissive Blink Max--{condition_showS:(_EmissionBlinkingEnabled==1)}", Float) = 1
		_EmissiveBlink_Velocity ("Emissive Blink Velocity--{condition_showS:(_EmissionBlinkingEnabled==1)}", Float) = 4
		_EmissionBlinkingOffset ("Offset--{condition_showS:(_EmissionBlinkingEnabled==1)}", Float) = 0
		
		// Scrolling Emission
		[Space(10)]
		[ThryToggleUI(true)] _ScrollingEmission ("<size=13><b>  Scrolling</b></size>", Float) = 0
		[ToggleUI]_EmissionScrollingUseCurve ("Use Curve--{condition_showS:(_ScrollingEmission==1)}", float) = 0
		[Curve]_EmissionScrollingCurve ("Curve--{condition_showS:(_ScrollingEmission==1&&_EmissionScrollingUseCurve==1)}", 2D) = "white" { }
		[ToggleUI]_EmissionScrollingVertexColor ("VColor as position--{condition_showS:(_ScrollingEmission==1)}", float) = 0
		_EmissiveScroll_Direction ("Direction--{condition_showS:(_ScrollingEmission==1)}", Vector) = (0, -10, 0, 0)
		_EmissiveScroll_Width ("Width--{condition_showS:(_ScrollingEmission==1)}", Float) = 10
		_EmissiveScroll_Velocity ("Velocity--{condition_showS:(_ScrollingEmission==1)}", Float) = 10
		_EmissiveScroll_Interval ("Interval--{condition_showS:(_ScrollingEmission==1)}", Float) = 20
		_EmissionScrollingOffset ("Offset--{condition_showS:(_ScrollingEmission==1)}", Float) = 0
		
		[Space(10)]
		[ThryToggleUI(true)] _AudioLinkEmission0Enabled ("<size=13><b>  Audio Link</b></size>--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Vector2]_AudioLinkEmission0StrengthMod ("Emission Strength Add--{ condition_showS:(_AudioLinkEmission0Enabled==1 && _EnableAudioLink==1)}", Vector) = (0, 0, 0, 0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission0StrengthBand ("Emission Add Band--{ condition_showS:(_AudioLinkEmission0Enabled==1 && _EnableAudioLink==1)}", Int) = 0
		[Vector2] _AudioLinkEmission0CenterOut ("Center Out--{ condition_showS:(_AudioLinkEmission0Enabled==1 && _EnableAudioLink==1)}", Vector) = (0, 0, 0, 0)
		_AudioLinkEmission0CenterOutwidth ("Center Out Duration--{ condition_showS:(_AudioLinkEmission0Enabled==1 && _EnableAudioLink==1)}", Range(0, 1)) = 1
		_AudioLinkEmission0CenterOutSize ("Wave Size--{ condition_showS:(_AudioLinkEmission0Enabled==1 && _EnableAudioLink==1)}", Range(0, 1)) = 1
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission0CenterOutBand ("Center Out Band--{ condition_showS:(_AudioLinkEmission0Enabled==1 && _EnableAudioLink==1)}", Int) = 0
		
		[HideInInspector] m_end_emissionOptions ("", Float) = 0
		
		// Second Emission
		[HideInInspector] m_start_emission1Options ("Emission / Glow 2 (Requires Emission 1 Enabled)--{reference_property:_EnableEmission1}", Float) = 0
		[HideInInspector][ThryToggle(EFFECT_HUE_VARIATION)]_EnableEmission1 ("Enable Emission 2", Float) = 0
		[HDR]_EmissionColor1 ("Emission Color", Color) = (1, 1, 1, 1)
		[Gradient]_EmissionMap1 ("Emission Map--{reference_properties:[_EmissionMap1Pan, _EmissionMap1UV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_EmissionMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )] _EmissionMap1UV ("UV", Int) = 0
		[ToggleUI]_EmissionBaseColorAsMap1 ("Base Color as Map?", Float) = 0
		_EmissionMask1 ("Emission Mask--{reference_properties:[_EmissionMask1Pan, _EmissionMask1UV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_EmissionMask1Pan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )] _EmissionMask1UV ("UV", Int) = 0
		_EmissionStrength1 ("Emission Strength", Range(0, 20)) = 0
		
		[Space(10)]
		[ThryToggleUI(true)]_EmissionHueShiftEnabled1 ("<size=13><b>  Hue Shift</b></size>", Float) = 0
		_EmissionHueShift1 ("Hue Shift--{condition_showS:(_EmissionHueShiftEnabled1==1)}", Range(0, 1)) = 0
		_EmissionHueShiftSpeed1 ("Hue Shift Speed--{condition_showS:(_EmissionHueShiftEnabled1==1)}", Float) = 0
		
		// Second Center Out Enission
		[Space(10)]
		[HideInInspector][ToggleUI]_EmissionCenterOutEnabled1 ("<size=13><b>  Center Out</b></size>", Float) = 0
		_EmissionCenterOutSpeed1 ("Flow Speed--{condition_showS:(_EmissionCenterOutEnabled1==1)}", Float) = 5
		
		// Second Glow In The Dark Emission
		[Space(10)]
		[ThryToggleUI(true)]_EnableGITDEmission1 ("<size=13><b>  Light Based</b></size>", Float) = 0
		[Enum(World, 0, Mesh, 1)] _GITDEWorldOrMesh1 ("Lighting Type--{condition_showS:(_EnableGITDEmission1==1)}", Int) = 0
		_GITDEMinEmissionMultiplier1 ("Min Emission Multiplier--{condition_showS:(_EnableGITDEmission1==1)}", Range(0, 1)) = 1
		_GITDEMaxEmissionMultiplier1 ("Max Emission Multiplier--{condition_showS:(_EnableGITDEmission1==1)}", Range(0, 1)) = 0
		_GITDEMinLight1 ("Min Lighting--{condition_showS:(_EnableGITDEmission1==1)}", Range(0, 1)) = 0
		_GITDEMaxLight1 ("Max Lighting--{condition_showS:(_EnableGITDEmission1==1)}", Range(0, 1)) = 1
		
		// Second Blinking Emission
		[Space(10)]
		[ThryToggleUI(true)]_EmissionBlinkingEnabled1 ("<size=13><b>  Blinking</b></size>", Float) = 0
		_EmissiveBlink_Min1 ("Emissive Blink Min--{condition_showS:(_EmissionBlinkingEnabled1==1)}", Float) = 0
		_EmissiveBlink_Max1 ("Emissive Blink Max--{condition_showS:(_EmissionBlinkingEnabled1==1)}", Float) = 1
		_EmissiveBlink_Velocity1 ("Emissive Blink Velocity--{condition_showS:(_EmissionBlinkingEnabled1==1)}", Float) = 4
		_EmissionBlinkingOffset1 ("Offset--{condition_showS:(_EmissionBlinkingEnabled1==1)}", Float) = 0
		
		// Scrolling Scrolling Emission
		[Space(10)]
		[ThryToggleUI(true)] _ScrollingEmission1 ("<size=13><b>  Scrolling</b></size>", Float) = 0
		[ToggleUI]_EmissionScrollingUseCurve1 ("Use Curve--{condition_showS:(_ScrollingEmission1==1)}", float) = 0
		[Curve]_EmissionScrollingCurve1 ("Curve--{condition_showS:(_ScrollingEmission1==1&&_EmissionScrollingUseCurve1==1)}", 2D) = "white" { }
		[ToggleUI]_EmissionScrollingVertexColor1 ("VColor as position--{condition_showS:(_ScrollingEmission1==1)}", float) = 0
		_EmissiveScroll_Direction1 ("Direction--{condition_showS:(_ScrollingEmission1==1)}", Vector) = (0, -10, 0, 0)
		_EmissiveScroll_Width1 ("Width--{condition_showS:(_ScrollingEmission1==1)}", Float) = 10
		_EmissiveScroll_Velocity1 ("Velocity--{condition_showS:(_ScrollingEmission1==1)}", Float) = 10
		_EmissiveScroll_Interval1 ("Interval--{condition_showS:(_ScrollingEmission1==1)}", Float) = 20
		_EmissionScrollingOffset1 ("Offset--{condition_showS:(_ScrollingEmission1==1)}", Float) = 0
		
		[Space(10)]
		[ThryToggleUI(true)] _AudioLinkEmission1Enabled ("<size=13><b>  Audio Link</b></size>--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Vector2]_AudioLinkEmission1StrengthMod ("Emission Strength Add--{ condition_showS:(_AudioLinkEmission1Enabled==1 && _EnableAudioLink==1)}", Vector) = (0, 0, 0, 0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission1StrengthBand ("Emission Add Band--{ condition_showS:(_AudioLinkEmission1Enabled==1 && _EnableAudioLink==1)}", Int) = 0
		[Vector2] _AudioLinkEmission1CenterOut ("Center Out--{ condition_showS:(_AudioLinkEmission1Enabled==1 && _EnableAudioLink==1)}", Vector) = (0, 0, 0, 0)
		_AudioLinkEmission1CenterOutwidth ("Center Out Duration--{ condition_showS:(_AudioLinkEmission1Enabled==1 && _EnableAudioLink==1)}", Range(0, 1)) = 1
		_AudioLinkEmission1CenterOutSize ("Wave Size--{ condition_showS:(_AudioLinkEmission1Enabled==1 && _EnableAudioLink==1)}", Range(0, 1)) = 1
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission1CenterOutBand ("Center Out Band--{ condition_showS:(_AudioLinkEmission1Enabled==1 && _EnableAudioLink==1)}", Int) = 0
		
		[HideInInspector] m_end_emission1Options ("", Float) = 0
		
		// Glitter
		[HideInInspector] m_start_glitter ("Glitter / Sparkle--{reference_property:_GlitterEnable}", Float) = 0
		[HideInInspector][ThryToggle(_SUNDISK_SIMPLE)]_GlitterEnable ("Enable Glitter?", Float) = 0
		[Enum(Angle, 0, Linear Emission, 1, Light Reflections, 2)]_GlitterMode ("Mode", Int) = 0
		[Enum(Circle, 0, Square, 1)]_GlitterShape ("Shape", Int) = 0
		[Enum(Add, 0, Replace, 1)] _GlitterBlendType ("Blend Mode", Int) = 0
		[HDR]_GlitterColor ("Color", Color) = (1, 1, 1)
		_GlitterUseSurfaceColor ("Use Surface Color", Range(0, 1)) = 0
		_GlitterColorMap ("Glitter Color Map--{reference_properties:[_GlitterColorMapPan, _GlitterColorMapUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_GlitterColorMapPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _GlitterColorMapUV ("UV", Int) = 0
		[HideInInspector][Vector2]_GlitterPan ("Panning", Vector) = (0, 0, 0, 0)
		_GlitterMask ("Glitter Mask--{reference_properties:[_GlitterMaskPan, _GlitterMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_GlitterMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _GlitterMaskUV ("UV", Int) = 0
		_GlitterTexture ("Glitter Texture--{reference_properties:[_GlitterTexturePan]}", 2D) = "white" { }
		[HideInInspector][Vector2]_GlitterTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[Vector2]_GlitterUVPanning ("Panning Speed", Vector) = (0, 0, 0, 0)
		_GlitterTextureRotation ("Rotation Speed", Float) = 0
		_GlitterFrequency ("Glitter Density", Float) = 300.0
		_GlitterJitter ("Glitter Jitter", Range(0, 1)) = 1.0
		_GlitterSpeed ("Glitter Speed", Float) = 10.0
		_GlitterSize ("Glitter Size", Range(0, 1)) = .3
		_GlitterContrast ("Glitter Contrast--{condition_showS:(_GlitterMode==0||_GlitterMode==2)}", Range(1, 1000)) = 300
		_GlitterAngleRange ("Glitter Angle Range--{condition_showS:(_GlitterMode==0||_GlitterMode==2)}", Range(0, 90)) = 90
		_GlitterMinBrightness ("Glitter Min Brightness", Range(0, 1)) = 0
		_GlitterBrightness ("Glitter Max Brightness", Range(0, 40)) = 3
		_GlitterBias ("Glitter Bias--{condition_show:(_GlitterMode==0)}", Range(0, 1)) = .8
		_GlitterHideInShadow ("Hide in shadow", Range(0, 1)) = 0
		_GlitterCenterSize ("dim light--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_GlitterMode==1},condition2:{type:PROPERTY_BOOL,data:_GlitterShape==1}}}", Range(0, 1)) = .08
		_glitterFrequencyLinearEmissive ("Frequency--{condition_show:{type:PROPERTY_BOOL,data:_GlitterMode==1}}", Range(0, 100)) = 20
		_GlitterJaggyFix ("Jaggy Fix--{condition_show:{type:PROPERTY_BOOL,data:_GlitterShape==1}}", Range(0, .1)) = .0
		
		[Space(10)]
		[ThryToggleUI(true)]_GlitterHueShiftEnabled ("<size=13><b>  Hue Shift</b></size>", Float) = 0
		_GlitterHueShiftSpeed ("Shift Speed--{condition_showS:(_GlitterHueShiftEnabled==1)}", Float) = 0
		_GlitterHueShift ("Hue Shift--{condition_showS:(_GlitterHueShiftEnabled==1)}", Range(0, 1)) = 0
		
		[Space(10)]
		[ThryToggleUI(true)]_GlitterRandomColors ("<size=13><b>  Random Stuff</b></size>", Float) = 0
		[MultiSlider]_GlitterMinMaxSaturation ("Saturation Range--{condition_showS:(_GlitterRandomColors==1)}", Vector) = (0.8, 1, 0, 1)
		[MultiSlider]_GlitterMinMaxBrightness ("Brightness Range--{condition_showS:(_GlitterRandomColors==1)}", Vector) = (0.8, 1, 0, 1)
		[ToggleUI]_GlitterRandomSize ("Random Size?--{condition_showS:(_GlitterRandomColors==1)}", Float) = 0
		[MultiSlider]_GlitterMinMaxSize ("Size Range--{condition_showS:(_GlitterRandomColors==1)}", Vector) = (0.1, 0.5, 0, 1)
		[ToggleUI]_GlitterRandomRotation ("Random Tex Rotation--{condition_showS:(_GlitterRandomColors==1)}", Float) = 0
		
		[HideInInspector] m_end_glitter ("Glitter / Sparkle--{condition_showS:(_GlitterRandomColors==1)}", Float) = 0
		
		// Flipbook
		[HideInInspector] m_start_flipBook ("Flipbook--{reference_property:_EnableFlipbook}", Float) = 0
		[ThryToggle(_SUNDISK_HIGH_QUALITY)]_EnableFlipbook ("Enable Flipbook", Float) = 0
		[ToggleUI]_FlipbookAlphaControlsFinalAlpha ("Flipbook Controls Alpha?", Float) = 0
		[ToggleUI]_FlipbookIntensityControlsAlpha ("Intensity Controls Alpha?", Float) = 0
		[ToggleUI]_FlipbookColorReplaces ("Color Replaces Flipbook", Float) = 0
		[TextureArray]_FlipbookTexArray ("Texture Array--{reference_properties:[_FlipbookTexArrayPan, _FlipbookTexArrayUV]}", 2DArray) = "" { }
		[HideInInspector][Vector2]_FlipbookTexArrayPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _FlipbookTexArrayUV ("UV", Int) = 0
		_FlipbookMask ("Mask--{reference_properties:[_FlipbookMaskPan, _FlipbookMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_FlipbookMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _FlipbookMaskUV ("UV", Int) = 0
		_FlipbookColor ("Color & alpha", Color) = (1, 1, 1, 1)
		_FlipbookTotalFrames ("Total Frames", Float) = 1
		_FlipbookFPS ("FPS", Float) = 30.0
		_FlipbookScaleOffset ("Scale | Offset", Vector) = (1, 1, 0, 0)
		[ToggleUI]_FlipbookTiled ("Tiled?", Float) = 0
		_FlipbookEmissionStrength ("Emission Strength", Range(0, 20)) = 0
		_FlipbookRotation ("Rotation", Range(0, 360)) = 0
		_FlipbookRotationSpeed ("Rotation Speed", Float) = 0
		_FlipbookReplace ("Replace", Range(0, 1)) = 1
		_FlipbookMultiply ("Multiply", Range(0, 1)) = 0
		_FlipbookAdd ("Add", Range(0, 1)) = 0
		
		//Flipbook audio link
		[HideInInspector] m_start_FlipbookAudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookScaleBand ("Scale Band", Int) = 0
		_AudioLinkFlipbookScale ("Scale Mod", Vector) = (0, 0, 0, 0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookAlphaBand ("Alpha Band", Int) = 0
		[Vector2]_AudioLinkFlipbookAlpha ("Alpha Mod", Vector) = (1, 1, 0, 0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookEmissionBand ("Emission Band", Int) = 0
		[Vector2]_AudioLinkFlipbookEmission ("Emission Mod", Vector) = (0, 0, 0, 0)
		[Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookFrameBand ("Frame Band", Int) = 0
		[Vector2]_AudioLinkFlipbookFrame ("Frame control", Vector) = (0, 0, 0, 0)
		[HideInInspector] m_end_FlipbookAudioLink ("Audio Link", Float) = 0
		
		// Flipbook Manual Control
		[HideInInspector] m_start_manualFlipbookControl ("Manual Control", Float) = 0
		_FlipbookCurrentFrame ("Current Frame", Float) = -1
		[HideInInspector] m_end_manualFlipbookControl ("Manual Control", Float) = 0
		
		[HideInInspector] m_start_crossfade ("Crossfade", Float) = 0
		[ToggleUI]_FlipbookCrossfadeEnabled ("Enable Crossfade?", Float) = 0
		[MultiSlider]_FlipbookCrossfadeRange ("Fade Range", Vector) = (0.75, 1, 0, 1)
		[HideInInspector] m_end_crossfade ("Crossfade", Float) = 0
		
		[HideInInspector] m_start_flipbookHueShift ("Hue Shift", Float) = 0
		[ToggleUI]_FlipbookHueShiftEnabled ("Enabled", Float) = 0
		_FlipbookHueShiftSpeed ("Shift Speed", Float) = 0
		_FlipbookHueShift ("Hue Shift", Range(0, 1)) = 0
		[HideInInspector] m_end_flipbookHueShift ("Hue Shift", Float) = 0
		[HideInInspector] m_end_flipBook ("Flipbook", Float) = 0
		
		// Dissolve
		[HideInInspector] m_start_dissolve ("Dissolve--{reference_property:_EnableDissolve}", Float) = 0
		[HideInInspector][ThryToggle(DISTORT)]_EnableDissolve ("Enable Dissolve", Float) = 0
		[Enum(Basic, 1, Point2Point, 2)] _DissolveType ("Dissolve Type", Int) = 1
		_DissolveEdgeWidth ("Edge Width", Range(0, .5)) = 0.025
		_DissolveEdgeHardness ("Edge Hardness", Range(0, 1)) = 0.5
		_DissolveEdgeColor ("Edge Color", Color) = (1, 1, 1, 1)
		[Gradient]_DissolveEdgeGradient ("Edge Gradient", 2D) = "white" { }
		_DissolveEdgeEmission ("Edge Emission", Range(0, 20)) = 0
		_DissolveTextureColor ("Dissolved Color", Color) = (1, 1, 1, 1)
		_DissolveToTexture ("Dissolved Texture--{reference_properties:[_DissolveToTexturePan, _DissolveToTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DissolveToTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveToTextureUV ("UV", Int) = 0
		_DissolveToEmissionStrength ("Dissolved Emission Strength", Range(0, 20)) = 0
		_DissolveNoiseTexture ("Dissolve Gradient--{reference_properties:[_DissolveNoiseTexturePan, _DissolveNoiseTextureUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DissolveNoiseTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveNoiseTextureUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_DissolveInvertNoise ("Invert?", Float) = 0
		_DissolveDetailNoise ("Dissolve Noise--{reference_properties:[_DissolveDetailNoisePan, _DissolveDetailNoiseUV]}", 2D) = "black" { }
		[HideInInspector][Vector2]_DissolveDetailNoisePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveDetailNoiseUV ("UV", Int) = 0
		[HideInInspector][ToggleUI]_DissolveInvertDetailNoise ("Invert?", Float) = 0
		_DissolveDetailStrength ("Dissolve Detail Strength", Range(0, 1)) = 0.1
		_DissolveAlpha ("Dissolve Alpha", Range(0, 1)) = 0
		_DissolveMask ("Dissolve Mask--{reference_properties:[_DissolveMaskPan, _DissolveMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DissolveMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveMaskUV ("UV", Int) = 0
		[ToggleUI]_DissolveUseVertexColors ("VertexColor.g Mask", Float) = 0
		[HideInInspector][ToggleUI]_DissolveMaskInvert ("Invert?", Float) = 0
		_ContinuousDissolve ("Continuous Dissolve Speed", Float) = 0
		
		// Point to Point Dissolve
		[HideInInspector] m_start_pointToPoint ("point to point--{condition_showS:(_DissolveType==2)}", Float) = 0
		[Enum(Local, 0, World, 1, Vertex Colors, 2)] _DissolveP2PWorldLocal ("World/Local", Int) = 0
		_DissolveP2PEdgeLength ("Edge Length", Float) = 0.1
		[Vector3]_DissolveStartPoint ("Start Point", Vector) = (0, -1, 0, 0)
		[Vector3]_DissolveEndPoint ("End Point", Vector) = (0, 1, 0, 0)
		[HideInInspector] m_end_pointToPoint ("Point To Point", Float) = 0
		
		[HideInInspector] m_start_dissolveHueShift ("Hue Shift--{reference_property:_DissolveHueShiftEnabled}", Float) = 0
		[HideInInspector][ToggleUI]_DissolveHueShiftEnabled ("Dissolved Enabled", Float) = 0
		_DissolveHueShiftSpeed ("Dissolved Speed", Float) = 0
		_DissolveHueShift ("Dissolved Shift", Range(0, 1)) = 0
		[ToggleUI]_DissolveEdgeHueShiftEnabled ("Edge Enabled", Float) = 0
		_DissolveEdgeHueShiftSpeed ("Edge Speed", Float) = 0
		_DissolveEdgeHueShift ("Edge Shift", Range(0, 1)) = 0
		[HideInInspector] m_end_dissolveHueShift ("Hue Shift", Float) = 0
		
		// Locked in anim sldiers
		[HideInInspector] m_start_BonusSliders ("Locked In Anim Sliders", Float) = 0
		_DissolveAlpha0 ("Dissolve Alpha 0", Range(-1, 1)) = 0
		_DissolveAlpha1 ("Dissolve Alpha 1", Range(-1, 1)) = 0
		_DissolveAlpha2 ("Dissolve Alpha 2", Range(-1, 1)) = 0
		_DissolveAlpha3 ("Dissolve Alpha 3", Range(-1, 1)) = 0
		_DissolveAlpha4 ("Dissolve Alpha 4", Range(-1, 1)) = 0
		_DissolveAlpha5 ("Dissolve Alpha 5", Range(-1, 1)) = 0
		_DissolveAlpha6 ("Dissolve Alpha 6", Range(-1, 1)) = 0
		_DissolveAlpha7 ("Dissolve Alpha 7", Range(-1, 1)) = 0
		_DissolveAlpha8 ("Dissolve Alpha 8", Range(-1, 1)) = 0
		_DissolveAlpha9 ("Dissolve Alpha 9", Range(-1, 1)) = 0
		[HideInInspector] m_end_BonusSliders ("Locked In Sliders", Float) = 0
		[HideInInspector] m_end_dissolve ("Dissolve", Float) = 0
		
		// Rendering Options
		[HideInInspector] m_modifierCategory ("Modifiers", Float) = 0
		[HideInInspector] m_start_uvModifiers ("UV Channels", Float) = 0
		[ThryHeaderLabel(Distorted UV, 13)]
		[Space(4)]
		[ThryToggle(USER_LUT)] _EnableDistortion ("Enabled?", Float) = 0
		[ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6)] _DistortionUvToDistort ("Distorted UV", Int) = 0
		_DistortionMask ("Mask--{reference_properties:[_DistortionMaskPan, _DistortionMaskUV]}", 2D) = "white" { }
		[HideInInspector][Vector2]_DistortionMaskPan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6)] _DistortionMaskUV ("UV", Int) = 0
		_DistortionFlowTexture ("Distortion Texture 1--{reference_properties:[_DistortionFlowTexturePan, _DistortionFlowTextureUV]}", 2D) = "black" { }
		[HideInInspector][Vector2]_DistortionFlowTexturePan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6)] _DistortionFlowTextureUV ("UV", Int) = 0
		_DistortionFlowTexture1 ("Distortion Texture 2--{reference_properties:[_DistortionFlowTexture1Pan, _DistortionFlowTexture1UV]}", 2D) = "black" { }
		[HideInInspector][Vector2]_DistortionFlowTexture1Pan ("Panning", Vector) = (0, 0, 0, 0)
		[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6)] _DistortionFlowTexture1UV ("UV", Int) = 0
		_DistortionStrength ("Strength1", Float) = 0.03
		_DistortionStrength1 ("Strength2", Float) = 0.01
		[Space(10)]
		[ThryHeaderLabel(Panosphere UV, 13)]
		[Space(4)]
		[ToggleUI] _StereoEnabled ("Stereo Enabled", Float) = 0
		[Space(10)]
		[ThryHeaderLabel(Polar Coordinates, 13)]
		[Space(4)]
		[ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5)] _PolarUV ("UV", Int) = 0
		[Vector2]_PolarCenter ("Center Coordinate", Vector) = (.5, .5, 0, 0)
		_PolarRadialScale ("Radial Scale", Float) = 1
		_PolarLengthScale ("Length Scale", Float) = 1
		_PolarSpiralPower ("Spiral Power", Float) = 0
		[HideInInspector] m_end_uvModifiers ("UV Channels", Float) = 0
		
		// Audio link
		[HideInInspector] m_start_audioLink ("Audio Link--{reference_property:_EnableAudioLink}", Float) = 0
		[HideInInspector][ThryToggle(COLOR_GRADING_LOG_VIEW)] _EnableAudioLink ("Enabled?", Float) = 0
		[Helpbox(1)] _AudioLinkHelp ("This section houses the global controls for audio link. Controls for individual features are in their respective sections. (Emission, Dissolve, etc...)", Int) = 0
		[ToggleUI] _AudioLinkAnimToggle ("Anim Toggle", Float) = 1
		_AudioLinkDelay ("Delay", Range(0, 1)) = 0
		//[ToggleUI]_AudioLinkAveraging ("Enable averaging", Float) = 0
		//_AudioLinkAverageRange ("Average Sampling Range", Range(0, 1)) = .5
		[HideInInspector] m_end_audioLink ("Audio Link", Float) = 0
		
		// Rendering Options
		[HideInInspector] m_postprocessing ("Post Processing", Float) = 0
		
		// Rendering Options
		[HideInInspector] m_renderingCategory ("Rendering", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
		[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 1
		[Enum(Thry.ColorMask)] _ColorMask ("Color Mask", Int) = 15
		_OffsetFactor ("Offset Factor", Float) = 0.0
		_OffsetUnits ("Offset Units", Float) = 0.0
		[ToggleUI]_IgnoreFog ("Ignore Fog", Float) = 0
		[HideInInspector] Instancing ("Instancing", Float) = 0 //add this property for instancing variants settings to be shown
		
		// Blending Options
		[HideInInspector] m_start_blending ("Blending", Float) = 0
		[Enum(Thry.BlendOp)]_BlendOp ("RGB Blend Op", Int) = 0
		[Enum(Thry.BlendOp)]_BlendOpAlpha ("Alpha Blend Op", Int) = 0
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Source Blend", Int) = 1
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Destination Blend", Int) = 0
		[HideInInspector] m_end_blending ("Blending", Float) = 0
		
		// Stencils
		[HideInInspector] m_start_StencilPassOptions ("Stencil", Float) = 0
		[IntRange] _StencilRef ("Stencil Reference Value", Range(0, 255)) = 0
		[IntRange] _StencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 255
		[IntRange] _StencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 255
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp ("Stencil Pass Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp ("Stencil Fail Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp ("Stencil ZFail Op", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompareFunction ("Stencil Compare Function", Float) = 8
		[HideInInspector] m_end_StencilPassOptions ("Stencil", Float) = 0
		
		// Outline Stencil
		[HideInInspector] m_start_OutlineStencil ("Outline Stencil", Float) = 0
		[IntRange] _OutlineStencilRef ("Stencil Reference Value", Range(0, 255)) = 0
		[IntRange] _OutlineStencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 255
		[IntRange] _OutlineStencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 255
		[Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilPassOp ("Stencil Pass Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilFailOp ("Stencil Fail Op", Float) = 0
		[Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilZFailOp ("Stencil ZFail Op", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _OutlineStencilCompareFunction ("Stencil Compare Function", Float) = 8
		[HideInInspector] m_end_OutlineStencil ("Outline Stencil", Float) = 0
		
	}
	SubShader
	{
		Tags { "RenderType" = "Opaque" "Queue" = "Geometry" }
		
		Pass
		{
			Tags { "LightMode" = "ForwardBase" }
			
			Stencil
			{
				Ref [_StencilRef]
				ReadMask [_StencilReadMask]
				WriteMask [_StencilWriteMask]
				Comp [_StencilCompareFunction]
				Pass [_StencilPassOp]
				Fail [_StencilFailOp]
				ZFail [_StencilZFailOp]
			}
			
			ZWrite [_ZWrite]
			Cull [_Cull]
			AlphaToMask [_AlphaToCoverage]
			ZTest [_ZTest]
			ColorMask [_ColorMask]
			Offset [_OffsetFactor], [_OffsetUnits]
			
			BlendOp [_BlendOp], [_BlendOpAlpha]
			Blend [_SrcBlend] [_DstBlend]
			
			CGPROGRAM
			
			#pragma target 5.0
			
			#pragma shader_feature USER_LUT
			
			//#pragma shader_feature KEYWORD
			
			#pragma shader_feature_local POI_LIGHT_DATA_DEBUG
			#pragma shader_feature_local POI_LIGHT_DATA_ADDITIVE_ENABLE
			#pragma shader_feature_local POI_VERTEXLIGHT_ON
			
			#pragma shader_feature VIGNETTE_MASKED
			#pragma multi_compile_local _LIGHTINGMODE_TEXTURERAMP _LIGHTINGMODE_MATHRAMP _LIGHTINGMODE_SHADEMAP _LIGHTINGMODE_REALISTIC _LIGHTINGMODE_WRAPPED _LIGHTINGMODE_SKIN _LIGHTINGMODE_FLAT
			
			#pragma shader_feature VIGNETTE_CLASSIC
			
			#pragma shader_feature _COLORADDSUBDIFF_ON
			#pragma shader_feature COLOR_GRADING_HDR_3D
			#pragma shader_feature_local POI_MATCAP0_CUSTOM_NORMAL
			#pragma shader_feature_local POI_MATCAP1_CUSTOM_NORMAL
			
			#pragma shader_feature _EMISSION
			#pragma shader_feature EFFECT_HUE_VARIATION
			
			#pragma shader_feature COLOR_GRADING_LOG_VIEW
			
			#pragma shader_feature_local POI_BACKFACE
			
			#pragma shader_feature FINALPASS
			
			#pragma shader_feature VIGNETTE
			#pragma shader_feature GEOM_TYPE_MESH
			
			#pragma shader_feature GEOM_TYPE_BRANCH
			#pragma shader_feature GEOM_TYPE_BRANCH_DETAIL
			#pragma shader_feature GEOM_TYPE_FROND
			#pragma shader_feature DEPTH_OF_FIELD_COC_VIEW
			
			#pragma shader_feature _SUNDISK_SIMPLE
			
			#pragma shader_feature _GLOSSYREFLECTIONS_OFF
			
			#pragma shader_feature _SUNDISK_HIGH_QUALITY
			
			#pragma shader_feature DISTORT
			
			#pragma shader_feature VERTEXLIGHT_ON
			#pragma multi_compile_fwdbase
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			
			// UNITY Includes
			#include "UnityCG.cginc"
			#include "UnityStandardUtils.cginc"
			#include "AutoLight.cginc"
			#include "UnityLightingCommon.cginc"
			#include "UnityPBSLighting.cginc"
			#pragma vertex vert
			#pragma fragment frag
			
			#define DielectricSpec float4(0.04, 0.04, 0.04, 1.0 - 0.04)
			#define pi float(3.14159265359)
			
			#define POI2D_SAMPLER_PAN(tex, texSampler, uv, pan) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv + _Time.x * pan))
			#define POI2D_SAMPLER(tex, texSampler, uv) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv))
			#define POI2D_PAN(tex, uv, pan) (tex2D(tex, uv + _Time.x * pan))
			#define POI2D(tex, uv) (tex2D(tex, uv))
			#define POI_SAMPLE_TEX2D(tex, uv) (UNITY_SAMPLE_TEX2D(tex, uv))
			#define POI_SAMPLE_TEX2D_PAN(tex, uv, pan) (UNITY_SAMPLE_TEX2D(tex, uv + _Time.x * pan))
			
			#define POI_SAFE_RGB1 float4(mainTexture.rgb * .0001, 1)
			#define POI_SAFE_RGBA mainTexture
			
			#if defined(UNITY_COMPILER_HLSL)
			#define PoiInitStruct(type, name) name = (type)0;
			#else
			#define PoiInitStruct(type, name)
			#endif
			
			#define POI_ERROR(poiMesh, gridSize) lerp(float3(1, 0, 1), float3(0, 0, 0), fmod(floor((poiMesh.worldPos.x) * gridSize) + floor((poiMesh.worldPos.y) * gridSize) + floor((poiMesh.worldPos.z) * gridSize), 2) == 0)
			
			#define POI_MODE_OPAQUE 0
			#define POI_MODE_CUTOUT 1
			#define POI_MODE_FADE 2
			#define POI_MODE_TRANSPARENT 3
			#define POI_MODE_ADDITIVE 4
			#define POI_MODE_SOFTADDITIVE 5
			#define POI_MODE_MULTIPLICATIVE 6
			#define POI_MODE_2XMULTIPLICATIVE 7
			#define POI_MODE_TRANSCLIPPING 9
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			
			[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )]
			*/
			// Map of where features in AudioLink are.
			#define ALPASS_DFT                      int2(0, 4)
			#define ALPASS_WAVEFORM                 int2(0, 6)
			#define ALPASS_AUDIOLINK                int2(0, 0)
			#define ALPASS_AUDIOBASS                int2(0, 0)
			#define ALPASS_AUDIOLOWMIDS             int2(0, 1)
			#define ALPASS_AUDIOHIGHMIDS            int2(0, 2)
			#define ALPASS_AUDIOTREBLE              int2(0, 3)
			#define ALPASS_AUDIOLINKHISTORY         int2(1, 0)
			#define ALPASS_GENERALVU                int2(0, 22)
			#define ALPASS_GENERALVU_INSTANCE_TIME  int2(2, 22)
			#define ALPASS_GENERALVU_LOCAL_TIME     int2(3, 22)
			#define ALPASS_GENERALVU_NETWORK_TIME   int2(4, 22)
			#define ALPASS_GENERALVU_PLAYERINFO     int2(6, 22)
			#define ALPASS_CCINTERNAL               int2(12, 22)
			#define ALPASS_CCSTRIP                  int2(0, 24)
			#define ALPASS_CCLIGHTS                 int2(0, 25)
			#define ALPASS_AUTOCORRELATOR           int2(0, 27)
			#define ALPASS_FILTEREDAUDIOLINK        int2(0, 28)
			
			// Some basic constants to use (Note, these should be compatible with
			// future version of AudioLink, but may change.
			#define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
			#define AUDIOLINK_SAMPLEDATA24          2046
			#define AUDIOLINK_EXPBINS               24
			#define AUDIOLINK_EXPOCT                10
			#define AUDIOLINK_ETOTALBINS (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
			#define AUDIOLINK_WIDTH                 128
			#define AUDIOLINK_SPS                   48000       // Samples per second
			#define AUDIOLINK_ROOTNOTE              0
			#define AUDIOLINK_4BAND_FREQFLOOR       0.123
			#define AUDIOLINK_4BAND_FREQCEILING     1
			#define AUDIOLINK_BOTTOM_FREQUENCY      13.75
			#define AUDIOLINK_BASE_AMPLITUDE        2.5
			#define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
			#define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
			#define AUDIOLINK_DFT_Q                 4.0
			#define AUDIOLINK_TREBLE_CORRECTION     5.0
			
			// ColorChord constants
			#define COLORCHORD_EMAXBIN              192
			#define COLORCHORD_IIR_DECAY_1          0.90
			#define COLORCHORD_IIR_DECAY_2          0.85
			#define COLORCHORD_CONSTANT_DECAY_1     0.01
			#define COLORCHORD_CONSTANT_DECAY_2     0.0
			#define COLORCHORD_NOTE_CLOSEST         3.0
			#define COLORCHORD_NEW_NOTE_GAIN        8.0
			#define COLORCHORD_MAX_NOTES            10
			
			// We use glsl_mod for most calculations because it behaves better
			// on negative numbers, and in some situations actually outperforms
			// HLSL's modf().
			#ifndef glsl_mod
			#define glsl_mod(x, y) (((x) - (y) * floor((x) / (y))))
			#endif
			
			uniform float4               _AudioTexture_TexelSize;
			
			#ifdef SHADER_TARGET_SURFACE_ANALYSIS
			#define AUDIOLINK_STANDARD_INDEXING
			#endif
			
			// Mechanism to index into texture.
			#ifdef AUDIOLINK_STANDARD_INDEXING
			sampler2D _AudioTexture;
			#define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
			#else
			uniform Texture2D<float4> _AudioTexture;
			SamplerState sampler_AudioTexture;
			#define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
			#endif
			
			float _Mode;
			
			#ifdef USER_LUT
			#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DistortionFlowTexture;
			float4 _DistortionFlowTexture_ST;
			float2 _DistortionFlowTexturePan;
			float _DistortionFlowTextureUV;
			#endif
			
			#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DistortionFlowTexture1;
			float4 _DistortionFlowTexture1_ST;
			float2 _DistortionFlowTexture1Pan;
			float _DistortionFlowTexture1UV;
			#endif
			
			#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DistortionMask;
			float4 _DistortionMask_ST;
			float2 _DistortionMaskPan;
			float _DistortionMaskUV;
			#endif
			
			float _DistortionUvToDistort;
			float _DistortionStrength;
			float _DistortionStrength1;
			#endif
			float _StereoEnabled;
			float _PolarUV;
			float2 _PolarCenter;
			float _PolarRadialScale;
			float _PolarLengthScale;
			float _PolarSpiralPower;
			
			float _IgnoreFog;
			
			float4 _Color;
			UNITY_DECLARE_TEX2D(_MainTex);
			float4 _MainTex_ST;
			float2 _MainTexPan;
			float _MainTexUV;
			float4 _MainTex_TexelSize;
			Texture2D _BumpMap;
			float4 _BumpMap_ST;
			float2 _BumpMapPan;
			float _BumpMapUV;
			float _BumpScale;
			Texture2D _ClippingMask;
			float4 _ClippingMask_ST;
			float2 _ClippingMaskPan;
			float _ClippingMaskUV;
			float _Inverse_Clipping;
			float _Cutoff;
			
			float _AlphaForceOpaque;
			float _AlphaMod;
			
			float _AlphaToCoverage;
			float _AlphaSharpennedA2C;
			float _AlphaMipScale;
			
			float _AlphaDithering;
			float _AlphaDitherGradient;
			
			float _AlphaDistanceFade;
			float _AlphaDistanceFadeType;
			float _AlphaDistanceFadeMinAlpha;
			float _AlphaDistanceFadeMaxAlpha;
			float _AlphaDistanceFadeMin;
			float _AlphaDistanceFadeMax;
			
			float _AlphaFresnel;
			float _AlphaFresnelAlpha;
			float _AlphaFresnelSharpness;
			float _AlphaFresnelWidth;
			float _AlphaFresnelInvert;
			
			float _AlphaAngular;
			float _AngleType;
			float _AngleCompareTo;
			float3 _AngleForwardDirection;
			float _CameraAngleMin;
			float _CameraAngleMax;
			float _ModelAngleMin;
			float _ModelAngleMax;
			float _AngleMinAlpha;
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			*/
			
			Texture2D _LightingMapsTex;
			float4 _LightingMapsTex_ST;
			float2 _LightingMapsTexPan;
			float _LightingMapsTexUV;
			float _LightDataAOStrength;
			float _LightDataDetailStrength;
			float _LightDataShadowMaskStrength;
			// Lighting Data
			float _LightingColorMode;
			float _LightingMapMode;
			float _LightingDirectiongMode;
			float3 _LightngForcedDirection;
			float _LightingIndirectUsesNormals;
			float _LightingCapEnabled;
			float _LightingCap;
			float _LightingForceColorEnabled;
			float3 _LightingForcedColor;
			float _LightingCastedShadows;
			float _LightingMonochromatic;
			float _LightingMinLightBrightness;
			// Additive Lighting Data
			float _LightingAdditiveLimited;
			float _LightingAdditiveLimit;
			float _LightingAdditivePassthrough;
			// Lighting Data Debug
			float _LightingDebugVisualize;
			
			// Toon Lighting
			UNITY_DECLARE_TEX2D(_ToonRamp);
			float _ShadowOffset;
			float _ShadowStrength;
			float _LightingIgnoreAmbientColor;
			// Math Toon Lighting
			float _LightingGradientStart;
			float _LightingGradientEnd;
			float3 _LightingShadowColor;
			float _LightingMathLinearSmooth;
			// ShadeMap Lighting
			float3 _1st_ShadeColor;
			Texture2D _1st_ShadeMap;
			float4 _1st_ShadeMap_ST;
			float2 _1st_ShadeMapPan;
			float _1st_ShadeMapUV;
			float _Use_1stShadeMapAlpha_As_ShadowMask;
			float _1stShadeMapMask_Inverse;
			float _Use_BaseAs1st;
			float3 _2nd_ShadeColor;
			Texture2D _2nd_ShadeMap;
			float4 _2nd_ShadeMap_ST;
			float2 _2nd_ShadeMapPan;
			float _2nd_ShadeMapUV;
			float _Use_2ndShadeMapAlpha_As_ShadowMask;
			float _2ndShadeMapMask_Inverse;
			float _Use_1stAs2nd;
			float _BaseColor_Step;
			float _BaseShade_Feather;
			float _ShadeColor_Step;
			float _1st2nd_Shades_Feather;
			// Realistic Lighting
			float _LightingStandardSmoothness;
			// Skin
			sampler2D _SkinLUT;
			float _SssScale;
			float _SssBumpBlur;
			float3 _SssTransmissionAbsorption;
			float3 _SssColorBleedAoWeights;
			// Additive
			float _LightingAdditiveType;
			float _LightingAdditiveGradientStart;
			float _LightingAdditiveGradientEnd;
			float _LightingAdditiveDetailStrength;
			float _LightingAdditiveLimitIntensity;
			float _LightingAdditiveMaxIntensity;
			
			#ifdef VIGNETTE_CLASSIC
			#if defined(PROP_MOCHIEMETALLICMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _MochieMetallicMap;
			float4 _MochieMetallicMap_ST;
			float2 _MochieMetallicMapPan;
			int _MochieMetallicMapUV;
			#endif
			
			#if defined(PROP_MOCHIEROUGHNESSMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _MochieRoughnessMap;
			float4 _MochieRoughnessMap_ST;
			float2 _MochieRoughnessMapPan;
			int _MochieRoughnessMapUV;
			#endif
			
			#if defined(PROP_MOCHIEREFLECTIONMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _MochieReflectionMask;
			float4 _MochieReflectionMask_ST;
			float2 _MochieReflectionMaskPan;
			int _MochieReflectionMaskUV;
			#endif
			
			#if defined(PROP_MOCHIESPECULARMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _MochieSpecularMask;
			float4 _MochieSpecularMask_ST;
			float2 _MochieSpecularMaskPan;
			int _MochieSpecularMaskUV;
			#endif
			
			float _MochieRoughnessMultiplier;
			float _MochieMetallicMultiplier;
			float _MochieReflectionStrength;
			float _MochieSpecularStrength;
			float4 _MochieSpecularTint;
			float4 _MochieReflectionTint;
			
			samplerCUBE _MochieReflCube;
			float4 _MochieReflCube_HDR;
			#endif
			
			#ifdef _COLORADDSUBDIFF_ON
			#if defined(PROP_MATCAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _Matcap;
			float4 _Matcap_ST;
			float2 _MatcapPan;
			float _MatcapUV;
			#endif
			#if defined(PROP_MATCAPMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _MatcapMask;
			float4 _MatcapMask_ST;
			float2 _MatcapMaskPan;
			float _MatcapMaskUV;
			#endif
			#ifdef POI_MATCAP0_CUSTOM_NORMAL
			#if defined(PROP_MATCAP0NORMALMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _Matcap0NormalMap;
			float4 _Matcap0NormalMap_ST;
			float2 _Matcap0NormalMapPan;
			float _Matcap0NormalMapUV;
			#endif
			float _Matcap0NormalMapScale;
			#endif
			float _MatcapMaskInvert;
			float _MatcapBorder;
			float4 _MatcapColor;
			float _MatcapIntensity;
			float _MatcapReplace;
			float _MatcapMultiply;
			float _MatcapAdd;
			float _MatcapEnable;
			float _MatcapLightMask;
			float _MatcapEmissionStrength;
			float _MatcapNormal;
			float _MatcapHueShiftEnabled;
			float _MatcapHueShiftSpeed;
			float _MatcapHueShift;
			#endif
			
			#ifdef COLOR_GRADING_HDR_3D
			#if defined(PROP_MATCAP2) || !defined(OPTIMIZER_ENABLED)
			Texture2D _Matcap2;
			float4 _Matcap2_ST;
			float2 _Matcap2Pan;
			float _Matcap2UV;
			#endif
			#if defined(PROP_MATCAP2MASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _Matcap2Mask;
			float4 _Matcap2Mask_ST;
			float2 _Matcap2MaskPan;
			float _Matcap2MaskUV;
			#endif
			#ifdef POI_MATCAP1_CUSTOM_NORMAL
			#if defined(PROP_MATCAP1NORMALMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _Matcap1NormalMap;
			float4 _Matcap1NormalMap_ST;
			float2 _Matcap1NormalMapPan;
			float _Matcap1NormalMapUV;
			#endif
			float _Matcap1NormalMapScale;
			#endif
			float _Matcap2MaskInvert;
			float _Matcap2Border;
			float4 _Matcap2Color;
			float _Matcap2Intensity;
			float _Matcap2Replace;
			float _Matcap2Multiply;
			float _Matcap2Add;
			float _Matcap2Enable;
			float _Matcap2LightMask;
			float _Matcap2EmissionStrength;
			float _Matcap2Normal;
			float _Matcap2HueShiftEnabled;
			float _Matcap2HueShiftSpeed;
			float _Matcap2HueShift;
			#endif
			
			#ifdef _EMISSION
			
			#if defined(PROP_EMISSIONMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _EmissionMap;
			float4 _EmissionMap_ST;
			float2 _EmissionMapPan;
			float _EmissionMapUV;
			#endif
			#if defined(PROP_EMISSIONMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _EmissionMask;
			float4 _EmissionMask_ST;
			float2 _EmissionMaskPan;
			float _EmissionMaskUV;
			#endif
			#if defined(PROP_EMISSIONSCROLLINGCURVE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _EmissionScrollingCurve;
			float4 _EmissionScrollingCurve_ST;
			#endif
			
			float4 _EmissionColor;
			float _EmissionBaseColorAsMap;
			float _EmissionStrength;
			float _EmissionHueShiftEnabled;
			float _EmissionHueShift;
			float _EmissionHueShiftSpeed;
			float _EmissionCenterOutEnabled;
			float _EmissionCenterOutSpeed;
			float _EnableGITDEmission;
			float _GITDEWorldOrMesh;
			float _GITDEMinEmissionMultiplier;
			float _GITDEMaxEmissionMultiplier;
			float _GITDEMinLight;
			float _GITDEMaxLight;
			float _EmissionBlinkingEnabled;
			float _EmissiveBlink_Min;
			float _EmissiveBlink_Max;
			float _EmissiveBlink_Velocity;
			float _EmissionBlinkingOffset;
			float _ScrollingEmission;
			float4 _EmissiveScroll_Direction;
			float _EmissiveScroll_Width;
			float _EmissiveScroll_Velocity;
			float _EmissiveScroll_Interval;
			float _EmissionScrollingOffset;
			
			float _AudioLinkEmission0Enabled;
			float2 _AudioLinkEmission0StrengthMod;
			float _AudioLinkEmission0StrengthBand;
			float2 _AudioLinkEmission0CenterOut;
			float _AudioLinkEmission0CenterOutwidth;
			float _AudioLinkEmission0CenterOutSize;
			float _AudioLinkEmission0CenterOutBand;
			
			#if defined(PROP_EMISSIONMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _EmissionMap1;
			float4 _EmissionMap1_ST;
			float2 _EmissionMap1Pan;
			float _EmissionMap1UV;
			#endif
			#if defined(PROP_EMISSIONMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _EmissionMask1;
			float4 _EmissionMask1_ST;
			float2 _EmissionMask1Pan;
			float _EmissionMask1UV;
			#endif
			#if defined(PROP_EMISSIONSCROLLINGCURVE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _EmissionScrollingCurve1;
			float4 _EmissionScrollingCurve1_ST;
			#endif
			
			float4 _EmissionColor1;
			float _EmissionBaseColorAsMap1;
			float _EmissionStrength1;
			float _EnableEmission1;
			float _EmissionHueShift1;
			float _EmissionHueShiftSpeed1;
			float4 _EmissiveScroll_Direction1;
			float _EmissiveScroll_Width1;
			float _EmissiveScroll_Velocity1;
			float _EmissiveScroll_Interval1;
			float _EmissionBlinkingEnabled1;
			float _EmissiveBlink_Min1;
			float _EmissiveBlink_Max1;
			float _EmissiveBlink_Velocity1;
			float _ScrollingEmission1;
			float _EnableGITDEmission1;
			float _GITDEMinEmissionMultiplier1;
			float _GITDEMaxEmissionMultiplier1;
			float _GITDEMinLight1;
			float _GITDEMaxLight1;
			float _GITDEWorldOrMesh1;
			float _EmissionCenterOutEnabled1;
			float _EmissionCenterOutSpeed1;
			float _EmissionHueShiftEnabled1;
			float _EmissionBlinkingOffset1;
			float _EmissionScrollingOffset1;
			
			float _EmissionReplace;
			
			float _EmissionScrollingVertexColor;
			float _EmissionScrollingVertexColor1;
			
			float _EmissionScrollingUseCurve;
			float _EmissionScrollingUseCurve1;
			
			float _AudioLinkEmission1Enabled;
			float2 _AudioLinkEmission1StrengthMod;
			float _AudioLinkEmission1StrengthBand;
			float2 _AudioLinkEmission1CenterOut;
			float _AudioLinkEmission1CenterOutwidth;
			float _AudioLinkEmission1CenterOutSize;
			float _AudioLinkEmission1CenterOutBand;
			
			#endif
			
			#ifdef COLOR_GRADING_LOG_VIEW
			float _AudioLinkDelay;
			float _AudioLinkAnimToggle;
			#endif
			
			#ifdef POI_BACKFACE
			float _BackFaceEnabled;
			float _BackFaceDetailIntensity;
			float _BackFaceEmissionStrength;
			float2 _BackFacePanning;
			float4 _BackFaceColor;
			float _BackFaceReplaceAlpha;
			float _BackFaceAlpha;
			
			#if defined(PROP_BACKFACETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BackFaceTexture;
			#endif
			float4 _BackFaceTexture_ST;
			float2 _BackFaceTexturePan;
			float _BackFaceTextureUV;
			
			#if defined(PROP_BACKFACEMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BackFaceMask;
			#endif
			float4 _BackFaceMask_ST;
			float2 _BackFaceMaskPan;
			float _BackFaceMaskUV;
			
			float _BackFaceHueShiftEnabled;
			float _BackFaceHueShift;
			float _BackFaceHueShiftSpeed;
			#endif
			
			//TODO detail strength stuff
			
			#ifdef FINALPASS
			#if defined(PROP_DETAILMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DetailMask;
			#endif
			float4 _DetailMask_ST;
			float2 _DetailMaskPan;
			float _DetailMaskUV;
			#if defined(PROP_DETAILNORMALMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DetailNormalMap;
			#endif
			float4 _DetailNormalMap_ST;
			float2 _DetailNormalMapPan;
			float _DetailNormalMapUV;
			#if defined(PROP_DETAILTEX) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DetailTex;
			#endif
			float4 _DetailTex_ST;
			float2 _DetailTexPan;
			float _DetailTexUV;
			
			float3 _DetailTint;
			float _DetailTexIntensity;
			float _DetailBrightness;
			float _DetailNormalMapScale;
			#endif
			
			#ifdef VIGNETTE
			#if defined(PROP_RGBMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RGBMask;
			#endif
			float4 _RGBMask_ST;
			float2 _RGBMaskPan;
			float _RGBMaskUV;
			
			#if defined(PROP_REDTEXURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RedTexure;
			#endif
			float4 _RedTexure_ST;
			float2 _RedTexurePan;
			float _RedTexureUV;
			
			#if defined(PROP_GREENTEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _GreenTexture;
			#endif
			float4 _GreenTexture_ST;
			float2 _GreenTexturePan;
			float _GreenTextureUV;
			
			#if defined(PROP_BLUETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _BlueTexture;
			#endif
			float4 _BlueTexture_ST;
			float2 _BlueTexturePan;
			float _BlueTextureUV;
			
			#if defined(PROP_ALPHATEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _AlphaTexture;
			#endif
			float4 _AlphaTexture_ST;
			float2 _AlphaTexturePan;
			float _AlphaTextureUV;
			
			#ifdef GEOM_TYPE_MESH
			#if defined(PROP_RGBNORMALR) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RgbNormalR;
			#endif
			float4 _RgbNormalR_ST;
			float2 _RgbNormalRPan;
			float _RgbNormalRUV;
			float _RgbNormalRScale;
			
			#if defined(PROP_RGBNORMALG) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RgbNormalG;
			#endif
			float4 _RgbNormalG_ST;
			float2 _RgbNormalGPan;
			float _RgbNormalGUV;
			float _RgbNormalGScale;
			
			#if defined(PROP_RGBNORMALB) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RgbNormalB;
			#endif
			float4 _RgbNormalB_ST;
			float2 _RgbNormalBPan;
			float _RgbNormalBUV;
			float _RgbNormalBScale;
			
			#if defined(PROP_RGBNORMALA) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RgbNormalA;
			#endif
			float4 _RgbNormalA_ST;
			float2 _RgbNormalAPan;
			float _RgbNormalAUV;
			float _RgbNormalAScale;
			
			float _RgbNormalsEnabled;
			#endif
			
			float4 _RedColor;
			float4 _GreenColor;
			float4 _BlueColor;
			float4 _AlphaColor;
			
			float _RGBBlendMultiplicative;
			float _RGBUseVertexColors;
			float _RGBNormalBlend;
			#endif
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			*/
			
			Texture2D _DecalMask;
			float4 _DecalMask_ST;
			float2 _DecalMaskPan;
			float _DecalMaskUV;
			
			#ifdef COLOR_GRADING_LOG_VIEW
			// Audio Link
			half _AudioLinkDecal0ScaleBand;
			float4 _AudioLinkDecal0Scale;
			half _AudioLinkDecal0RotationBand;
			float2 _AudioLinkDecal0Rotation;
			half _AudioLinkDecal0AlphaBand;
			float2 _AudioLinkDecal0Alpha;
			half _AudioLinkDecal0EmissionBand;
			float2 _AudioLinkDecal0Emission;
			
			half _AudioLinkDecal1ScaleBand;
			float4 _AudioLinkDecal1Scale;
			half _AudioLinkDecal1RotationBand;
			float2 _AudioLinkDecal1Rotation;
			half _AudioLinkDecal1AlphaBand;
			float2 _AudioLinkDecal1Alpha;
			half _AudioLinkDecal1EmissionBand;
			float2 _AudioLinkDecal1Emission;
			
			half _AudioLinkDecal2ScaleBand;
			float4 _AudioLinkDecal2Scale;
			half _AudioLinkDecal2RotationBand;
			float2 _AudioLinkDecal2Rotation;
			half _AudioLinkDecal2AlphaBand;
			float2 _AudioLinkDecal2Alpha;
			half _AudioLinkDecal2EmissionBand;
			float2 _AudioLinkDecal2Emission;
			
			half _AudioLinkDecal3ScaleBand;
			float4 _AudioLinkDecal3Scale;
			half _AudioLinkDecal3RotationBand;
			float2 _AudioLinkDecal3Rotation;
			half _AudioLinkDecal3AlphaBand;
			float2 _AudioLinkDecal3Alpha;
			half _AudioLinkDecal3EmissionBand;
			float2 _AudioLinkDecal3Emission;
			#endif
			
			#ifdef GEOM_TYPE_BRANCH
			Texture2D _DecalTexture;
			float4 _DecalTexture_ST;
			float2 _DecalTexturePan;
			float _DecalTextureUV;
			
			float4 _DecalColor;
			fixed _DecalTiled;
			float _DecalBlendType;
			half _DecalRotation;
			half2 _DecalScale;
			half2 _DecalPosition;
			half _DecalRotationSpeed;
			float _DecalEmissionStrength;
			float _DecalBlendAlpha;
			float _DecalHueShiftEnabled;
			float _DecalHueShift;
			float _DecalHueShiftSpeed;
			float _Decal0Depth;
			#endif
			
			#ifdef GEOM_TYPE_BRANCH_DETAIL
			Texture2D _DecalTexture1;
			float4 _DecalTexture1_ST;
			float2 _DecalTexture1Pan;
			float _DecalTexture1UV;
			
			float4 _DecalColor1;
			fixed _DecalTiled1;
			float _DecalBlendType1;
			half _DecalRotation1;
			half2 _DecalScale1;
			half2 _DecalPosition1;
			half _DecalRotationSpeed1;
			float _DecalEmissionStrength1;
			float _DecalBlendAlpha1;
			float _DecalHueShiftEnabled1;
			float _DecalHueShift1;
			float _DecalHueShiftSpeed1;
			float _Decal1Depth;
			#endif
			
			#ifdef GEOM_TYPE_FROND
			Texture2D _DecalTexture2;
			float4 _DecalTexture2_ST;
			float2 _DecalTexture2Pan;
			float _DecalTexture2UV;
			float4 _DecalColor2;
			fixed _DecalTiled2;
			float _DecalBlendType2;
			half _DecalRotation2;
			half2 _DecalScale2;
			half2 _DecalPosition2;
			half _DecalRotationSpeed2;
			float _DecalEmissionStrength2;
			float _DecalBlendAlpha2;
			float _DecalHueShiftEnabled2;
			float _DecalHueShift2;
			float _DecalHueShiftSpeed2;
			float _Decal2Depth;
			#endif
			
			#ifdef DEPTH_OF_FIELD_COC_VIEW
			Texture2D _DecalTexture3;
			float4 _DecalTexture3_ST;
			float2 _DecalTexture3Pan;
			float _DecalTexture3UV;
			float4 _DecalColor3;
			fixed _DecalTiled3;
			float _DecalBlendType3;
			half _DecalRotation3;
			half2 _DecalScale3;
			half2 _DecalPosition3;
			half _DecalRotationSpeed3;
			float _DecalEmissionStrength3;
			float _DecalBlendAlpha3;
			float _DecalHueShiftEnabled3;
			float _DecalHueShift3;
			float _DecalHueShiftSpeed3;
			float _Decal3Depth;
			#endif
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			*/
			
			#ifdef _SUNDISK_SIMPLE
			half3 _GlitterColor;
			float2 _GlitterPan;
			half _GlitterSpeed;
			half _GlitterBrightness;
			float _GlitterFrequency;
			float _GlitterJitter;
			half _GlitterSize;
			half _GlitterContrast;
			half _GlitterAngleRange;
			half _GlitterMinBrightness;
			half _GlitterBias;
			fixed _GlitterUseSurfaceColor;
			float _GlitterBlendType;
			float _GlitterMode;
			float _GlitterShape;
			float _GlitterCenterSize;
			float _glitterFrequencyLinearEmissive;
			float _GlitterJaggyFix;
			float _GlitterTextureRotation;
			float2 _GlitterUVPanning;
			
			float _GlitterHueShiftEnabled;
			float _GlitterHueShiftSpeed;
			float _GlitterHueShift;
			float _GlitterHideInShadow;
			
			float _GlitterRandomColors;
			float2 _GlitterMinMaxSaturation;
			float2 _GlitterMinMaxBrightness;
			float _GlitterRandomSize;
			float4 _GlitterMinMaxSize;
			float _GlitterRandomRotation;
			
			#if defined(PROP_GLITTERMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _GlitterMask;
			#endif
			float4 _GlitterMask_ST;
			float2 _GlitterMaskPan;
			float _GlitterMaskUV;
			#if defined(PROP_GLITTERCOLORMAP) || !defined(OPTIMIZER_ENABLED)
			Texture2D _GlitterColorMap;
			#endif
			float4 _GlitterColorMap_ST;
			float2 _GlitterColorMapPan;
			float _GlitterColorMapUV;
			#if defined(PROP_GLITTERTEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _GlitterTexture;
			#endif
			float4 _GlitterTexture_ST;
			float2 _GlitterTexturePan;
			float _GlitterTextureUV;
			#endif
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			*/
			
			#ifdef _GLOSSYREFLECTIONS_OFF
			float4 _RimLightColor;
			float _RimLightingInvert;
			float _RimWidth;
			float _RimStrength;
			float _RimSharpness;
			float _RimLightColorBias;
			float _ShadowMix;
			float _ShadowMixThreshold;
			float _ShadowMixWidthMod;
			float _EnableRimLighting;
			float _RimBrighten;
			float _RimLightNormal;
			float _RimHueShiftEnabled;
			float _RimHueShiftSpeed;
			float _RimHueShift;
			float _RimWidthNoiseStrength;
			
			#if defined(PROP_RIMTEX) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RimTex;
			#endif
			float4 _RimTex_ST;
			float2 _RimTexPan;
			float _RimTexUV;
			#if defined(PROP_RIMMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RimMask;
			#endif
			float4 _RimMask_ST;
			float2 _RimMaskPan;
			float _RimMaskUV;
			#if defined(PROP_RIMWIDTHNOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _RimWidthNoiseTexture;
			#endif
			float4 _RimWidthNoiseTexture_ST;
			float2 _RimWidthNoiseTexturePan;
			float _RimWidthNoiseTextureUV;
			
			#endif
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			*/
			
			#ifdef _SUNDISK_HIGH_QUALITY
			
			UNITY_DECLARE_TEX2DARRAY(_FlipbookTexArray);
			float4 _FlipbookTexArray_ST;
			
			float4 _FlipbookColor;
			float _FlipbookFPS;
			uint _FlipbookTotalFrames;
			float4 _FlipbookScaleOffset;
			float _FlipbookTiled;
			int _FlipbookCurrentFrame;
			float _FlipbookEmissionStrength;
			float _FlipbookRotation;
			float _EnableFlipbook;
			uint _FlipbookTexArrayUV;
			float _FlipbookAlphaControlsFinalAlpha;
			float _FlipbookRotationSpeed;
			float _FlipbookIntensityControlsAlpha;
			float _FlipbookColorReplaces;
			float2 _FlipbookTexArrayPan;
			
			// blending
			float _FlipbookReplace;
			float _FlipbookMultiply;
			float _FlipbookAdd;
			
			#if defined(PROP_FLIPBOOKMASSK) || !defined(OPTIMIZED_ENABLED)
			Texture2D _FlipbookMask;
			#endif
			float4 _FlipbookMask_ST;
			float2 _FlipbookMaskPan;
			float _FlipbookMaskUV;
			
			// anim
			uint _FlipbookMovementType;
			float4 _FlipbookStartEndOffset;
			float _FlipbookMovementSpeed;
			
			// Crossfade
			float _FlipbookCrossfadeEnabled;
			float2 _FlipbookCrossfadeRange;
			
			// Hueshift
			float _FlipbookHueShiftEnabled;
			float _FlipbookHueShiftSpeed;
			float _FlipbookHueShift;
			#endif
			
			#ifdef DISTORT
			float _DissolveType;
			float _DissolveEdgeWidth;
			float4 _DissolveEdgeColor;
			sampler2D _DissolveEdgeGradient;
			float4 _DissolveEdgeGradient_ST;
			float2 _DissolveEdgeGradientPan;
			float _DissolveEdgeGradientUV;
			float _DissolveEdgeEmission;
			float4 _DissolveTextureColor;
			
			#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DissolveToTexture;
			#endif
			float4 _DissolveToTexture_ST;
			float2 _DissolveToTexturePan;
			float _DissolveToTextureUV;
			
			#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DissolveNoiseTexture;
			#endif
			float4 _DissolveNoiseTexture_ST;
			float2 _DissolveNoiseTexturePan;
			float _DissolveNoiseTextureUV;
			
			#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DissolveDetailNoise;
			#endif
			float4 _DissolveDetailNoise_ST;
			float2 _DissolveDetailNoisePan;
			float _DissolveDetailNoiseUV;
			
			#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
			Texture2D _DissolveMask;
			#endif
			float4 _DissolveMask_ST;
			float2 _DissolveMaskPan;
			float _DissolveMaskUV;
			
			float _DissolveMaskInvert;
			float _DissolveAlpha;
			float _ContinuousDissolve;
			float _DissolveDetailStrength;
			float _DissolveEdgeHardness;
			float _DissolveInvertNoise;
			float _DissolveInvertDetailNoise;
			float _DissolveToEmissionStrength;
			
			// Point to Point
			float _DissolveP2PWorldLocal;
			float _DissolveP2PEdgeLength;
			float4 _DissolveStartPoint;
			float4 _DissolveEndPoint;
			
			// World Dissolve
			float _DissolveWorldShape;
			float4 _DissolveShapePosition;
			float4 _DissolveShapeRotation;
			float _DissolveShapeScale;
			float _DissolveInvertShape;
			float _DissolveShapeEdgeLength;
			
			float _DissolveAlpha0;
			float _DissolveAlpha1;
			float _DissolveAlpha2;
			float _DissolveAlpha3;
			float _DissolveAlpha4;
			float _DissolveAlpha5;
			float _DissolveAlpha6;
			float _DissolveAlpha7;
			float _DissolveAlpha8;
			float _DissolveAlpha9;
			// Masking
			float _DissolveEmissionSide;
			float _DissolveEmission1Side;
			float _DissolveUseVertexColors;
			
			float4 edgeColor;
			float edgeAlpha;
			float dissolveAlpha;
			float4 dissolveToTexture;
			
			float _DissolveHueShiftEnabled;
			float _DissolveHueShiftSpeed;
			float _DissolveHueShift;
			float _DissolveEdgeHueShiftEnabled;
			float _DissolveEdgeHueShiftSpeed;
			float _DissolveEdgeHueShift;
			#endif
			
			/*
			Texture2D ;
			float4 _ST;
			float2 Pan;
			float UV;
			*/
			
			//Structs
			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
				float2 uv0 : TEXCOORD0;
				float2 uv1 : TEXCOORD1;
				float2 uv2 : TEXCOORD2;
				float2 uv3 : TEXCOORD3;
				uint vertexId : SV_VertexID;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv[4] : TEXCOORD0;
				float3 objNormal : TEXCOORD4;
				float3 normal : TEXCOORD5;
				float3 tangent : TEXCOORD6;
				float3 binormal : TEXCOORD7;
				float4 worldPos : TEXCOORD8;
				float4 localPos : TEXCOORD9;
				float3 objectPos : TEXCOORD10;
				float4 vertexColor : TEXCOORD11;
				float3 tangentViewDir : TEXCOORD12;
				float4 lightmapUV : TEXCOORD13;
				float4 grabPos: TEXCOORD14;
				UNITY_SHADOW_COORDS(15)
				UNITY_FOG_COORDS(16)
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			
			struct PoiMesh
			{
				
				// 0 Vertex normal
				// 1 Fragment normal
				float3 normals[2];
				float3 objNormal;
				float3 tangentSpaceNormal;
				float3 binormal;
				float3 tangent;
				float3 worldPos;
				float3 localPos;
				float3 objectPosition;
				float isFrontFace;
				float4 vertexColor;
				float4 lightmapUV;
				// 0-3 UV0-UV3
				// 4 Panosphere UV
				// 5 world pos xz
				// 6 Polar UV
				// 7 Distorted UV
				float2 uv[8];
			};
			
			struct PoiCam
			{
				float3 viewDir;
				float3 forwardDir;
				float3 worldPos;
				float distanceToVert;
				float2 clipPos;
				float3 reflectionDir;
				float3 tangentViewDir;
				float4 grabPos;
				float2 screenUV;
				float vDotN;
				
			};
			
			struct PoiMods
			{
				float4 Mask;
				float4 audioLink;
				float audioLinkAvailable;
				float audioLinkVersion;
				float4 audioLinkTexture;
				float2 detailMask;
				float2 backFaceDetailIntensity;
			};
			
			struct PoiLight
			{
				
				float3 direction;
				float attenuation;
				float attenuationStrength;
				float3 directColor;
				float3 indirectColor;
				float occlusion;
				float shadowMask;
				float detailShadow;
				float3 halfDir;
				float lightMap;
				float3 rampedLightMap;
				float nDotL;
				float nDotV;
				float nDotH;
				float lDotv;
				float lDotH;
				float nDotLSaturated;
				float nDotLNormalized;
				#ifdef UNITY_PASS_FORWARDADD
				float additiveShadow;
				#endif
				float3 finalLighting;
				
				#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
				// Non Important Lights
				float4 vDotNL;
				float3 vColor[4];
				float4 vCorrectedDotNL;
				float4 vAttenuation;
				float4 vAttenuationDotNL;
				float3 vPosition[4];
				float3 vDirection[4];
				float3 vFinalLighting;
				float3 vHalfDir[4];
				half4 vDotNH;
				half4 vDotLH;
				#endif
				
			};
			
			struct PoiVertexLights
			{
				
				float3 direction;
				float3 color;
				float attenuation;
			};
			
			struct PoiFragData
			{
				float3 baseColor;
				float3 finalColor;
				float alpha;
				float3 emission;
			};
			
			float2 poiUV(float2 uv, float4 tex_st)
			{
				return uv * tex_st.xy + tex_st.zw;
			}
			
			//Lighting Helpers
			float calculateluminance(float3 color)
			{
				return color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
			}
			
			/*
			* MIT License
			*
			* Copyright (c) 2018 s-ilent
			*
			* Permission is hereby granted, free of charge, to any person obtaining a copy
			* of this software and associated documentation files (the "Software"), to deal
			* in the Software without restriction, including without limitation the rights
			* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
			* copies of the Software, and to permit persons to whom the Software is
			* furnished to do so, subject to the following conditions:
			*
			* The above copyright notice and this permission notice shall be included in all
			* copies or substantial portions of the Software.
			*
			* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
			* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
			* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
			* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
			* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
			* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
			* SOFTWARE.
			*/
			
			float shEvaluateDiffuseL1Geomerics_local(float L0, float3 L1, float3 n)
			{
				// average energy
				float R0 = max(0, L0);
				
				// avg direction of incoming light
				float3 R1 = 0.5f * L1;
				
				// directional brightness
				float lenR1 = length(R1);
				
				// linear angle between normal and direction 0-1
				//float q = 0.5f * (1.0f + dot(R1 / lenR1, n));
				//float q = dot(R1 / lenR1, n) * 0.5 + 0.5;
				float q = dot(normalize(R1), n) * 0.5 + 0.5;
				q = saturate(q); // Thanks to ScruffyRuffles for the bug identity.
				
				// power for q
				// lerps from 1 (linear) to 3 (cubic) based on directionality
				float p = 1.0f + 2.0f * lenR1 / R0;
				
				// dynamic range constant
				// should vary between 4 (highly directional) and 0 (ambient)
				float a = (1.0f - lenR1 / R0) / (1.0f + lenR1 / R0);
				
				return R0 * (a + (1.0f - a) * (p + 1.0f) * pow(q, p));
			}
			
			half3 BetterSH9(half4 normal)
			{
				float3 indirect;
				float3 L0 = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
				indirect.r = shEvaluateDiffuseL1Geomerics_local(L0.r, unity_SHAr.xyz, normal.xyz);
				indirect.g = shEvaluateDiffuseL1Geomerics_local(L0.g, unity_SHAg.xyz, normal.xyz);
				indirect.b = shEvaluateDiffuseL1Geomerics_local(L0.b, unity_SHAb.xyz, normal.xyz);
				indirect = max(0, indirect);
				indirect += SHEvalLinearL2(normal);
				return indirect;
			}
			
			// Silent's code ends here
			
			float3 getCameraForward()
			{
				#if UNITY_SINGLE_PASS_STEREO
				float3 p1 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 1, 1));
				float3 p2 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 0, 1));
				#else
				float3 p1 = mul(unity_CameraToWorld, float4(0, 0, 1, 1)).xyz;
				float3 p2 = mul(unity_CameraToWorld, float4(0, 0, 0, 1)).xyz;
				#endif
				return normalize(p2 - p1);
			}
			
			half3 GetSHLength()
			{
				half3 x, x1;
				x.r = length(unity_SHAr);
				x.g = length(unity_SHAg);
				x.b = length(unity_SHAb);
				x1.r = length(unity_SHBr);
				x1.g = length(unity_SHBg);
				x1.b = length(unity_SHBb);
				return x + x1;
			}
			
			float3 BoxProjection(float3 direction, float3 position, float4 cubemapPosition, float3 boxMin, float3 boxMax)
			{
				#if UNITY_SPECCUBE_BOX_PROJECTION
				//UNITY_BRANCH
				if (cubemapPosition.w > 0)
				{
					float3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
					float scalar = min(min(factors.x, factors.y), factors.z);
					direction = direction * scalar + (position - cubemapPosition.xyz);
				}
				#endif
				return direction;
			}
			
			float poiMax(float2 i)
			{
				return max(i.x, i.y);
			}
			
			float poiMax(float3 i)
			{
				return max(max(i.x, i.y), i.z);
			}
			
			float poiMax(float4 i)
			{
				return max(max(max(i.x, i.y), i.z), i.w);
			}
			
			float3 calculateNormal(in float3 baseNormal, in PoiMesh poiMesh, in Texture2D normalTexture, in float4 normal_ST, in float2 normalPan, in float normalUV, in float normalIntensity)
			{
				float3 normal = UnpackScaleNormal(POI2D_SAMPLER_PAN(normalTexture, _MainTex, poiUV(poiMesh.uv[normalUV], normal_ST), normalPan), normalIntensity);
				return normalize(
				normal.x * poiMesh.tangent +
				normal.y * poiMesh.binormal +
				normal.z * baseNormal
				);
			}
			
			float remap(float x, float minOld, float maxOld, float minNew = 0, float maxNew = 1)
			{
				return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
			}
			
			float2 remap(float2 x, float2 minOld, float2 maxOld, float2 minNew = 0, float2 maxNew = 1)
			{
				return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
			}
			
			float3 remap(float3 x, float3 minOld, float3 maxOld, float3 minNew = 0, float3 maxNew = 1)
			{
				return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
			}
			
			float4 remap(float4 x, float4 minOld, float4 maxOld, float4 minNew = 0, float4 maxNew = 1)
			{
				return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
			}
			
			float remapClamped(float minOld, float maxOld, float x, float minNew = 0, float maxNew = 1)
			{
				return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), 0, 1);
			}
			
			float2 calcParallax(in float height, in PoiCam poiCam)
			{
				return((height * - 1) + 1) * (poiCam.tangentViewDir.xy / poiCam.tangentViewDir.z);
			}
			
			/*
			0: Zero	                float4(0.0, 0.0, 0.0, 0.0),
			1: One	                float4(1.0, 1.0, 1.0, 1.0),
			2: DstColor	            destinationColor,
			3: SrcColor	            sourceColor,
			4: OneMinusDstColor	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
			5: SrcAlpha	            sourceColor.aaaa,
			6: OneMinusSrcColor	    float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
			7: DstAlpha	            destinationColor.aaaa,
			8: OneMinusDstAlpha	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor.,
			9: SrcAlphaSaturate     saturate(sourceColor.aaaa),
			10: OneMinusSrcAlpha	float4(1.0, 1.0, 1.0, 1.0) - sourceColor.aaaa,
			*/
			
			float4 poiBlend(const float sourceFactor, const  float4 sourceColor, const  float destinationFactor, const  float4 destinationColor, const float4 blendFactor)
			{
				float4 sA = 1 - blendFactor;
				const float4 blendData[11] = {
				float4(0.0, 0.0, 0.0, 0.0),
				float4(1.0, 1.0, 1.0, 1.0),
				destinationColor,
				sourceColor,
				float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
				sA,
				float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
				sA,
				float4(1.0, 1.0, 1.0, 1.0) - sA,
				saturate(sourceColor.aaaa),
				1 - sA,
			};
			
			return lerp(blendData[sourceFactor] * sourceColor + blendData[destinationFactor] * destinationColor, sourceColor, sA);
		}
		
		// Average
		float3 blendAverage(float3 base, float3 blend)
		{
			return(base + blend) / 2.0;
		}
		
		// Color burn
		float blendColorBurn(float base, float blend)
		{
			return(blend == 0.0)?blend : max((1.0 - ((1.0 - base) / blend)), 0.0);
		}
		
		float3 blendColorBurn(float3 base, float3 blend)
		{
			return float3(blendColorBurn(base.r, blend.r), blendColorBurn(base.g, blend.g), blendColorBurn(base.b, blend.b));
		}
		
		// Color Dodge
		float blendColorDodge(float base, float blend)
		{
			return(blend == 1.0)?blend : min(base / (1.0 - blend), 1.0);
		}
		
		float3 blendColorDodge(float3 base, float3 blend)
		{
			return float3(blendColorDodge(base.r, blend.r), blendColorDodge(base.g, blend.g), blendColorDodge(base.b, blend.b));
		}
		
		// Darken
		float blendDarken(float base, float blend)
		{
			return min(blend, base);
		}
		
		float3 blendDarken(float3 base, float3 blend)
		{
			return float3(blendDarken(base.r, blend.r), blendDarken(base.g, blend.g), blendDarken(base.b, blend.b));
		}
		
		// Exclusion
		float3 blendExclusion(float3 base, float3 blend)
		{
			return base + blend - 2.0 * base * blend;
		}
		
		// Reflect
		float blendReflect(float base, float blend)
		{
			return(blend == 1.0)?blend : min(base * base / (1.0 - blend), 1.0);
		}
		
		float3 blendReflect(float3 base, float3 blend)
		{
			return float3(blendReflect(base.r, blend.r), blendReflect(base.g, blend.g), blendReflect(base.b, blend.b));
		}
		
		// Glow
		float3 blendGlow(float3 base, float3 blend)
		{
			return blendReflect(blend, base);
		}
		
		// Overlay
		float blendOverlay(float base, float blend)
		{
			return base < 0.5?(2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
		}
		
		float3 blendOverlay(float3 base, float3 blend)
		{
			return float3(blendOverlay(base.r, blend.r), blendOverlay(base.g, blend.g), blendOverlay(base.b, blend.b));
		}
		
		// Hard Light
		float3 blendHardLight(float3 base, float3 blend)
		{
			return blendOverlay(blend, base);
		}
		
		// Vivid light
		float blendVividLight(float base, float blend)
		{
			return(blend < 0.5)?blendColorBurn(base, (2.0 * blend)) : blendColorDodge(base, (2.0 * (blend - 0.5)));
		}
		
		float3 blendVividLight(float3 base, float3 blend)
		{
			return float3(blendVividLight(base.r, blend.r), blendVividLight(base.g, blend.g), blendVividLight(base.b, blend.b));
		}
		
		// Hard mix
		float blendHardMix(float base, float blend)
		{
			return(blendVividLight(base, blend) < 0.5)?0.0 : 1.0;
		}
		
		float3 blendHardMix(float3 base, float3 blend)
		{
			return float3(blendHardMix(base.r, blend.r), blendHardMix(base.g, blend.g), blendHardMix(base.b, blend.b));
		}
		
		// Lighten
		float blendLighten(float base, float blend)
		{
			return max(blend, base);
		}
		
		float3 blendLighten(float3 base, float3 blend)
		{
			return float3(blendLighten(base.r, blend.r), blendLighten(base.g, blend.g), blendLighten(base.b, blend.b));
		}
		
		// Linear Burn
		float blendLinearBurn(float base, float blend)
		{
			// Note : Same implementation as BlendSubtractf
			return max(base + blend - 1.0, 0.0);
		}
		
		float3 blendLinearBurn(float3 base, float3 blend)
		{
			// Note : Same implementation as BlendSubtract
			return max(base + blend - float3(1.0, 1.0, 1.0), float3(0.0, 0.0, 0.0));
		}
		
		// Linear Dodge
		float blendLinearDodge(float base, float blend)
		{
			// Note : Same implementation as BlendAddf
			return min(base + blend, 1.0);
		}
		
		float3 blendLinearDodge(float3 base, float3 blend)
		{
			// Note : Same implementation as BlendAdd
			return min(base + blend, float3(1.0, 1.0, 1.0));
		}
		
		// Linear light
		float blendLinearLight(float base, float blend)
		{
			return blend < 0.5?blendLinearBurn(base, (2.0 * blend)) : blendLinearDodge(base, (2.0 * (blend - 0.5)));
		}
		
		float3 blendLinearLight(float3 base, float3 blend)
		{
			return float3(blendLinearLight(base.r, blend.r), blendLinearLight(base.g, blend.g), blendLinearLight(base.b, blend.b));
		}
		
		// Multiply
		float3 blendMultiply(float3 base, float3 blend)
		{
			return base * blend;
		}
		
		// Negation
		float3 blendNegation(float3 base, float3 blend)
		{
			return float3(1.0, 1.0, 1.0) - abs(float3(1.0, 1.0, 1.0) - base - blend);
		}
		
		// Normal
		float3 blendNormal(float3 base, float3 blend)
		{
			return blend;
		}
		
		// Phoenix
		float3 blendPhoenix(float3 base, float3 blend)
		{
			return min(base, blend) - max(base, blend) + float3(1.0, 1.0, 1.0);
		}
		
		// Pin light
		float blendPinLight(float base, float blend)
		{
			return(blend < 0.5)?blendDarken(base, (2.0 * blend)) : blendLighten(base, (2.0 * (blend - 0.5)));
		}
		
		float3 blendPinLight(float3 base, float3 blend)
		{
			return float3(blendPinLight(base.r, blend.r), blendPinLight(base.g, blend.g), blendPinLight(base.b, blend.b));
		}
		
		// Screen
		float blendScreen(float base, float blend)
		{
			return 1.0 - ((1.0 - base) * (1.0 - blend));
		}
		
		float3 blendScreen(float3 base, float3 blend)
		{
			return float3(blendScreen(base.r, blend.r), blendScreen(base.g, blend.g), blendScreen(base.b, blend.b));
		}
		
		// Soft Light
		float blendSoftLight(float base, float blend)
		{
			return(blend < 0.5)?(2.0 * base * blend + base * base * (1.0 - 2.0 * blend)) : (sqrt(base) * (2.0 * blend - 1.0) + 2.0 * base * (1.0 - blend));
		}
		
		float3 blendSoftLight(float3 base, float3 blend)
		{
			return float3(blendSoftLight(base.r, blend.r), blendSoftLight(base.g, blend.g), blendSoftLight(base.b, blend.b));
		}
		
		// Subtract
		float blendSubtract(float base, float blend)
		{
			return max(base - blend, 0.0);
		}
		
		float3 blendSubtract(float3 base, float3 blend)
		{
			return max(base - blend, 0.0);
		}
		
		// Difference
		float blendDifference(float base, float blend)
		{
			return abs(base - blend);
		}
		
		float3 blendDifference(float3 base, float3 blend)
		{
			return abs(base - blend);
		}
		
		// Divide
		float blendDivide(float base, float blend)
		{
			return base / max(blend, 0.0001);
		}
		
		float3 blendDivide(float3 base, float3 blend)
		{
			return base / max(blend, 0.0001);
		}
		
		float3 customBlend(float3 base, float3 blend, float blendType)
		{
			float3 ret = 0;
			switch(blendType)
			{
				case 0:
				{
					ret = blendNormal(base, blend);
					break;
				}
				case 1:
				{
					ret = blendDarken(base, blend);
					break;
				}
				case 2:
				{
					ret = blendMultiply(base, blend);
					break;
				}
				case 3:
				{
					ret = blendColorBurn(base, blend);
					break;
				}
				case 4:
				{
					ret = blendLinearBurn(base, blend);
					break;
				}
				case 5:
				{
					ret = blendLighten(base, blend);
					break;
				}
				case 6:
				{
					ret = blendScreen(base, blend);
					break;
				}
				case 7:
				{
					ret = blendColorDodge(base, blend);
					break;
				}
				case 8:
				{
					ret = blendLinearDodge(base, blend);
					break;
				}
				case 9:
				{
					ret = blendOverlay(base, blend);
					break;
				}
				case 10:
				{
					ret = blendSoftLight(base, blend);
					break;
				}
				case 11:
				{
					ret = blendHardLight(base, blend);
					break;
				}
				case 12:
				{
					ret = blendVividLight(base, blend);
					break;
				}
				case 13:
				{
					ret = blendLinearLight(base, blend);
					break;
				}
				case 14:
				{
					ret = blendPinLight(base, blend);
					break;
				}
				case 15:
				{
					ret = blendHardMix(base, blend);
					break;
				}
				case 16:
				{
					ret = blendDifference(base, blend);
					break;
				}
				case 17:
				{
					ret = blendExclusion(base, blend);
					break;
				}
				case 18:
				{
					ret = blendSubtract(base, blend);
					break;
				}
				case 19:
				{
					ret = blendDivide(base, blend);
					break;
				}
			}
			return ret;
		}
		
		float random(float2 p)
		{
			return frac(sin(dot(p, float2(12.9898, 78.2383))) * 43758.5453123);
		}
		
		float2 random2(float2 p)
		{
			return frac(sin(float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)))) * 43758.5453);
		}
		
		float3 random3(float3 p)
		{
			return frac(sin(float3(dot(p, float3(127.1, 311.7, 248.6)), dot(p, float3(269.5, 183.3, 423.3)), dot(p, float3(248.3, 315.9, 184.2)))) * 43758.5453);
		}
		
		float3 randomFloat3(float2 Seed, float maximum)
		{
			return(.5 + float3(
			frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(float2(Seed), float2(12.9898, 78.233))) * 43758.5453)
			) * .5) * (maximum);
		}
		
		float3 randomFloat3Range(float2 Seed, float Range)
		{
			return(float3(
			frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
			) * 2 - 1) * Range;
		}
		
		float3 randomFloat3WiggleRange(float2 Seed, float Range, float wiggleSpeed)
		{
			float3 rando = (float3(
			frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
			frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
			) * 2 - 1);
			float speed = 1 + wiggleSpeed;
			return float3(sin((_Time.x + rando.x * pi) * speed), sin((_Time.x + rando.y * pi) * speed), sin((_Time.x + rando.z * pi) * speed)) * Range;
		}
		
		void Unity_RandomRange_float(float2 Seed, float Min, float Max, out float Out)
		{
			float randomno = frac(sin(dot(Seed, float2(12.9898, 78.233))) * 43758.5453);
			Out = lerp(Min, Max, randomno);
		}
		
		//art
		
		// Based on unity shader graph code
		
		// * Adjustments * //
		
		/*
		* Channel Mixer
		*
		* Controls the amount each of the channels of input In contribute to each of the channels of output Out. The slider
		* parameters on the node control the contribution of each of the input channels. The toggle button parameters control
		* which of the output channels is currently being edited. Slider controls for editing the contribution of each input
		* channnel range between -2 and 2.
		*/
		void poiChannelMixer(float3 In, float3 _ChannelMixer_Red, float3 _ChannelMixer_Green, float3 _ChannelMixer_Blue, out float3 Out)
		{
			Out = float3(dot(In, _ChannelMixer_Red), dot(In, _ChannelMixer_Green), dot(In, _ChannelMixer_Blue));
		}
		
		/*
		* Contrast
		*
		* Adjusts the contrast of input In by the amount of input Contrast. A Contrast value of 1 will return the input
		* unaltered. A Contrast value of 0 will return the midpoint of the input
		*/
		void poiContrast(float3 In, float Contrast, out float3 Out)
		{
			float midpoint = pow(0.5, 2.2);
			Out = (In - midpoint) * Contrast + midpoint;
		}
		
		/*
		* Invert Colors
		*
		* Inverts the colors of input In on a per channel basis. This Node assumes all input values are in the range 0 - 1.
		*/
		void poiInvertColors(float4 In, float4 InvertColors, out float4 Out)
		{
			Out = abs(InvertColors - In);
		}
		
		/*
		* Replace Color
		*
		* Replaces values in input In equal to input From to the value of input To. Input Range can be used to define a
		* wider range of values around input From to replace. Input Fuzziness can be used to soften the edges around the
		* selection similar to anti-aliasing.
		*/
		void poiReplaceColor(float3 In, float3 From, float3 To, float Range, float Fuzziness, out float3 Out)
		{
			float Distance = distance(From, In);
			Out = lerp(To, In, saturate((Distance - Range) / max(Fuzziness, 0.00001)));
		}
		
		/*
		* Saturation
		*
		* Adjusts the saturation of input In by the amount of input Saturation. A Saturation value of 1 will return the input
		* unaltered. A Saturation value of 0 will return the input completely desaturated.
		*/
		void poiSaturation(float3 In, float Saturation, out float3 Out)
		{
			float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
			Out = luma.xxx + Saturation.xxx * (In - luma.xxx);
		}
		
		/*
		* Dither Node
		*
		* Dither is an intentional form of noise used to randomize quantization error. It is used to prevent large-scale
		* patterns such as color banding in images. The Dither node applies dithering in screen-space to ensure a uniform
		* distribution of the pattern. This can be adjusted by connecting another node to input Screen Position.
		*
		* This Node is commonly used as an input to Alpha Clip Threshold on a Master Node to give the appearance of
		* transparency to an opaque object. This is useful for creating objects that appear to be transparent but have
		* the advantages of rendering as opaque, such as writing depth and/or being rendered in deferred.
		*/
		void poiDither(float4 In, float4 ScreenPosition, out float4 Out)
		{
			float2 uv = ScreenPosition.xy * _ScreenParams.xy;
			float DITHER_THRESHOLDS[16] = {
			1.0 / 17.0, 9.0 / 17.0, 3.0 / 17.0, 11.0 / 17.0,
			13.0 / 17.0, 5.0 / 17.0, 15.0 / 17.0, 7.0 / 17.0,
			4.0 / 17.0, 12.0 / 17.0, 2.0 / 17.0, 10.0 / 17.0,
			16.0 / 17.0, 8.0 / 17.0, 14.0 / 17.0, 6.0 / 17.0
		};
		uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
		Out = In - DITHER_THRESHOLDS[index];
	}
	
	/*
	* Color Mask
	*
	* Creates a mask from values in input In equal to input Mask Color. Input Range can be used to define a wider
	* range of values around input Mask Color to create the mask. Colors within this range will return 1,
	* otherwise the node will return 0. Input Fuzziness can be used to soften the edges around the selection
	* similar to anti-aliasing.
	*/
	void poiColorMask(float3 In, float3 MaskColor, float Range, float Fuzziness, out float4 Out)
	{
		float Distance = distance(MaskColor, In);
		Out = saturate(1 - (Distance - Range) / max(Fuzziness, 0.00001));
	}
	
	float3 hueShift(float3 color, float Offset)
	{
		float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
		float4 P = lerp(float4(color.bg, K.wz), float4(color.gb, K.xy), step(color.b, color.g));
		float4 Q = lerp(float4(P.xyw, color.r), float4(color.r, P.yzx), step(P.x, color.r));
		float D = Q.x - min(Q.w, Q.y);
		float E = 0.0000000001;
		float3 hsv = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);
		
		float hue = hsv.x + Offset;
		hsv.x = frac(hue);
		
		float4 K2 = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
		float3 P2 = abs(frac(hsv.xxx + K2.xyz) * 6.0 - K2.www);
		return hsv.z * lerp(K2.xxx, saturate(P2 - K2.xxx), hsv.y);
	}
	
	static const float Epsilon = 1e-10;
	// The weights of RGB contributions to luminance.
	// Should sum to unity.
	static const float3 HCYwts = float3(0.299, 0.587, 0.114);
	static const float HCLgamma = 3;
	static const float HCLy0 = 100;
	static const float HCLmaxL = 0.530454533953517; // == exp(HCLgamma / HCLy0) - 0.5
	static const float3 wref = float3(1.0, 1.0, 1.0);
	#define TAU 6.28318531
	
	float3 HUEtoRGB(in float H)
	{
		float R = abs(H * 6 - 3) - 1;
		float G = 2 - abs(H * 6 - 2);
		float B = 2 - abs(H * 6 - 4);
		return saturate(float3(R, G, B));
	}
	
	float3 RGBtoHCV(in float3 RGB)
	{
		// Based on work by Sam Hocevar and Emil Persson
		float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0 / 3.0) : float4(RGB.gb, 0.0, -1.0 / 3.0);
		float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
		float C = Q.x - min(Q.w, Q.y);
		float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
		return float3(H, C, Q.x);
	}
	
	float3 HSVtoRGB(in float3 HSV)
	{
		float3 RGB = HUEtoRGB(HSV.x);
		return((RGB - 1) * HSV.y + 1) * HSV.z;
	}
	
	float3 RGBtoHSV(in float3 RGB)
	{
		float3 HCV = RGBtoHCV(RGB);
		float S = HCV.y / (HCV.z + Epsilon);
		return float3(HCV.x, S, HCV.z);
	}
	
	float3 HSLtoRGB(in float3 HSL)
	{
		float3 RGB = HUEtoRGB(HSL.x);
		float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
		return(RGB - 0.5) * C + HSL.z;
	}
	
	float3 RGBtoHSL(in float3 RGB)
	{
		float3 HCV = RGBtoHCV(RGB);
		float L = HCV.z - HCV.y * 0.5;
		float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
		return float3(HCV.x, S, L);
	}
	
	float3 HCYtoRGB(in float3 HCY)
	{
		
		float3 RGB = HUEtoRGB(HCY.x);
		float Z = dot(RGB, HCYwts);
		if (HCY.z < Z)
		{
			HCY.y *= HCY.z / Z;
		}
		else if (Z < 1)
		{
			HCY.y *= (1 - HCY.z) / (1 - Z);
		}
		return(RGB - Z) * HCY.y + HCY.z;
	}
	
	float3 RGBtoHCY(in float3 RGB)
	{
		// Corrected by David Schaeffer
		float3 HCV = RGBtoHCV(RGB);
		float Y = dot(RGB, HCYwts);
		float Z = dot(HUEtoRGB(HCV.x), HCYwts);
		if (Y < Z)
		{
			HCV.y *= Z / (Epsilon + Y);
		}
		else
		{
			HCV.y *= (1 - Z) / (Epsilon + 1 - Y);
		}
		return float3(HCV.x, HCV.y, Y);
	}
	
	float3 HCLtoRGB(in float3 HCL)
	{
		float3 RGB = 0;
		if (HCL.z != 0)
		{
			float H = HCL.x;
			float C = HCL.y;
			float L = HCL.z * HCLmaxL;
			float Q = exp((1 - C / (2 * L)) * (HCLgamma / HCLy0));
			float U = (2 * L - C) / (2 * Q - 1);
			float V = C / Q;
			float A = (H + min(frac(2 * H) / 4, frac(-2 * H) / 8)) * pi * 2;
			float T;
			H *= 6;
			if (H <= 0.999)
			{
				T = tan(A);
				RGB.r = 1;
				RGB.g = T / (1 + T);
			}
			else if (H <= 1.001)
			{
				RGB.r = 1;
				RGB.g = 1;
			}
			else if (H <= 2)
			{
				T = tan(A);
				RGB.r = (1 + T) / T;
				RGB.g = 1;
			}
			else if (H <= 3)
			{
				T = tan(A);
				RGB.g = 1;
				RGB.b = 1 + T;
			}
			else if (H <= 3.999)
			{
				T = tan(A);
				RGB.g = 1 / (1 + T);
				RGB.b = 1;
			}
			else if (H <= 4.001)
			{
				RGB.g = 0;
				RGB.b = 1;
			}
			else if (H <= 5)
			{
				T = tan(A);
				RGB.r = -1 / T;
				RGB.b = 1;
			}
			else
			{
				T = tan(A);
				RGB.r = 1;
				RGB.b = -T;
			}
			RGB = RGB * V + U;
		}
		return RGB;
	}
	
	float3 RGBtoHCL(in float3 RGB)
	{
		float3 HCL;
		float H = 0;
		float U = min(RGB.r, min(RGB.g, RGB.b));
		float V = max(RGB.r, max(RGB.g, RGB.b));
		float Q = HCLgamma / HCLy0;
		HCL.y = V - U;
		if (HCL.y != 0)
		{
			H = atan2(RGB.g - RGB.b, RGB.r - RGB.g) / pi;
			Q *= U / V;
		}
		Q = exp(Q);
		HCL.x = frac(H / 2 - min(frac(H), frac(-H)) / 6);
		HCL.y *= Q;
		HCL.z = lerp(-U, V, Q) / (HCLmaxL * 2);
		return HCL;
	}
	
	//HSL MODIFT
	float3 ModifyViaHSL(float3 color, float3 HSLMod)
	{
		float3 colorHSL = RGBtoHSL(color);
		colorHSL.r = frac(colorHSL.r + HSLMod.r);
		colorHSL.g = saturate(colorHSL.g + HSLMod.g);
		colorHSL.b = saturate(colorHSL.b + HSLMod.b);
		return HSLtoRGB(colorHSL);
	}
	
	float3 poiSaturation(float3 In, float Saturation)
	{
		float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
		return luma.xxx + Saturation.xxx * (In - luma.xxx);
	}
	// LCH
	float xyzF(float t)
	{
		return lerp(pow(t, 1. / 3.), 7.787037 * t + 0.139731, step(t, 0.00885645));
	}
	float xyzR(float t)
	{
		return lerp(t * t * t, 0.1284185 * (t - 0.139731), step(t, 0.20689655));
	}
	float3 rgb2lch(in float3 c)
	{
		c = mul(float3x3(0.4124, 0.3576, 0.1805,
		0.2126, 0.7152, 0.0722,
		0.0193, 0.1192, 0.9505), c);
		c.x = xyzF(c.x / wref.x);
		c.y = xyzF(c.y / wref.y);
		c.z = xyzF(c.z / wref.z);
		float3 lab = float3(max(0., 116.0 * c.y - 16.0), 500.0 * (c.x - c.y), 200.0 * (c.y - c.z));
		return float3(lab.x, length(float2(lab.y, lab.z)), atan2(lab.z, lab.y));
	}
	
	float3 lch2rgb(in float3 c)
	{
		c = float3(c.x, cos(c.z) * c.y, sin(c.z) * c.y);
		
		float lg = 1. / 116. * (c.x + 16.);
		float3 xyz = float3(wref.x * xyzR(lg + 0.002 * c.y),
		wref.y * xyzR(lg),
		wref.z * xyzR(lg - 0.005 * c.z));
		
		float3 rgb = mul(float3x3(3.2406, -1.5372, -0.4986,
		- 0.9689, 1.8758, 0.0415,
		0.0557, -0.2040, 1.0570), xyz);
		
		return rgb;
	}
	
	//cheaply lerp around a circle
	float lerpAng(in float a, in float b, in float x)
	{
		float ang = fmod(fmod((a - b), TAU) + pi * 3., TAU) - pi;
		return ang * x + b;
	}
	
	//Linear interpolation between two colors in Lch space
	float3 lerpLch(in float3 a, in float3 b, in float x)
	{
		float hue = lerpAng(a.z, b.z, x);
		return float3(lerp(b.xy, a.xy, x), hue);
	}
	
	float3 poiExpensiveColorBlend(float3 col1, float3 col2, float alpha)
	{
		return lch2rgb(lerpLch(rgb2lch(col1), rgb2lch(col2), alpha));
	}
	
	float4x4 poiAngleAxisRotationMatrix(float angle, float3 axis)
	{
		axis = normalize(axis);
		float s = sin(angle);
		float c = cos(angle);
		float oc = 1.0 - c;
		
		return float4x4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s, 0.0,
		oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s, 0.0,
		oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c, 0.0,
		0.0, 0.0, 0.0, 1.0);
	}
	
	float4x4 poiRotationMatrixFromAngles(float x, float y, float z)
	{
		float angleX = radians(x);
		float c = cos(angleX);
		float s = sin(angleX);
		float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
		0, c, -s, 0,
		0, s, c, 0,
		0, 0, 0, 1);
		
		float angleY = radians(y);
		c = cos(angleY);
		s = sin(angleY);
		float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
		0, 1, 0, 0,
		- s, 0, c, 0,
		0, 0, 0, 1);
		
		float angleZ = radians(z);
		c = cos(angleZ);
		s = sin(angleZ);
		float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
		s, c, 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1);
		
		return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
	}
	
	float4x4 poiRotationMatrixFromAngles(float3 angles)
	{
		float angleX = radians(angles.x);
		float c = cos(angleX);
		float s = sin(angleX);
		float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
		0, c, -s, 0,
		0, s, c, 0,
		0, 0, 0, 1);
		
		float angleY = radians(angles.y);
		c = cos(angleY);
		s = sin(angleY);
		float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
		0, 1, 0, 0,
		- s, 0, c, 0,
		0, 0, 0, 1);
		
		float angleZ = radians(angles.z);
		c = cos(angleZ);
		s = sin(angleZ);
		float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
		s, c, 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1);
		
		return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
	}
	
	float3 getCameraPosition()
	{
		#ifdef USING_STEREO_MATRICES
		return lerp(unity_StereoWorldSpaceCameraPos[0], unity_StereoWorldSpaceCameraPos[1], 0.5);
		#endif
		return _WorldSpaceCameraPos;
	}
	
	half2 calcScreenUVs(half4 grabPos)
	{
		half2 uv = grabPos.xy / (grabPos.w + 0.0000000001);
		#if UNITY_SINGLE_PASS_STEREO
		uv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
		#else
		uv.xy *= _ScreenParams.xy;
		#endif
		
		return uv;
	}
	
	float CalcMipLevel(float2 texture_coord)
	{
		float2 dx = ddx(texture_coord);
		float2 dy = ddy(texture_coord);
		float delta_max_sqr = max(dot(dx, dx), dot(dy, dy));
		
		return 0.5 * log2(delta_max_sqr);
	}
	
	v2f vert(appdata v)
	{
		UNITY_SETUP_INSTANCE_ID(v);
		v2f o;
		PoiInitStruct(v2f, o);
		UNITY_TRANSFER_INSTANCE_ID(v, o);
		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
		
		o.objectPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
		o.objNormal = v.normal;
		o.normal = UnityObjectToWorldNormal(v.normal);
		o.tangent = UnityObjectToWorldDir(v.tangent);
		
		o.binormal = cross(o.normal, o.tangent) * (v.tangent.w * unity_WorldTransformParams.w);
		o.vertexColor = v.color;
		
		o.uv[0] = v.uv0;
		o.uv[1] = v.uv1;
		o.uv[2] = v.uv2;
		o.uv[3] = v.uv3;
		
		#if defined(LIGHTMAP_ON)
		o.lightmapUV.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
		#endif
		#ifdef DYNAMICLIGHTMAP_ON
		o.lightmapUV.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
		#endif
		
		o.localPos = v.vertex;
		o.worldPos = mul(unity_ObjectToWorld, o.localPos);
		
		float3 localOffset = float3(0, 0, 0);
		float3 worldOffset = float3(0, 0, 0);
		
		#ifdef POI_PASS_FORWARDOUTLINE
		float outlineMask = 1;
		//TODO figure out why uvs can't be set dynamically
		outlineMask = poiMax(tex2Dlod(_OutlineMask, float4(poiUV(o.uv[0], _OutlineMask_ST) + _Time.x * _OutlineMaskPan, 0, 0)).rgb);
		
		//UNITY_BRANCH
		if (_OutlineUseVertexColors == 2)
		{
			outlineMask *= v.color.r;
		}
		
		float3 outlineNormal = o.normal;
		//UNITY_BRANCH
		if (_OutlineUseVertexColors == 1)
		{
			//TODO normals appear to be transformed before entering the vertex shader and I'm not sure how to achieve the same results with vertex colors
			outlineNormal = UnityObjectToWorldNormal(v.color);
		}
		
		half offsetMultiplier = 1;
		half distanceOffset = 1;
		//UNITY_BRANCH
		if (_OutlineFixedSize)
		{
			distanceOffset *= min(distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, o.localPos).xyz), _OutlinesMaxDistance);
		}
		
		float3 offset = outlineNormal * (_LineWidth * _EnableOutlines / 100) * outlineMask * distanceOffset;
		
		//UNITY_BRANCH
		if (_OutlineMode == 2)
		{
			float3 lightDirection = normalize(_WorldSpaceLightPos0 + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz);
			offsetMultiplier = saturate(dot(lightDirection, outlineNormal));
			offset *= offsetMultiplier;
			offset *= distanceOffset;
		}
		else if (_OutlineMode == 3)
		{
			half3 viewNormal = mul((float3x3)UNITY_MATRIX_V, outlineNormal);
			offsetMultiplier = saturate(dot(viewNormal.xy, normalize(_OutlinePersonaDirection.xy)));
			
			offset *= offsetMultiplier;
			offset *= distanceOffset;
		}
		else if (_OutlineMode == 4)
		{
			offset = mul((float3x3)transpose(UNITY_MATRIX_V), _OutlineDropShadowOffset);
			offset *= distanceOffset;
		}
		
		localOffset += mul(unity_WorldToObject, offset);
		worldOffset += offset;
		#endif
		
		o.localPos.rgb += localOffset;
		o.worldPos.rgb += worldOffset;
		o.pos = UnityObjectToClipPos(o.localPos);
		o.grabPos = ComputeGrabScreenPos(o.pos);
		
		float3x3 objectToTangent = float3x3(
		o.tangent.xyz,
		cross(o.normal, o.tangent.xyz) * v.tangent.w,
		o.normal
		);
		o.tangentViewDir = mul(objectToTangent, ObjSpaceViewDir(o.localPos));
		
		#ifndef FORWARD_META_PASS
		#if !defined(UNITY_PASS_SHADOWCASTER)
		UNITY_TRANSFER_SHADOW(o, o.uv[0].xy);
		#else
		TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
		#endif
		#endif
		UNITY_TRANSFER_FOG(o, o.pos);
		return o;
	}
	
	#ifdef COLOR_GRADING_LOG_VIEW
	//Tests to see if Audio Link texture is available
	bool AudioLinkIsAvailable()
	{
		#if !defined(AUDIOLINK_STANDARD_INDEXING)
		int width, height;
		_AudioTexture.GetDimensions(width, height);
		return width > 16;
		#else
		return _AudioTexture_TexelSize.z > 16;
		#endif
	}
	
	//Get version of audiolink present in the world, 0 if no audiolink is present
	float AudioLinkGetVersion()
	{
		int2 dims;
		#if !defined(AUDIOLINK_STANDARD_INDEXING)
		_AudioTexture.GetDimensions(dims.x, dims.y);
		#else
		dims = _AudioTexture_TexelSize.zw;
		#endif
		
		if (dims.x >= 128)
		return AudioLinkData(ALPASS_GENERALVU).x;
		else if (dims.x > 16)
		return 1;
		else
		return 0;
	}
	
	float getBandAtTime(float band, float time, float width, float size = 1.0f)
	{
		return pow(UNITY_SAMPLE_TEX2D(_AudioTexture, float2(time * width, band)).r, (1 - size) * 3 + 1);
	}
	
	void initAudioBands(inout PoiMods poiMods)
	{
		poiMods.audioLinkAvailable = AudioLinkIsAvailable();
		poiMods.audioLinkAvailable *= _AudioLinkAnimToggle;
		
		if (poiMods.audioLinkAvailable)
		{
			poiMods.audioLinkVersion = AudioLinkGetVersion();
			poiMods.audioLink.x = AudioLinkData(ALPASS_AUDIOBASS).r;
			poiMods.audioLink.y = AudioLinkData(ALPASS_AUDIOLOWMIDS).r;
			poiMods.audioLink.z = AudioLinkData(ALPASS_AUDIOHIGHMIDS).r;
			poiMods.audioLink.w = AudioLinkData(ALPASS_AUDIOTREBLE).r;
		}
	}
	#endif
	
	float2 calculatePolarCoordinate(in PoiMesh poiMesh)
	{
		float2 delta = poiMesh.uv[_PolarUV] - _PolarCenter;
		float radius = length(delta) * 2 * _PolarRadialScale;
		float angle = atan2(delta.x, delta.y) * 1.0 / 6.28 * _PolarLengthScale;
		return float2(radius, angle + distance(poiMesh.uv[_PolarUV], _PolarCenter) * _PolarSpiralPower);
	}
	
	float2 MonoPanoProjection(float3 coords)
	{
		float3 normalizedCoords = normalize(coords);
		float latitude = acos(normalizedCoords.y);
		float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
		float2 sphereCoords = float2(longitude, latitude) * float2(1.0 / UNITY_PI, 1.0 / UNITY_PI);
		sphereCoords = float2(1.0, 1.0) - sphereCoords;
		return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).zw;
	}
	
	float2 StereoPanoProjection(float3 coords)
	{
		float3 normalizedCoords = normalize(coords);
		float latitude = acos(normalizedCoords.y);
		float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
		float2 sphereCoords = float2(longitude, latitude) * float2(0.5 / UNITY_PI, 1.0 / UNITY_PI);
		sphereCoords = float2(0.5, 1.0) - sphereCoords;
		return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
	}
	
	float2 calculatePanosphereUV(in PoiMesh poiMesh)
	{
		float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - poiMesh.worldPos) * - 1;
		return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), _StereoEnabled);
	}
	
	#ifdef USER_LUT
	float2 distortedUV(in PoiMesh poiMesh)
	{
		#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
		float4 flowVector = POI2D_SAMPLER_PAN(_DistortionFlowTexture, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTextureUV], _DistortionFlowTexture_ST), _DistortionFlowTexturePan) * 2 - 1;
		#else
		float4 flowVector = 0;
		#endif
		
		#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
		float4 flowVector1 = POI2D_SAMPLER_PAN(_DistortionFlowTexture1, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTexture1UV], _DistortionFlowTexture1_ST), _DistortionFlowTexture1Pan) * 2 - 1;
		#else
		float4 flowVector1 = 0;
		#endif
		
		#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
		half distortionMask = POI2D_SAMPLER_PAN(_DistortionMask, _MainTex, poiMesh.uv[_DistortionMaskUV], _DistortionMaskPan).r;
		#else
		half distortionMask = 1;
		#endif
		
		half distortionStrength = _DistortionStrength;
		half distortionStrength1 = _DistortionStrength1;
		
		flowVector *= distortionStrength;
		flowVector1 *= distortionStrength1;
		return poiMesh.uv[_DistortionUvToDistort] + ((flowVector.xy + flowVector1.xy) / 2) * distortionMask;
	}
	#endif
	
	void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
	{
		poiFragData.alpha = saturate(poiFragData.alpha + _AlphaMod);
		
		// Distance Fade
		if (_AlphaDistanceFade)
		{
			float3 position = _AlphaDistanceFadeType ? poiMesh.worldPos : poiMesh.objectPosition;
			poiFragData.alpha *= lerp(_AlphaDistanceFadeMinAlpha, _AlphaDistanceFadeMaxAlpha, smoothstep(_AlphaDistanceFadeMin, _AlphaDistanceFadeMax, distance(position, poiCam.worldPos)));
		}
		
		// Fresnel Alpha
		if (_AlphaFresnel)
		{
			float holoRim = saturate(1 - smoothstep(min(_AlphaFresnelSharpness, _AlphaFresnelWidth), _AlphaFresnelWidth, poiCam.vDotN));
			holoRim = abs(lerp(1, holoRim, _AlphaFresnelAlpha));
			poiFragData.alpha *= _AlphaFresnelInvert ?1 - holoRim : holoRim;
		}
		
		if (_AlphaAngular)
		{
			half cameraAngleMin = _CameraAngleMin / 180;
			half cameraAngleMax = _CameraAngleMax / 180;
			half modelAngleMin = _ModelAngleMin / 180;
			half modelAngleMax = _ModelAngleMax / 180;
			float3 pos = _AngleCompareTo == 0 ? poiMesh.objectPosition : poiMesh.worldPos;
			half3 cameraToModelDirection = normalize(pos - getCameraPosition());
			half3 modelForwardDirection = normalize(mul(unity_ObjectToWorld, normalize(_AngleForwardDirection)));
			half cameraLookAtModel = remapClamped(cameraAngleMax, cameraAngleMin, .5 * dot(cameraToModelDirection, getCameraForward()) + .5);
			half modelLookAtCamera = remapClamped(modelAngleMax, modelAngleMin, .5 * dot(-cameraToModelDirection, modelForwardDirection) + .5);
			if (_AngleType == 0)
			{
				poiFragData.alpha *= max(cameraLookAtModel, _AngleMinAlpha);
			}
			else if (_AngleType == 1)
			{
				poiFragData.alpha *= max(modelLookAtCamera, _AngleMinAlpha);
			}
			else if (_AngleType == 2)
			{
				poiFragData.alpha *= max(cameraLookAtModel * modelLookAtCamera, _AngleMinAlpha);
			}
		}
	}
	
	inline half Dither8x8Bayer(int x, int y)
	{
		const half dither[ 64 ] = {
		1, 49, 13, 61, 4, 52, 16, 64,
		33, 17, 45, 29, 36, 20, 48, 32,
		9, 57, 5, 53, 12, 60, 8, 56,
		41, 25, 37, 21, 44, 28, 40, 24,
		3, 51, 15, 63, 2, 50, 14, 62,
		35, 19, 47, 31, 34, 18, 46, 30,
		11, 59, 7, 55, 10, 58, 6, 54,
		43, 27, 39, 23, 42, 26, 38, 22
	};
	int r = y * 8 + x;
	return dither[r] / 64;
}

half calcDither(half2 grabPos)
{
	half dither = Dither8x8Bayer(fmod(grabPos.x, 8), fmod(grabPos.y, 8));
	return dither;
}

void applyDithering(inout PoiFragData poiFragData, in PoiCam poiCam)
{
	if (_AlphaDithering)
	{
		poiFragData.alpha = poiFragData.alpha - (calcDither(poiCam.screenUV) * (1 - poiFragData.alpha) * _AlphaDitherGradient);
	}
}

void ApplyAlphaToCoverage(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
	// Force Model Opacity to 1 if desired
	UNITY_BRANCH
	if (_Mode == 1)
	{
		UNITY_BRANCH
		if (_AlphaSharpennedA2C)
		{
			// rescale alpha by mip level
			poiFragData.alpha *= 1 + max(0, CalcMipLevel(poiMesh.uv[0] * _MainTex_TexelSize.zw)) * _AlphaMipScale;
			// rescale alpha by partial derivative
			poiFragData.alpha = (poiFragData.alpha - _Cutoff) / max(fwidth(poiFragData.alpha), 0.0001) + _Cutoff;
		}
	}
}

#ifdef VIGNETTE_MASKED

void applyShadeMapping(inout PoiFragData poiFragData, PoiMesh poiMesh, PoiLight poiLight)
{
	float MainColorFeatherStep = _BaseColor_Step - _BaseShade_Feather;
	float firstColorFeatherStep = _ShadeColor_Step - _1st2nd_Shades_Feather;
	
	#if defined(PROP_1ST_SHADEMAP) || !defined(OPTIMIZER_ENABLED)
	float4 firstShadeMap = POI2D_SAMPLER_PAN(_1st_ShadeMap, _MainTex, poiUV(poiMesh.uv[_1st_ShadeMapUV], _1st_ShadeMap_ST), _1st_ShadeMapPan);
	#else
	float4 firstShadeMap = float4(1, 1, 1, 1);
	#endif
	firstShadeMap = lerp(firstShadeMap, float4(poiFragData.baseColor, 1), _Use_BaseAs1st);
	
	#if defined(PROP_2ND_SHADEMAP) || !defined(OPTIMIZER_ENABLED)
	float4 secondShadeMap = POI2D_SAMPLER_PAN(_2nd_ShadeMap, _MainTex, poiUV(poiMesh.uv[_2nd_ShadeMapUV], _2nd_ShadeMap_ST), _2nd_ShadeMapPan);
	#else
	float4 secondShadeMap = float4(1, 1, 1, 1);
	#endif
	secondShadeMap = lerp(secondShadeMap, firstShadeMap, _Use_1stAs2nd);
	
	firstShadeMap.rgb *= _1st_ShadeColor.rgb; //* lighColor
	secondShadeMap.rgb *= _2nd_ShadeColor.rgb; //* LightColor;
	
	float shadowMask = 1;
	shadowMask *= _Use_1stShadeMapAlpha_As_ShadowMask ?(_1stShadeMapMask_Inverse ?(1.0 - firstShadeMap.a) : firstShadeMap.a) : 1;
	shadowMask *= _Use_2ndShadeMapAlpha_As_ShadowMask ?(_2ndShadeMapMask_Inverse ?(1.0 - secondShadeMap.a) : secondShadeMap.a) : 1;
	
	float mainShadowMask = saturate(1 - ((poiLight.lightMap) - MainColorFeatherStep) / (_BaseColor_Step - MainColorFeatherStep) * (shadowMask));
	float firstSecondShadowMask = saturate(1 - ((poiLight.lightMap) - firstColorFeatherStep) / (_ShadeColor_Step - firstColorFeatherStep) * (shadowMask));
	
	mainShadowMask *= poiLight.shadowMask;
	firstSecondShadowMask *= poiLight.shadowMask;
	
	poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, lerp(firstShadeMap.rgb, secondShadeMap.rgb, firstSecondShadowMask), mainShadowMask);
}

void ApplySubtractiveLighting(inout UnityIndirect indirectLight)
{
	#if SUBTRACTIVE_LIGHTING
	poiLight.attenuation = FadeShadows(lerp(1, poiLight.attenuation, _AttenuationMultiplier));
	
	float ndotl = saturate(dot(i.normal, _WorldSpaceLightPos0.xyz));
	float3 shadowedLightEstimate = ndotl * (1 - poiLight.attenuation) * _LightColor0.rgb;
	float3 subtractedLight = indirectLight.diffuse - shadowedLightEstimate;
	subtractedLight = max(subtractedLight, unity_ShadowColor.rgb);
	subtractedLight = lerp(subtractedLight, indirectLight.diffuse, _LightShadowData.x);
	indirectLight.diffuse = min(subtractedLight, indirectLight.diffuse);
	#endif
}

UnityIndirect CreateIndirectLight(in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
	UnityIndirect indirectLight;
	indirectLight.diffuse = 0;
	indirectLight.specular = 0;
	
	#if defined(LIGHTMAP_ON)
	indirectLight.diffuse = DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, poiMesh.lightmapUV.xy));
	
	#if defined(DIRLIGHTMAP_COMBINED)
	float4 lightmapDirection = UNITY_SAMPLE_TEX2D_SAMPLER(
	unity_LightmapInd, unity_Lightmap, poiMesh.lightmapUV.xy
	);
	indirectLight.diffuse = DecodeDirectionalLightmap(
	indirectLight.diffuse, lightmapDirection, poiMesh.normals[1]
	);
	#endif
	ApplySubtractiveLighting(indirectLight);
	#endif
	
	#if defined(DYNAMICLIGHTMAP_ON)
	float3 dynamicLightDiffuse = DecodeRealtimeLightmap(
	UNITY_SAMPLE_TEX2D(unity_DynamicLightmap, poiMesh.lightmapUV.zw)
	);
	
	#if defined(DIRLIGHTMAP_COMBINED)
	float4 dynamicLightmapDirection = UNITY_SAMPLE_TEX2D_SAMPLER(
	unity_DynamicDirectionality, unity_DynamicLightmap,
	poiMesh.lightmapUV.zw
	);
	indirectLight.diffuse += DecodeDirectionalLightmap(
	dynamicLightDiffuse, dynamicLightmapDirection, poiMesh.normals[1]
	);
	#else
	indirectLight.diffuse += dynamicLightDiffuse;
	#endif
	#endif
	
	#if !defined(LIGHTMAP_ON) && !defined(DYNAMICLIGHTMAP_ON)
	#if UNITY_LIGHT_PROBE_PROXY_VOLUME
	if (unity_ProbeVolumeParams.x == 1)
	{
		indirectLight.diffuse = SHEvalLinearL0L1_SampleProbeVolume(
		float4(poiMesh.normals[1], 1), poiMesh.worldPos
		);
		indirectLight.diffuse = max(0, indirectLight.diffuse);
		#if defined(UNITY_COLORSPACE_GAMMA)
		indirectLight.diffuse = LinearToGammaSpace(indirectLight.diffuse);
		#endif
	}
	else
	{
		indirectLight.diffuse += max(0, ShadeSH9(float4(poiMesh.normals[1], 1)));
	}
	#else
	indirectLight.diffuse += max(0, ShadeSH9(float4(poiMesh.normals[1], 1)));
	#endif
	#endif
	
	float3 reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
	Unity_GlossyEnvironmentData envData;
	envData.roughness = 1 - _LightingStandardSmoothness;
	envData.reflUVW = BoxProjection(
	reflectionDir, poiMesh.worldPos.xyz,
	unity_SpecCube0_ProbePosition,
	unity_SpecCube0_BoxMin.xyz, unity_SpecCube0_BoxMax.xyz
	);
	float3 probe0 = Unity_GlossyEnvironment(
	UNITY_PASS_TEXCUBE(unity_SpecCube0), unity_SpecCube0_HDR, envData
	);
	envData.reflUVW = BoxProjection(
	reflectionDir, poiMesh.worldPos.xyz,
	unity_SpecCube1_ProbePosition,
	unity_SpecCube1_BoxMin.xyz, unity_SpecCube1_BoxMax.xyz
	);
	#if UNITY_SPECCUBE_BLENDING
	float interpolator = unity_SpecCube0_BoxMin.w;
	//UNITY_BRANCH
	if (interpolator < 0.99999)
	{
		float3 probe1 = Unity_GlossyEnvironment(
		UNITY_PASS_TEXCUBE_SAMPLER(unity_SpecCube1, unity_SpecCube0),
		unity_SpecCube0_HDR, envData
		);
		indirectLight.specular = lerp(probe1, probe0, interpolator);
	}
	else
	{
		indirectLight.specular = probe0;
	}
	#else
	indirectLight.specular = probe0;
	#endif
	
	indirectLight.diffuse *= poiLight.occlusion;
	indirectLight.specular *= poiLight.occlusion;
	
	return indirectLight;
}

void applyShading(inout PoiLight poiLight, inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{
	#ifdef UNITY_PASS_FORWARDBASE
	
	float shadowStrength = _ShadowStrength * poiLight.shadowMask;
	
	#ifdef POI_PASS_FORWARDOUTLINE
	shadowStrength = lerp(0, shadowStrength, _OutlineShadowStrength);
	#endif
	
	#ifdef _LIGHTINGMODE_FLAT
	poiLight.finalLighting = poiLight.directColor;
	poiLight.rampedLightMap = poiLight.nDotLSaturated;
	#endif
	
	#ifdef _LIGHTINGMODE_TEXTURERAMP
	poiLight.rampedLightMap = lerp(1, UNITY_SAMPLE_TEX2D(_ToonRamp, poiLight.lightMap + _ShadowOffset).rgb, shadowStrength);
	poiLight.finalLighting = lerp(_LightingShadowColor * lerp(poiLight.indirectColor, poiLight.rampedLightMap * poiLight.directColor, _LightingIgnoreAmbientColor) * poiLight.occlusion, poiLight.directColor, poiLight.rampedLightMap);
	#endif
	
	#ifdef _LIGHTINGMODE_MATHRAMP
	if (_LightingMathLinearSmooth)
	{
		poiLight.rampedLightMap = saturate(1 - remapClamped(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - poiLight.lightMap * poiLight.detailShadow));
	}
	else
	{
		poiLight.rampedLightMap = saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - poiLight.lightMap * poiLight.detailShadow));
	}
	poiLight.finalLighting = lerp((_LightingShadowColor * lerp(poiLight.indirectColor, poiLight.directColor, _LightingIgnoreAmbientColor) * poiLight.occlusion), (poiLight.directColor), saturate(poiLight.rampedLightMap + 1 - shadowStrength));
	#endif
	
	#ifdef _LIGHTINGMODE_SHADEMAP
	poiLight.finalLighting = poiLight.directColor;
	#endif
	
	#ifdef _LIGHTINGMODE_REALISTIC
	UnityLight light;
	light.dir = poiLight.direction;
	light.color = saturate(_LightColor0.rgb * lerp(1, poiLight.attenuation, poiLight.attenuationStrength) * poiLight.detailShadow);
	light.ndotl = poiLight.nDotLSaturated;
	poiLight.rampedLightMap = poiLight.nDotLSaturated;
	poiLight.finalLighting = UNITY_BRDF_PBS(1, 0, 0, _LightingStandardSmoothness, poiMesh.normals[1], poiCam.viewDir, light, CreateIndirectLight(poiMesh, poiCam, poiLight)).xyz;
	#endif
	
	#ifdef _LIGHTINGMODE_WRAPPED
	poiLight.finalLighting = lerp(POI_ERROR(poiMesh, 20) * poiLight.indirectColor, poiLight.directColor, ceil(poiLight.nDotL));
	#endif
	
	#ifdef _LIGHTINGMODE_SKIN
	float3 ambientNormalWorld = poiMesh.normals[1];//aTangentToWorld(s, s.blurredNormalTangent);
	poiLight.rampedLightMap = poiLight.nDotLSaturated;
	// Scattering mask.
	float subsurface = 1;
	float skinScattering = saturate(subsurface * _SssScale * 2);
	
	// Skin subsurface depth absorption tint.
	// cf http://www.crytek.com/download/2014_03_25_CRYENGINE_GDC_Schultz.pdf pg 35
	half3 absorption = exp((1.0h - subsurface) * _SssTransmissionAbsorption.rgb);
	
	// Albedo scale for absorption assumes ~0.5 luminance for Caucasian skin.
	absorption *= saturate(poiFragData.baseColor * unity_ColorSpaceDouble.rgb);
	
	// Blurred normals for indirect diffuse and direct scattering.
	ambientNormalWorld = normalize(lerp(poiMesh.normals[1], ambientNormalWorld, _SssBumpBlur));
	
	float ndlBlur = dot(poiMesh.normals[1], poiLight.direction) * 0.5h + 0.5h;
	float lumi = dot(poiLight.directColor, half3(0.2126h, 0.7152h, 0.0722h));
	float4 sssLookupUv = float4(ndlBlur, skinScattering * lumi, 0.0f, 0.0f);
	half3 sss = poiLight.lightMap * poiLight.attenuation * tex2Dlod(_SkinLUT, sssLookupUv).rgb;
	poiLight.finalLighting = min(lerp(poiLight.indirectColor * _LightingShadowColor, _LightingShadowColor, _LightingIgnoreAmbientColor) + (sss * poiLight.directColor), poiLight.directColor);
	#endif
	
	#endif
	
	#ifdef UNITY_PASS_FORWARDADD
	//UNITY_BRANCH
	if (_LightingAdditiveType == 0) // Realistic
	
	{
		poiLight.finalLighting = poiLight.directColor * poiLight.attenuation * max(0, poiLight.nDotL) * poiLight.detailShadow * poiLight.additiveShadow;
	}
	else if (_LightingAdditiveType == 1) // Toon
	
	{
		#if defined(POINT) || defined(SPOT)
		poiLight.finalLighting = lerp(poiLight.directColor * max(poiLight.additiveShadow, _LightingAdditivePassthrough), poiLight.indirectColor, smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, 1 - (.5 * poiLight.nDotL + .5))) * poiLight.attenuation * poiLight.detailShadow;
		#else
		poiLight.finalLighting = lerp(poiLight.directColor * max(poiLight.attenuation, _LightingAdditivePassthrough), poiLight.indirectColor, smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, 1 - (.5 * poiLight.nDotL + .5))) * poiLight.detailShadow;
		#endif
	}
	/*
	else //if(_LightingAdditiveType == 2) // Wrapped
	{
		float uv = saturate(RTWrapFunc(poiLight.nDotL, _LightingWrappedWrap, _LightingWrappedNormalization)) * detailShadow;
		
		poiLight.rampedLightMap = 1;
		//UNITY_BRANCH
		if (_LightingRampType == 1) // Math Gradient
		poiLight.rampedLightMap = lerp(_LightingShadowColor, float3(1, 1, 1), saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - uv)));
		// TODO: ramp texture or full shade/tint map for atlasing
		//poiLight.rampedLightMap = lerp(1, UNITY_SAMPLE_TEX2D(_ToonRamp, float2(uv + _ShadowOffset, 1)), shadowStrength.r);
		
		float shadowatten = max(poiLight.additiveShadow, _LightingAdditivePassthrough);
		return poiLight.color * poiLight.rampedLightMap * saturate(poiLight.attenuation * uv * shadowatten);
	}
	*/
	#endif
	
	#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
	float3 vertexLighting = float3(0, 0, 0);
	for (int index = 0; index < 4; index++)
	{
		//UNITY_BRANCH
		if (_LightingAdditiveType == 0)
		{
			vertexLighting += poiLight.vColor[index] * poiLight.vAttenuationDotNL[index] * poiLight.detailShadow; // Realistic
			
		}
		
		//UNITY_BRANCH
		if (_LightingAdditiveType == 1) // Toon
		
		{
			vertexLighting += lerp(poiLight.vColor[index] * poiLight.vAttenuation[index], poiLight.vColor[index] * _LightingAdditivePassthrough * poiLight.vAttenuation[index], smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, poiLight.vDotNL[index])) * poiLight.detailShadow;
		}
		
		//UNITY_BRANCH
		if (_LightingAdditiveType == 2) //if(_LightingAdditiveType == 2) // Wrapped
		
		{
			//TODO wrapped vertex lighting
			vertexLighting += lerp(poiLight.vColor[index] * poiLight.vAttenuation[index], poiLight.vColor[index] * _LightingAdditivePassthrough * poiLight.vAttenuation[index], smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, poiLight.vDotNL[index])) * poiLight.detailShadow;
			/*
			float uv = saturate(RTWrapFunc(-poiLight.vDotNL[index], _LightingWrappedWrap, _LightingWrappedNormalization)) * poiLight.detailShadow;
			
			poiLight.rampedLightMap = 1;
			if (_LightingRampType == 1) // Math Gradient
			poiLight.rampedLightMap = lerp(_LightingShadowColor, float3(1, 1, 1), saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - uv)));
			
			vertexLighting += poiLight.vColor[index] * poiLight.rampedLightMap * saturate(poiLight.vAttenuation[index] * uv);
			*/
		}
	}
	float3 mixedLight = poiLight.finalLighting;
	mixedLight = vertexLighting + poiLight.finalLighting;
	poiFragData.finalColor = poiFragData.baseColor * mixedLight;
	#else
	poiFragData.finalColor = poiFragData.baseColor * poiLight.finalLighting;
	#endif
}
#endif

#ifdef VIGNETTE_CLASSIC

bool SceneHasReflections(){
float width, height;
unity_SpecCube0.GetDimensions(width, height);
return !(width * height < 2);
}

float3 GetWorldReflections(float3 reflDir, float3 worldPos, float roughness){
float3 baseReflDir = reflDir;
reflDir = BoxProjection(reflDir, worldPos, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
float4 envSample0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
float3 p0 = DecodeHDR(envSample0, unity_SpecCube0_HDR);
float interpolator = unity_SpecCube0_BoxMin.w;
UNITY_BRANCH
if (interpolator < 0.99999){
float3 refDirBlend = BoxProjection(baseReflDir, worldPos, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
float4 envSample1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, refDirBlend, roughness * UNITY_SPECCUBE_LOD_STEPS);
float3 p1 = DecodeHDR(envSample1, unity_SpecCube1_HDR);
p0 = lerp(p1, p0, interpolator);
}
return p0;
}

float3 GetReflections(in PoiCam pc, in PoiLight pl, in PoiMesh pm, float roughness){
float3 reflections = 0;
UNITY_BRANCH
if (SceneHasReflections()){
reflections = GetWorldReflections(pc.reflectionDir, pm.worldPos.xyz, roughness);
}
else {
reflections = texCUBElod(_MochieReflCube, float4(pc.reflectionDir, roughness * UNITY_SPECCUBE_LOD_STEPS));
reflections = DecodeHDR(float4(reflections,1), _MochieReflCube_HDR);
}
reflections *= pl.occlusion;
return reflections;
}

float GetGGXTerm(in PoiLight pl, float roughness){
float visibilityTerm = 0;
if (pl.nDotL > 0){
float rough = roughness;
float rough2 = roughness * roughness;

float lambdaV = pl.nDotL * (pl.nDotV * (1 - rough) + rough);
float lambdaL = pl.nDotV * (pl.nDotL * (1 - rough) + rough);

visibilityTerm = 0.5f / (lambdaV + lambdaL + 1e-5f);
float d = (pl.nDotH * rough2 - pl.nDotH) * pl.nDotH + 1.0f;
float dotTerm = UNITY_INV_PI * rough2 / (d * d + 1e-7f);

visibilityTerm *= dotTerm * UNITY_PI;
}
return visibilityTerm;
}

void GetSpecFresTerm(in PoiLight pl, inout float3 specularTerm, inout float3 fresnelTerm, float3 specCol, float roughness){
specularTerm = GetGGXTerm(pl, roughness);
fresnelTerm = FresnelTerm(specCol, pl.lDotH);
specularTerm = max(0, specularTerm * max(0.00001, pl.nDotL));
}

float GetRoughness(float smoothness){
float rough = 1-smoothness;
rough *= 1.7-0.7*rough;
return rough;
}

void MochieBRDF(inout PoiFragData pfd, in PoiCam pc, in PoiLight pl, in PoiMesh pm){

float smoothness = 1-(POI2D_SAMPLER_PAN(_MochieRoughnessMap, _MainTex, poiUV(pm.uv[_MochieRoughnessMapUV], _MochieRoughnessMap_ST), _MochieRoughnessMapPan) * _MochieRoughnessMultiplier);
float roughness = GetRoughness(smoothness);
float metallic = POI2D_SAMPLER_PAN(_MochieMetallicMap, _MainTex, poiUV(pm.uv[_MochieMetallicMapUV], _MochieMetallicMap_ST), _MochieMetallicMapPan) * _MochieMetallicMultiplier;
float3 specCol = lerp(unity_ColorSpaceDielectricSpec.rgb, pfd.baseColor, metallic);
float omr = unity_ColorSpaceDielectricSpec.a - metallic * unity_ColorSpaceDielectricSpec.a;
float percepRough = 1-smoothness;
float brdfRoughness = percepRough * percepRough;
brdfRoughness = max(brdfRoughness, 0.002);

float3 lighting = pl.finalLighting;
float3 diffuse = pfd.baseColor;
float3 specular = 0;
float3 reflections = 0;
float3 environment = 0;

// Specular
if (_MochieSpecularStrength > 0){
float3 fresnelTerm = 1;
float3 specularTerm = 1;
float specularMask = POI2D_SAMPLER_PAN(_MochieSpecularMask, _MainTex, poiUV(pm.uv[_MochieSpecularMaskUV], _MochieSpecularMask_ST), _MochieSpecularMaskPan);
GetSpecFresTerm(pl, specularTerm, fresnelTerm, specCol, brdfRoughness);
specular = lighting * specularTerm * fresnelTerm * specularMask * _MochieSpecularTint * pl.occlusion * pl.attenuation * _MochieSpecularStrength;
}

// Reflections
if (_MochieReflectionStrength > 0){
float reflectionMask = POI2D_SAMPLER_PAN(_MochieReflectionMask, _MainTex, poiUV(pm.uv[_MochieReflectionMaskUV], _MochieReflectionMask_ST), _MochieReflectionMaskPan);
float surfaceReduction = (1.0 / (brdfRoughness*brdfRoughness + 1.0));
float grazingTerm = saturate(smoothness + (1-omr));
float3 reflCol = GetReflections(pc, pl, pm, roughness);
float reflStr = reflectionMask * _MochieReflectionStrength;
reflections = surfaceReduction * reflCol * FresnelLerp(specCol, grazingTerm, pl.nDotV);
reflections *= _MochieReflectionTint * reflStr;
#ifdef UNITY_PASS_FORWARDADD
reflections *= pl.attenuation;
#endif
diffuse = lerp(diffuse, diffuse*omr, reflStr);
}

environment = specular + reflections;
diffuse *= lighting;
diffuse += environment;
pfd.finalColor = diffuse;
}

#endif

void blendMatcap(in PoiLight poiLight, inout PoiFragData poiFragData, float add, float multiply, float replace, float4 matcapColor, float matcapMask, float emissionStrength, float matcapLightMask
#ifdef POI_BLACKLIGHT
, uint blackLightMaskIndex
#endif
)
{
if (matcapLightMask)
{
matcapMask *= lerp(1, poiLight.rampedLightMap, matcapLightMask);
}
#ifdef POI_BLACKLIGHT
if (blackLightMaskIndex != 4)
{
matcapMask *= blackLightMask[blackLightMaskIndex];
}
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, matcapColor.rgb, replace * matcapMask * matcapColor.a * .999999);
poiFragData.baseColor.rgb *= lerp(1, matcapColor.rgb, multiply * matcapMask * matcapColor.a);
poiFragData.baseColor.rgb += matcapColor.rgb * add * matcapMask * matcapColor.a;
poiFragData.emission += matcapColor.rgb * emissionStrength * matcapMask * matcapColor.a;
}

#if defined(_COLORADDSUBDIFF_ON) || defined(COLOR_GRADING_HDR_3D)
void applyMatcap(inout PoiFragData poiFragData, in PoiCam poiCam, in PoiMesh poiMesh, in PoiLight poiLight)
{
float4 matcap = 0;
float matcapMask = 0;
float4 matcap2 = 0;
float matcap2Mask = 0;

// Both matcaps use the same coordinates
half3 worldViewUp = normalize(half3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, half3(0, 1, 0)));
half3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));

// Matcap 1
#ifdef _COLORADDSUBDIFF_ON

#ifdef POI_MATCAP0_CUSTOM_NORMAL
float3 normal0 = calculateNormal(poiMesh.normals[_MatcapNormal], poiMesh, _Matcap0NormalMap, _Matcap0NormalMap_ST, _Matcap0NormalMapPan, _Matcap0NormalMapUV, _Matcap0NormalMapScale);
#else
float3 normal0 = poiMesh.normals[_MatcapNormal];
#endif

half2 matcapUV = half2(dot(worldViewRight, normal0), dot(worldViewUp, poiMesh.normals[_MatcapNormal])) * _MatcapBorder + 0.5;

#if defined(PROP_MATCAP) || !defined(OPTIMIZER_ENABLED)
matcap = UNITY_SAMPLE_TEX2D_SAMPLER(_Matcap, _MainTex, TRANSFORM_TEX(matcapUV, _Matcap)) * _MatcapColor;
#else
matcap = _MatcapColor;
#endif

matcap.rgb *= _MatcapIntensity;
#if defined(PROP_MATCAPMASK) || !defined(OPTIMIZER_ENABLED)
matcapMask = POI2D_SAMPLER_PAN(_MatcapMask, _MainTex, poiUV(poiMesh.uv[_MatcapMaskUV], _MatcapMask_ST), _MatcapMaskPan);
#else
matcapMask = 1;
#endif

if (_MatcapMaskInvert)
{
matcapMask = 1 - matcapMask;
}

//UNITY_BRANCH
if (_MatcapHueShiftEnabled)
{
matcap.rgb = hueShift(matcap.rgb, _MatcapHueShift + _Time.x * _MatcapHueShiftSpeed);
}

blendMatcap(poiLight, poiFragData, _MatcapAdd, _MatcapMultiply, _MatcapReplace, matcap, matcapMask, _MatcapEmissionStrength, _MatcapLightMask
#ifdef POI_BLACKLIGHT
, _BlackLightMaskMatcap
#endif
);
#endif

// Matcap 2
#ifdef COLOR_GRADING_HDR_3D

#ifdef POI_MATCAP1_CUSTOM_NORMAL
float3 normal1 = calculateNormal(poiMesh.normals[_Matcap2Normal], poiMesh, _Matcap1NormalMap, _Matcap1NormalMap_ST, _Matcap1NormalMapPan, _Matcap1NormalMapUV, _Matcap1NormalMapScale);
#else
float3 normal1 = poiMesh.normals[_Matcap2Normal];
#endif

half2 matcapUV2 = half2(dot(worldViewRight, normal1), dot(worldViewUp, poiMesh.normals[_Matcap2Normal])) * _Matcap2Border + 0.5;
#if defined(PROP_MATCAP2) || !defined(OPTIMIZER_ENABLED)
matcap2 = UNITY_SAMPLE_TEX2D_SAMPLER(_Matcap2, _MainTex, TRANSFORM_TEX(matcapUV2, _Matcap2)) * _Matcap2Color;
#else
matcap2 = _Matcap2Color;
#endif
matcap2.rgb *= _Matcap2Intensity;
#if defined(PROP_MATCAP2MASK) || !defined(OPTIMIZER_ENABLED)
matcap2Mask = POI2D_SAMPLER_PAN(_Matcap2Mask, _MainTex, poiUV(poiMesh.uv[_Matcap2MaskUV], _Matcap2Mask_ST), _Matcap2MaskPan);
#else
matcap2Mask = 1;
#endif
if (_Matcap2MaskInvert)
{
matcap2Mask = 1 - matcap2Mask;
}

//UNITY_BRANCH
if (_Matcap2HueShiftEnabled)
{
matcap2.rgb = hueShift(matcap2.rgb, _Matcap2HueShift + _Time.x * _Matcap2HueShiftSpeed);
}

blendMatcap(poiLight, poiFragData, _Matcap2Add, _Matcap2Multiply, _Matcap2Replace, matcap2, matcap2Mask, _Matcap2EmissionStrength, _Matcap2LightMask
#ifdef POI_BLACKLIGHT
, _BlackLightMaskMatcap2
#endif
);
#endif
}
#endif

float calculateGlowInTheDark(in float minLight, in float maxLight, in float minEmissionMultiplier, in float maxEmissionMultiplier, in float enabled, in float worldOrMesh, in PoiLight poiLight)
{
float glowInTheDarkMultiplier = 1;
//UNITY_BRANCH
if (enabled)
{
#ifdef POI_LIGHTING
float3 lightValue = worldOrMesh ? calculateluminance(poiLight.finalLighting.rgb) : calculateluminance(poiLight.directLighting.rgb);
float gitdeAlpha = saturate(inverseLerp(minLight, maxLight, lightValue));
glowInTheDarkMultiplier = lerp(minEmissionMultiplier, maxEmissionMultiplier, gitdeAlpha);
#endif
}
return glowInTheDarkMultiplier;
}

float calculateScrollingEmission(in float3 direction, in float velocity, in float interval, in float scrollWidth, float offset, float3 position)
{
float phase = 0;
phase = dot(position, direction);
phase -= (_Time.y + offset) * velocity;
phase /= interval;
phase -= floor(phase);
phase = saturate(phase);
return(pow(phase, scrollWidth) + pow(1 - phase, scrollWidth * 4)) * 0.5;
}

float calculateBlinkingEmission(in float blinkMin, in float blinkMax, in float blinkVelocity, float offset)
{
float amplitude = (blinkMax - blinkMin) * 0.5f;
float base = blinkMin + amplitude;
return sin((_Time.y + offset) * blinkVelocity) * amplitude + base;
}

#ifdef _EMISSION
void applyEmission(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiLight poiLight, in PoiCam poiCam, in PoiMods poiMods)
{

// First Emission
float3 emission0 = 0;
float emissionStrength0 = _EmissionStrength;
float3 emissionColor0 = 0;

#ifdef COLOR_GRADING_LOG_VIEW
if (poiMods.audioLinkAvailable && _AudioLinkEmission0Enabled)
{
emissionStrength0 += lerp(_AudioLinkEmission0CenterOut.x, _AudioLinkEmission0CenterOut.y, getBandAtTime(_AudioLinkEmission0CenterOutBand, saturate(1 - poiLight.nDotV), _AudioLinkEmission0CenterOutwidth, _AudioLinkEmission0CenterOutSize));
emissionStrength0 += lerp(_AudioLinkEmission0StrengthMod.x, _AudioLinkEmission0StrengthMod.y, poiMods.audioLink[_AudioLinkEmission0StrengthBand]);
}
#endif

float glowInTheDarkMultiplier0 = calculateGlowInTheDark(_GITDEMinLight, _GITDEMaxLight, _GITDEMinEmissionMultiplier, _GITDEMaxEmissionMultiplier, _EnableGITDEmission, _GITDEWorldOrMesh, poiLight);

#if defined(PROP_EMISSIONMAP) || !defined(OPTIMIZER_ENABLED)
//UNITY_BRANCH
if (!_EmissionCenterOutEnabled)
{
emissionColor0 = POI2D_SAMPLER_PAN(_EmissionMap, _MainTex, poiUV(poiMesh.uv[_EmissionMapUV], _EmissionMap_ST), _EmissionMapPan).rgb * lerp(1, poiFragData.baseColor, _EmissionBaseColorAsMap).rgb * _EmissionColor.rgb;
}
else
{
emissionColor0 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionMap, _MainTex, ((.5 + poiLight.nDotV * .5) * _EmissionMap_ST.xy) + _Time.x * _EmissionCenterOutSpeed).rgb * lerp(1, poiFragData.baseColor, _EmissionBaseColorAsMap).rgb * _EmissionColor.rgb;
}
#else
emissionColor0 = lerp(1, poiFragData.baseColor, _EmissionBaseColorAsMap).rgb * _EmissionColor.rgb;
#endif

//UNITY_BRANCH
if (_ScrollingEmission)
{
float3 pos = poiMesh.localPos;
//UNITY_BRANCH
if (_EmissionScrollingVertexColor)
{
pos = poiMesh.vertexColor.rgb;
}

//UNITY_BRANCH
if (_EmissionScrollingUseCurve)
{
#if defined(PROP_EMISSIONSCROLLINGCURVE) || !defined(OPTIMIZER_ENABLED)
emissionStrength0 *= UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionScrollingCurve, _MainTex, poiUV(poiMesh.uv[_EmissionMapUV], _EmissionScrollingCurve_ST) + (dot(pos, _EmissiveScroll_Direction.xyz) * _EmissiveScroll_Interval) + _Time.x * _EmissiveScroll_Velocity).r;
#endif
}
else
{
emissionStrength0 *= calculateScrollingEmission(_EmissiveScroll_Direction.xyz, _EmissiveScroll_Velocity, _EmissiveScroll_Interval, _EmissiveScroll_Width, _EmissionScrollingOffset, pos);
}
}

//UNITY_BRANCH
if (_EmissionBlinkingEnabled)
{
emissionStrength0 *= calculateBlinkingEmission(_EmissiveBlink_Min, _EmissiveBlink_Max, _EmissiveBlink_Velocity, _EmissionBlinkingOffset);
}

emissionColor0 = hueShift(emissionColor0, frac(_EmissionHueShift + _EmissionHueShiftSpeed * _Time.x) * _EmissionHueShiftEnabled);

#if defined(PROP_EMISSIONMASK) || !defined(OPTIMIZER_ENABLED)
float emissionMask0 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionMask, _MainTex, poiUV(poiMesh.uv[_EmissionMaskUV], _EmissionMask_ST) + _Time.x * _EmissionMaskPan).r;
#else
float emissionMask0 = 1;
#endif

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskEmission != 4)
{
emissionMask0 *= blackLightMask[_BlackLightMaskEmission];
}
#endif

emissionStrength0 *= glowInTheDarkMultiplier0 * emissionMask0;
emission0 = emissionStrength0 * emissionColor0;

#ifdef POI_DISSOLVE
//UNITY_BRANCH
if (_DissolveEmissionSide != 2)
{
emission0 *= lerp(1 - dissolveAlpha, dissolveAlpha, _DissolveEmissionSide);
}
#endif

// Second Emission
float3 emission1 = 0;
float emissionStrength1 = 0;
float3 emissionColor1 = 0;

#ifdef EFFECT_HUE_VARIATION
emissionStrength1 = _EmissionStrength1;
#ifdef COLOR_GRADING_LOG_VIEW
if (poiMods.audioLinkAvailable && _AudioLinkEmission1Enabled)
{
emissionStrength1 += lerp(_AudioLinkEmission1CenterOut.x, _AudioLinkEmission1CenterOut.y, getBandAtTime(_AudioLinkEmission1CenterOutBand, saturate(1 - poiLight.nDotV), _AudioLinkEmission1CenterOutwidth, _AudioLinkEmission0CenterOutSize));
emissionStrength1 += lerp(_AudioLinkEmission1StrengthMod.x, _AudioLinkEmission1StrengthMod.y, poiMods.audioLink[_AudioLinkEmission1StrengthBand]);
}
#endif

float glowInTheDarkMultiplier1 = calculateGlowInTheDark(_GITDEMinLight1, _GITDEMaxLight1, _GITDEMinEmissionMultiplier1, _GITDEMaxEmissionMultiplier1, _EnableGITDEmission1, _GITDEWorldOrMesh1, poiLight);
#if defined(PROP_EMISSIONMAP1) || !defined(OPTIMIZER_ENABLED)

//UNITY_BRANCH
if (!_EmissionCenterOutEnabled1)
{
emissionColor1 = POI2D_SAMPLER_PAN(_EmissionMap1, _MainTex, poiUV(poiMesh.uv[_EmissionMap1UV], _EmissionMap1_ST), _EmissionMap1Pan) * lerp(1, poiFragData.baseColor, _EmissionBaseColorAsMap1).rgb * _EmissionColor1.rgb;
}
else
{
emissionColor1 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionMap1, _MainTex, ((.5 + poiLight.nDotV * .5) * _EmissionMap1_ST.xy) + _Time.x * _EmissionCenterOutSpeed1).rgb * lerp(1, poiFragData.baseColor, _EmissionBaseColorAsMap1).rgb * _EmissionColor1.rgb;
}
#else
emissionColor1 = lerp(1, poiFragData.baseColor, _EmissionBaseColorAsMap1).rgb * _EmissionColor1.rgb;;
#endif
//UNITY_BRANCH
if (_ScrollingEmission1)
{
float3 pos1 = poiMesh.localPos;
//UNITY_BRANCH
if (_EmissionScrollingVertexColor1)
{
pos1 = poiMesh.vertexColor.rgb;
}

//UNITY_BRANCH
if (_EmissionScrollingUseCurve1)
{
#if defined(PROP_EMISSIONSCROLLINGCURVE1) || !defined(OPTIMIZER_ENABLED)
emissionStrength1 *= UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionScrollingCurve1, _MainTex, poiUV(poiMesh.uv[_EmissionMap1UV], _EmissionScrollingCurve1_ST) + (dot(pos1, _EmissiveScroll_Direction1) * _EmissiveScroll_Interval1) + _Time.x * _EmissiveScroll_Velocity1);
#endif
}
else
{
emissionStrength1 *= calculateScrollingEmission(_EmissiveScroll_Direction1, _EmissiveScroll_Velocity1, _EmissiveScroll_Interval1, _EmissiveScroll_Width1, _EmissionScrollingOffset1, pos1);
}
}
//UNITY_BRANCH
if (_EmissionBlinkingEnabled1)
{
emissionStrength1 *= calculateBlinkingEmission(_EmissiveBlink_Min1, _EmissiveBlink_Max1, _EmissiveBlink_Velocity1, _EmissionBlinkingOffset1);
}

emissionColor1 = hueShift(emissionColor1, frac(_EmissionHueShift1 + _EmissionHueShiftSpeed1 * _Time.x) * _EmissionHueShiftEnabled1);
#if defined(PROP_EMISSIONMASK1) || !defined(OPTIMIZER_ENABLED)
float emissionMask1 = UNITY_SAMPLE_TEX2D_SAMPLER(_EmissionMask1, _MainTex, poiUV(poiMesh.uv[_EmissionMask1UV], _EmissionMask1_ST) + _Time.x * _EmissionMask1Pan);
#else
float emissionMask1 = 1;
#endif

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskEmission2 != 4)
{
emissionMask1 *= blackLightMask[_BlackLightMaskEmission2];
}
#endif
emissionStrength1 *= glowInTheDarkMultiplier1 * emissionMask1;
emission1 = emissionStrength1 * emissionColor1;

#endif
poiFragData.finalColor.rgb = lerp(poiFragData.finalColor.rgb, saturate(emission0 + emission1),  _EmissionReplace * poiMax(emission0 + emission1));

poiFragData.emission = emission0 + emission1;
}
#endif

#ifdef POI_BACKFACE
void ApplyBackFaceColor(inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods)
{
if (!poiMesh.isFrontFace)
{
float4 backFaceColor = _BackFaceColor;
#if defined(PROP_BACKFACETEXTURE) || !defined(OPTIMIZER_ENABLED)
backFaceColor *= POI2D_SAMPLER_PAN(_BackFaceTexture, _MainTex, poiUV(poiMesh.uv[_BackFaceTextureUV], _BackFaceTexture_ST), _BackFaceTexturePan);
#endif
backFaceColor.rgb = hueShift(backFaceColor.rgb, frac(_BackFaceHueShift + _BackFaceHueShiftSpeed * _Time.x) * _BackFaceHueShiftEnabled);

float backFaceMask = 1;
#if defined(PROP_BACKFACEMASK) || !defined(OPTIMIZER_ENABLED)
backFaceMask *= POI2D_SAMPLER_PAN(_BackFaceMask, _MainTex, poiUV(poiMesh.uv[_BackFaceMaskUV], _BackFaceMask_ST), _BackFaceMaskPan).r * _BackFaceAlpha * backFaceColor.a;
#endif

poiFragData.baseColor = lerp(poiFragData.baseColor, backFaceColor.rgb, backFaceMask);

UNITY_BRANCH
if (_BackFaceReplaceAlpha)
{
poiFragData.alpha = lerp(backFaceColor.a, poiFragData.alpha, backFaceMask);
}

poiFragData.emission += backFaceColor.rgb * _BackFaceEmissionStrength * backFaceMask;
}
}
#endif

#ifdef FINALPASS
void ApplyDetailColor(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiMods poiMods)
{
#if defined(PROP_DETAILTEX) || !defined(OPTIMIZER_ENABLED)
half3 detailTexture = POI2D_SAMPLER_PAN(_DetailTex, _MainTex, poiUV(poiMesh.uv[_DetailTexUV], _DetailTex_ST), _DetailTexPan).rgb * _DetailTint.rgb;
#else
half3 detailTexture = 0.21763764082 * _DetailTint.rgb;
#endif

poiFragData.baseColor.rgb *= LerpWhiteTo(detailTexture * _DetailBrightness * unity_ColorSpaceDouble.rgb, poiMods.detailMask.r * _DetailTexIntensity);
}

void ApplyDetailNormal(inout PoiMods poiMods, inout PoiMesh poiMesh)
{
#if defined(PROP_DETAILMASK) || !defined(OPTIMIZER_ENABLED)
poiMods.detailMask = POI2D_SAMPLER_PAN(_DetailMask, _MainTex, poiUV(poiMesh.uv[_DetailMaskUV], _DetailMask_ST), _DetailMaskPan).rg;
#else
poiMods.detailMask = 1;
#endif

#ifdef POI_BACKFACE
if (!poiMesh.isFrontFace)
{
poiMods.detailMask.g *= _BackFaceDetailIntensity;
}
#endif

#if defined(PROP_DETAILNORMALMAP) || !defined(OPTIMIZER_ENABLED)
half3 detailNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_DetailNormalMap, _MainTex, poiUV(poiMesh.uv[_DetailNormalMapUV], _DetailNormalMap_ST), _DetailNormalMapPan), _DetailNormalMapScale * poiMods.detailMask.g);
poiMesh.tangentSpaceNormal = BlendNormals(detailNormal, poiMesh.tangentSpaceNormal);
#endif
}
#endif

#ifdef VIGNETTE

void calculateRGBNormals(inout PoiMesh poiMesh)
{
float4 rgbMask;
//UNITY_BRANCH
if (_RGBUseVertexColors)
{
rgbMask = poiMesh.vertexColor;
}
else
{
#if defined(PROP_RGBMASK) || !defined(OPTIMIZER_ENABLED)
rgbMask = POI2D_SAMPLER_PAN(_RGBMask, _MainTex, poiUV(poiMesh.uv[_RGBMaskUV], _RGBMask_ST), _RGBMaskPan);
#else
rgbMask = 1;
#endif
}

//UNITY_BRANCH
if (_RgbNormalsEnabled)
{
//UNITY_BRANCH
if (_RGBNormalBlend == 0)
{
//UNITY_BRANCH
if (_RgbNormalRScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalR, _MainTex, poiUV(poiMesh.uv[_RgbNormalRUV], _RgbNormalR_ST), _RgbNormalRPan), _RgbNormalRScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.r);
}

//UNITY_BRANCH
if (_RgbNormalGScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalG, _MainTex, poiUV(poiMesh.uv[_RgbNormalGUV], _RgbNormalG_ST), _RgbNormalGPan), _RgbNormalGScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.g);
}

//UNITY_BRANCH
if (_RgbNormalBScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalB, _MainTex, poiUV(poiMesh.uv[_RgbNormalBUV], _RgbNormalB_ST), _RgbNormalBPan), _RgbNormalBScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.b);
}

//UNITY_BRANCH
if (_RgbNormalAScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalA, _MainTex, poiUV(poiMesh.uv[_RgbNormalAUV], _RgbNormalA_ST), _RgbNormalAPan), _RgbNormalAScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.a);
}
}
else
{
half3 newNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalR, _MainTex, poiUV(poiMesh.uv[_RgbNormalRUV], _RgbNormalR_ST), _RgbNormalRPan), _RgbNormalRScale * rgbMask.r);
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalG, _MainTex, poiUV(poiMesh.uv[_RgbNormalGUV], _RgbNormalG_ST), _RgbNormalGPan), _RgbNormalGScale * rgbMask.g);
newNormal = BlendNormals(newNormal, normalToBlendWith);
normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalB, _MainTex, poiUV(poiMesh.uv[_RgbNormalBUV], _RgbNormalB_ST), _RgbNormalBPan), _RgbNormalBScale * rgbMask.b);
newNormal = BlendNormals(newNormal, normalToBlendWith);
normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalA, _MainTex, poiUV(poiMesh.uv[_RgbNormalAUV], _RgbNormalA_ST), _RgbNormalAPan), _RgbNormalAScale * rgbMask.a);
newNormal = BlendNormals(newNormal, normalToBlendWith);
poiMesh.tangentSpaceNormal = BlendNormals(newNormal, poiMesh.tangentSpaceNormal);
}
}
}

void calculateRGBMask(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
//If RGB normals are in use this data will already exist
float4 rgbMask = float4(1, 1, 1, 1);
//UNITY_BRANCH
if (_RGBUseVertexColors)
{
rgbMask = poiMesh.vertexColor;
}
else
{
#if defined(PROP_RGBMASK) || !defined(OPTIMIZER_ENABLED)
rgbMask = POI2D_SAMPLER_PAN(_RGBMask, _MainTex, poiUV(poiMesh.uv[_RGBMaskUV], _RGBMask_ST), _RGBMaskPan);
#else
rgbMask = 1;
#endif
}

#if defined(PROP_REDTEXURE) || !defined(OPTIMIZER_ENABLED)
float4 red = POI2D_SAMPLER_PAN(_RedTexure, _MainTex, poiUV(poiMesh.uv[_RedTexureUV], _RedTexure_ST), _RedTexurePan);
#else
float4 red = 1;
#endif
#if defined(PROP_GREENTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 green = POI2D_SAMPLER_PAN(_GreenTexture, _MainTex, poiUV(poiMesh.uv[_GreenTextureUV], _GreenTexture_ST), _GreenTexturePan);
#else
float4 green = 1;
#endif
#if defined(PROP_BLUETEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 blue = POI2D_SAMPLER_PAN(_BlueTexture, _MainTex, poiUV(poiMesh.uv[_BlueTextureUV], _BlueTexture_ST), _BlueTexturePan);
#else
float4 blue = 1;
#endif
#if defined(PROP_ALPHATEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 alpha = POI2D_SAMPLER_PAN(_AlphaTexture, _MainTex, poiUV(poiMesh.uv[_AlphaTextureUV], _AlphaTexture_ST), _AlphaTexturePan);
#else
float4 alpha = 1;
#endif

//UNITY_BRANCH
if (_RGBBlendMultiplicative)
{
float3 RGBColor = 1;
RGBColor = lerp(RGBColor, red.rgb * _RedColor.rgb, rgbMask.r * red.a * _RedColor.a);
RGBColor = lerp(RGBColor, green.rgb * _GreenColor.rgb, rgbMask.g * green.a * _GreenColor.a);
RGBColor = lerp(RGBColor, blue.rgb * _BlueColor.rgb, rgbMask.b * blue.a * _BlueColor.a);
RGBColor = lerp(RGBColor, alpha.rgb * _AlphaColor.rgb, rgbMask.a * alpha.a * _AlphaColor.a);

poiFragData.baseColor *= RGBColor;
}
else
{
poiFragData.baseColor = lerp(poiFragData.baseColor, red.rgb * _RedColor.rgb, rgbMask.r * red.a * _RedColor.a);
poiFragData.baseColor = lerp(poiFragData.baseColor, green.rgb * _GreenColor.rgb, rgbMask.g * green.a * _GreenColor.a);
poiFragData.baseColor = lerp(poiFragData.baseColor, blue.rgb * _BlueColor.rgb, rgbMask.b * blue.a * _BlueColor.a);
poiFragData.baseColor = lerp(poiFragData.baseColor, alpha.rgb * _AlphaColor.rgb, rgbMask.a * alpha.a * _AlphaColor.a);
}
}
#endif

#ifdef GEOM_TYPE_BRANCH

float2 decalUV(float uvNumber, float2 position, half rotation, half rotationSpeed, half2 scale, float depth, in PoiMesh poiMesh, in PoiCam poiCam)
{
float2 uv = poiMesh.uv[uvNumber] + calcParallax(depth + 1, poiCam);
float2 decalCenter = position;
float theta = radians(rotation + _Time.z * rotationSpeed);
float cs = cos(theta);
float sn = sin(theta);
uv = float2((uv.x - decalCenter.x) * cs - (uv.y - decalCenter.y) * sn + decalCenter.x, (uv.x - decalCenter.x) * sn + (uv.y - decalCenter.y) * cs + decalCenter.y);
uv = remap(uv, float2(0, 0) - scale / 2 + position, scale / 2 + position, float2(0, 0), float2(1, 1));
return uv;
}

inline float3 decalHueShift(float enabled, float3 color, float shift, float shiftSpeed)
{
//UNITY_BRANCH
if (enabled)
{
color = hueShift(color, shift + _Time.x * shiftSpeed);
}
return color;
}

inline float applyTilingClipping(float enabled, float2 uv)
{
float ret = 1;
//UNITY_BRANCH
if (!enabled)
{
if (uv.x > 1 || uv.y > 1 || uv.x < 0 || uv.y < 0)
{
ret = 0;
}
}
return ret;
}

void applyDecals(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{

#if defined(PROP_DECALMASK) || !defined(OPTIMIZER_ENABLED)
float4 decalMask = POI2D_SAMPLER_PAN(_DecalMask, _MainTex, poiMesh.uv[_DecalMaskUV], _DecalMaskPan);
#else
float4 decalMask = 1;
#endif

float4 decalColor = 1;
float2 uv = 0;

// Decal 0
float2 decalScale = float2(1, 1);
float decalRotation = 0;
decalScale = _DecalScale;
#if defined(PROP_DECALTEXTURE) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal0Scale.xy, _AudioLinkDecal0Scale.zw, poiMods.audioLink[_AudioLinkDecal0ScaleBand]);
decalRotation += lerp(_AudioLinkDecal0Rotation.x, _AudioLinkDecal0Rotation.y, poiMods.audioLink[_AudioLinkDecal0RotationBand]);
}
#endif
uv = decalUV(_DecalTextureUV, _DecalPosition, _DecalRotation + decalRotation, _DecalRotationSpeed, decalScale, _Decal0Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture, _MainTex, uv, _DecalTexturePan) * _DecalColor;
#else
uv = decalUV(_DecalTextureUV, _DecalPosition, _DecalRotation + decalRotation, _DecalRotationSpeed, decalScale, _Decal0Depth, poiMesh, poiCam);
decalColor = _DecalColor;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled, decalColor.rgb, _DecalHueShift, _DecalHueShiftSpeed);
decalColor.a *= applyTilingClipping(_DecalTiled, uv) * decalMask.r;

float audioLinkDecalAlpha0 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha0 = lerp(_AudioLinkDecal0Alpha.x, _AudioLinkDecal0Alpha.y, poiMods.audioLink[_AudioLinkDecal0AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType), decalColor.a * saturate(_DecalBlendAlpha + audioLinkDecalAlpha0));

float audioLinkDecalEmission0 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission0 = lerp(_AudioLinkDecal0Emission.x, _AudioLinkDecal0Emission.y, poiMods.audioLink[_AudioLinkDecal0EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength + audioLinkDecalEmission0, 0);

#ifdef GEOM_TYPE_BRANCH_DETAIL
// Decal 1
decalScale = _DecalScale1;
decalRotation = 0;
#if defined(PROP_DECALTEXTURE1) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal1Scale.xy, _AudioLinkDecal1Scale.zw, poiMods.audioLink[_AudioLinkDecal1ScaleBand]);
decalRotation += lerp(_AudioLinkDecal1Rotation.x, _AudioLinkDecal1Rotation.y, poiMods.audioLink[_AudioLinkDecal1RotationBand]);
}
#endif
uv = decalUV(_DecalTexture1UV, _DecalPosition1, _DecalRotation1 + decalRotation, _DecalRotationSpeed1, decalScale, _Decal1Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture1, _MainTex, uv, _DecalTexture1Pan) * _DecalColor1;
#else
uv = decalUV(_DecalTexture1UV, _DecalPosition1, _DecalRotation1 + decalRotation, _DecalRotationSpeed1, decalScale, _Decal1Depth, poiMesh, poiCam);
decalColor = _DecalColor1;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled1, decalColor.rgb, _DecalHueShift1, _DecalHueShiftSpeed1);
decalColor.a *= applyTilingClipping(_DecalTiled1, uv) * decalMask.g;

float audioLinkDecalAlpha1 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha1 = lerp(_AudioLinkDecal1Alpha.x, _AudioLinkDecal1Alpha.y, poiMods.audioLink[_AudioLinkDecal1AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType1), decalColor.a * saturate(_DecalBlendAlpha1 + audioLinkDecalAlpha1));

float audioLinkDecalEmission1 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission1 = lerp(_AudioLinkDecal1Emission.x, _AudioLinkDecal1Emission.y, poiMods.audioLink[_AudioLinkDecal1EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength1 + audioLinkDecalEmission1, 0);
#endif
#ifdef GEOM_TYPE_FROND
// Decal 2
decalScale = _DecalScale2;
decalRotation = 0;
#if defined(PROP_DECALTEXTURE2) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal2Scale.xy, _AudioLinkDecal2Scale.zw, poiMods.audioLink[_AudioLinkDecal2ScaleBand]);
decalRotation += lerp(_AudioLinkDecal2Rotation.x, _AudioLinkDecal2Rotation.y, poiMods.audioLink[_AudioLinkDecal2RotationBand]);
}
#endif
uv = decalUV(_DecalTexture2UV, _DecalPosition2, _DecalRotation2 + decalRotation, _DecalRotationSpeed2, decalScale, _Decal2Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture2, _MainTex, uv, _DecalTexture2Pan) * _DecalColor2;
#else
uv = decalUV(_DecalTexture2UV, _DecalPosition2, _DecalRotation2 + decalRotation, _DecalRotationSpeed2, decalScale, _Decal2Depth, poiMesh, poiCam);
decalColor = _DecalColor2;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled2, decalColor.rgb, _DecalHueShift2, _DecalHueShiftSpeed2);
decalColor.a *= applyTilingClipping(_DecalTiled2, uv) * decalMask.b;

float audioLinkDecalAlpha2 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha2 = lerp(_AudioLinkDecal2Alpha.x, _AudioLinkDecal2Alpha.y, poiMods.audioLink[_AudioLinkDecal2AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType2), decalColor.a * saturate(_DecalBlendAlpha2 + audioLinkDecalAlpha2));

float audioLinkDecalEmission2 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission2 = lerp(_AudioLinkDecal2Emission.x, _AudioLinkDecal2Emission.y, poiMods.audioLink[_AudioLinkDecal2EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength2 + audioLinkDecalEmission2, 0);
#endif
#ifdef DEPTH_OF_FIELD_COC_VIEW
// Decal 3
decalScale = _DecalScale3;
decalRotation = 0;
#if defined(PROP_DECALTEXTURE3) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal3Scale.xy, _AudioLinkDecal3Scale.zw, poiMods.audioLink[_AudioLinkDecal3ScaleBand]);
decalRotation += lerp(_AudioLinkDecal3Rotation.x, _AudioLinkDecal3Rotation.y, poiMods.audioLink[_AudioLinkDecal3RotationBand]);
}
#endif
uv = decalUV(_DecalTexture3UV, _DecalPosition3, _DecalRotation3 + decalRotation, _DecalRotationSpeed3, decalScale, _Decal3Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture3, _MainTex, uv, _DecalTexture3Pan) * _DecalColor3;
#else
uv = decalUV(_DecalTexture3UV, _DecalPosition3, _DecalRotation3 + decalRotation, _DecalRotationSpeed3, decalScale, _Decal3Depth, poiMesh, poiCam);
decalColor = _DecalColor3;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled3, decalColor.rgb, _DecalHueShift3, _DecalHueShiftSpeed3);
decalColor.a *= applyTilingClipping(_DecalTiled3, uv) * decalMask.a;

float audioLinkDecalAlpha3 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha3 = lerp(_AudioLinkDecal3Alpha.x, _AudioLinkDecal3Alpha.y, poiMods.audioLink[_AudioLinkDecal3AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType3), decalColor.a * saturate(_DecalBlendAlpha3 + audioLinkDecalAlpha3));

float audioLinkDecalEmission3 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission3 = lerp(_AudioLinkDecal3Emission.x, _AudioLinkDecal3Emission.y, poiMods.audioLink[_AudioLinkDecal3EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength3 + audioLinkDecalEmission3, 0);
#endif

poiFragData.baseColor = saturate(poiFragData.baseColor);
}
#endif

#ifdef _SUNDISK_SIMPLE

float3 RandomColorFromPoint(float2 rando)
{
fixed hue = random2(rando.x + rando.y).x;
fixed saturation = lerp(_GlitterMinMaxSaturation.x, _GlitterMinMaxSaturation.y, rando.x);
fixed value = lerp(_GlitterMinMaxBrightness.x, _GlitterMinMaxBrightness.y, rando.y);
float3 hsv = float3(hue, saturation, value);
return HSVtoRGB(hsv);
}

void applyGlitter(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
// Scale
float2 st = frac(poiMesh.uv[0] + _GlitterUVPanning.xy * _Time.x) * _GlitterFrequency;

// Tile the space
float2 i_st = floor(st);
float2 f_st = frac(st);

float m_dist = 10.;  // minimun distance
float2 m_point = 0;        // minimum point
float2 randoPoint = 0;
float2 dank;
for (int j = -1; j <= 1; j++)
{
for (int i = -1; i <= 1; i++)
{
float2 neighbor = float2(i, j);
float2 pos = random2(i_st + neighbor);
float2 rando = pos;
pos = 0.5 + 0.5 * sin(_GlitterJitter * 6.2831 * pos);
float2 diff = neighbor + pos - f_st;
float dist = length(diff);

if (dist < m_dist)
{
dank = diff;
m_dist = dist;
m_point = pos;
randoPoint = rando;
}
}
}

float randomFromPoint = random(randoPoint);

float size = _GlitterSize;
UNITY_BRANCH
if (_GlitterRandomSize)
{
size = remapClamped(0, 1, randomFromPoint, _GlitterMinMaxSize.x, _GlitterMinMaxSize.y);
}

// Assign a color using the closest point position
//color += dot(m_point, float2(.3, .6));

// Add distance field to closest point center
// color.g = m_dist;

// Show isolines
//color -= abs(sin(40.0 * m_dist)) * 0.07;

// Draw cell center
half glitterAlpha = 1;
switch(_GlitterShape)
{
case 0: //circle
glitterAlpha = (1. - step(size, m_dist));
break;
case 1: //sqaure
float jaggyFix = pow(poiCam.distanceToVert, 2) * _GlitterJaggyFix;

UNITY_BRANCH
if (_GlitterRandomRotation == 1 || _GlitterTextureRotation != 0)
{
float2 center = float2(0, 0);
float randomBoy = 0;
UNITY_BRANCH
if (_GlitterRandomRotation)
{
randomBoy = random(randoPoint);
}
float theta = radians((randomBoy + _Time.x * _GlitterTextureRotation) * 360);
float cs = cos(theta);
float sn = sin(theta);
dank = float2((dank.x - center.x) * cs - (dank.y - center.y) * sn + center.x, (dank.x - center.x) * sn + (dank.y - center.y) * cs + center.y);
glitterAlpha = (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.x))) * (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.y)));
}
else
{
glitterAlpha = (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.x))) * (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.y)));
}
break;
}

float3 finalGlitter = 0;

half3 glitterColor = _GlitterColor;

float3 norm = poiMesh.normals[1];
float3 randomRotation = 0;
switch(_GlitterMode)
{
case 0:
UNITY_BRANCH
if (_GlitterSpeed > 0)
{
randomRotation = randomFloat3WiggleRange(randoPoint, _GlitterAngleRange, _GlitterSpeed);
}
else
{
randomRotation = randomFloat3Range(randoPoint, _GlitterAngleRange);
}

float3 glitterReflectionDirection = normalize(mul(poiRotationMatrixFromAngles(randomRotation), norm));
finalGlitter = lerp(0, _GlitterMinBrightness * glitterAlpha, glitterAlpha) + max(pow(saturate(dot(lerp(glitterReflectionDirection, poiCam.viewDir, _GlitterBias), poiCam.viewDir)), _GlitterContrast), 0);
finalGlitter *= glitterAlpha;
break;
case 1:
float offset = random(randoPoint);
float brightness = sin((_Time.x + offset) * _GlitterSpeed) * _glitterFrequencyLinearEmissive - (_glitterFrequencyLinearEmissive - 1);
finalGlitter = max(_GlitterMinBrightness * glitterAlpha, brightness * glitterAlpha * smoothstep(0, 1, 1 - m_dist * _GlitterCenterSize * 10));
break;
case 2:
if (_GlitterSpeed > 0)
{
randomRotation = randomFloat3WiggleRange(randoPoint, _GlitterAngleRange, _GlitterSpeed);
}
else
{
randomRotation = randomFloat3Range(randoPoint, _GlitterAngleRange);
}

float3 glitterLightReflectionDirection = normalize(mul(poiRotationMatrixFromAngles(randomRotation), norm));

#ifdef UNITY_PASS_FORWARDADD
glitterAlpha *= poiLight.nDotLSaturated * poiLight.attenuation;
#endif
#ifdef UNITY_PASS_FORWARDBASE
glitterAlpha *= poiLight.nDotLSaturated;
#endif

float3 halfDir = normalize(poiLight.direction + poiCam.viewDir);
float specAngle = max(dot(halfDir, glitterLightReflectionDirection), 0.0);

finalGlitter = lerp(0, _GlitterMinBrightness * glitterAlpha, glitterAlpha) + max(pow(specAngle, _GlitterContrast), 0);

glitterColor *= poiLight.directColor;
finalGlitter *= glitterAlpha;

break;
}

glitterColor *= lerp(1, poiFragData.baseColor, _GlitterUseSurfaceColor);
#if defined(PROP_GLITTERCOLORMAP) || !defined(OPTIMIZER_ENABLED)
glitterColor *= POI2D_SAMPLER_PAN(_GlitterColorMap, _MainTex, poiUV(poiMesh.uv[_GlitterColorMapUV], _GlitterColorMap_ST), _GlitterColorMapPan).rgb;
#endif
float2 uv = remapClamped(-size, size, dank, 0, 1);
UNITY_BRANCH
if (_GlitterRandomRotation == 1 || _GlitterTextureRotation != 0 && !_GlitterShape)
{
float2 fakeUVCenter = float2(.5, .5);
float randomBoy = 0;
UNITY_BRANCH
if (_GlitterRandomRotation)
{
randomBoy = random(randoPoint);
}
float theta = radians((randomBoy + _Time.x * _GlitterTextureRotation) * 360);
float cs = cos(theta);
float sn = sin(theta);
uv = float2((uv.x - fakeUVCenter.x) * cs - (uv.y - fakeUVCenter.y) * sn + fakeUVCenter.x, (uv.x - fakeUVCenter.x) * sn + (uv.y - fakeUVCenter.y) * cs + fakeUVCenter.y);
}

#if defined(PROP_GLITTERTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 glitterTexture = POI2D_SAMPLER_PAN(_GlitterTexture, _MainTex, poiUV(uv, _GlitterTexture_ST), _GlitterTexturePan);
#else
float4 glitterTexture = 1;
#endif
//float4 glitterTexture = _GlitterTexture.SampleGrad(sampler_MainTex, frac(uv), ddx(uv), ddy(uv));
glitterColor *= glitterTexture.rgb;
#if defined(PROP_GLITTERMASK) || !defined(OPTIMIZER_ENABLED)
float glitterMask = POI2D_SAMPLER_PAN(_GlitterMask, _MainTex, poiUV(poiMesh.uv[_GlitterMaskUV], _GlitterMask_ST), _GlitterMaskPan);
#else
float glitterMask = 1;
#endif

glitterMask *= lerp(1, poiLight.attenuation, _GlitterHideInShadow);

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskGlitter != 4)
{
glitterMask *= blackLightMask[_BlackLightMaskGlitter];
}
#endif

if (_GlitterRandomColors)
{
glitterColor *= RandomColorFromPoint(random2(randoPoint.x + randoPoint.y));
}

UNITY_BRANCH
if (_GlitterHueShiftEnabled)
{
glitterColor.rgb = hueShift(glitterColor.rgb, _GlitterHueShift + _Time.x * _GlitterHueShiftSpeed);
}

UNITY_BRANCH
if (_GlitterBlendType == 1)
{
poiFragData.baseColor = lerp(poiFragData.baseColor, finalGlitter * glitterColor * _GlitterBrightness, finalGlitter * glitterTexture.a * glitterMask);
poiFragData.emission += finalGlitter * glitterColor * max(0, (_GlitterBrightness - 1) * glitterTexture.a) * glitterMask;
}
else
{
poiFragData.emission += finalGlitter * glitterColor * _GlitterBrightness * glitterTexture.a * glitterMask;
}
}
#endif

#ifdef _GLOSSYREFLECTIONS_OFF
void ApplyRimLighting(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
#if defined(PROP_RIMWIDTHNOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
float rimNoise = POI2D_SAMPLER_PAN(_RimWidthNoiseTexture, _MainTex, poiMesh.uv[_RimWidthNoiseTextureUV], _RimWidthNoiseTexturePan);
#else
float rimNoise = 0;
#endif

rimNoise = (rimNoise - .5) * _RimWidthNoiseStrength;

float viewDotNormal = saturate(abs(dot(poiCam.viewDir, poiMesh.normals[_RimLightNormal])));

UNITY_BRANCH
if (_RimLightingInvert)
{
viewDotNormal = 1 - viewDotNormal;
}
float rimStrength = _RimStrength;
float rimBrighten = _RimBrighten;

float rimWidth = lerp( - .05, 1, _RimWidth);
#ifdef POI_AUDIOLINK
UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
rimWidth = clamp(rimWidth + lerp(_AudioLinkRimWidthAdd.x, _AudioLinkRimWidthAdd.y, poiMods.audioLink[_AudioLinkRimWidthBand]), - .05, 1);
rimStrength += lerp(_AudioLinkRimEmissionAdd.x, _AudioLinkRimEmissionAdd.y, poiMods.audioLink[_AudioLinkRimEmissionBand]);
rimBrighten += lerp(_AudioLinkRimBrightnessAdd.x, _AudioLinkRimBrightnessAdd.y, poiMods.audioLink[_AudioLinkRimBrightnessBand]);
}
#endif

rimWidth -= rimNoise;
#if defined(PROP_RIMMASK) || !defined(OPTIMIZER_ENABLED)
float rimMask = POI2D_SAMPLER_PAN(_RimMask, _MainTex, poiMesh.uv[_RimMaskUV], _RimMaskPan);
#else
float rimMask = 1;
#endif

#if defined(PROP_RIMTEX) || !defined(OPTIMIZER_ENABLED)
float4 rimColor = POI2D_SAMPLER_PAN(_RimTex, _MainTex, poiMesh.uv[_RimTexUV], _RimTexPan) * _RimLightColor;
#else
float4 rimColor = _RimLightColor;
#endif

UNITY_BRANCH
if (_RimHueShiftEnabled)
{
rimColor.rgb = hueShift(rimColor.rgb, _RimHueShift + _Time.x * _RimHueShiftSpeed);
}

rimWidth = max(lerp(rimWidth, rimWidth * lerp(0, 1, poiLight.lightMap - _ShadowMixThreshold) * _ShadowMixWidthMod, _ShadowMix), 0);
float rim = 1 - smoothstep(min(_RimSharpness, rimWidth), rimWidth, viewDotNormal);
rim *= _RimLightColor.a * rimColor.a * rimMask;
poiFragData.emission += rim * lerp(poiFragData.baseColor, rimColor, _RimLightColorBias) * rimStrength;
poiFragData.baseColor = lerp(poiFragData.baseColor, lerp(poiFragData.baseColor, rimColor, _RimLightColorBias) + lerp(poiFragData.baseColor, rimColor, _RimLightColorBias) * rimBrighten, rim);
}
#endif

#ifdef _SUNDISK_HIGH_QUALITY

void applyFlipbook(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
float4 flipBookPixel = float4(0, 0, 0, 0);
#if defined(PROP_FLIPBOOKMASK) || !defined(OPTIMIZER_ENABLED)
float flipBookMask = POI2D_SAMPLER_PAN(_FlipbookMask, _MainTex, poiMesh.uv[_FlipbookMaskUV], _FlipbookMaskPan).r;
#else
float flipBookMask = 1;
#endif
float4 flipbookScaleOffset = _FlipbookScaleOffset;

#ifdef POI_AUDIOLINK
flipbookScaleOffset.xy += lerp(_AudioLinkFlipbookScale.xy, _AudioLinkFlipbookScale.zw, poiMods.audioLink[_AudioLinkFlipbookScaleBand]);
#endif

flipbookScaleOffset.xy = 1 - flipbookScaleOffset.xy;
float2 uv = frac(poiMesh.uv[_FlipbookTexArrayUV]);
float theta = radians(_FlipbookRotation + _Time.z * _FlipbookRotationSpeed);
float cs = cos(theta);
float sn = sin(theta);
float2 spriteCenter = flipbookScaleOffset.zw + .5;
// 2d rotation
uv = float2((uv.x - spriteCenter.x) * cs - (uv.y - spriteCenter.y) * sn + spriteCenter.x, (uv.x - spriteCenter.x) * sn + (uv.y - spriteCenter.y) * cs + spriteCenter.y);

float2 newUV = remap(uv, float2(0, 0) + flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(1, 1) - flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(0, 0), float2(1, 1));

UNITY_BRANCH
if (_FlipbookTiled == 0)
{
if (max(newUV.x, newUV.y) > 1 || min(newUV.x, newUV.y) < 0)
{
return;
}
}
#if defined(PROP_FLIPBOOKTEXARRAY) || !defined(OPTIMIZER_ENABLED)
float currentFrame = fmod(_FlipbookCurrentFrame, _FlipbookTotalFrames);
if (_FlipbookCurrentFrame < 0)
{
currentFrame = (_Time.y / (1 / _FlipbookFPS)) % _FlipbookTotalFrames;
}
#ifdef POI_AUDIOLINK
currentFrame += lerp(_AudioLinkFlipbookFrame.x, _AudioLinkFlipbookFrame.y, poiMods.audioLink[_AudioLinkFlipbookFrameBand]);
#endif
flipBookPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor(currentFrame)));
UNITY_BRANCH
if (_FlipbookCrossfadeEnabled)
{
float4 flipbookNextPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor((currentFrame + 1) % _FlipbookTotalFrames)));
flipBookPixel = lerp(flipBookPixel, flipbookNextPixel, smoothstep(_FlipbookCrossfadeRange.x, _FlipbookCrossfadeRange.y, frac(currentFrame)));
}
#else
flipBookPixel = 1;
#endif

UNITY_BRANCH
if (_FlipbookIntensityControlsAlpha)
{
flipBookPixel.a = poiMax(flipBookPixel.rgb);
}
UNITY_BRANCH
if (_FlipbookColorReplaces)
{
flipBookPixel.rgb = _FlipbookColor.rgb;
}
else
{
flipBookPixel.rgb *= _FlipbookColor.rgb;
}

#ifdef POI_BLACKLIGHT
UNITY_BRANCH
if (_BlackLightMaskFlipbook != 4)
{
flipBookMask *= blackLightMask[_BlackLightMaskFlipbook];
}
#endif

UNITY_BRANCH
if (_FlipbookHueShiftEnabled)
{
flipBookPixel.rgb = hueShift(flipBookPixel.rgb, _FlipbookHueShift + _Time.x * _FlipbookHueShiftSpeed);
}
half flipbookAlpha = 1;
#ifdef POI_AUDIOLINK
flipbookAlpha = saturate(lerp(_AudioLinkFlipbookAlpha.x, _AudioLinkFlipbookAlpha.y, poiMods.audioLink[_AudioLinkFlipbookAlphaBand]));
#endif

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)

poiFragData.baseColor = lerp(poiFragData.baseColor, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * _FlipbookReplace * flipBookMask * flipbookAlpha);
poiFragData.baseColor = poiFragData.baseColor + flipBookPixel.rgb * _FlipbookAdd * flipBookMask * flipbookAlpha;
poiFragData.baseColor = poiFragData.baseColor * lerp(1, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * flipBookMask * _FlipbookMultiply * flipbookAlpha);

float flipbookEmissionStrength = _FlipbookEmissionStrength;
#ifdef POI_AUDIOLINK
flipbookEmissionStrength += max(lerp(_AudioLinkFlipbookEmission.x, _AudioLinkFlipbookEmission.y, poiMods.audioLink[_AudioLinkFlipbookEmissionBand]), 0);
#endif

poiFragData.emission += lerp(0, flipBookPixel.rgb * flipbookEmissionStrength, flipBookPixel.a * _FlipbookColor.a * flipBookMask * flipbookAlpha);

#endif

UNITY_BRANCH
if (_FlipbookAlphaControlsFinalAlpha)
{
poiFragData.alpha = lerp(poiFragData.alpha, flipBookPixel.a * _FlipbookColor.a, flipBookMask);
}
}

#endif

#ifdef DISTORT
void applyDissolve(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
float dissolveMask = POI2D_SAMPLER_PAN(_DissolveMask, _MainTex, poiUV(poiMesh.uv[_DissolveMaskUV], _DissolveMask_ST), _DissolveMaskPan).r;
#else
float dissolveMask = 1;
#endif
UNITY_BRANCH
if (_DissolveUseVertexColors)
{
// Vertex Color Imprecision hype
dissolveMask = ceil(poiMesh.vertexColor.g * 100000) / 100000;
}

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
dissolveToTexture = POI2D_SAMPLER_PAN(_DissolveToTexture, _MainTex, poiUV(poiMesh.uv[_DissolveToTextureUV], _DissolveToTexture_ST), _DissolveToTexturePan) * _DissolveTextureColor;
#else
dissolveToTexture = _DissolveTextureColor;
#endif

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
float dissolveNoiseTexture = POI2D_SAMPLER_PAN(_DissolveNoiseTexture, _MainTex, poiUV(poiMesh.uv[_DissolveNoiseTextureUV], _DissolveNoiseTexture_ST), _DissolveNoiseTexturePan).r;
#else
float dissolveNoiseTexture = 1;
#endif

float da = _DissolveAlpha
+ _DissolveAlpha0
+ _DissolveAlpha1
+ _DissolveAlpha2
+ _DissolveAlpha3
+ _DissolveAlpha4
+ _DissolveAlpha5
+ _DissolveAlpha6
+ _DissolveAlpha7
+ _DissolveAlpha8
+ _DissolveAlpha9;
float dds = _DissolveDetailStrength;

#ifdef POI_AUDIOLINK
UNITY_BRANCH
if (_EnableDissolveAudioLink && poiMods.audioLinkTextureExists)
{
da += lerp(_AudioLinkDissolveAlpha.x, _AudioLinkDissolveAlpha.y, poiMods.audioLink[_AudioLinkDissolveAlphaBand]);
dds += lerp(_AudioLinkDissolveDetail.x, _AudioLinkDissolveDetail.y, poiMods.audioLink[_AudioLinkDissolveDetailBand]);
}
#endif

da = saturate(da);
dds = saturate(dds);

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskDissolve != 4)
{
dissolveMask *= blackLightMask[_BlackLightMaskDissolve];
}
#endif

if (_DissolveMaskInvert)
{
dissolveMask = 1 - dissolveMask;
}
#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
float dissolveDetailNoise = POI2D_SAMPLER_PAN(_DissolveDetailNoise, _MainTex, poiUV(poiMesh.uv[_DissolveDetailNoiseUV], _DissolveDetailNoise_ST), _DissolveDetailNoisePan);
#else
float dissolveDetailNoise = 0;
#endif
if (_DissolveInvertNoise)
{
dissolveNoiseTexture = 1 - dissolveNoiseTexture;
}
if (_DissolveInvertDetailNoise)
{
dissolveDetailNoise = 1 - dissolveDetailNoise;
}
if (_ContinuousDissolve != 0)
{
da = sin(_Time.y * _ContinuousDissolve) * .5 + .5;
}
da *= dissolveMask;
dissolveAlpha = da;
edgeAlpha = 0;

UNITY_BRANCH
if (_DissolveType == 1) // Basic

{
da = remap(da, 0, 1, -_DissolveEdgeWidth, 1);
dissolveAlpha = da;
//Adjust detail strength to avoid artifacts
dds *= smoothstep(1, .99, da);
float noise = saturate(dissolveNoiseTexture - dissolveDetailNoise * dds);

noise = saturate(noise + 0.001);
//noise = remap(noise, 0, 1, _DissolveEdgeWidth, 1 - _DissolveEdgeWidth);
dissolveAlpha = dissolveAlpha >= noise;
edgeAlpha = remapClamped(da + _DissolveEdgeWidth, da, noise) * (1 - dissolveAlpha);
}
else if (_DissolveType == 2) // Point to Point

{
float3 direction;
float3 currentPos;
float distanceTo = 0;
direction = normalize(_DissolveEndPoint - _DissolveStartPoint);
currentPos = lerp(_DissolveStartPoint, _DissolveEndPoint, dissolveAlpha);

UNITY_BRANCH
if (_DissolveP2PWorldLocal != 1)
{
float3 pos = _DissolveP2PWorldLocal == 0 ? poiMesh.localPos.rgb : poiMesh.vertexColor.rgb;
distanceTo = dot(pos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
else
{
distanceTo = dot(poiMesh.worldPos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
}

#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveHueShiftEnabled)
{
dissolveToTexture.rgb = hueShift(dissolveToTexture.rgb, _DissolveHueShift + _Time.x * _DissolveHueShiftSpeed);
}
#endif

poiFragData.alpha = lerp(poiFragData.alpha, dissolveToTexture.a, dissolveAlpha * .999999);

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)
poiFragData.baseColor = lerp(poiFragData.baseColor, dissolveToTexture.rgb, dissolveAlpha * .999999);

UNITY_BRANCH
if (_DissolveEdgeWidth)
{
edgeColor = tex2D(_DissolveEdgeGradient, poiUV(float2(edgeAlpha, edgeAlpha), _DissolveEdgeGradient_ST)) * _DissolveEdgeColor;
#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveEdgeHueShiftEnabled)
{
edgeColor.rgb = hueShift(edgeColor.rgb, _DissolveEdgeHueShift + _Time.x * _DissolveEdgeHueShiftSpeed);
}
#endif
poiFragData.baseColor = lerp(poiFragData.baseColor, edgeColor.rgb, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
}

poiFragData.emission += lerp(0, dissolveToTexture * _DissolveToEmissionStrength, dissolveAlpha) + lerp(0, edgeColor.rgb * _DissolveEdgeEmission, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
#endif
}
#endif

float4 frag(v2f i, uint facing : SV_IsFrontFace) : SV_Target
{
UNITY_SETUP_INSTANCE_ID(i);
PoiMesh poiMesh;
PoiInitStruct(PoiMesh, poiMesh);

PoiLight poiLight;
PoiInitStruct(PoiLight, poiLight);

PoiVertexLights poiVertexLights;
PoiInitStruct(PoiVertexLights, poiVertexLights);

PoiCam poiCam;
PoiInitStruct(PoiCam, poiCam);

PoiMods poiMods;
PoiInitStruct(PoiMods, poiMods);

PoiFragData poiFragData;
poiFragData.emission = 0;
poiFragData.baseColor = float3(0, 0, 0);
poiFragData.finalColor = float3(0, 0, 0);
poiFragData.alpha = 1;

// Mesh Data
poiMesh.objectPosition = i.objectPos;
poiMesh.objNormal = i.objNormal;
poiMesh.normals[0] = i.normal;
poiMesh.tangent = i.tangent;
poiMesh.binormal = i.binormal;
poiMesh.worldPos = i.worldPos.xyz;
poiMesh.localPos = i.localPos.xyz;
poiMesh.vertexColor = i.vertexColor;
poiMesh.isFrontFace = facing;

#ifndef POI_PASS_FORWARDOUTLINE
if (!poiMesh.isFrontFace)
{
poiMesh.normals[0] *= -1;
poiMesh.tangent *= -1;
poiMesh.binormal *= -1;
}
#endif
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 6 Distorted UV
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
poiMesh.lightmapUV = i.lightmapUV;
#endif
poiMesh.uv[0] = i.uv[0];
poiMesh.uv[1] = i.uv[1];
poiMesh.uv[2] = i.uv[2];
poiMesh.uv[3] = i.uv[3];
poiMesh.uv[4] = poiMesh.uv[0];
poiMesh.uv[5] = poiMesh.worldPos.xz;
poiMesh.uv[6] = poiMesh.uv[0];
poiMesh.uv[7] = poiMesh.uv[0];
poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
#ifdef USER_LUT
poiMesh.uv[7] = distortedUV(poiMesh);
#endif
/*
half3 worldViewUp = normalize(half3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, half3(0, 1, 0)));
half3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
poiMesh[8] = half2(dot(worldViewRight, poiMesh.normals[_MatcapNormal]), dot(worldViewUp, poiMesh.normals[_MatcapNormal])) * _MatcapBorder + 0.5;
*/

float4 mainTexture = UNITY_SAMPLE_TEX2D(_MainTex, poiUV(poiMesh.uv[_MainTexUV].xy, _MainTex_ST) + _Time.x * _MainTexPan);

float3 mainNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_BumpMap, _MainTex, poiUV(poiMesh.uv[_BumpMapUV], _BumpMap_ST), _BumpMapPan), _BumpScale);
poiMesh.tangentSpaceNormal = mainNormal;

#if defined(FINALPASS) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
ApplyDetailNormal(poiMods, poiMesh);
#endif

#if defined(GEOM_TYPE_MESH) && defined(VIGNETTE) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
calculateRGBNormals(poiMesh);
#endif

poiMesh.normals[1] = normalize(
poiMesh.tangentSpaceNormal.x * poiMesh.tangent.xyz +
poiMesh.tangentSpaceNormal.y * poiMesh.binormal +
poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
);

#ifdef POI_PASS_FORWARDOUTLINE
poiMesh.normals[1] = poiMesh.normals[0];
#endif

// Camera data
poiCam.viewDir = normalize(_WorldSpaceCameraPos - i.worldPos.xyz);
poiCam.forwardDir = getCameraForward();
poiCam.worldPos = _WorldSpaceCameraPos;
poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
//poiCam.distanceToModel = distance(poiMesh.modelPos, poiCam.worldPos);
poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
poiCam.grabPos = i.grabPos;
poiCam.screenUV = calcScreenUVs(i.grabPos);
poiCam.tangentViewDir = normalize(i.tangentViewDir);
poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
poiCam.clipPos = i.pos;

#if defined(PROP_LIGHTINGMAPSTEX) || !defined(OPTIMIZER_ENABLED)
float4 lightingMaps = POI2D_SAMPLER_PAN(_LightingMapsTex, _MainTex, poiUV(poiMesh.uv[_LightingMapsTexUV], _LightingMapsTex_ST), _LightingMapsTexPan);
#else
float4 lightingMaps = float4(1, 1, 1, 1);
#endif

poiLight.occlusion = lerp(1, lightingMaps.r, _LightDataAOStrength);
poiLight.detailShadow = lerp(1, lightingMaps.g, _LightDataDetailStrength);
poiLight.shadowMask = lerp(1, lightingMaps.b, _LightDataShadowMaskStrength);

#ifdef UNITY_PASS_FORWARDBASE

bool lightExists = false;
if (any(_LightColor0.rgb >= 0.002))
{
lightExists = true;
}

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
float4 toLightX = unity_4LightPosX0 - i.worldPos.x;
float4 toLightY = unity_4LightPosY0 - i.worldPos.y;
float4 toLightZ = unity_4LightPosZ0 - i.worldPos.z;
float4 lengthSq = 0;
lengthSq += toLightX * toLightX;
lengthSq += toLightY * toLightY;
lengthSq += toLightZ * toLightZ;

float4 lightAttenSq = unity_4LightAtten0;
float4 atten = 1.0 / (1.0 + lengthSq * lightAttenSq);
float4 vLightWeight = saturate(1 - (lengthSq * lightAttenSq / 25));
poiLight.vAttenuation = min(atten, vLightWeight * vLightWeight);

poiLight.vDotNL = 0;
poiLight.vDotNL += toLightX * poiMesh.normals[1].x;
poiLight.vDotNL += toLightY * poiMesh.normals[1].y;
poiLight.vDotNL += toLightZ * poiMesh.normals[1].z;

float4 corr = rsqrt(lengthSq);
poiLight.vDotNL = max(0, poiLight.vDotNL * corr);
poiLight.vAttenuationDotNL = poiLight.vAttenuation * poiLight.vDotNL;

for (int index = 0; index < 4; index++)
{
poiLight.vPosition[index] = float3(unity_4LightPosX0[index], unity_4LightPosY0[index], unity_4LightPosZ0[index]);

float3 vertexToLightSource = poiLight.vPosition[index] - poiMesh.worldPos;
poiLight.vDirection[index] = normalize(vertexToLightSource);
//poiLight.vAttenuationDotNL[index] = 1.0 / (1.0 + unity_4LightAtten0[index] * poiLight.vDotNL[index]);
poiLight.vColor[index] = unity_LightColor[index].rgb;
//UNITY_BRANCH
if (_LightingAdditiveLimitIntensity == 1)
{
float intensity = max(0.001, (0.299 * poiLight.vColor[index].r + 0.587 * poiLight.vColor[index].g + 0.114 * poiLight.vColor[index].b));
poiLight.vColor[index] = min(poiLight.vColor[index], poiLight.vColor[index] / (intensity / _LightingAdditiveMaxIntensity));
}
poiLight.vHalfDir[index] = Unity_SafeNormalize(poiLight.vDirection[index] + poiCam.viewDir);
poiLight.vDotNL[index] = dot(poiMesh.normals[1], -poiLight.vDirection[index]);
poiLight.vCorrectedDotNL[index] = .5 * (poiLight.vDotNL[index] + 1);
poiLight.vDotLH[index] = saturate(dot(poiLight.vDirection[index], poiLight.vHalfDir[index]));

poiLight.vDotNH[index] = saturate(dot(poiMesh.normals[1], poiLight.vHalfDir[index]));
}
#endif

//UNITY_BRANCH
if (_LightingColorMode == 0) // Poi Custom Light Color

{
float3 magic = max(BetterSH9(normalize(unity_SHAr + unity_SHAg + unity_SHAb)), 0);
float3 normalLight = _LightColor0.rgb + BetterSH9(float4(0, 0, 0, 1));

float magiLumi = calculateluminance(magic);
float normaLumi = calculateluminance(normalLight);
float maginormalumi = magiLumi + normaLumi;

float magiratio = magiLumi / maginormalumi;
float normaRatio = normaLumi / maginormalumi;

float target = calculateluminance(magic * magiratio + normalLight * normaRatio);
float3 properLightColor = magic + normalLight;
float properLuminance = calculateluminance(magic + normalLight);
poiLight.directColor = properLightColor * max(0.0001, (target / properLuminance));

poiLight.indirectColor = BetterSH9(float4(lerp(0, poiMesh.normals[1], _LightingIndirectUsesNormals), 1));
}

//UNITY_BRANCH
if (_LightingColorMode == 1) // More standard approach to light color
{
float3 indirectColor = BetterSH9(float4(poiMesh.normals[1], 1));
if (lightExists)
{
poiLight.directColor = _LightColor0.rgb;
poiLight.indirectColor = indirectColor;
}
else
{
poiLight.directColor = indirectColor * 0.6;
poiLight.indirectColor = indirectColor * 0.5;
}
}

float lightMapMode = _LightingMapMode;
//UNITY_BRANCH
if (_LightingDirectiongMode == 0)
{
poiLight.direction = _WorldSpaceLightPos0.xyz + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
}
else
{
//UNITY_BRANCH
if (_LightingDirectiongMode == 1)
{
poiLight.direction = mul(unity_ObjectToWorld, _LightngForcedDirection).xyz;;
}
//UNITY_BRANCH
if (_LightingDirectiongMode == 2)
{
poiLight.direction = _LightngForcedDirection;
}
if (lightMapMode == 0)
{
lightMapMode == 1;
}
}

poiLight.direction = normalize(poiLight.direction);
poiLight.attenuationStrength = _LightingCastedShadows;
poiLight.attenuation = 1;
if (!all(_LightColor0.rgb == 0.0))
{
UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
poiLight.attenuation *= attenuation;
}

poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
poiLight.nDotLSaturated = saturate(poiLight.nDotL);
poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
poiLight.nDotV = dot(poiMesh.normals[1], poiCam.viewDir);
poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);

//UNITY_BRANCH
if (lightMapMode == 0) // Poi special light map

{
float3 ShadeSH9Plus = GetSHLength();
float3 ShadeSH9Minus = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;

float3 greyScaleVector = float3(.33333, .33333, .33333);
float bw_lightColor = dot(poiLight.directColor, greyScaleVector);
float bw_directLighting = (((poiLight.nDotL * 0.5 + 0.5) * bw_lightColor * lerp(1, poiLight.attenuation, poiLight.attenuationStrength)) + dot(ShadeSH9(float4(poiMesh.normals[1], 1)), greyScaleVector));
float bw_bottomIndirectLighting = dot(ShadeSH9Minus, greyScaleVector);
float bw_topIndirectLighting = dot(ShadeSH9Plus, greyScaleVector);
float lightDifference = ((bw_topIndirectLighting + bw_lightColor) - bw_bottomIndirectLighting);
poiLight.lightMap = smoothstep(0, lightDifference, bw_directLighting - bw_bottomIndirectLighting);
}
//UNITY_BRANCH
if (lightMapMode == 1) // Normalized nDotL

{
poiLight.lightMap = poiLight.nDotLNormalized;
}
//UNITY_BRANCH
if (lightMapMode == 2) // Saturated nDotL

{
poiLight.lightMap = poiLight.nDotLSaturated;
}

poiLight.directColor = max(poiLight.directColor, poiLight.directColor / max(0.0001, (calculateluminance(poiLight.directColor) / _LightingMinLightBrightness)));
poiLight.indirectColor = max(poiLight.indirectColor, poiLight.indirectColor / max(0.0001, (calculateluminance(poiLight.indirectColor) / _LightingMinLightBrightness)));

poiLight.directColor = lerp(poiLight.directColor, dot(poiLight.directColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
poiLight.indirectColor = lerp(poiLight.indirectColor, dot(poiLight.indirectColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
//UNITY_BRANCH
if (_LightingCapEnabled)
{
poiLight.directColor = min(poiLight.directColor, _LightingCap);
poiLight.indirectColor = min(poiLight.indirectColor, _LightingCap);
}

//UNITY_BRANCH
if (_LightingForceColorEnabled)
{
poiLight.directColor = _LightingForcedColor;
}

#endif

#ifdef UNITY_PASS_FORWARDADD
#ifndef POI_LIGHT_DATA_ADDITIVE_ENABLE
return float4(mainTexture.rgb * .0001, 1);
#endif

#if defined(POINT) || defined(SPOT)
poiLight.direction = normalize(_WorldSpaceLightPos0.xyz - i.worldPos.xyz);

#ifdef POINT
poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(input, poiMesh.worldPos);
unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1)).xyz;
poiLight.attenuation = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
#endif

#ifdef SPOT
poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(i, poiMesh.worldPos);
unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1));
poiLight.attenuation = (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
#endif
#else
poiLight.direction = _WorldSpaceLightPos0.xyz;
UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
poiLight.additiveShadow == 0;
poiLight.attenuation = attenuation;
#endif
poiLight.directColor = _LightingAdditiveLimited ? min(_LightingAdditiveLimit, _LightColor0.rgb) : _LightColor0.rgb;
poiLight.indirectColor = lerp(0, poiLight.directColor, _LightingAdditivePassthrough);

poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
poiLight.nDotLSaturated = saturate(poiLight.nDotL);
poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
poiLight.nDotV = dot(poiMesh.normals[1], poiCam.viewDir);
poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);
poiLight.lightMap = 1;
#endif

#ifdef POI_LIGHT_DATA_DEBUG

#ifdef UNITY_PASS_FORWARDBASE
//UNITY_BRANCH
if (_LightingDebugVisualize <= 5)
{
switch(_LightingDebugVisualize)
{
case 0: // Direct Light Color
return float4(poiLight.directColor + mainTexture.rgb * .0001, 1);
break;
case 1: // Indirect Light Color
return float4(poiLight.indirectColor + mainTexture.rgb * .0001, 1);
break;
case 2: // Light Map
return float4(poiLight.lightMap + mainTexture.rgb * .0001, 1);
break;
case 3: // Attenuation
return float4(poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 4: // N Dot L
return float4(poiLight.nDotLNormalized, poiLight.nDotLNormalized, poiLight.nDotLNormalized, 1) + mainTexture * .0001;
break;
case 5:
return float4(poiLight.halfDir, 1) + mainTexture * .0001;
break;
}
}
else
{
return POI_SAFE_RGB1;
}
#endif
#ifdef UNITY_PASS_FORWARDADD
//UNITY_BRANCH
if (_LightingDebugVisualize < 6)
{
return POI_SAFE_RGB1;
}
else
{
switch(_LightingDebugVisualize)
{
case 6:
return float4(poiLight.directColor * poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 7:
return float4(poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 8:
return float4(poiLight.additiveShadow + mainTexture.rgb * .0001, 1);
break;
case 9:
return float4(poiLight.nDotLNormalized + mainTexture.rgb * .0001, 1);
break;
case 10:
return float4(poiLight.halfDir, 1) + mainTexture * .0001;
break;
}
}
#endif
#endif

poiFragData.baseColor = mainTexture.rgb * _Color.rgb;
poiFragData.alpha = mainTexture.a * _Color.a;

#if defined(PROP_CLIPPINGMASK) || !defined(OPTIMIZER_ENABLED)
float alphaMask = POI2D_SAMPLER_PAN(_ClippingMask, _MainTex, poiUV(poiMesh.uv[_ClippingMaskUV], _ClippingMask_ST), _ClippingMaskPan).r;
#else
float alphaMask = 1;
#endif

poiFragData.alpha *= alphaMask;

applyAlphaOptions(poiFragData, poiMesh, poiCam);

#if defined(_LIGHTINGMODE_SHADEMAP) && defined(VIGNETTE_MASKED)
applyShadeMapping(poiFragData, poiMesh, poiLight);
#endif

#if defined(_COLORADDSUBDIFF_ON) || defined(COLOR_GRADING_HDR_3D)
applyMatcap(poiFragData, poiCam, poiMesh, poiLight);
#endif

#ifdef POI_BACKFACE
ApplyBackFaceColor(poiFragData, poiMesh, poiMods);
#endif

#ifdef FINALPASS
ApplyDetailColor(poiFragData, poiMesh, poiMods);
#endif

#ifdef VIGNETTE
calculateRGBMask(poiFragData, poiMesh);
#endif

#ifdef GEOM_TYPE_BRANCH
applyDecals(poiFragData, poiMesh, poiCam);
#endif

#ifdef _SUNDISK_SIMPLE
applyGlitter(poiFragData, poiMesh, poiCam, poiLight);
#endif

#ifdef _GLOSSYREFLECTIONS_OFF
ApplyRimLighting(poiFragData, poiMesh, poiCam, poiLight);
#endif

#ifdef _SUNDISK_HIGH_QUALITY
applyFlipbook(poiFragData, poiMesh);
#endif

#ifdef DISTORT
applyDissolve(poiFragData, poiMesh);
#endif

poiFragData.finalColor = poiFragData.baseColor;

#ifdef VIGNETTE_MASKED
#ifdef POI_PASS_FORWARDOUTLINE
//UNITY_BRANCH
if (_OutlineLit)
{
applyShading(poiLight, poiFragData, poiMesh, poiCam);
}
else
{
poiFragData.finalColor = poiFragData.baseColor;
}
#else
applyShading(poiLight, poiFragData, poiMesh, poiCam);
#endif
#endif

#if defined(VIGNETTE_CLASSIC)
MochieBRDF(poiFragData, poiCam, poiLight, poiMesh);
#endif

#ifdef COLOR_GRADING_LOG_VIEW
initAudioBands(poiMods);
#endif

#ifdef _EMISSION
applyEmission(poiFragData, poiMesh, poiLight, poiCam, poiMods);
#endif

if (_Mode == 1)
{
clip(poiFragData.alpha - _Cutoff);
}

//UNITY_BRANCH
if (_IgnoreFog == 0)
{
UNITY_APPLY_FOG(i.fogCoord, poiFragData.finalColor);
}

poiFragData.alpha = _AlphaForceOpaque ? 1 : poiFragData.alpha;

ApplyAlphaToCoverage(poiFragData, poiMesh);

applyDithering(poiFragData, poiCam);

//#ifndef UNITY_PASS_SHADOWCASTER
if (_Mode == POI_MODE_OPAQUE)
{
poiFragData.alpha = 1;
}
return float4(poiFragData.finalColor + poiFragData.emission, poiFragData.alpha) + mainTexture * 0.0001;
//#else
//	SHADOW_CASTER_FRAGMENT(i)
//#endif

}

ENDCG

}

Pass
{
Tags { "LightMode" = "ForwardBase" }

Stencil
{
Ref [_OutlineStencilRef]
ReadMask [_OutlineStencilReadMask]
WriteMask [_OutlineStencilWriteMask]
Comp [_OutlineStencilCompareFunction]
Pass [_OutlineStencilPassOp]
Fail [_OutlineStencilFailOp]
ZFail [_OutlineStencilZFailOp]
}

ZTest [_ZTest]
ColorMask [_ColorMask]
Offset [_OutlineOffsetFactor], [_OutlineOffsetUnits]
BlendOp [_BlendOp], [_BlendOpAlpha]
Blend [_SrcBlend] [_DstBlend]
ZWrite [_ZWrite]
AlphaToMask [_AlphaToCoverage]
Cull [_OutlineCull]

CGPROGRAM

#pragma target 5.0

#pragma shader_feature USER_LUT

//#pragma shader_feature KEYWORD

#pragma shader_feature_local POI_LIGHT_DATA_DEBUG
#pragma shader_feature_local POI_LIGHT_DATA_ADDITIVE_ENABLE
#pragma shader_feature_local POI_VERTEXLIGHT_ON

#pragma shader_feature VIGNETTE_MASKED
#pragma multi_compile_local _LIGHTINGMODE_TEXTURERAMP _LIGHTINGMODE_MATHRAMP _LIGHTINGMODE_SHADEMAP _LIGHTINGMODE_REALISTIC _LIGHTINGMODE_WRAPPED _LIGHTINGMODE_SKIN _LIGHTINGMODE_FLAT

#pragma shader_feature VIGNETTE_CLASSIC

#pragma shader_feature _COLORADDSUBDIFF_ON
#pragma shader_feature COLOR_GRADING_HDR_3D
#pragma shader_feature_local POI_MATCAP0_CUSTOM_NORMAL
#pragma shader_feature_local POI_MATCAP1_CUSTOM_NORMAL

#pragma shader_feature _EMISSION
#pragma shader_feature EFFECT_HUE_VARIATION

#pragma shader_feature COLOR_GRADING_LOG_VIEW

#pragma shader_feature_local POI_BACKFACE

#pragma shader_feature FINALPASS

#pragma shader_feature VIGNETTE
#pragma shader_feature GEOM_TYPE_MESH

#pragma shader_feature GEOM_TYPE_BRANCH
#pragma shader_feature GEOM_TYPE_BRANCH_DETAIL
#pragma shader_feature GEOM_TYPE_FROND
#pragma shader_feature DEPTH_OF_FIELD_COC_VIEW

#pragma shader_feature _SUNDISK_SIMPLE

#pragma shader_feature _GLOSSYREFLECTIONS_OFF

#pragma shader_feature _SUNDISK_HIGH_QUALITY

#pragma shader_feature DISTORT

#pragma shader_feature VERTEXLIGHT_ON
#pragma multi_compile_fwdbase
#pragma multi_compile_instancing
#pragma multi_compile_fog
#define POI_PASS_FORWARDOUTLINE

// UNITY Includes
#include "UnityCG.cginc"
#include "UnityStandardUtils.cginc"
#include "AutoLight.cginc"
#include "UnityLightingCommon.cginc"
#include "UnityPBSLighting.cginc"
#pragma vertex vert
#pragma fragment frag

#define DielectricSpec float4(0.04, 0.04, 0.04, 1.0 - 0.04)
#define pi float(3.14159265359)

#define POI2D_SAMPLER_PAN(tex, texSampler, uv, pan) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv + _Time.x * pan))
#define POI2D_SAMPLER(tex, texSampler, uv) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv))
#define POI2D_PAN(tex, uv, pan) (tex2D(tex, uv + _Time.x * pan))
#define POI2D(tex, uv) (tex2D(tex, uv))
#define POI_SAMPLE_TEX2D(tex, uv) (UNITY_SAMPLE_TEX2D(tex, uv))
#define POI_SAMPLE_TEX2D_PAN(tex, uv, pan) (UNITY_SAMPLE_TEX2D(tex, uv + _Time.x * pan))

#define POI_SAFE_RGB1 float4(mainTexture.rgb * .0001, 1)
#define POI_SAFE_RGBA mainTexture

#if defined(UNITY_COMPILER_HLSL)
#define PoiInitStruct(type, name) name = (type)0;
#else
#define PoiInitStruct(type, name)
#endif

#define POI_ERROR(poiMesh, gridSize) lerp(float3(1, 0, 1), float3(0, 0, 0), fmod(floor((poiMesh.worldPos.x) * gridSize) + floor((poiMesh.worldPos.y) * gridSize) + floor((poiMesh.worldPos.z) * gridSize), 2) == 0)

#define POI_MODE_OPAQUE 0
#define POI_MODE_CUTOUT 1
#define POI_MODE_FADE 2
#define POI_MODE_TRANSPARENT 3
#define POI_MODE_ADDITIVE 4
#define POI_MODE_SOFTADDITIVE 5
#define POI_MODE_MULTIPLICATIVE 6
#define POI_MODE_2XMULTIPLICATIVE 7
#define POI_MODE_TRANSCLIPPING 9

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;

[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )]
*/
// Map of where features in AudioLink are.
#define ALPASS_DFT                      int2(0, 4)
#define ALPASS_WAVEFORM                 int2(0, 6)
#define ALPASS_AUDIOLINK                int2(0, 0)
#define ALPASS_AUDIOBASS                int2(0, 0)
#define ALPASS_AUDIOLOWMIDS             int2(0, 1)
#define ALPASS_AUDIOHIGHMIDS            int2(0, 2)
#define ALPASS_AUDIOTREBLE              int2(0, 3)
#define ALPASS_AUDIOLINKHISTORY         int2(1, 0)
#define ALPASS_GENERALVU                int2(0, 22)
#define ALPASS_GENERALVU_INSTANCE_TIME  int2(2, 22)
#define ALPASS_GENERALVU_LOCAL_TIME     int2(3, 22)
#define ALPASS_GENERALVU_NETWORK_TIME   int2(4, 22)
#define ALPASS_GENERALVU_PLAYERINFO     int2(6, 22)
#define ALPASS_CCINTERNAL               int2(12, 22)
#define ALPASS_CCSTRIP                  int2(0, 24)
#define ALPASS_CCLIGHTS                 int2(0, 25)
#define ALPASS_AUTOCORRELATOR           int2(0, 27)
#define ALPASS_FILTEREDAUDIOLINK        int2(0, 28)

// Some basic constants to use (Note, these should be compatible with
// future version of AudioLink, but may change.
#define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
#define AUDIOLINK_SAMPLEDATA24          2046
#define AUDIOLINK_EXPBINS               24
#define AUDIOLINK_EXPOCT                10
#define AUDIOLINK_ETOTALBINS (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
#define AUDIOLINK_WIDTH                 128
#define AUDIOLINK_SPS                   48000       // Samples per second
#define AUDIOLINK_ROOTNOTE              0
#define AUDIOLINK_4BAND_FREQFLOOR       0.123
#define AUDIOLINK_4BAND_FREQCEILING     1
#define AUDIOLINK_BOTTOM_FREQUENCY      13.75
#define AUDIOLINK_BASE_AMPLITUDE        2.5
#define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
#define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
#define AUDIOLINK_DFT_Q                 4.0
#define AUDIOLINK_TREBLE_CORRECTION     5.0

// ColorChord constants
#define COLORCHORD_EMAXBIN              192
#define COLORCHORD_IIR_DECAY_1          0.90
#define COLORCHORD_IIR_DECAY_2          0.85
#define COLORCHORD_CONSTANT_DECAY_1     0.01
#define COLORCHORD_CONSTANT_DECAY_2     0.0
#define COLORCHORD_NOTE_CLOSEST         3.0
#define COLORCHORD_NEW_NOTE_GAIN        8.0
#define COLORCHORD_MAX_NOTES            10

// We use glsl_mod for most calculations because it behaves better
// on negative numbers, and in some situations actually outperforms
// HLSL's modf().
#ifndef glsl_mod
#define glsl_mod(x, y) (((x) - (y) * floor((x) / (y))))
#endif

uniform float4               _AudioTexture_TexelSize;

#ifdef SHADER_TARGET_SURFACE_ANALYSIS
#define AUDIOLINK_STANDARD_INDEXING
#endif

// Mechanism to index into texture.
#ifdef AUDIOLINK_STANDARD_INDEXING
sampler2D _AudioTexture;
#define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
#else
uniform Texture2D<float4> _AudioTexture;
SamplerState sampler_AudioTexture;
#define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
#endif

float _Mode;

#ifdef USER_LUT
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionFlowTexture;
float4 _DistortionFlowTexture_ST;
float2 _DistortionFlowTexturePan;
float _DistortionFlowTextureUV;
#endif

#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionFlowTexture1;
float4 _DistortionFlowTexture1_ST;
float2 _DistortionFlowTexture1Pan;
float _DistortionFlowTexture1UV;
#endif

#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionMask;
float4 _DistortionMask_ST;
float2 _DistortionMaskPan;
float _DistortionMaskUV;
#endif

float _DistortionUvToDistort;
float _DistortionStrength;
float _DistortionStrength1;
#endif
float _StereoEnabled;
float _PolarUV;
float2 _PolarCenter;
float _PolarRadialScale;
float _PolarLengthScale;
float _PolarSpiralPower;

float _IgnoreFog;

float4 _Color;
UNITY_DECLARE_TEX2D(_MainTex);
float4 _MainTex_ST;
float2 _MainTexPan;
float _MainTexUV;
float4 _MainTex_TexelSize;
Texture2D _BumpMap;
float4 _BumpMap_ST;
float2 _BumpMapPan;
float _BumpMapUV;
float _BumpScale;
Texture2D _ClippingMask;
float4 _ClippingMask_ST;
float2 _ClippingMaskPan;
float _ClippingMaskUV;
float _Inverse_Clipping;
float _Cutoff;

float _AlphaForceOpaque;
float _AlphaMod;

float _AlphaToCoverage;
float _AlphaSharpennedA2C;
float _AlphaMipScale;

float _AlphaDithering;
float _AlphaDitherGradient;

float _AlphaDistanceFade;
float _AlphaDistanceFadeType;
float _AlphaDistanceFadeMinAlpha;
float _AlphaDistanceFadeMaxAlpha;
float _AlphaDistanceFadeMin;
float _AlphaDistanceFadeMax;

float _AlphaFresnel;
float _AlphaFresnelAlpha;
float _AlphaFresnelSharpness;
float _AlphaFresnelWidth;
float _AlphaFresnelInvert;

float _AlphaAngular;
float _AngleType;
float _AngleCompareTo;
float3 _AngleForwardDirection;
float _CameraAngleMin;
float _CameraAngleMax;
float _ModelAngleMin;
float _ModelAngleMax;
float _AngleMinAlpha;

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

Texture2D _LightingMapsTex;
float4 _LightingMapsTex_ST;
float2 _LightingMapsTexPan;
float _LightingMapsTexUV;
float _LightDataAOStrength;
float _LightDataDetailStrength;
float _LightDataShadowMaskStrength;
// Lighting Data
float _LightingColorMode;
float _LightingMapMode;
float _LightingDirectiongMode;
float3 _LightngForcedDirection;
float _LightingIndirectUsesNormals;
float _LightingCapEnabled;
float _LightingCap;
float _LightingForceColorEnabled;
float3 _LightingForcedColor;
float _LightingCastedShadows;
float _LightingMonochromatic;
float _LightingMinLightBrightness;
// Additive Lighting Data
float _LightingAdditiveLimited;
float _LightingAdditiveLimit;
float _LightingAdditivePassthrough;
// Lighting Data Debug
float _LightingDebugVisualize;

// Toon Lighting
UNITY_DECLARE_TEX2D(_ToonRamp);
float _ShadowOffset;
float _ShadowStrength;
float _LightingIgnoreAmbientColor;
// Math Toon Lighting
float _LightingGradientStart;
float _LightingGradientEnd;
float3 _LightingShadowColor;
float _LightingMathLinearSmooth;
// ShadeMap Lighting
float3 _1st_ShadeColor;
Texture2D _1st_ShadeMap;
float4 _1st_ShadeMap_ST;
float2 _1st_ShadeMapPan;
float _1st_ShadeMapUV;
float _Use_1stShadeMapAlpha_As_ShadowMask;
float _1stShadeMapMask_Inverse;
float _Use_BaseAs1st;
float3 _2nd_ShadeColor;
Texture2D _2nd_ShadeMap;
float4 _2nd_ShadeMap_ST;
float2 _2nd_ShadeMapPan;
float _2nd_ShadeMapUV;
float _Use_2ndShadeMapAlpha_As_ShadowMask;
float _2ndShadeMapMask_Inverse;
float _Use_1stAs2nd;
float _BaseColor_Step;
float _BaseShade_Feather;
float _ShadeColor_Step;
float _1st2nd_Shades_Feather;
// Realistic Lighting
float _LightingStandardSmoothness;
// Skin
sampler2D _SkinLUT;
float _SssScale;
float _SssBumpBlur;
float3 _SssTransmissionAbsorption;
float3 _SssColorBleedAoWeights;
// Additive
float _LightingAdditiveType;
float _LightingAdditiveGradientStart;
float _LightingAdditiveGradientEnd;
float _LightingAdditiveDetailStrength;
float _LightingAdditiveLimitIntensity;
float _LightingAdditiveMaxIntensity;

#ifdef POI_PASS_FORWARDOUTLINE
// outline Vertex Options
float _OutlineMode;
float4 _OutlinePersonaDirection;
float4 _OutlineDropShadowOffset;
float _OutlineUseVertexColors;
float _OutlineFixedSize;
float _EnableOutlines;
float _OutlinesMaxDistance;
float _LineWidth;
float _OutlineEmission;
float4 _LineColor;
texture2D _OutlineTexture; //TODO make this dynamically not read for lock in
float4 _OutlineTexture_ST;
float2 _OutlineTexturePan;
float _OutlineTextureUV;
float4 _OutlineFadeDistance;
float4 _OutlineGlobalPan;
sampler2D _OutlineMask;
float4 _OutlineMask_ST;
float2 _OutlineMaskPan;
float _OutlineMaskUV;
float _OutlineRimLightBlend;
float _OutlineLit;
float _OutlineTintMix;
half _OutlineHueOffset;
half _OutlineHueShift;
half _OutlineHueOffsetSpeed;
float _OutlineShadowStrength;
#endif

#ifdef COLOR_GRADING_LOG_VIEW
float _AudioLinkDelay;
float _AudioLinkAnimToggle;
#endif

#ifdef _SUNDISK_HIGH_QUALITY

UNITY_DECLARE_TEX2DARRAY(_FlipbookTexArray);
float4 _FlipbookTexArray_ST;

float4 _FlipbookColor;
float _FlipbookFPS;
uint _FlipbookTotalFrames;
float4 _FlipbookScaleOffset;
float _FlipbookTiled;
int _FlipbookCurrentFrame;
float _FlipbookEmissionStrength;
float _FlipbookRotation;
float _EnableFlipbook;
uint _FlipbookTexArrayUV;
float _FlipbookAlphaControlsFinalAlpha;
float _FlipbookRotationSpeed;
float _FlipbookIntensityControlsAlpha;
float _FlipbookColorReplaces;
float2 _FlipbookTexArrayPan;

// blending
float _FlipbookReplace;
float _FlipbookMultiply;
float _FlipbookAdd;

#if defined(PROP_FLIPBOOKMASSK) || !defined(OPTIMIZED_ENABLED)
Texture2D _FlipbookMask;
#endif
float4 _FlipbookMask_ST;
float2 _FlipbookMaskPan;
float _FlipbookMaskUV;

// anim
uint _FlipbookMovementType;
float4 _FlipbookStartEndOffset;
float _FlipbookMovementSpeed;

// Crossfade
float _FlipbookCrossfadeEnabled;
float2 _FlipbookCrossfadeRange;

// Hueshift
float _FlipbookHueShiftEnabled;
float _FlipbookHueShiftSpeed;
float _FlipbookHueShift;
#endif

#ifdef DISTORT
float _DissolveType;
float _DissolveEdgeWidth;
float4 _DissolveEdgeColor;
sampler2D _DissolveEdgeGradient;
float4 _DissolveEdgeGradient_ST;
float2 _DissolveEdgeGradientPan;
float _DissolveEdgeGradientUV;
float _DissolveEdgeEmission;
float4 _DissolveTextureColor;

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveToTexture;
#endif
float4 _DissolveToTexture_ST;
float2 _DissolveToTexturePan;
float _DissolveToTextureUV;

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveNoiseTexture;
#endif
float4 _DissolveNoiseTexture_ST;
float2 _DissolveNoiseTexturePan;
float _DissolveNoiseTextureUV;

#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveDetailNoise;
#endif
float4 _DissolveDetailNoise_ST;
float2 _DissolveDetailNoisePan;
float _DissolveDetailNoiseUV;

#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveMask;
#endif
float4 _DissolveMask_ST;
float2 _DissolveMaskPan;
float _DissolveMaskUV;

float _DissolveMaskInvert;
float _DissolveAlpha;
float _ContinuousDissolve;
float _DissolveDetailStrength;
float _DissolveEdgeHardness;
float _DissolveInvertNoise;
float _DissolveInvertDetailNoise;
float _DissolveToEmissionStrength;

// Point to Point
float _DissolveP2PWorldLocal;
float _DissolveP2PEdgeLength;
float4 _DissolveStartPoint;
float4 _DissolveEndPoint;

// World Dissolve
float _DissolveWorldShape;
float4 _DissolveShapePosition;
float4 _DissolveShapeRotation;
float _DissolveShapeScale;
float _DissolveInvertShape;
float _DissolveShapeEdgeLength;

float _DissolveAlpha0;
float _DissolveAlpha1;
float _DissolveAlpha2;
float _DissolveAlpha3;
float _DissolveAlpha4;
float _DissolveAlpha5;
float _DissolveAlpha6;
float _DissolveAlpha7;
float _DissolveAlpha8;
float _DissolveAlpha9;
// Masking
float _DissolveEmissionSide;
float _DissolveEmission1Side;
float _DissolveUseVertexColors;

float4 edgeColor;
float edgeAlpha;
float dissolveAlpha;
float4 dissolveToTexture;

float _DissolveHueShiftEnabled;
float _DissolveHueShiftSpeed;
float _DissolveHueShift;
float _DissolveEdgeHueShiftEnabled;
float _DissolveEdgeHueShiftSpeed;
float _DissolveEdgeHueShift;
#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

//Structs
struct appdata
{
float4 vertex : POSITION;
float3 normal : NORMAL;
float4 tangent : TANGENT;
float4 color : COLOR;
float2 uv0 : TEXCOORD0;
float2 uv1 : TEXCOORD1;
float2 uv2 : TEXCOORD2;
float2 uv3 : TEXCOORD3;
uint vertexId : SV_VertexID;
UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct v2f
{
float4 pos : SV_POSITION;
float2 uv[4] : TEXCOORD0;
float3 objNormal : TEXCOORD4;
float3 normal : TEXCOORD5;
float3 tangent : TEXCOORD6;
float3 binormal : TEXCOORD7;
float4 worldPos : TEXCOORD8;
float4 localPos : TEXCOORD9;
float3 objectPos : TEXCOORD10;
float4 vertexColor : TEXCOORD11;
float3 tangentViewDir : TEXCOORD12;
float4 lightmapUV : TEXCOORD13;
float4 grabPos: TEXCOORD14;
UNITY_SHADOW_COORDS(15)
UNITY_FOG_COORDS(16)
UNITY_VERTEX_INPUT_INSTANCE_ID
UNITY_VERTEX_OUTPUT_STEREO
};

struct PoiMesh
{

// 0 Vertex normal
// 1 Fragment normal
float3 normals[2];
float3 objNormal;
float3 tangentSpaceNormal;
float3 binormal;
float3 tangent;
float3 worldPos;
float3 localPos;
float3 objectPosition;
float isFrontFace;
float4 vertexColor;
float4 lightmapUV;
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 7 Distorted UV
float2 uv[8];
};

struct PoiCam
{
float3 viewDir;
float3 forwardDir;
float3 worldPos;
float distanceToVert;
float2 clipPos;
float3 reflectionDir;
float3 tangentViewDir;
float4 grabPos;
float2 screenUV;
float vDotN;

};

struct PoiMods
{
float4 Mask;
float4 audioLink;
float audioLinkAvailable;
float audioLinkVersion;
float4 audioLinkTexture;
float2 detailMask;
float2 backFaceDetailIntensity;
};

struct PoiLight
{

float3 direction;
float attenuation;
float attenuationStrength;
float3 directColor;
float3 indirectColor;
float occlusion;
float shadowMask;
float detailShadow;
float3 halfDir;
float lightMap;
float3 rampedLightMap;
float nDotL;
float nDotV;
float nDotH;
float lDotv;
float lDotH;
float nDotLSaturated;
float nDotLNormalized;
#ifdef UNITY_PASS_FORWARDADD
float additiveShadow;
#endif
float3 finalLighting;

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
// Non Important Lights
float4 vDotNL;
float3 vColor[4];
float4 vCorrectedDotNL;
float4 vAttenuation;
float4 vAttenuationDotNL;
float3 vPosition[4];
float3 vDirection[4];
float3 vFinalLighting;
float3 vHalfDir[4];
half4 vDotNH;
half4 vDotLH;
#endif

};

struct PoiVertexLights
{

float3 direction;
float3 color;
float attenuation;
};

struct PoiFragData
{
float3 baseColor;
float3 finalColor;
float alpha;
float3 emission;
};

float2 poiUV(float2 uv, float4 tex_st)
{
return uv * tex_st.xy + tex_st.zw;
}

//Lighting Helpers
float calculateluminance(float3 color)
{
return color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
}

/*
* MIT License
*
* Copyright (c) 2018 s-ilent
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

float shEvaluateDiffuseL1Geomerics_local(float L0, float3 L1, float3 n)
{
// average energy
float R0 = max(0, L0);

// avg direction of incoming light
float3 R1 = 0.5f * L1;

// directional brightness
float lenR1 = length(R1);

// linear angle between normal and direction 0-1
//float q = 0.5f * (1.0f + dot(R1 / lenR1, n));
//float q = dot(R1 / lenR1, n) * 0.5 + 0.5;
float q = dot(normalize(R1), n) * 0.5 + 0.5;
q = saturate(q); // Thanks to ScruffyRuffles for the bug identity.

// power for q
// lerps from 1 (linear) to 3 (cubic) based on directionality
float p = 1.0f + 2.0f * lenR1 / R0;

// dynamic range constant
// should vary between 4 (highly directional) and 0 (ambient)
float a = (1.0f - lenR1 / R0) / (1.0f + lenR1 / R0);

return R0 * (a + (1.0f - a) * (p + 1.0f) * pow(q, p));
}

half3 BetterSH9(half4 normal)
{
float3 indirect;
float3 L0 = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
indirect.r = shEvaluateDiffuseL1Geomerics_local(L0.r, unity_SHAr.xyz, normal.xyz);
indirect.g = shEvaluateDiffuseL1Geomerics_local(L0.g, unity_SHAg.xyz, normal.xyz);
indirect.b = shEvaluateDiffuseL1Geomerics_local(L0.b, unity_SHAb.xyz, normal.xyz);
indirect = max(0, indirect);
indirect += SHEvalLinearL2(normal);
return indirect;
}

// Silent's code ends here

float3 getCameraForward()
{
#if UNITY_SINGLE_PASS_STEREO
float3 p1 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 1, 1));
float3 p2 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 0, 1));
#else
float3 p1 = mul(unity_CameraToWorld, float4(0, 0, 1, 1)).xyz;
float3 p2 = mul(unity_CameraToWorld, float4(0, 0, 0, 1)).xyz;
#endif
return normalize(p2 - p1);
}

half3 GetSHLength()
{
half3 x, x1;
x.r = length(unity_SHAr);
x.g = length(unity_SHAg);
x.b = length(unity_SHAb);
x1.r = length(unity_SHBr);
x1.g = length(unity_SHBg);
x1.b = length(unity_SHBb);
return x + x1;
}

float3 BoxProjection(float3 direction, float3 position, float4 cubemapPosition, float3 boxMin, float3 boxMax)
{
#if UNITY_SPECCUBE_BOX_PROJECTION
//UNITY_BRANCH
if (cubemapPosition.w > 0)
{
float3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
float scalar = min(min(factors.x, factors.y), factors.z);
direction = direction * scalar + (position - cubemapPosition.xyz);
}
#endif
return direction;
}

float poiMax(float2 i)
{
return max(i.x, i.y);
}

float poiMax(float3 i)
{
return max(max(i.x, i.y), i.z);
}

float poiMax(float4 i)
{
return max(max(max(i.x, i.y), i.z), i.w);
}

float3 calculateNormal(in float3 baseNormal, in PoiMesh poiMesh, in Texture2D normalTexture, in float4 normal_ST, in float2 normalPan, in float normalUV, in float normalIntensity)
{
float3 normal = UnpackScaleNormal(POI2D_SAMPLER_PAN(normalTexture, _MainTex, poiUV(poiMesh.uv[normalUV], normal_ST), normalPan), normalIntensity);
return normalize(
normal.x * poiMesh.tangent +
normal.y * poiMesh.binormal +
normal.z * baseNormal
);
}

float remap(float x, float minOld, float maxOld, float minNew = 0, float maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float2 remap(float2 x, float2 minOld, float2 maxOld, float2 minNew = 0, float2 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float3 remap(float3 x, float3 minOld, float3 maxOld, float3 minNew = 0, float3 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float4 remap(float4 x, float4 minOld, float4 maxOld, float4 minNew = 0, float4 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float remapClamped(float minOld, float maxOld, float x, float minNew = 0, float maxNew = 1)
{
return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), 0, 1);
}

float2 calcParallax(in float height, in PoiCam poiCam)
{
return((height * - 1) + 1) * (poiCam.tangentViewDir.xy / poiCam.tangentViewDir.z);
}

/*
0: Zero	                float4(0.0, 0.0, 0.0, 0.0),
1: One	                float4(1.0, 1.0, 1.0, 1.0),
2: DstColor	            destinationColor,
3: SrcColor	            sourceColor,
4: OneMinusDstColor	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
5: SrcAlpha	            sourceColor.aaaa,
6: OneMinusSrcColor	    float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
7: DstAlpha	            destinationColor.aaaa,
8: OneMinusDstAlpha	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor.,
9: SrcAlphaSaturate     saturate(sourceColor.aaaa),
10: OneMinusSrcAlpha	float4(1.0, 1.0, 1.0, 1.0) - sourceColor.aaaa,
*/

float4 poiBlend(const float sourceFactor, const  float4 sourceColor, const  float destinationFactor, const  float4 destinationColor, const float4 blendFactor)
{
float4 sA = 1 - blendFactor;
const float4 blendData[11] = {
float4(0.0, 0.0, 0.0, 0.0),
float4(1.0, 1.0, 1.0, 1.0),
destinationColor,
sourceColor,
float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
sA,
float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
sA,
float4(1.0, 1.0, 1.0, 1.0) - sA,
saturate(sourceColor.aaaa),
1 - sA,
};

return lerp(blendData[sourceFactor] * sourceColor + blendData[destinationFactor] * destinationColor, sourceColor, sA);
}

// Average
float3 blendAverage(float3 base, float3 blend)
{
return(base + blend) / 2.0;
}

// Color burn
float blendColorBurn(float base, float blend)
{
return(blend == 0.0)?blend : max((1.0 - ((1.0 - base) / blend)), 0.0);
}

float3 blendColorBurn(float3 base, float3 blend)
{
return float3(blendColorBurn(base.r, blend.r), blendColorBurn(base.g, blend.g), blendColorBurn(base.b, blend.b));
}

// Color Dodge
float blendColorDodge(float base, float blend)
{
return(blend == 1.0)?blend : min(base / (1.0 - blend), 1.0);
}

float3 blendColorDodge(float3 base, float3 blend)
{
return float3(blendColorDodge(base.r, blend.r), blendColorDodge(base.g, blend.g), blendColorDodge(base.b, blend.b));
}

// Darken
float blendDarken(float base, float blend)
{
return min(blend, base);
}

float3 blendDarken(float3 base, float3 blend)
{
return float3(blendDarken(base.r, blend.r), blendDarken(base.g, blend.g), blendDarken(base.b, blend.b));
}

// Exclusion
float3 blendExclusion(float3 base, float3 blend)
{
return base + blend - 2.0 * base * blend;
}

// Reflect
float blendReflect(float base, float blend)
{
return(blend == 1.0)?blend : min(base * base / (1.0 - blend), 1.0);
}

float3 blendReflect(float3 base, float3 blend)
{
return float3(blendReflect(base.r, blend.r), blendReflect(base.g, blend.g), blendReflect(base.b, blend.b));
}

// Glow
float3 blendGlow(float3 base, float3 blend)
{
return blendReflect(blend, base);
}

// Overlay
float blendOverlay(float base, float blend)
{
return base < 0.5?(2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
}

float3 blendOverlay(float3 base, float3 blend)
{
return float3(blendOverlay(base.r, blend.r), blendOverlay(base.g, blend.g), blendOverlay(base.b, blend.b));
}

// Hard Light
float3 blendHardLight(float3 base, float3 blend)
{
return blendOverlay(blend, base);
}

// Vivid light
float blendVividLight(float base, float blend)
{
return(blend < 0.5)?blendColorBurn(base, (2.0 * blend)) : blendColorDodge(base, (2.0 * (blend - 0.5)));
}

float3 blendVividLight(float3 base, float3 blend)
{
return float3(blendVividLight(base.r, blend.r), blendVividLight(base.g, blend.g), blendVividLight(base.b, blend.b));
}

// Hard mix
float blendHardMix(float base, float blend)
{
return(blendVividLight(base, blend) < 0.5)?0.0 : 1.0;
}

float3 blendHardMix(float3 base, float3 blend)
{
return float3(blendHardMix(base.r, blend.r), blendHardMix(base.g, blend.g), blendHardMix(base.b, blend.b));
}

// Lighten
float blendLighten(float base, float blend)
{
return max(blend, base);
}

float3 blendLighten(float3 base, float3 blend)
{
return float3(blendLighten(base.r, blend.r), blendLighten(base.g, blend.g), blendLighten(base.b, blend.b));
}

// Linear Burn
float blendLinearBurn(float base, float blend)
{
// Note : Same implementation as BlendSubtractf
return max(base + blend - 1.0, 0.0);
}

float3 blendLinearBurn(float3 base, float3 blend)
{
// Note : Same implementation as BlendSubtract
return max(base + blend - float3(1.0, 1.0, 1.0), float3(0.0, 0.0, 0.0));
}

// Linear Dodge
float blendLinearDodge(float base, float blend)
{
// Note : Same implementation as BlendAddf
return min(base + blend, 1.0);
}

float3 blendLinearDodge(float3 base, float3 blend)
{
// Note : Same implementation as BlendAdd
return min(base + blend, float3(1.0, 1.0, 1.0));
}

// Linear light
float blendLinearLight(float base, float blend)
{
return blend < 0.5?blendLinearBurn(base, (2.0 * blend)) : blendLinearDodge(base, (2.0 * (blend - 0.5)));
}

float3 blendLinearLight(float3 base, float3 blend)
{
return float3(blendLinearLight(base.r, blend.r), blendLinearLight(base.g, blend.g), blendLinearLight(base.b, blend.b));
}

// Multiply
float3 blendMultiply(float3 base, float3 blend)
{
return base * blend;
}

// Negation
float3 blendNegation(float3 base, float3 blend)
{
return float3(1.0, 1.0, 1.0) - abs(float3(1.0, 1.0, 1.0) - base - blend);
}

// Normal
float3 blendNormal(float3 base, float3 blend)
{
return blend;
}

// Phoenix
float3 blendPhoenix(float3 base, float3 blend)
{
return min(base, blend) - max(base, blend) + float3(1.0, 1.0, 1.0);
}

// Pin light
float blendPinLight(float base, float blend)
{
return(blend < 0.5)?blendDarken(base, (2.0 * blend)) : blendLighten(base, (2.0 * (blend - 0.5)));
}

float3 blendPinLight(float3 base, float3 blend)
{
return float3(blendPinLight(base.r, blend.r), blendPinLight(base.g, blend.g), blendPinLight(base.b, blend.b));
}

// Screen
float blendScreen(float base, float blend)
{
return 1.0 - ((1.0 - base) * (1.0 - blend));
}

float3 blendScreen(float3 base, float3 blend)
{
return float3(blendScreen(base.r, blend.r), blendScreen(base.g, blend.g), blendScreen(base.b, blend.b));
}

// Soft Light
float blendSoftLight(float base, float blend)
{
return(blend < 0.5)?(2.0 * base * blend + base * base * (1.0 - 2.0 * blend)) : (sqrt(base) * (2.0 * blend - 1.0) + 2.0 * base * (1.0 - blend));
}

float3 blendSoftLight(float3 base, float3 blend)
{
return float3(blendSoftLight(base.r, blend.r), blendSoftLight(base.g, blend.g), blendSoftLight(base.b, blend.b));
}

// Subtract
float blendSubtract(float base, float blend)
{
return max(base - blend, 0.0);
}

float3 blendSubtract(float3 base, float3 blend)
{
return max(base - blend, 0.0);
}

// Difference
float blendDifference(float base, float blend)
{
return abs(base - blend);
}

float3 blendDifference(float3 base, float3 blend)
{
return abs(base - blend);
}

// Divide
float blendDivide(float base, float blend)
{
return base / max(blend, 0.0001);
}

float3 blendDivide(float3 base, float3 blend)
{
return base / max(blend, 0.0001);
}

float3 customBlend(float3 base, float3 blend, float blendType)
{
float3 ret = 0;
switch(blendType)
{
case 0:
{
ret = blendNormal(base, blend);
break;
}
case 1:
{
ret = blendDarken(base, blend);
break;
}
case 2:
{
ret = blendMultiply(base, blend);
break;
}
case 3:
{
ret = blendColorBurn(base, blend);
break;
}
case 4:
{
ret = blendLinearBurn(base, blend);
break;
}
case 5:
{
ret = blendLighten(base, blend);
break;
}
case 6:
{
ret = blendScreen(base, blend);
break;
}
case 7:
{
ret = blendColorDodge(base, blend);
break;
}
case 8:
{
ret = blendLinearDodge(base, blend);
break;
}
case 9:
{
ret = blendOverlay(base, blend);
break;
}
case 10:
{
ret = blendSoftLight(base, blend);
break;
}
case 11:
{
ret = blendHardLight(base, blend);
break;
}
case 12:
{
ret = blendVividLight(base, blend);
break;
}
case 13:
{
ret = blendLinearLight(base, blend);
break;
}
case 14:
{
ret = blendPinLight(base, blend);
break;
}
case 15:
{
ret = blendHardMix(base, blend);
break;
}
case 16:
{
ret = blendDifference(base, blend);
break;
}
case 17:
{
ret = blendExclusion(base, blend);
break;
}
case 18:
{
ret = blendSubtract(base, blend);
break;
}
case 19:
{
ret = blendDivide(base, blend);
break;
}
}
return ret;
}

float random(float2 p)
{
return frac(sin(dot(p, float2(12.9898, 78.2383))) * 43758.5453123);
}

float2 random2(float2 p)
{
return frac(sin(float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)))) * 43758.5453);
}

float3 random3(float3 p)
{
return frac(sin(float3(dot(p, float3(127.1, 311.7, 248.6)), dot(p, float3(269.5, 183.3, 423.3)), dot(p, float3(248.3, 315.9, 184.2)))) * 43758.5453);
}

float3 randomFloat3(float2 Seed, float maximum)
{
return(.5 + float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed), float2(12.9898, 78.233))) * 43758.5453)
) * .5) * (maximum);
}

float3 randomFloat3Range(float2 Seed, float Range)
{
return(float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
) * 2 - 1) * Range;
}

float3 randomFloat3WiggleRange(float2 Seed, float Range, float wiggleSpeed)
{
float3 rando = (float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
) * 2 - 1);
float speed = 1 + wiggleSpeed;
return float3(sin((_Time.x + rando.x * pi) * speed), sin((_Time.x + rando.y * pi) * speed), sin((_Time.x + rando.z * pi) * speed)) * Range;
}

void Unity_RandomRange_float(float2 Seed, float Min, float Max, out float Out)
{
float randomno = frac(sin(dot(Seed, float2(12.9898, 78.233))) * 43758.5453);
Out = lerp(Min, Max, randomno);
}

//art

// Based on unity shader graph code

// * Adjustments * //

/*
* Channel Mixer
*
* Controls the amount each of the channels of input In contribute to each of the channels of output Out. The slider
* parameters on the node control the contribution of each of the input channels. The toggle button parameters control
* which of the output channels is currently being edited. Slider controls for editing the contribution of each input
* channnel range between -2 and 2.
*/
void poiChannelMixer(float3 In, float3 _ChannelMixer_Red, float3 _ChannelMixer_Green, float3 _ChannelMixer_Blue, out float3 Out)
{
Out = float3(dot(In, _ChannelMixer_Red), dot(In, _ChannelMixer_Green), dot(In, _ChannelMixer_Blue));
}

/*
* Contrast
*
* Adjusts the contrast of input In by the amount of input Contrast. A Contrast value of 1 will return the input
* unaltered. A Contrast value of 0 will return the midpoint of the input
*/
void poiContrast(float3 In, float Contrast, out float3 Out)
{
float midpoint = pow(0.5, 2.2);
Out = (In - midpoint) * Contrast + midpoint;
}

/*
* Invert Colors
*
* Inverts the colors of input In on a per channel basis. This Node assumes all input values are in the range 0 - 1.
*/
void poiInvertColors(float4 In, float4 InvertColors, out float4 Out)
{
Out = abs(InvertColors - In);
}

/*
* Replace Color
*
* Replaces values in input In equal to input From to the value of input To. Input Range can be used to define a
* wider range of values around input From to replace. Input Fuzziness can be used to soften the edges around the
* selection similar to anti-aliasing.
*/
void poiReplaceColor(float3 In, float3 From, float3 To, float Range, float Fuzziness, out float3 Out)
{
float Distance = distance(From, In);
Out = lerp(To, In, saturate((Distance - Range) / max(Fuzziness, 0.00001)));
}

/*
* Saturation
*
* Adjusts the saturation of input In by the amount of input Saturation. A Saturation value of 1 will return the input
* unaltered. A Saturation value of 0 will return the input completely desaturated.
*/
void poiSaturation(float3 In, float Saturation, out float3 Out)
{
float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
Out = luma.xxx + Saturation.xxx * (In - luma.xxx);
}

/*
* Dither Node
*
* Dither is an intentional form of noise used to randomize quantization error. It is used to prevent large-scale
* patterns such as color banding in images. The Dither node applies dithering in screen-space to ensure a uniform
* distribution of the pattern. This can be adjusted by connecting another node to input Screen Position.
*
* This Node is commonly used as an input to Alpha Clip Threshold on a Master Node to give the appearance of
* transparency to an opaque object. This is useful for creating objects that appear to be transparent but have
* the advantages of rendering as opaque, such as writing depth and/or being rendered in deferred.
*/
void poiDither(float4 In, float4 ScreenPosition, out float4 Out)
{
float2 uv = ScreenPosition.xy * _ScreenParams.xy;
float DITHER_THRESHOLDS[16] = {
1.0 / 17.0, 9.0 / 17.0, 3.0 / 17.0, 11.0 / 17.0,
13.0 / 17.0, 5.0 / 17.0, 15.0 / 17.0, 7.0 / 17.0,
4.0 / 17.0, 12.0 / 17.0, 2.0 / 17.0, 10.0 / 17.0,
16.0 / 17.0, 8.0 / 17.0, 14.0 / 17.0, 6.0 / 17.0
};
uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
Out = In - DITHER_THRESHOLDS[index];
}

/*
* Color Mask
*
* Creates a mask from values in input In equal to input Mask Color. Input Range can be used to define a wider
* range of values around input Mask Color to create the mask. Colors within this range will return 1,
* otherwise the node will return 0. Input Fuzziness can be used to soften the edges around the selection
* similar to anti-aliasing.
*/
void poiColorMask(float3 In, float3 MaskColor, float Range, float Fuzziness, out float4 Out)
{
float Distance = distance(MaskColor, In);
Out = saturate(1 - (Distance - Range) / max(Fuzziness, 0.00001));
}

float3 hueShift(float3 color, float Offset)
{
float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
float4 P = lerp(float4(color.bg, K.wz), float4(color.gb, K.xy), step(color.b, color.g));
float4 Q = lerp(float4(P.xyw, color.r), float4(color.r, P.yzx), step(P.x, color.r));
float D = Q.x - min(Q.w, Q.y);
float E = 0.0000000001;
float3 hsv = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);

float hue = hsv.x + Offset;
hsv.x = frac(hue);

float4 K2 = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
float3 P2 = abs(frac(hsv.xxx + K2.xyz) * 6.0 - K2.www);
return hsv.z * lerp(K2.xxx, saturate(P2 - K2.xxx), hsv.y);
}

static const float Epsilon = 1e-10;
// The weights of RGB contributions to luminance.
// Should sum to unity.
static const float3 HCYwts = float3(0.299, 0.587, 0.114);
static const float HCLgamma = 3;
static const float HCLy0 = 100;
static const float HCLmaxL = 0.530454533953517; // == exp(HCLgamma / HCLy0) - 0.5
static const float3 wref = float3(1.0, 1.0, 1.0);
#define TAU 6.28318531

float3 HUEtoRGB(in float H)
{
float R = abs(H * 6 - 3) - 1;
float G = 2 - abs(H * 6 - 2);
float B = 2 - abs(H * 6 - 4);
return saturate(float3(R, G, B));
}

float3 RGBtoHCV(in float3 RGB)
{
// Based on work by Sam Hocevar and Emil Persson
float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0 / 3.0) : float4(RGB.gb, 0.0, -1.0 / 3.0);
float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
float C = Q.x - min(Q.w, Q.y);
float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
return float3(H, C, Q.x);
}

float3 HSVtoRGB(in float3 HSV)
{
float3 RGB = HUEtoRGB(HSV.x);
return((RGB - 1) * HSV.y + 1) * HSV.z;
}

float3 RGBtoHSV(in float3 RGB)
{
float3 HCV = RGBtoHCV(RGB);
float S = HCV.y / (HCV.z + Epsilon);
return float3(HCV.x, S, HCV.z);
}

float3 HSLtoRGB(in float3 HSL)
{
float3 RGB = HUEtoRGB(HSL.x);
float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
return(RGB - 0.5) * C + HSL.z;
}

float3 RGBtoHSL(in float3 RGB)
{
float3 HCV = RGBtoHCV(RGB);
float L = HCV.z - HCV.y * 0.5;
float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
return float3(HCV.x, S, L);
}

float3 HCYtoRGB(in float3 HCY)
{

float3 RGB = HUEtoRGB(HCY.x);
float Z = dot(RGB, HCYwts);
if (HCY.z < Z)
{
HCY.y *= HCY.z / Z;
}
else if (Z < 1)
{
HCY.y *= (1 - HCY.z) / (1 - Z);
}
return(RGB - Z) * HCY.y + HCY.z;
}

float3 RGBtoHCY(in float3 RGB)
{
// Corrected by David Schaeffer
float3 HCV = RGBtoHCV(RGB);
float Y = dot(RGB, HCYwts);
float Z = dot(HUEtoRGB(HCV.x), HCYwts);
if (Y < Z)
{
HCV.y *= Z / (Epsilon + Y);
}
else
{
HCV.y *= (1 - Z) / (Epsilon + 1 - Y);
}
return float3(HCV.x, HCV.y, Y);
}

float3 HCLtoRGB(in float3 HCL)
{
float3 RGB = 0;
if (HCL.z != 0)
{
float H = HCL.x;
float C = HCL.y;
float L = HCL.z * HCLmaxL;
float Q = exp((1 - C / (2 * L)) * (HCLgamma / HCLy0));
float U = (2 * L - C) / (2 * Q - 1);
float V = C / Q;
float A = (H + min(frac(2 * H) / 4, frac(-2 * H) / 8)) * pi * 2;
float T;
H *= 6;
if (H <= 0.999)
{
T = tan(A);
RGB.r = 1;
RGB.g = T / (1 + T);
}
else if (H <= 1.001)
{
RGB.r = 1;
RGB.g = 1;
}
else if (H <= 2)
{
T = tan(A);
RGB.r = (1 + T) / T;
RGB.g = 1;
}
else if (H <= 3)
{
T = tan(A);
RGB.g = 1;
RGB.b = 1 + T;
}
else if (H <= 3.999)
{
T = tan(A);
RGB.g = 1 / (1 + T);
RGB.b = 1;
}
else if (H <= 4.001)
{
RGB.g = 0;
RGB.b = 1;
}
else if (H <= 5)
{
T = tan(A);
RGB.r = -1 / T;
RGB.b = 1;
}
else
{
T = tan(A);
RGB.r = 1;
RGB.b = -T;
}
RGB = RGB * V + U;
}
return RGB;
}

float3 RGBtoHCL(in float3 RGB)
{
float3 HCL;
float H = 0;
float U = min(RGB.r, min(RGB.g, RGB.b));
float V = max(RGB.r, max(RGB.g, RGB.b));
float Q = HCLgamma / HCLy0;
HCL.y = V - U;
if (HCL.y != 0)
{
H = atan2(RGB.g - RGB.b, RGB.r - RGB.g) / pi;
Q *= U / V;
}
Q = exp(Q);
HCL.x = frac(H / 2 - min(frac(H), frac(-H)) / 6);
HCL.y *= Q;
HCL.z = lerp(-U, V, Q) / (HCLmaxL * 2);
return HCL;
}

//HSL MODIFT
float3 ModifyViaHSL(float3 color, float3 HSLMod)
{
float3 colorHSL = RGBtoHSL(color);
colorHSL.r = frac(colorHSL.r + HSLMod.r);
colorHSL.g = saturate(colorHSL.g + HSLMod.g);
colorHSL.b = saturate(colorHSL.b + HSLMod.b);
return HSLtoRGB(colorHSL);
}

float3 poiSaturation(float3 In, float Saturation)
{
float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
return luma.xxx + Saturation.xxx * (In - luma.xxx);
}
// LCH
float xyzF(float t)
{
return lerp(pow(t, 1. / 3.), 7.787037 * t + 0.139731, step(t, 0.00885645));
}
float xyzR(float t)
{
return lerp(t * t * t, 0.1284185 * (t - 0.139731), step(t, 0.20689655));
}
float3 rgb2lch(in float3 c)
{
c = mul(float3x3(0.4124, 0.3576, 0.1805,
0.2126, 0.7152, 0.0722,
0.0193, 0.1192, 0.9505), c);
c.x = xyzF(c.x / wref.x);
c.y = xyzF(c.y / wref.y);
c.z = xyzF(c.z / wref.z);
float3 lab = float3(max(0., 116.0 * c.y - 16.0), 500.0 * (c.x - c.y), 200.0 * (c.y - c.z));
return float3(lab.x, length(float2(lab.y, lab.z)), atan2(lab.z, lab.y));
}

float3 lch2rgb(in float3 c)
{
c = float3(c.x, cos(c.z) * c.y, sin(c.z) * c.y);

float lg = 1. / 116. * (c.x + 16.);
float3 xyz = float3(wref.x * xyzR(lg + 0.002 * c.y),
wref.y * xyzR(lg),
wref.z * xyzR(lg - 0.005 * c.z));

float3 rgb = mul(float3x3(3.2406, -1.5372, -0.4986,
- 0.9689, 1.8758, 0.0415,
0.0557, -0.2040, 1.0570), xyz);

return rgb;
}

//cheaply lerp around a circle
float lerpAng(in float a, in float b, in float x)
{
float ang = fmod(fmod((a - b), TAU) + pi * 3., TAU) - pi;
return ang * x + b;
}

//Linear interpolation between two colors in Lch space
float3 lerpLch(in float3 a, in float3 b, in float x)
{
float hue = lerpAng(a.z, b.z, x);
return float3(lerp(b.xy, a.xy, x), hue);
}

float3 poiExpensiveColorBlend(float3 col1, float3 col2, float alpha)
{
return lch2rgb(lerpLch(rgb2lch(col1), rgb2lch(col2), alpha));
}

float4x4 poiAngleAxisRotationMatrix(float angle, float3 axis)
{
axis = normalize(axis);
float s = sin(angle);
float c = cos(angle);
float oc = 1.0 - c;

return float4x4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s, 0.0,
oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s, 0.0,
oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c, 0.0,
0.0, 0.0, 0.0, 1.0);
}

float4x4 poiRotationMatrixFromAngles(float x, float y, float z)
{
float angleX = radians(x);
float c = cos(angleX);
float s = sin(angleX);
float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
0, c, -s, 0,
0, s, c, 0,
0, 0, 0, 1);

float angleY = radians(y);
c = cos(angleY);
s = sin(angleY);
float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
0, 1, 0, 0,
- s, 0, c, 0,
0, 0, 0, 1);

float angleZ = radians(z);
c = cos(angleZ);
s = sin(angleZ);
float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
s, c, 0, 0,
0, 0, 1, 0,
0, 0, 0, 1);

return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
}

float4x4 poiRotationMatrixFromAngles(float3 angles)
{
float angleX = radians(angles.x);
float c = cos(angleX);
float s = sin(angleX);
float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
0, c, -s, 0,
0, s, c, 0,
0, 0, 0, 1);

float angleY = radians(angles.y);
c = cos(angleY);
s = sin(angleY);
float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
0, 1, 0, 0,
- s, 0, c, 0,
0, 0, 0, 1);

float angleZ = radians(angles.z);
c = cos(angleZ);
s = sin(angleZ);
float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
s, c, 0, 0,
0, 0, 1, 0,
0, 0, 0, 1);

return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
}

float3 getCameraPosition()
{
#ifdef USING_STEREO_MATRICES
return lerp(unity_StereoWorldSpaceCameraPos[0], unity_StereoWorldSpaceCameraPos[1], 0.5);
#endif
return _WorldSpaceCameraPos;
}

half2 calcScreenUVs(half4 grabPos)
{
half2 uv = grabPos.xy / (grabPos.w + 0.0000000001);
#if UNITY_SINGLE_PASS_STEREO
uv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
#else
uv.xy *= _ScreenParams.xy;
#endif

return uv;
}

float CalcMipLevel(float2 texture_coord)
{
float2 dx = ddx(texture_coord);
float2 dy = ddy(texture_coord);
float delta_max_sqr = max(dot(dx, dx), dot(dy, dy));

return 0.5 * log2(delta_max_sqr);
}

v2f vert(appdata v)
{
UNITY_SETUP_INSTANCE_ID(v);
v2f o;
PoiInitStruct(v2f, o);
UNITY_TRANSFER_INSTANCE_ID(v, o);
UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

o.objectPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
o.objNormal = v.normal;
o.normal = UnityObjectToWorldNormal(v.normal);
o.tangent = UnityObjectToWorldDir(v.tangent);

o.binormal = cross(o.normal, o.tangent) * (v.tangent.w * unity_WorldTransformParams.w);
o.vertexColor = v.color;

o.uv[0] = v.uv0;
o.uv[1] = v.uv1;
o.uv[2] = v.uv2;
o.uv[3] = v.uv3;

#if defined(LIGHTMAP_ON)
o.lightmapUV.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif
#ifdef DYNAMICLIGHTMAP_ON
o.lightmapUV.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif

o.localPos = v.vertex;
o.worldPos = mul(unity_ObjectToWorld, o.localPos);

float3 localOffset = float3(0, 0, 0);
float3 worldOffset = float3(0, 0, 0);

#ifdef POI_PASS_FORWARDOUTLINE
float outlineMask = 1;
//TODO figure out why uvs can't be set dynamically
outlineMask = poiMax(tex2Dlod(_OutlineMask, float4(poiUV(o.uv[0], _OutlineMask_ST) + _Time.x * _OutlineMaskPan, 0, 0)).rgb);

//UNITY_BRANCH
if (_OutlineUseVertexColors == 2)
{
outlineMask *= v.color.r;
}

float3 outlineNormal = o.normal;
//UNITY_BRANCH
if (_OutlineUseVertexColors == 1)
{
//TODO normals appear to be transformed before entering the vertex shader and I'm not sure how to achieve the same results with vertex colors
outlineNormal = UnityObjectToWorldNormal(v.color);
}

half offsetMultiplier = 1;
half distanceOffset = 1;
//UNITY_BRANCH
if (_OutlineFixedSize)
{
distanceOffset *= min(distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, o.localPos).xyz), _OutlinesMaxDistance);
}

float3 offset = outlineNormal * (_LineWidth * _EnableOutlines / 100) * outlineMask * distanceOffset;

//UNITY_BRANCH
if (_OutlineMode == 2)
{
float3 lightDirection = normalize(_WorldSpaceLightPos0 + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz);
offsetMultiplier = saturate(dot(lightDirection, outlineNormal));
offset *= offsetMultiplier;
offset *= distanceOffset;
}
else if (_OutlineMode == 3)
{
half3 viewNormal = mul((float3x3)UNITY_MATRIX_V, outlineNormal);
offsetMultiplier = saturate(dot(viewNormal.xy, normalize(_OutlinePersonaDirection.xy)));

offset *= offsetMultiplier;
offset *= distanceOffset;
}
else if (_OutlineMode == 4)
{
offset = mul((float3x3)transpose(UNITY_MATRIX_V), _OutlineDropShadowOffset);
offset *= distanceOffset;
}

localOffset += mul(unity_WorldToObject, offset);
worldOffset += offset;
#endif

o.localPos.rgb += localOffset;
o.worldPos.rgb += worldOffset;
o.pos = UnityObjectToClipPos(o.localPos);
o.grabPos = ComputeGrabScreenPos(o.pos);

float3x3 objectToTangent = float3x3(
o.tangent.xyz,
cross(o.normal, o.tangent.xyz) * v.tangent.w,
o.normal
);
o.tangentViewDir = mul(objectToTangent, ObjSpaceViewDir(o.localPos));

#ifndef FORWARD_META_PASS
#if !defined(UNITY_PASS_SHADOWCASTER)
UNITY_TRANSFER_SHADOW(o, o.uv[0].xy);
#else
TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
#endif
#endif
UNITY_TRANSFER_FOG(o, o.pos);
return o;
}

#ifdef COLOR_GRADING_LOG_VIEW
//Tests to see if Audio Link texture is available
bool AudioLinkIsAvailable()
{
#if !defined(AUDIOLINK_STANDARD_INDEXING)
int width, height;
_AudioTexture.GetDimensions(width, height);
return width > 16;
#else
return _AudioTexture_TexelSize.z > 16;
#endif
}

//Get version of audiolink present in the world, 0 if no audiolink is present
float AudioLinkGetVersion()
{
int2 dims;
#if !defined(AUDIOLINK_STANDARD_INDEXING)
_AudioTexture.GetDimensions(dims.x, dims.y);
#else
dims = _AudioTexture_TexelSize.zw;
#endif

if (dims.x >= 128)
return AudioLinkData(ALPASS_GENERALVU).x;
else if (dims.x > 16)
return 1;
else
return 0;
}

float getBandAtTime(float band, float time, float width, float size = 1.0f)
{
return pow(UNITY_SAMPLE_TEX2D(_AudioTexture, float2(time * width, band)).r, (1 - size) * 3 + 1);
}

void initAudioBands(inout PoiMods poiMods)
{
poiMods.audioLinkAvailable = AudioLinkIsAvailable();
poiMods.audioLinkAvailable *= _AudioLinkAnimToggle;

if (poiMods.audioLinkAvailable)
{
poiMods.audioLinkVersion = AudioLinkGetVersion();
poiMods.audioLink.x = AudioLinkData(ALPASS_AUDIOBASS).r;
poiMods.audioLink.y = AudioLinkData(ALPASS_AUDIOLOWMIDS).r;
poiMods.audioLink.z = AudioLinkData(ALPASS_AUDIOHIGHMIDS).r;
poiMods.audioLink.w = AudioLinkData(ALPASS_AUDIOTREBLE).r;
}
}
#endif

float2 calculatePolarCoordinate(in PoiMesh poiMesh)
{
float2 delta = poiMesh.uv[_PolarUV] - _PolarCenter;
float radius = length(delta) * 2 * _PolarRadialScale;
float angle = atan2(delta.x, delta.y) * 1.0 / 6.28 * _PolarLengthScale;
return float2(radius, angle + distance(poiMesh.uv[_PolarUV], _PolarCenter) * _PolarSpiralPower);
}

float2 MonoPanoProjection(float3 coords)
{
float3 normalizedCoords = normalize(coords);
float latitude = acos(normalizedCoords.y);
float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
float2 sphereCoords = float2(longitude, latitude) * float2(1.0 / UNITY_PI, 1.0 / UNITY_PI);
sphereCoords = float2(1.0, 1.0) - sphereCoords;
return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).zw;
}

float2 StereoPanoProjection(float3 coords)
{
float3 normalizedCoords = normalize(coords);
float latitude = acos(normalizedCoords.y);
float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
float2 sphereCoords = float2(longitude, latitude) * float2(0.5 / UNITY_PI, 1.0 / UNITY_PI);
sphereCoords = float2(0.5, 1.0) - sphereCoords;
return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
}

float2 calculatePanosphereUV(in PoiMesh poiMesh)
{
float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - poiMesh.worldPos) * - 1;
return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), _StereoEnabled);
}

#ifdef USER_LUT
float2 distortedUV(in PoiMesh poiMesh)
{
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 flowVector = POI2D_SAMPLER_PAN(_DistortionFlowTexture, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTextureUV], _DistortionFlowTexture_ST), _DistortionFlowTexturePan) * 2 - 1;
#else
float4 flowVector = 0;
#endif

#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
float4 flowVector1 = POI2D_SAMPLER_PAN(_DistortionFlowTexture1, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTexture1UV], _DistortionFlowTexture1_ST), _DistortionFlowTexture1Pan) * 2 - 1;
#else
float4 flowVector1 = 0;
#endif

#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
half distortionMask = POI2D_SAMPLER_PAN(_DistortionMask, _MainTex, poiMesh.uv[_DistortionMaskUV], _DistortionMaskPan).r;
#else
half distortionMask = 1;
#endif

half distortionStrength = _DistortionStrength;
half distortionStrength1 = _DistortionStrength1;

flowVector *= distortionStrength;
flowVector1 *= distortionStrength1;
return poiMesh.uv[_DistortionUvToDistort] + ((flowVector.xy + flowVector1.xy) / 2) * distortionMask;
}
#endif

void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{
poiFragData.alpha = saturate(poiFragData.alpha + _AlphaMod);

// Distance Fade
if (_AlphaDistanceFade)
{
float3 position = _AlphaDistanceFadeType ? poiMesh.worldPos : poiMesh.objectPosition;
poiFragData.alpha *= lerp(_AlphaDistanceFadeMinAlpha, _AlphaDistanceFadeMaxAlpha, smoothstep(_AlphaDistanceFadeMin, _AlphaDistanceFadeMax, distance(position, poiCam.worldPos)));
}

// Fresnel Alpha
if (_AlphaFresnel)
{
float holoRim = saturate(1 - smoothstep(min(_AlphaFresnelSharpness, _AlphaFresnelWidth), _AlphaFresnelWidth, poiCam.vDotN));
holoRim = abs(lerp(1, holoRim, _AlphaFresnelAlpha));
poiFragData.alpha *= _AlphaFresnelInvert ?1 - holoRim : holoRim;
}

if (_AlphaAngular)
{
half cameraAngleMin = _CameraAngleMin / 180;
half cameraAngleMax = _CameraAngleMax / 180;
half modelAngleMin = _ModelAngleMin / 180;
half modelAngleMax = _ModelAngleMax / 180;
float3 pos = _AngleCompareTo == 0 ? poiMesh.objectPosition : poiMesh.worldPos;
half3 cameraToModelDirection = normalize(pos - getCameraPosition());
half3 modelForwardDirection = normalize(mul(unity_ObjectToWorld, normalize(_AngleForwardDirection)));
half cameraLookAtModel = remapClamped(cameraAngleMax, cameraAngleMin, .5 * dot(cameraToModelDirection, getCameraForward()) + .5);
half modelLookAtCamera = remapClamped(modelAngleMax, modelAngleMin, .5 * dot(-cameraToModelDirection, modelForwardDirection) + .5);
if (_AngleType == 0)
{
poiFragData.alpha *= max(cameraLookAtModel, _AngleMinAlpha);
}
else if (_AngleType == 1)
{
poiFragData.alpha *= max(modelLookAtCamera, _AngleMinAlpha);
}
else if (_AngleType == 2)
{
poiFragData.alpha *= max(cameraLookAtModel * modelLookAtCamera, _AngleMinAlpha);
}
}
}

inline half Dither8x8Bayer(int x, int y)
{
const half dither[ 64 ] = {
1, 49, 13, 61, 4, 52, 16, 64,
33, 17, 45, 29, 36, 20, 48, 32,
9, 57, 5, 53, 12, 60, 8, 56,
41, 25, 37, 21, 44, 28, 40, 24,
3, 51, 15, 63, 2, 50, 14, 62,
35, 19, 47, 31, 34, 18, 46, 30,
11, 59, 7, 55, 10, 58, 6, 54,
43, 27, 39, 23, 42, 26, 38, 22
};
int r = y * 8 + x;
return dither[r] / 64;
}

half calcDither(half2 grabPos)
{
half dither = Dither8x8Bayer(fmod(grabPos.x, 8), fmod(grabPos.y, 8));
return dither;
}

void applyDithering(inout PoiFragData poiFragData, in PoiCam poiCam)
{
if (_AlphaDithering)
{
poiFragData.alpha = poiFragData.alpha - (calcDither(poiCam.screenUV) * (1 - poiFragData.alpha) * _AlphaDitherGradient);
}
}

void ApplyAlphaToCoverage(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
// Force Model Opacity to 1 if desired
UNITY_BRANCH
if (_Mode == 1)
{
UNITY_BRANCH
if (_AlphaSharpennedA2C)
{
// rescale alpha by mip level
poiFragData.alpha *= 1 + max(0, CalcMipLevel(poiMesh.uv[0] * _MainTex_TexelSize.zw)) * _AlphaMipScale;
// rescale alpha by partial derivative
poiFragData.alpha = (poiFragData.alpha - _Cutoff) / max(fwidth(poiFragData.alpha), 0.0001) + _Cutoff;
}
}
}

#ifdef VIGNETTE_MASKED

void applyShadeMapping(inout PoiFragData poiFragData, PoiMesh poiMesh, PoiLight poiLight)
{
float MainColorFeatherStep = _BaseColor_Step - _BaseShade_Feather;
float firstColorFeatherStep = _ShadeColor_Step - _1st2nd_Shades_Feather;

#if defined(PROP_1ST_SHADEMAP) || !defined(OPTIMIZER_ENABLED)
float4 firstShadeMap = POI2D_SAMPLER_PAN(_1st_ShadeMap, _MainTex, poiUV(poiMesh.uv[_1st_ShadeMapUV], _1st_ShadeMap_ST), _1st_ShadeMapPan);
#else
float4 firstShadeMap = float4(1, 1, 1, 1);
#endif
firstShadeMap = lerp(firstShadeMap, float4(poiFragData.baseColor, 1), _Use_BaseAs1st);

#if defined(PROP_2ND_SHADEMAP) || !defined(OPTIMIZER_ENABLED)
float4 secondShadeMap = POI2D_SAMPLER_PAN(_2nd_ShadeMap, _MainTex, poiUV(poiMesh.uv[_2nd_ShadeMapUV], _2nd_ShadeMap_ST), _2nd_ShadeMapPan);
#else
float4 secondShadeMap = float4(1, 1, 1, 1);
#endif
secondShadeMap = lerp(secondShadeMap, firstShadeMap, _Use_1stAs2nd);

firstShadeMap.rgb *= _1st_ShadeColor.rgb; //* lighColor
secondShadeMap.rgb *= _2nd_ShadeColor.rgb; //* LightColor;

float shadowMask = 1;
shadowMask *= _Use_1stShadeMapAlpha_As_ShadowMask ?(_1stShadeMapMask_Inverse ?(1.0 - firstShadeMap.a) : firstShadeMap.a) : 1;
shadowMask *= _Use_2ndShadeMapAlpha_As_ShadowMask ?(_2ndShadeMapMask_Inverse ?(1.0 - secondShadeMap.a) : secondShadeMap.a) : 1;

float mainShadowMask = saturate(1 - ((poiLight.lightMap) - MainColorFeatherStep) / (_BaseColor_Step - MainColorFeatherStep) * (shadowMask));
float firstSecondShadowMask = saturate(1 - ((poiLight.lightMap) - firstColorFeatherStep) / (_ShadeColor_Step - firstColorFeatherStep) * (shadowMask));

mainShadowMask *= poiLight.shadowMask;
firstSecondShadowMask *= poiLight.shadowMask;

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, lerp(firstShadeMap.rgb, secondShadeMap.rgb, firstSecondShadowMask), mainShadowMask);
}

void ApplySubtractiveLighting(inout UnityIndirect indirectLight)
{
#if SUBTRACTIVE_LIGHTING
poiLight.attenuation = FadeShadows(lerp(1, poiLight.attenuation, _AttenuationMultiplier));

float ndotl = saturate(dot(i.normal, _WorldSpaceLightPos0.xyz));
float3 shadowedLightEstimate = ndotl * (1 - poiLight.attenuation) * _LightColor0.rgb;
float3 subtractedLight = indirectLight.diffuse - shadowedLightEstimate;
subtractedLight = max(subtractedLight, unity_ShadowColor.rgb);
subtractedLight = lerp(subtractedLight, indirectLight.diffuse, _LightShadowData.x);
indirectLight.diffuse = min(subtractedLight, indirectLight.diffuse);
#endif
}

UnityIndirect CreateIndirectLight(in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
UnityIndirect indirectLight;
indirectLight.diffuse = 0;
indirectLight.specular = 0;

#if defined(LIGHTMAP_ON)
indirectLight.diffuse = DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, poiMesh.lightmapUV.xy));

#if defined(DIRLIGHTMAP_COMBINED)
float4 lightmapDirection = UNITY_SAMPLE_TEX2D_SAMPLER(
unity_LightmapInd, unity_Lightmap, poiMesh.lightmapUV.xy
);
indirectLight.diffuse = DecodeDirectionalLightmap(
indirectLight.diffuse, lightmapDirection, poiMesh.normals[1]
);
#endif
ApplySubtractiveLighting(indirectLight);
#endif

#if defined(DYNAMICLIGHTMAP_ON)
float3 dynamicLightDiffuse = DecodeRealtimeLightmap(
UNITY_SAMPLE_TEX2D(unity_DynamicLightmap, poiMesh.lightmapUV.zw)
);

#if defined(DIRLIGHTMAP_COMBINED)
float4 dynamicLightmapDirection = UNITY_SAMPLE_TEX2D_SAMPLER(
unity_DynamicDirectionality, unity_DynamicLightmap,
poiMesh.lightmapUV.zw
);
indirectLight.diffuse += DecodeDirectionalLightmap(
dynamicLightDiffuse, dynamicLightmapDirection, poiMesh.normals[1]
);
#else
indirectLight.diffuse += dynamicLightDiffuse;
#endif
#endif

#if !defined(LIGHTMAP_ON) && !defined(DYNAMICLIGHTMAP_ON)
#if UNITY_LIGHT_PROBE_PROXY_VOLUME
if (unity_ProbeVolumeParams.x == 1)
{
indirectLight.diffuse = SHEvalLinearL0L1_SampleProbeVolume(
float4(poiMesh.normals[1], 1), poiMesh.worldPos
);
indirectLight.diffuse = max(0, indirectLight.diffuse);
#if defined(UNITY_COLORSPACE_GAMMA)
indirectLight.diffuse = LinearToGammaSpace(indirectLight.diffuse);
#endif
}
else
{
indirectLight.diffuse += max(0, ShadeSH9(float4(poiMesh.normals[1], 1)));
}
#else
indirectLight.diffuse += max(0, ShadeSH9(float4(poiMesh.normals[1], 1)));
#endif
#endif

float3 reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
Unity_GlossyEnvironmentData envData;
envData.roughness = 1 - _LightingStandardSmoothness;
envData.reflUVW = BoxProjection(
reflectionDir, poiMesh.worldPos.xyz,
unity_SpecCube0_ProbePosition,
unity_SpecCube0_BoxMin.xyz, unity_SpecCube0_BoxMax.xyz
);
float3 probe0 = Unity_GlossyEnvironment(
UNITY_PASS_TEXCUBE(unity_SpecCube0), unity_SpecCube0_HDR, envData
);
envData.reflUVW = BoxProjection(
reflectionDir, poiMesh.worldPos.xyz,
unity_SpecCube1_ProbePosition,
unity_SpecCube1_BoxMin.xyz, unity_SpecCube1_BoxMax.xyz
);
#if UNITY_SPECCUBE_BLENDING
float interpolator = unity_SpecCube0_BoxMin.w;
//UNITY_BRANCH
if (interpolator < 0.99999)
{
float3 probe1 = Unity_GlossyEnvironment(
UNITY_PASS_TEXCUBE_SAMPLER(unity_SpecCube1, unity_SpecCube0),
unity_SpecCube0_HDR, envData
);
indirectLight.specular = lerp(probe1, probe0, interpolator);
}
else
{
indirectLight.specular = probe0;
}
#else
indirectLight.specular = probe0;
#endif

indirectLight.diffuse *= poiLight.occlusion;
indirectLight.specular *= poiLight.occlusion;

return indirectLight;
}

void applyShading(inout PoiLight poiLight, inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{
#ifdef UNITY_PASS_FORWARDBASE

float shadowStrength = _ShadowStrength * poiLight.shadowMask;

#ifdef POI_PASS_FORWARDOUTLINE
shadowStrength = lerp(0, shadowStrength, _OutlineShadowStrength);
#endif

#ifdef _LIGHTINGMODE_FLAT
poiLight.finalLighting = poiLight.directColor;
poiLight.rampedLightMap = poiLight.nDotLSaturated;
#endif

#ifdef _LIGHTINGMODE_TEXTURERAMP
poiLight.rampedLightMap = lerp(1, UNITY_SAMPLE_TEX2D(_ToonRamp, poiLight.lightMap + _ShadowOffset).rgb, shadowStrength);
poiLight.finalLighting = lerp(_LightingShadowColor * lerp(poiLight.indirectColor, poiLight.rampedLightMap * poiLight.directColor, _LightingIgnoreAmbientColor) * poiLight.occlusion, poiLight.directColor, poiLight.rampedLightMap);
#endif

#ifdef _LIGHTINGMODE_MATHRAMP
if (_LightingMathLinearSmooth)
{
poiLight.rampedLightMap = saturate(1 - remapClamped(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - poiLight.lightMap * poiLight.detailShadow));
}
else
{
poiLight.rampedLightMap = saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - poiLight.lightMap * poiLight.detailShadow));
}
poiLight.finalLighting = lerp((_LightingShadowColor * lerp(poiLight.indirectColor, poiLight.directColor, _LightingIgnoreAmbientColor) * poiLight.occlusion), (poiLight.directColor), saturate(poiLight.rampedLightMap + 1 - shadowStrength));
#endif

#ifdef _LIGHTINGMODE_SHADEMAP
poiLight.finalLighting = poiLight.directColor;
#endif

#ifdef _LIGHTINGMODE_REALISTIC
UnityLight light;
light.dir = poiLight.direction;
light.color = saturate(_LightColor0.rgb * lerp(1, poiLight.attenuation, poiLight.attenuationStrength) * poiLight.detailShadow);
light.ndotl = poiLight.nDotLSaturated;
poiLight.rampedLightMap = poiLight.nDotLSaturated;
poiLight.finalLighting = UNITY_BRDF_PBS(1, 0, 0, _LightingStandardSmoothness, poiMesh.normals[1], poiCam.viewDir, light, CreateIndirectLight(poiMesh, poiCam, poiLight)).xyz;
#endif

#ifdef _LIGHTINGMODE_WRAPPED
poiLight.finalLighting = lerp(POI_ERROR(poiMesh, 20) * poiLight.indirectColor, poiLight.directColor, ceil(poiLight.nDotL));
#endif

#ifdef _LIGHTINGMODE_SKIN
float3 ambientNormalWorld = poiMesh.normals[1];//aTangentToWorld(s, s.blurredNormalTangent);
poiLight.rampedLightMap = poiLight.nDotLSaturated;
// Scattering mask.
float subsurface = 1;
float skinScattering = saturate(subsurface * _SssScale * 2);

// Skin subsurface depth absorption tint.
// cf http://www.crytek.com/download/2014_03_25_CRYENGINE_GDC_Schultz.pdf pg 35
half3 absorption = exp((1.0h - subsurface) * _SssTransmissionAbsorption.rgb);

// Albedo scale for absorption assumes ~0.5 luminance for Caucasian skin.
absorption *= saturate(poiFragData.baseColor * unity_ColorSpaceDouble.rgb);

// Blurred normals for indirect diffuse and direct scattering.
ambientNormalWorld = normalize(lerp(poiMesh.normals[1], ambientNormalWorld, _SssBumpBlur));

float ndlBlur = dot(poiMesh.normals[1], poiLight.direction) * 0.5h + 0.5h;
float lumi = dot(poiLight.directColor, half3(0.2126h, 0.7152h, 0.0722h));
float4 sssLookupUv = float4(ndlBlur, skinScattering * lumi, 0.0f, 0.0f);
half3 sss = poiLight.lightMap * poiLight.attenuation * tex2Dlod(_SkinLUT, sssLookupUv).rgb;
poiLight.finalLighting = min(lerp(poiLight.indirectColor * _LightingShadowColor, _LightingShadowColor, _LightingIgnoreAmbientColor) + (sss * poiLight.directColor), poiLight.directColor);
#endif

#endif

#ifdef UNITY_PASS_FORWARDADD
//UNITY_BRANCH
if (_LightingAdditiveType == 0) // Realistic

{
poiLight.finalLighting = poiLight.directColor * poiLight.attenuation * max(0, poiLight.nDotL) * poiLight.detailShadow * poiLight.additiveShadow;
}
else if (_LightingAdditiveType == 1) // Toon

{
#if defined(POINT) || defined(SPOT)
poiLight.finalLighting = lerp(poiLight.directColor * max(poiLight.additiveShadow, _LightingAdditivePassthrough), poiLight.indirectColor, smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, 1 - (.5 * poiLight.nDotL + .5))) * poiLight.attenuation * poiLight.detailShadow;
#else
poiLight.finalLighting = lerp(poiLight.directColor * max(poiLight.attenuation, _LightingAdditivePassthrough), poiLight.indirectColor, smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, 1 - (.5 * poiLight.nDotL + .5))) * poiLight.detailShadow;
#endif
}
/*
else //if(_LightingAdditiveType == 2) // Wrapped
{
float uv = saturate(RTWrapFunc(poiLight.nDotL, _LightingWrappedWrap, _LightingWrappedNormalization)) * detailShadow;

poiLight.rampedLightMap = 1;
//UNITY_BRANCH
if (_LightingRampType == 1) // Math Gradient
poiLight.rampedLightMap = lerp(_LightingShadowColor, float3(1, 1, 1), saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - uv)));
// TODO: ramp texture or full shade/tint map for atlasing
//poiLight.rampedLightMap = lerp(1, UNITY_SAMPLE_TEX2D(_ToonRamp, float2(uv + _ShadowOffset, 1)), shadowStrength.r);

float shadowatten = max(poiLight.additiveShadow, _LightingAdditivePassthrough);
return poiLight.color * poiLight.rampedLightMap * saturate(poiLight.attenuation * uv * shadowatten);
}
*/
#endif

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
float3 vertexLighting = float3(0, 0, 0);
for (int index = 0; index < 4; index++)
{
//UNITY_BRANCH
if (_LightingAdditiveType == 0)
{
vertexLighting += poiLight.vColor[index] * poiLight.vAttenuationDotNL[index] * poiLight.detailShadow; // Realistic

}

//UNITY_BRANCH
if (_LightingAdditiveType == 1) // Toon

{
vertexLighting += lerp(poiLight.vColor[index] * poiLight.vAttenuation[index], poiLight.vColor[index] * _LightingAdditivePassthrough * poiLight.vAttenuation[index], smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, poiLight.vDotNL[index])) * poiLight.detailShadow;
}

//UNITY_BRANCH
if (_LightingAdditiveType == 2) //if(_LightingAdditiveType == 2) // Wrapped

{
//TODO wrapped vertex lighting
vertexLighting += lerp(poiLight.vColor[index] * poiLight.vAttenuation[index], poiLight.vColor[index] * _LightingAdditivePassthrough * poiLight.vAttenuation[index], smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, poiLight.vDotNL[index])) * poiLight.detailShadow;
/*
float uv = saturate(RTWrapFunc(-poiLight.vDotNL[index], _LightingWrappedWrap, _LightingWrappedNormalization)) * poiLight.detailShadow;

poiLight.rampedLightMap = 1;
if (_LightingRampType == 1) // Math Gradient
poiLight.rampedLightMap = lerp(_LightingShadowColor, float3(1, 1, 1), saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - uv)));

vertexLighting += poiLight.vColor[index] * poiLight.rampedLightMap * saturate(poiLight.vAttenuation[index] * uv);
*/
}
}
float3 mixedLight = poiLight.finalLighting;
mixedLight = vertexLighting + poiLight.finalLighting;
poiFragData.finalColor = poiFragData.baseColor * mixedLight;
#else
poiFragData.finalColor = poiFragData.baseColor * poiLight.finalLighting;
#endif
}
#endif

#ifdef POI_PASS_FORWARDOUTLINE
void applyOutlineColor(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiLight poiLight)
{
clip(_EnableOutlines - 0.01);
float OutlineMask = tex2D(_OutlineMask, TRANSFORM_TEX(poiMesh.uv[_OutlineMaskUV], _OutlineMask) + _Time.x * _OutlineMaskPan).r;
clip(OutlineMask * _LineWidth - 0.001);
float4 col = POI2D_SAMPLER_PAN(_OutlineTexture, _MainTex, poiUV(poiMesh.uv[_OutlineTextureUV], _OutlineTexture_ST), _OutlineTexturePan) * _LineColor;
//UNITY_BRANCH
if (_OutlineMode == 0)
{
poiFragData.baseColor = col;
}
//UNITY_BRANCH
if (_OutlineMode == 1)
{
poiFragData.baseColor = lerp(_LineColor.rgb, poiFragData.baseColor, _OutlineTintMix) * col;
}
//UNITY_BRANCH
if (_OutlineMode == 2)
{
poiFragData.baseColor = lerp(poiFragData.baseColor, poiLight.directColor, _OutlineRimLightBlend) * col;
}

poiFragData.alpha *= col.a;

// Hue shift
//UNITY_BRANCH
if (_OutlineHueShift)
{
poiFragData.baseColor = hueShift(poiFragData.baseColor, _OutlineHueOffset +_OutlineHueOffsetSpeed * _Time.x);
}
}
#endif

#ifdef _SUNDISK_HIGH_QUALITY

void applyFlipbook(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
float4 flipBookPixel = float4(0, 0, 0, 0);
#if defined(PROP_FLIPBOOKMASK) || !defined(OPTIMIZER_ENABLED)
float flipBookMask = POI2D_SAMPLER_PAN(_FlipbookMask, _MainTex, poiMesh.uv[_FlipbookMaskUV], _FlipbookMaskPan).r;
#else
float flipBookMask = 1;
#endif
float4 flipbookScaleOffset = _FlipbookScaleOffset;

#ifdef POI_AUDIOLINK
flipbookScaleOffset.xy += lerp(_AudioLinkFlipbookScale.xy, _AudioLinkFlipbookScale.zw, poiMods.audioLink[_AudioLinkFlipbookScaleBand]);
#endif

flipbookScaleOffset.xy = 1 - flipbookScaleOffset.xy;
float2 uv = frac(poiMesh.uv[_FlipbookTexArrayUV]);
float theta = radians(_FlipbookRotation + _Time.z * _FlipbookRotationSpeed);
float cs = cos(theta);
float sn = sin(theta);
float2 spriteCenter = flipbookScaleOffset.zw + .5;
// 2d rotation
uv = float2((uv.x - spriteCenter.x) * cs - (uv.y - spriteCenter.y) * sn + spriteCenter.x, (uv.x - spriteCenter.x) * sn + (uv.y - spriteCenter.y) * cs + spriteCenter.y);

float2 newUV = remap(uv, float2(0, 0) + flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(1, 1) - flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(0, 0), float2(1, 1));

UNITY_BRANCH
if (_FlipbookTiled == 0)
{
if (max(newUV.x, newUV.y) > 1 || min(newUV.x, newUV.y) < 0)
{
return;
}
}
#if defined(PROP_FLIPBOOKTEXARRAY) || !defined(OPTIMIZER_ENABLED)
float currentFrame = fmod(_FlipbookCurrentFrame, _FlipbookTotalFrames);
if (_FlipbookCurrentFrame < 0)
{
currentFrame = (_Time.y / (1 / _FlipbookFPS)) % _FlipbookTotalFrames;
}
#ifdef POI_AUDIOLINK
currentFrame += lerp(_AudioLinkFlipbookFrame.x, _AudioLinkFlipbookFrame.y, poiMods.audioLink[_AudioLinkFlipbookFrameBand]);
#endif
flipBookPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor(currentFrame)));
UNITY_BRANCH
if (_FlipbookCrossfadeEnabled)
{
float4 flipbookNextPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor((currentFrame + 1) % _FlipbookTotalFrames)));
flipBookPixel = lerp(flipBookPixel, flipbookNextPixel, smoothstep(_FlipbookCrossfadeRange.x, _FlipbookCrossfadeRange.y, frac(currentFrame)));
}
#else
flipBookPixel = 1;
#endif

UNITY_BRANCH
if (_FlipbookIntensityControlsAlpha)
{
flipBookPixel.a = poiMax(flipBookPixel.rgb);
}
UNITY_BRANCH
if (_FlipbookColorReplaces)
{
flipBookPixel.rgb = _FlipbookColor.rgb;
}
else
{
flipBookPixel.rgb *= _FlipbookColor.rgb;
}

#ifdef POI_BLACKLIGHT
UNITY_BRANCH
if (_BlackLightMaskFlipbook != 4)
{
flipBookMask *= blackLightMask[_BlackLightMaskFlipbook];
}
#endif

UNITY_BRANCH
if (_FlipbookHueShiftEnabled)
{
flipBookPixel.rgb = hueShift(flipBookPixel.rgb, _FlipbookHueShift + _Time.x * _FlipbookHueShiftSpeed);
}
half flipbookAlpha = 1;
#ifdef POI_AUDIOLINK
flipbookAlpha = saturate(lerp(_AudioLinkFlipbookAlpha.x, _AudioLinkFlipbookAlpha.y, poiMods.audioLink[_AudioLinkFlipbookAlphaBand]));
#endif

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)

poiFragData.baseColor = lerp(poiFragData.baseColor, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * _FlipbookReplace * flipBookMask * flipbookAlpha);
poiFragData.baseColor = poiFragData.baseColor + flipBookPixel.rgb * _FlipbookAdd * flipBookMask * flipbookAlpha;
poiFragData.baseColor = poiFragData.baseColor * lerp(1, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * flipBookMask * _FlipbookMultiply * flipbookAlpha);

float flipbookEmissionStrength = _FlipbookEmissionStrength;
#ifdef POI_AUDIOLINK
flipbookEmissionStrength += max(lerp(_AudioLinkFlipbookEmission.x, _AudioLinkFlipbookEmission.y, poiMods.audioLink[_AudioLinkFlipbookEmissionBand]), 0);
#endif

poiFragData.emission += lerp(0, flipBookPixel.rgb * flipbookEmissionStrength, flipBookPixel.a * _FlipbookColor.a * flipBookMask * flipbookAlpha);

#endif

UNITY_BRANCH
if (_FlipbookAlphaControlsFinalAlpha)
{
poiFragData.alpha = lerp(poiFragData.alpha, flipBookPixel.a * _FlipbookColor.a, flipBookMask);
}
}

#endif

#ifdef DISTORT
void applyDissolve(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
float dissolveMask = POI2D_SAMPLER_PAN(_DissolveMask, _MainTex, poiUV(poiMesh.uv[_DissolveMaskUV], _DissolveMask_ST), _DissolveMaskPan).r;
#else
float dissolveMask = 1;
#endif
UNITY_BRANCH
if (_DissolveUseVertexColors)
{
// Vertex Color Imprecision hype
dissolveMask = ceil(poiMesh.vertexColor.g * 100000) / 100000;
}

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
dissolveToTexture = POI2D_SAMPLER_PAN(_DissolveToTexture, _MainTex, poiUV(poiMesh.uv[_DissolveToTextureUV], _DissolveToTexture_ST), _DissolveToTexturePan) * _DissolveTextureColor;
#else
dissolveToTexture = _DissolveTextureColor;
#endif

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
float dissolveNoiseTexture = POI2D_SAMPLER_PAN(_DissolveNoiseTexture, _MainTex, poiUV(poiMesh.uv[_DissolveNoiseTextureUV], _DissolveNoiseTexture_ST), _DissolveNoiseTexturePan).r;
#else
float dissolveNoiseTexture = 1;
#endif

float da = _DissolveAlpha
+ _DissolveAlpha0
+ _DissolveAlpha1
+ _DissolveAlpha2
+ _DissolveAlpha3
+ _DissolveAlpha4
+ _DissolveAlpha5
+ _DissolveAlpha6
+ _DissolveAlpha7
+ _DissolveAlpha8
+ _DissolveAlpha9;
float dds = _DissolveDetailStrength;

#ifdef POI_AUDIOLINK
UNITY_BRANCH
if (_EnableDissolveAudioLink && poiMods.audioLinkTextureExists)
{
da += lerp(_AudioLinkDissolveAlpha.x, _AudioLinkDissolveAlpha.y, poiMods.audioLink[_AudioLinkDissolveAlphaBand]);
dds += lerp(_AudioLinkDissolveDetail.x, _AudioLinkDissolveDetail.y, poiMods.audioLink[_AudioLinkDissolveDetailBand]);
}
#endif

da = saturate(da);
dds = saturate(dds);

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskDissolve != 4)
{
dissolveMask *= blackLightMask[_BlackLightMaskDissolve];
}
#endif

if (_DissolveMaskInvert)
{
dissolveMask = 1 - dissolveMask;
}
#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
float dissolveDetailNoise = POI2D_SAMPLER_PAN(_DissolveDetailNoise, _MainTex, poiUV(poiMesh.uv[_DissolveDetailNoiseUV], _DissolveDetailNoise_ST), _DissolveDetailNoisePan);
#else
float dissolveDetailNoise = 0;
#endif
if (_DissolveInvertNoise)
{
dissolveNoiseTexture = 1 - dissolveNoiseTexture;
}
if (_DissolveInvertDetailNoise)
{
dissolveDetailNoise = 1 - dissolveDetailNoise;
}
if (_ContinuousDissolve != 0)
{
da = sin(_Time.y * _ContinuousDissolve) * .5 + .5;
}
da *= dissolveMask;
dissolveAlpha = da;
edgeAlpha = 0;

UNITY_BRANCH
if (_DissolveType == 1) // Basic

{
da = remap(da, 0, 1, -_DissolveEdgeWidth, 1);
dissolveAlpha = da;
//Adjust detail strength to avoid artifacts
dds *= smoothstep(1, .99, da);
float noise = saturate(dissolveNoiseTexture - dissolveDetailNoise * dds);

noise = saturate(noise + 0.001);
//noise = remap(noise, 0, 1, _DissolveEdgeWidth, 1 - _DissolveEdgeWidth);
dissolveAlpha = dissolveAlpha >= noise;
edgeAlpha = remapClamped(da + _DissolveEdgeWidth, da, noise) * (1 - dissolveAlpha);
}
else if (_DissolveType == 2) // Point to Point

{
float3 direction;
float3 currentPos;
float distanceTo = 0;
direction = normalize(_DissolveEndPoint - _DissolveStartPoint);
currentPos = lerp(_DissolveStartPoint, _DissolveEndPoint, dissolveAlpha);

UNITY_BRANCH
if (_DissolveP2PWorldLocal != 1)
{
float3 pos = _DissolveP2PWorldLocal == 0 ? poiMesh.localPos.rgb : poiMesh.vertexColor.rgb;
distanceTo = dot(pos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
else
{
distanceTo = dot(poiMesh.worldPos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
}

#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveHueShiftEnabled)
{
dissolveToTexture.rgb = hueShift(dissolveToTexture.rgb, _DissolveHueShift + _Time.x * _DissolveHueShiftSpeed);
}
#endif

poiFragData.alpha = lerp(poiFragData.alpha, dissolveToTexture.a, dissolveAlpha * .999999);

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)
poiFragData.baseColor = lerp(poiFragData.baseColor, dissolveToTexture.rgb, dissolveAlpha * .999999);

UNITY_BRANCH
if (_DissolveEdgeWidth)
{
edgeColor = tex2D(_DissolveEdgeGradient, poiUV(float2(edgeAlpha, edgeAlpha), _DissolveEdgeGradient_ST)) * _DissolveEdgeColor;
#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveEdgeHueShiftEnabled)
{
edgeColor.rgb = hueShift(edgeColor.rgb, _DissolveEdgeHueShift + _Time.x * _DissolveEdgeHueShiftSpeed);
}
#endif
poiFragData.baseColor = lerp(poiFragData.baseColor, edgeColor.rgb, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
}

poiFragData.emission += lerp(0, dissolveToTexture * _DissolveToEmissionStrength, dissolveAlpha) + lerp(0, edgeColor.rgb * _DissolveEdgeEmission, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
#endif
}
#endif

float4 frag(v2f i, uint facing : SV_IsFrontFace) : SV_Target
{
UNITY_SETUP_INSTANCE_ID(i);
PoiMesh poiMesh;
PoiInitStruct(PoiMesh, poiMesh);

PoiLight poiLight;
PoiInitStruct(PoiLight, poiLight);

PoiVertexLights poiVertexLights;
PoiInitStruct(PoiVertexLights, poiVertexLights);

PoiCam poiCam;
PoiInitStruct(PoiCam, poiCam);

PoiMods poiMods;
PoiInitStruct(PoiMods, poiMods);

PoiFragData poiFragData;
poiFragData.emission = 0;
poiFragData.baseColor = float3(0, 0, 0);
poiFragData.finalColor = float3(0, 0, 0);
poiFragData.alpha = 1;

// Mesh Data
poiMesh.objectPosition = i.objectPos;
poiMesh.objNormal = i.objNormal;
poiMesh.normals[0] = i.normal;
poiMesh.tangent = i.tangent;
poiMesh.binormal = i.binormal;
poiMesh.worldPos = i.worldPos.xyz;
poiMesh.localPos = i.localPos.xyz;
poiMesh.vertexColor = i.vertexColor;
poiMesh.isFrontFace = facing;

#ifndef POI_PASS_FORWARDOUTLINE
if (!poiMesh.isFrontFace)
{
poiMesh.normals[0] *= -1;
poiMesh.tangent *= -1;
poiMesh.binormal *= -1;
}
#endif
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 6 Distorted UV
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
poiMesh.lightmapUV = i.lightmapUV;
#endif
poiMesh.uv[0] = i.uv[0];
poiMesh.uv[1] = i.uv[1];
poiMesh.uv[2] = i.uv[2];
poiMesh.uv[3] = i.uv[3];
poiMesh.uv[4] = poiMesh.uv[0];
poiMesh.uv[5] = poiMesh.worldPos.xz;
poiMesh.uv[6] = poiMesh.uv[0];
poiMesh.uv[7] = poiMesh.uv[0];
poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
#ifdef USER_LUT
poiMesh.uv[7] = distortedUV(poiMesh);
#endif
/*
half3 worldViewUp = normalize(half3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, half3(0, 1, 0)));
half3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
poiMesh[8] = half2(dot(worldViewRight, poiMesh.normals[_MatcapNormal]), dot(worldViewUp, poiMesh.normals[_MatcapNormal])) * _MatcapBorder + 0.5;
*/

float4 mainTexture = UNITY_SAMPLE_TEX2D(_MainTex, poiUV(poiMesh.uv[_MainTexUV].xy, _MainTex_ST) + _Time.x * _MainTexPan);

float3 mainNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_BumpMap, _MainTex, poiUV(poiMesh.uv[_BumpMapUV], _BumpMap_ST), _BumpMapPan), _BumpScale);
poiMesh.tangentSpaceNormal = mainNormal;

#if defined(FINALPASS) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
ApplyDetailNormal(poiMods, poiMesh);
#endif

#if defined(GEOM_TYPE_MESH) && defined(VIGNETTE) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
calculateRGBNormals(poiMesh);
#endif

poiMesh.normals[1] = normalize(
poiMesh.tangentSpaceNormal.x * poiMesh.tangent.xyz +
poiMesh.tangentSpaceNormal.y * poiMesh.binormal +
poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
);

#ifdef POI_PASS_FORWARDOUTLINE
poiMesh.normals[1] = poiMesh.normals[0];
#endif

// Camera data
poiCam.viewDir = normalize(_WorldSpaceCameraPos - i.worldPos.xyz);
poiCam.forwardDir = getCameraForward();
poiCam.worldPos = _WorldSpaceCameraPos;
poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
//poiCam.distanceToModel = distance(poiMesh.modelPos, poiCam.worldPos);
poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
poiCam.grabPos = i.grabPos;
poiCam.screenUV = calcScreenUVs(i.grabPos);
poiCam.tangentViewDir = normalize(i.tangentViewDir);
poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
poiCam.clipPos = i.pos;

#if defined(PROP_LIGHTINGMAPSTEX) || !defined(OPTIMIZER_ENABLED)
float4 lightingMaps = POI2D_SAMPLER_PAN(_LightingMapsTex, _MainTex, poiUV(poiMesh.uv[_LightingMapsTexUV], _LightingMapsTex_ST), _LightingMapsTexPan);
#else
float4 lightingMaps = float4(1, 1, 1, 1);
#endif

poiLight.occlusion = lerp(1, lightingMaps.r, _LightDataAOStrength);
poiLight.detailShadow = lerp(1, lightingMaps.g, _LightDataDetailStrength);
poiLight.shadowMask = lerp(1, lightingMaps.b, _LightDataShadowMaskStrength);

#ifdef UNITY_PASS_FORWARDBASE

bool lightExists = false;
if (any(_LightColor0.rgb >= 0.002))
{
lightExists = true;
}

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
float4 toLightX = unity_4LightPosX0 - i.worldPos.x;
float4 toLightY = unity_4LightPosY0 - i.worldPos.y;
float4 toLightZ = unity_4LightPosZ0 - i.worldPos.z;
float4 lengthSq = 0;
lengthSq += toLightX * toLightX;
lengthSq += toLightY * toLightY;
lengthSq += toLightZ * toLightZ;

float4 lightAttenSq = unity_4LightAtten0;
float4 atten = 1.0 / (1.0 + lengthSq * lightAttenSq);
float4 vLightWeight = saturate(1 - (lengthSq * lightAttenSq / 25));
poiLight.vAttenuation = min(atten, vLightWeight * vLightWeight);

poiLight.vDotNL = 0;
poiLight.vDotNL += toLightX * poiMesh.normals[1].x;
poiLight.vDotNL += toLightY * poiMesh.normals[1].y;
poiLight.vDotNL += toLightZ * poiMesh.normals[1].z;

float4 corr = rsqrt(lengthSq);
poiLight.vDotNL = max(0, poiLight.vDotNL * corr);
poiLight.vAttenuationDotNL = poiLight.vAttenuation * poiLight.vDotNL;

for (int index = 0; index < 4; index++)
{
poiLight.vPosition[index] = float3(unity_4LightPosX0[index], unity_4LightPosY0[index], unity_4LightPosZ0[index]);

float3 vertexToLightSource = poiLight.vPosition[index] - poiMesh.worldPos;
poiLight.vDirection[index] = normalize(vertexToLightSource);
//poiLight.vAttenuationDotNL[index] = 1.0 / (1.0 + unity_4LightAtten0[index] * poiLight.vDotNL[index]);
poiLight.vColor[index] = unity_LightColor[index].rgb;
//UNITY_BRANCH
if (_LightingAdditiveLimitIntensity == 1)
{
float intensity = max(0.001, (0.299 * poiLight.vColor[index].r + 0.587 * poiLight.vColor[index].g + 0.114 * poiLight.vColor[index].b));
poiLight.vColor[index] = min(poiLight.vColor[index], poiLight.vColor[index] / (intensity / _LightingAdditiveMaxIntensity));
}
poiLight.vHalfDir[index] = Unity_SafeNormalize(poiLight.vDirection[index] + poiCam.viewDir);
poiLight.vDotNL[index] = dot(poiMesh.normals[1], -poiLight.vDirection[index]);
poiLight.vCorrectedDotNL[index] = .5 * (poiLight.vDotNL[index] + 1);
poiLight.vDotLH[index] = saturate(dot(poiLight.vDirection[index], poiLight.vHalfDir[index]));

poiLight.vDotNH[index] = saturate(dot(poiMesh.normals[1], poiLight.vHalfDir[index]));
}
#endif

//UNITY_BRANCH
if (_LightingColorMode == 0) // Poi Custom Light Color

{
float3 magic = max(BetterSH9(normalize(unity_SHAr + unity_SHAg + unity_SHAb)), 0);
float3 normalLight = _LightColor0.rgb + BetterSH9(float4(0, 0, 0, 1));

float magiLumi = calculateluminance(magic);
float normaLumi = calculateluminance(normalLight);
float maginormalumi = magiLumi + normaLumi;

float magiratio = magiLumi / maginormalumi;
float normaRatio = normaLumi / maginormalumi;

float target = calculateluminance(magic * magiratio + normalLight * normaRatio);
float3 properLightColor = magic + normalLight;
float properLuminance = calculateluminance(magic + normalLight);
poiLight.directColor = properLightColor * max(0.0001, (target / properLuminance));

poiLight.indirectColor = BetterSH9(float4(lerp(0, poiMesh.normals[1], _LightingIndirectUsesNormals), 1));
}

//UNITY_BRANCH
if (_LightingColorMode == 1) // More standard approach to light color
{
float3 indirectColor = BetterSH9(float4(poiMesh.normals[1], 1));
if (lightExists)
{
poiLight.directColor = _LightColor0.rgb;
poiLight.indirectColor = indirectColor;
}
else
{
poiLight.directColor = indirectColor * 0.6;
poiLight.indirectColor = indirectColor * 0.5;
}
}

float lightMapMode = _LightingMapMode;
//UNITY_BRANCH
if (_LightingDirectiongMode == 0)
{
poiLight.direction = _WorldSpaceLightPos0.xyz + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
}
else
{
//UNITY_BRANCH
if (_LightingDirectiongMode == 1)
{
poiLight.direction = mul(unity_ObjectToWorld, _LightngForcedDirection).xyz;;
}
//UNITY_BRANCH
if (_LightingDirectiongMode == 2)
{
poiLight.direction = _LightngForcedDirection;
}
if (lightMapMode == 0)
{
lightMapMode == 1;
}
}

poiLight.direction = normalize(poiLight.direction);
poiLight.attenuationStrength = _LightingCastedShadows;
poiLight.attenuation = 1;
if (!all(_LightColor0.rgb == 0.0))
{
UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
poiLight.attenuation *= attenuation;
}

poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
poiLight.nDotLSaturated = saturate(poiLight.nDotL);
poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
poiLight.nDotV = dot(poiMesh.normals[1], poiCam.viewDir);
poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);

//UNITY_BRANCH
if (lightMapMode == 0) // Poi special light map

{
float3 ShadeSH9Plus = GetSHLength();
float3 ShadeSH9Minus = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;

float3 greyScaleVector = float3(.33333, .33333, .33333);
float bw_lightColor = dot(poiLight.directColor, greyScaleVector);
float bw_directLighting = (((poiLight.nDotL * 0.5 + 0.5) * bw_lightColor * lerp(1, poiLight.attenuation, poiLight.attenuationStrength)) + dot(ShadeSH9(float4(poiMesh.normals[1], 1)), greyScaleVector));
float bw_bottomIndirectLighting = dot(ShadeSH9Minus, greyScaleVector);
float bw_topIndirectLighting = dot(ShadeSH9Plus, greyScaleVector);
float lightDifference = ((bw_topIndirectLighting + bw_lightColor) - bw_bottomIndirectLighting);
poiLight.lightMap = smoothstep(0, lightDifference, bw_directLighting - bw_bottomIndirectLighting);
}
//UNITY_BRANCH
if (lightMapMode == 1) // Normalized nDotL

{
poiLight.lightMap = poiLight.nDotLNormalized;
}
//UNITY_BRANCH
if (lightMapMode == 2) // Saturated nDotL

{
poiLight.lightMap = poiLight.nDotLSaturated;
}

poiLight.directColor = max(poiLight.directColor, poiLight.directColor / max(0.0001, (calculateluminance(poiLight.directColor) / _LightingMinLightBrightness)));
poiLight.indirectColor = max(poiLight.indirectColor, poiLight.indirectColor / max(0.0001, (calculateluminance(poiLight.indirectColor) / _LightingMinLightBrightness)));

poiLight.directColor = lerp(poiLight.directColor, dot(poiLight.directColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
poiLight.indirectColor = lerp(poiLight.indirectColor, dot(poiLight.indirectColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
//UNITY_BRANCH
if (_LightingCapEnabled)
{
poiLight.directColor = min(poiLight.directColor, _LightingCap);
poiLight.indirectColor = min(poiLight.indirectColor, _LightingCap);
}

//UNITY_BRANCH
if (_LightingForceColorEnabled)
{
poiLight.directColor = _LightingForcedColor;
}

#endif

#ifdef UNITY_PASS_FORWARDADD
#ifndef POI_LIGHT_DATA_ADDITIVE_ENABLE
return float4(mainTexture.rgb * .0001, 1);
#endif

#if defined(POINT) || defined(SPOT)
poiLight.direction = normalize(_WorldSpaceLightPos0.xyz - i.worldPos.xyz);

#ifdef POINT
poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(input, poiMesh.worldPos);
unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1)).xyz;
poiLight.attenuation = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
#endif

#ifdef SPOT
poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(i, poiMesh.worldPos);
unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1));
poiLight.attenuation = (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
#endif
#else
poiLight.direction = _WorldSpaceLightPos0.xyz;
UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
poiLight.additiveShadow == 0;
poiLight.attenuation = attenuation;
#endif
poiLight.directColor = _LightingAdditiveLimited ? min(_LightingAdditiveLimit, _LightColor0.rgb) : _LightColor0.rgb;
poiLight.indirectColor = lerp(0, poiLight.directColor, _LightingAdditivePassthrough);

poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
poiLight.nDotLSaturated = saturate(poiLight.nDotL);
poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
poiLight.nDotV = dot(poiMesh.normals[1], poiCam.viewDir);
poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);
poiLight.lightMap = 1;
#endif

#ifdef POI_LIGHT_DATA_DEBUG

#ifdef UNITY_PASS_FORWARDBASE
//UNITY_BRANCH
if (_LightingDebugVisualize <= 5)
{
switch(_LightingDebugVisualize)
{
case 0: // Direct Light Color
return float4(poiLight.directColor + mainTexture.rgb * .0001, 1);
break;
case 1: // Indirect Light Color
return float4(poiLight.indirectColor + mainTexture.rgb * .0001, 1);
break;
case 2: // Light Map
return float4(poiLight.lightMap + mainTexture.rgb * .0001, 1);
break;
case 3: // Attenuation
return float4(poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 4: // N Dot L
return float4(poiLight.nDotLNormalized, poiLight.nDotLNormalized, poiLight.nDotLNormalized, 1) + mainTexture * .0001;
break;
case 5:
return float4(poiLight.halfDir, 1) + mainTexture * .0001;
break;
}
}
else
{
return POI_SAFE_RGB1;
}
#endif
#ifdef UNITY_PASS_FORWARDADD
//UNITY_BRANCH
if (_LightingDebugVisualize < 6)
{
return POI_SAFE_RGB1;
}
else
{
switch(_LightingDebugVisualize)
{
case 6:
return float4(poiLight.directColor * poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 7:
return float4(poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 8:
return float4(poiLight.additiveShadow + mainTexture.rgb * .0001, 1);
break;
case 9:
return float4(poiLight.nDotLNormalized + mainTexture.rgb * .0001, 1);
break;
case 10:
return float4(poiLight.halfDir, 1) + mainTexture * .0001;
break;
}
}
#endif
#endif

poiFragData.baseColor = mainTexture.rgb * _Color.rgb;
poiFragData.alpha = mainTexture.a * _Color.a;

#if defined(PROP_CLIPPINGMASK) || !defined(OPTIMIZER_ENABLED)
float alphaMask = POI2D_SAMPLER_PAN(_ClippingMask, _MainTex, poiUV(poiMesh.uv[_ClippingMaskUV], _ClippingMask_ST), _ClippingMaskPan).r;
#else
float alphaMask = 1;
#endif

poiFragData.alpha *= alphaMask;

applyAlphaOptions(poiFragData, poiMesh, poiCam);

#if defined(_LIGHTINGMODE_SHADEMAP) && defined(VIGNETTE_MASKED)
applyShadeMapping(poiFragData, poiMesh, poiLight);
#endif

#ifdef POI_PASS_FORWARDOUTLINE
applyOutlineColor(poiFragData, poiMesh, poiLight);
#endif

#ifdef _SUNDISK_HIGH_QUALITY
applyFlipbook(poiFragData, poiMesh);
#endif

#ifdef DISTORT
applyDissolve(poiFragData, poiMesh);
#endif

poiFragData.finalColor = poiFragData.baseColor;

#ifdef VIGNETTE_MASKED
#ifdef POI_PASS_FORWARDOUTLINE
//UNITY_BRANCH
if (_OutlineLit)
{
applyShading(poiLight, poiFragData, poiMesh, poiCam);
}
else
{
poiFragData.finalColor = poiFragData.baseColor;
}
#else
applyShading(poiLight, poiFragData, poiMesh, poiCam);
#endif
#endif

#ifdef COLOR_GRADING_LOG_VIEW
initAudioBands(poiMods);
#endif

if (_Mode == 1)
{
clip(poiFragData.alpha - _Cutoff);
}

//UNITY_BRANCH
if (_IgnoreFog == 0)
{
UNITY_APPLY_FOG(i.fogCoord, poiFragData.finalColor);
}

//#ifndef UNITY_PASS_SHADOWCASTER
if (_Mode == POI_MODE_OPAQUE)
{
poiFragData.alpha = 1;
}
return float4(poiFragData.finalColor + poiFragData.emission, poiFragData.alpha) + mainTexture * 0.0001;
//#else
//	SHADOW_CASTER_FRAGMENT(i)
//#endif

}

ENDCG

}

Pass
{
Tags { "LightMode" = "ForwardAdd" }

Stencil
{
Ref [_StencilRef]
ReadMask [_StencilReadMask]
WriteMask [_StencilWriteMask]
Comp [_StencilCompareFunction]
Pass [_StencilPassOp]
Fail [_StencilFailOp]
ZFail [_StencilZFailOp]
}

ZWrite Off
Cull [_Cull]
AlphaToMask [_AlphaToCoverage]
ZTest [_ZTest]
ColorMask [_ColorMask]
Offset [_OffsetFactor], [_OffsetUnits]

BlendOp [_BlendOp], [_BlendOpAlpha]
Blend One One

CGPROGRAM

#pragma target 5.0

#pragma shader_feature USER_LUT

//#pragma shader_feature KEYWORD

#pragma shader_feature_local POI_LIGHT_DATA_DEBUG
#pragma shader_feature_local POI_LIGHT_DATA_ADDITIVE_ENABLE
#pragma shader_feature_local POI_VERTEXLIGHT_ON

#pragma shader_feature VIGNETTE_MASKED
#pragma multi_compile_local _LIGHTINGMODE_TEXTURERAMP _LIGHTINGMODE_MATHRAMP _LIGHTINGMODE_SHADEMAP _LIGHTINGMODE_REALISTIC _LIGHTINGMODE_WRAPPED _LIGHTINGMODE_SKIN _LIGHTINGMODE_FLAT

#pragma shader_feature VIGNETTE_CLASSIC

#pragma shader_feature _COLORADDSUBDIFF_ON
#pragma shader_feature COLOR_GRADING_HDR_3D
#pragma shader_feature_local POI_MATCAP0_CUSTOM_NORMAL
#pragma shader_feature_local POI_MATCAP1_CUSTOM_NORMAL

#pragma shader_feature _EMISSION
#pragma shader_feature EFFECT_HUE_VARIATION

#pragma shader_feature COLOR_GRADING_LOG_VIEW

#pragma shader_feature_local POI_BACKFACE

#pragma shader_feature FINALPASS

#pragma shader_feature VIGNETTE
#pragma shader_feature GEOM_TYPE_MESH

#pragma shader_feature GEOM_TYPE_BRANCH
#pragma shader_feature GEOM_TYPE_BRANCH_DETAIL
#pragma shader_feature GEOM_TYPE_FROND
#pragma shader_feature DEPTH_OF_FIELD_COC_VIEW

#pragma shader_feature _SUNDISK_SIMPLE

#pragma shader_feature _GLOSSYREFLECTIONS_OFF

#pragma shader_feature _SUNDISK_HIGH_QUALITY

#pragma shader_feature DISTORT

#pragma multi_compile_fwdadd_fullshadows
#pragma multi_compile_instancing
#pragma multi_compile_fog

// UNITY Includes
#include "UnityCG.cginc"
#include "UnityStandardUtils.cginc"
#include "AutoLight.cginc"
#include "UnityLightingCommon.cginc"
#include "UnityPBSLighting.cginc"
#pragma vertex vert
#pragma fragment frag

#define DielectricSpec float4(0.04, 0.04, 0.04, 1.0 - 0.04)
#define pi float(3.14159265359)

#define POI2D_SAMPLER_PAN(tex, texSampler, uv, pan) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv + _Time.x * pan))
#define POI2D_SAMPLER(tex, texSampler, uv) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv))
#define POI2D_PAN(tex, uv, pan) (tex2D(tex, uv + _Time.x * pan))
#define POI2D(tex, uv) (tex2D(tex, uv))
#define POI_SAMPLE_TEX2D(tex, uv) (UNITY_SAMPLE_TEX2D(tex, uv))
#define POI_SAMPLE_TEX2D_PAN(tex, uv, pan) (UNITY_SAMPLE_TEX2D(tex, uv + _Time.x * pan))

#define POI_SAFE_RGB1 float4(mainTexture.rgb * .0001, 1)
#define POI_SAFE_RGBA mainTexture

#if defined(UNITY_COMPILER_HLSL)
#define PoiInitStruct(type, name) name = (type)0;
#else
#define PoiInitStruct(type, name)
#endif

#define POI_ERROR(poiMesh, gridSize) lerp(float3(1, 0, 1), float3(0, 0, 0), fmod(floor((poiMesh.worldPos.x) * gridSize) + floor((poiMesh.worldPos.y) * gridSize) + floor((poiMesh.worldPos.z) * gridSize), 2) == 0)

#define POI_MODE_OPAQUE 0
#define POI_MODE_CUTOUT 1
#define POI_MODE_FADE 2
#define POI_MODE_TRANSPARENT 3
#define POI_MODE_ADDITIVE 4
#define POI_MODE_SOFTADDITIVE 5
#define POI_MODE_MULTIPLICATIVE 6
#define POI_MODE_2XMULTIPLICATIVE 7
#define POI_MODE_TRANSCLIPPING 9

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;

[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )]
*/
// Map of where features in AudioLink are.
#define ALPASS_DFT                      int2(0, 4)
#define ALPASS_WAVEFORM                 int2(0, 6)
#define ALPASS_AUDIOLINK                int2(0, 0)
#define ALPASS_AUDIOBASS                int2(0, 0)
#define ALPASS_AUDIOLOWMIDS             int2(0, 1)
#define ALPASS_AUDIOHIGHMIDS            int2(0, 2)
#define ALPASS_AUDIOTREBLE              int2(0, 3)
#define ALPASS_AUDIOLINKHISTORY         int2(1, 0)
#define ALPASS_GENERALVU                int2(0, 22)
#define ALPASS_GENERALVU_INSTANCE_TIME  int2(2, 22)
#define ALPASS_GENERALVU_LOCAL_TIME     int2(3, 22)
#define ALPASS_GENERALVU_NETWORK_TIME   int2(4, 22)
#define ALPASS_GENERALVU_PLAYERINFO     int2(6, 22)
#define ALPASS_CCINTERNAL               int2(12, 22)
#define ALPASS_CCSTRIP                  int2(0, 24)
#define ALPASS_CCLIGHTS                 int2(0, 25)
#define ALPASS_AUTOCORRELATOR           int2(0, 27)
#define ALPASS_FILTEREDAUDIOLINK        int2(0, 28)

// Some basic constants to use (Note, these should be compatible with
// future version of AudioLink, but may change.
#define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
#define AUDIOLINK_SAMPLEDATA24          2046
#define AUDIOLINK_EXPBINS               24
#define AUDIOLINK_EXPOCT                10
#define AUDIOLINK_ETOTALBINS (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
#define AUDIOLINK_WIDTH                 128
#define AUDIOLINK_SPS                   48000       // Samples per second
#define AUDIOLINK_ROOTNOTE              0
#define AUDIOLINK_4BAND_FREQFLOOR       0.123
#define AUDIOLINK_4BAND_FREQCEILING     1
#define AUDIOLINK_BOTTOM_FREQUENCY      13.75
#define AUDIOLINK_BASE_AMPLITUDE        2.5
#define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
#define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
#define AUDIOLINK_DFT_Q                 4.0
#define AUDIOLINK_TREBLE_CORRECTION     5.0

// ColorChord constants
#define COLORCHORD_EMAXBIN              192
#define COLORCHORD_IIR_DECAY_1          0.90
#define COLORCHORD_IIR_DECAY_2          0.85
#define COLORCHORD_CONSTANT_DECAY_1     0.01
#define COLORCHORD_CONSTANT_DECAY_2     0.0
#define COLORCHORD_NOTE_CLOSEST         3.0
#define COLORCHORD_NEW_NOTE_GAIN        8.0
#define COLORCHORD_MAX_NOTES            10

// We use glsl_mod for most calculations because it behaves better
// on negative numbers, and in some situations actually outperforms
// HLSL's modf().
#ifndef glsl_mod
#define glsl_mod(x, y) (((x) - (y) * floor((x) / (y))))
#endif

uniform float4               _AudioTexture_TexelSize;

#ifdef SHADER_TARGET_SURFACE_ANALYSIS
#define AUDIOLINK_STANDARD_INDEXING
#endif

// Mechanism to index into texture.
#ifdef AUDIOLINK_STANDARD_INDEXING
sampler2D _AudioTexture;
#define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
#else
uniform Texture2D<float4> _AudioTexture;
SamplerState sampler_AudioTexture;
#define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
#endif

float _Mode;

#ifdef USER_LUT
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionFlowTexture;
float4 _DistortionFlowTexture_ST;
float2 _DistortionFlowTexturePan;
float _DistortionFlowTextureUV;
#endif

#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionFlowTexture1;
float4 _DistortionFlowTexture1_ST;
float2 _DistortionFlowTexture1Pan;
float _DistortionFlowTexture1UV;
#endif

#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionMask;
float4 _DistortionMask_ST;
float2 _DistortionMaskPan;
float _DistortionMaskUV;
#endif

float _DistortionUvToDistort;
float _DistortionStrength;
float _DistortionStrength1;
#endif
float _StereoEnabled;
float _PolarUV;
float2 _PolarCenter;
float _PolarRadialScale;
float _PolarLengthScale;
float _PolarSpiralPower;

float _IgnoreFog;

float4 _Color;
UNITY_DECLARE_TEX2D(_MainTex);
float4 _MainTex_ST;
float2 _MainTexPan;
float _MainTexUV;
float4 _MainTex_TexelSize;
Texture2D _BumpMap;
float4 _BumpMap_ST;
float2 _BumpMapPan;
float _BumpMapUV;
float _BumpScale;
Texture2D _ClippingMask;
float4 _ClippingMask_ST;
float2 _ClippingMaskPan;
float _ClippingMaskUV;
float _Inverse_Clipping;
float _Cutoff;

float _AlphaForceOpaque;
float _AlphaMod;

float _AlphaToCoverage;
float _AlphaSharpennedA2C;
float _AlphaMipScale;

float _AlphaDithering;
float _AlphaDitherGradient;

float _AlphaDistanceFade;
float _AlphaDistanceFadeType;
float _AlphaDistanceFadeMinAlpha;
float _AlphaDistanceFadeMaxAlpha;
float _AlphaDistanceFadeMin;
float _AlphaDistanceFadeMax;

float _AlphaFresnel;
float _AlphaFresnelAlpha;
float _AlphaFresnelSharpness;
float _AlphaFresnelWidth;
float _AlphaFresnelInvert;

float _AlphaAngular;
float _AngleType;
float _AngleCompareTo;
float3 _AngleForwardDirection;
float _CameraAngleMin;
float _CameraAngleMax;
float _ModelAngleMin;
float _ModelAngleMax;
float _AngleMinAlpha;

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

Texture2D _LightingMapsTex;
float4 _LightingMapsTex_ST;
float2 _LightingMapsTexPan;
float _LightingMapsTexUV;
float _LightDataAOStrength;
float _LightDataDetailStrength;
float _LightDataShadowMaskStrength;
// Lighting Data
float _LightingColorMode;
float _LightingMapMode;
float _LightingDirectiongMode;
float3 _LightngForcedDirection;
float _LightingIndirectUsesNormals;
float _LightingCapEnabled;
float _LightingCap;
float _LightingForceColorEnabled;
float3 _LightingForcedColor;
float _LightingCastedShadows;
float _LightingMonochromatic;
float _LightingMinLightBrightness;
// Additive Lighting Data
float _LightingAdditiveLimited;
float _LightingAdditiveLimit;
float _LightingAdditivePassthrough;
// Lighting Data Debug
float _LightingDebugVisualize;

// Toon Lighting
UNITY_DECLARE_TEX2D(_ToonRamp);
float _ShadowOffset;
float _ShadowStrength;
float _LightingIgnoreAmbientColor;
// Math Toon Lighting
float _LightingGradientStart;
float _LightingGradientEnd;
float3 _LightingShadowColor;
float _LightingMathLinearSmooth;
// ShadeMap Lighting
float3 _1st_ShadeColor;
Texture2D _1st_ShadeMap;
float4 _1st_ShadeMap_ST;
float2 _1st_ShadeMapPan;
float _1st_ShadeMapUV;
float _Use_1stShadeMapAlpha_As_ShadowMask;
float _1stShadeMapMask_Inverse;
float _Use_BaseAs1st;
float3 _2nd_ShadeColor;
Texture2D _2nd_ShadeMap;
float4 _2nd_ShadeMap_ST;
float2 _2nd_ShadeMapPan;
float _2nd_ShadeMapUV;
float _Use_2ndShadeMapAlpha_As_ShadowMask;
float _2ndShadeMapMask_Inverse;
float _Use_1stAs2nd;
float _BaseColor_Step;
float _BaseShade_Feather;
float _ShadeColor_Step;
float _1st2nd_Shades_Feather;
// Realistic Lighting
float _LightingStandardSmoothness;
// Skin
sampler2D _SkinLUT;
float _SssScale;
float _SssBumpBlur;
float3 _SssTransmissionAbsorption;
float3 _SssColorBleedAoWeights;
// Additive
float _LightingAdditiveType;
float _LightingAdditiveGradientStart;
float _LightingAdditiveGradientEnd;
float _LightingAdditiveDetailStrength;
float _LightingAdditiveLimitIntensity;
float _LightingAdditiveMaxIntensity;

#ifdef VIGNETTE_CLASSIC
#if defined(PROP_MOCHIEMETALLICMAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _MochieMetallicMap;
float4 _MochieMetallicMap_ST;
float2 _MochieMetallicMapPan;
int _MochieMetallicMapUV;
#endif

#if defined(PROP_MOCHIEROUGHNESSMAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _MochieRoughnessMap;
float4 _MochieRoughnessMap_ST;
float2 _MochieRoughnessMapPan;
int _MochieRoughnessMapUV;
#endif

#if defined(PROP_MOCHIEREFLECTIONMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _MochieReflectionMask;
float4 _MochieReflectionMask_ST;
float2 _MochieReflectionMaskPan;
int _MochieReflectionMaskUV;
#endif

#if defined(PROP_MOCHIESPECULARMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _MochieSpecularMask;
float4 _MochieSpecularMask_ST;
float2 _MochieSpecularMaskPan;
int _MochieSpecularMaskUV;
#endif

float _MochieRoughnessMultiplier;
float _MochieMetallicMultiplier;
float _MochieReflectionStrength;
float _MochieSpecularStrength;
float4 _MochieSpecularTint;
float4 _MochieReflectionTint;

samplerCUBE _MochieReflCube;
float4 _MochieReflCube_HDR;
#endif

#ifdef _COLORADDSUBDIFF_ON
#if defined(PROP_MATCAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _Matcap;
float4 _Matcap_ST;
float2 _MatcapPan;
float _MatcapUV;
#endif
#if defined(PROP_MATCAPMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _MatcapMask;
float4 _MatcapMask_ST;
float2 _MatcapMaskPan;
float _MatcapMaskUV;
#endif
#ifdef POI_MATCAP0_CUSTOM_NORMAL
#if defined(PROP_MATCAP0NORMALMAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _Matcap0NormalMap;
float4 _Matcap0NormalMap_ST;
float2 _Matcap0NormalMapPan;
float _Matcap0NormalMapUV;
#endif
float _Matcap0NormalMapScale;
#endif
float _MatcapMaskInvert;
float _MatcapBorder;
float4 _MatcapColor;
float _MatcapIntensity;
float _MatcapReplace;
float _MatcapMultiply;
float _MatcapAdd;
float _MatcapEnable;
float _MatcapLightMask;
float _MatcapEmissionStrength;
float _MatcapNormal;
float _MatcapHueShiftEnabled;
float _MatcapHueShiftSpeed;
float _MatcapHueShift;
#endif

#ifdef COLOR_GRADING_HDR_3D
#if defined(PROP_MATCAP2) || !defined(OPTIMIZER_ENABLED)
Texture2D _Matcap2;
float4 _Matcap2_ST;
float2 _Matcap2Pan;
float _Matcap2UV;
#endif
#if defined(PROP_MATCAP2MASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _Matcap2Mask;
float4 _Matcap2Mask_ST;
float2 _Matcap2MaskPan;
float _Matcap2MaskUV;
#endif
#ifdef POI_MATCAP1_CUSTOM_NORMAL
#if defined(PROP_MATCAP1NORMALMAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _Matcap1NormalMap;
float4 _Matcap1NormalMap_ST;
float2 _Matcap1NormalMapPan;
float _Matcap1NormalMapUV;
#endif
float _Matcap1NormalMapScale;
#endif
float _Matcap2MaskInvert;
float _Matcap2Border;
float4 _Matcap2Color;
float _Matcap2Intensity;
float _Matcap2Replace;
float _Matcap2Multiply;
float _Matcap2Add;
float _Matcap2Enable;
float _Matcap2LightMask;
float _Matcap2EmissionStrength;
float _Matcap2Normal;
float _Matcap2HueShiftEnabled;
float _Matcap2HueShiftSpeed;
float _Matcap2HueShift;
#endif

#ifdef COLOR_GRADING_LOG_VIEW
float _AudioLinkDelay;
float _AudioLinkAnimToggle;
#endif

#ifdef POI_BACKFACE
float _BackFaceEnabled;
float _BackFaceDetailIntensity;
float _BackFaceEmissionStrength;
float2 _BackFacePanning;
float4 _BackFaceColor;
float _BackFaceReplaceAlpha;
float _BackFaceAlpha;

#if defined(PROP_BACKFACETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _BackFaceTexture;
#endif
float4 _BackFaceTexture_ST;
float2 _BackFaceTexturePan;
float _BackFaceTextureUV;

#if defined(PROP_BACKFACEMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _BackFaceMask;
#endif
float4 _BackFaceMask_ST;
float2 _BackFaceMaskPan;
float _BackFaceMaskUV;

float _BackFaceHueShiftEnabled;
float _BackFaceHueShift;
float _BackFaceHueShiftSpeed;
#endif

//TODO detail strength stuff

#ifdef FINALPASS
#if defined(PROP_DETAILMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DetailMask;
#endif
float4 _DetailMask_ST;
float2 _DetailMaskPan;
float _DetailMaskUV;
#if defined(PROP_DETAILNORMALMAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _DetailNormalMap;
#endif
float4 _DetailNormalMap_ST;
float2 _DetailNormalMapPan;
float _DetailNormalMapUV;
#if defined(PROP_DETAILTEX) || !defined(OPTIMIZER_ENABLED)
Texture2D _DetailTex;
#endif
float4 _DetailTex_ST;
float2 _DetailTexPan;
float _DetailTexUV;

float3 _DetailTint;
float _DetailTexIntensity;
float _DetailBrightness;
float _DetailNormalMapScale;
#endif

#ifdef VIGNETTE
#if defined(PROP_RGBMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _RGBMask;
#endif
float4 _RGBMask_ST;
float2 _RGBMaskPan;
float _RGBMaskUV;

#if defined(PROP_REDTEXURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _RedTexure;
#endif
float4 _RedTexure_ST;
float2 _RedTexurePan;
float _RedTexureUV;

#if defined(PROP_GREENTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _GreenTexture;
#endif
float4 _GreenTexture_ST;
float2 _GreenTexturePan;
float _GreenTextureUV;

#if defined(PROP_BLUETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _BlueTexture;
#endif
float4 _BlueTexture_ST;
float2 _BlueTexturePan;
float _BlueTextureUV;

#if defined(PROP_ALPHATEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _AlphaTexture;
#endif
float4 _AlphaTexture_ST;
float2 _AlphaTexturePan;
float _AlphaTextureUV;

#ifdef GEOM_TYPE_MESH
#if defined(PROP_RGBNORMALR) || !defined(OPTIMIZER_ENABLED)
Texture2D _RgbNormalR;
#endif
float4 _RgbNormalR_ST;
float2 _RgbNormalRPan;
float _RgbNormalRUV;
float _RgbNormalRScale;

#if defined(PROP_RGBNORMALG) || !defined(OPTIMIZER_ENABLED)
Texture2D _RgbNormalG;
#endif
float4 _RgbNormalG_ST;
float2 _RgbNormalGPan;
float _RgbNormalGUV;
float _RgbNormalGScale;

#if defined(PROP_RGBNORMALB) || !defined(OPTIMIZER_ENABLED)
Texture2D _RgbNormalB;
#endif
float4 _RgbNormalB_ST;
float2 _RgbNormalBPan;
float _RgbNormalBUV;
float _RgbNormalBScale;

#if defined(PROP_RGBNORMALA) || !defined(OPTIMIZER_ENABLED)
Texture2D _RgbNormalA;
#endif
float4 _RgbNormalA_ST;
float2 _RgbNormalAPan;
float _RgbNormalAUV;
float _RgbNormalAScale;

float _RgbNormalsEnabled;
#endif

float4 _RedColor;
float4 _GreenColor;
float4 _BlueColor;
float4 _AlphaColor;

float _RGBBlendMultiplicative;
float _RGBUseVertexColors;
float _RGBNormalBlend;
#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

Texture2D _DecalMask;
float4 _DecalMask_ST;
float2 _DecalMaskPan;
float _DecalMaskUV;

#ifdef COLOR_GRADING_LOG_VIEW
// Audio Link
half _AudioLinkDecal0ScaleBand;
float4 _AudioLinkDecal0Scale;
half _AudioLinkDecal0RotationBand;
float2 _AudioLinkDecal0Rotation;
half _AudioLinkDecal0AlphaBand;
float2 _AudioLinkDecal0Alpha;
half _AudioLinkDecal0EmissionBand;
float2 _AudioLinkDecal0Emission;

half _AudioLinkDecal1ScaleBand;
float4 _AudioLinkDecal1Scale;
half _AudioLinkDecal1RotationBand;
float2 _AudioLinkDecal1Rotation;
half _AudioLinkDecal1AlphaBand;
float2 _AudioLinkDecal1Alpha;
half _AudioLinkDecal1EmissionBand;
float2 _AudioLinkDecal1Emission;

half _AudioLinkDecal2ScaleBand;
float4 _AudioLinkDecal2Scale;
half _AudioLinkDecal2RotationBand;
float2 _AudioLinkDecal2Rotation;
half _AudioLinkDecal2AlphaBand;
float2 _AudioLinkDecal2Alpha;
half _AudioLinkDecal2EmissionBand;
float2 _AudioLinkDecal2Emission;

half _AudioLinkDecal3ScaleBand;
float4 _AudioLinkDecal3Scale;
half _AudioLinkDecal3RotationBand;
float2 _AudioLinkDecal3Rotation;
half _AudioLinkDecal3AlphaBand;
float2 _AudioLinkDecal3Alpha;
half _AudioLinkDecal3EmissionBand;
float2 _AudioLinkDecal3Emission;
#endif

#ifdef GEOM_TYPE_BRANCH
Texture2D _DecalTexture;
float4 _DecalTexture_ST;
float2 _DecalTexturePan;
float _DecalTextureUV;

float4 _DecalColor;
fixed _DecalTiled;
float _DecalBlendType;
half _DecalRotation;
half2 _DecalScale;
half2 _DecalPosition;
half _DecalRotationSpeed;
float _DecalEmissionStrength;
float _DecalBlendAlpha;
float _DecalHueShiftEnabled;
float _DecalHueShift;
float _DecalHueShiftSpeed;
float _Decal0Depth;
#endif

#ifdef GEOM_TYPE_BRANCH_DETAIL
Texture2D _DecalTexture1;
float4 _DecalTexture1_ST;
float2 _DecalTexture1Pan;
float _DecalTexture1UV;

float4 _DecalColor1;
fixed _DecalTiled1;
float _DecalBlendType1;
half _DecalRotation1;
half2 _DecalScale1;
half2 _DecalPosition1;
half _DecalRotationSpeed1;
float _DecalEmissionStrength1;
float _DecalBlendAlpha1;
float _DecalHueShiftEnabled1;
float _DecalHueShift1;
float _DecalHueShiftSpeed1;
float _Decal1Depth;
#endif

#ifdef GEOM_TYPE_FROND
Texture2D _DecalTexture2;
float4 _DecalTexture2_ST;
float2 _DecalTexture2Pan;
float _DecalTexture2UV;
float4 _DecalColor2;
fixed _DecalTiled2;
float _DecalBlendType2;
half _DecalRotation2;
half2 _DecalScale2;
half2 _DecalPosition2;
half _DecalRotationSpeed2;
float _DecalEmissionStrength2;
float _DecalBlendAlpha2;
float _DecalHueShiftEnabled2;
float _DecalHueShift2;
float _DecalHueShiftSpeed2;
float _Decal2Depth;
#endif

#ifdef DEPTH_OF_FIELD_COC_VIEW
Texture2D _DecalTexture3;
float4 _DecalTexture3_ST;
float2 _DecalTexture3Pan;
float _DecalTexture3UV;
float4 _DecalColor3;
fixed _DecalTiled3;
float _DecalBlendType3;
half _DecalRotation3;
half2 _DecalScale3;
half2 _DecalPosition3;
half _DecalRotationSpeed3;
float _DecalEmissionStrength3;
float _DecalBlendAlpha3;
float _DecalHueShiftEnabled3;
float _DecalHueShift3;
float _DecalHueShiftSpeed3;
float _Decal3Depth;
#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

#ifdef _SUNDISK_SIMPLE
half3 _GlitterColor;
float2 _GlitterPan;
half _GlitterSpeed;
half _GlitterBrightness;
float _GlitterFrequency;
float _GlitterJitter;
half _GlitterSize;
half _GlitterContrast;
half _GlitterAngleRange;
half _GlitterMinBrightness;
half _GlitterBias;
fixed _GlitterUseSurfaceColor;
float _GlitterBlendType;
float _GlitterMode;
float _GlitterShape;
float _GlitterCenterSize;
float _glitterFrequencyLinearEmissive;
float _GlitterJaggyFix;
float _GlitterTextureRotation;
float2 _GlitterUVPanning;

float _GlitterHueShiftEnabled;
float _GlitterHueShiftSpeed;
float _GlitterHueShift;
float _GlitterHideInShadow;

float _GlitterRandomColors;
float2 _GlitterMinMaxSaturation;
float2 _GlitterMinMaxBrightness;
float _GlitterRandomSize;
float4 _GlitterMinMaxSize;
float _GlitterRandomRotation;

#if defined(PROP_GLITTERMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _GlitterMask;
#endif
float4 _GlitterMask_ST;
float2 _GlitterMaskPan;
float _GlitterMaskUV;
#if defined(PROP_GLITTERCOLORMAP) || !defined(OPTIMIZER_ENABLED)
Texture2D _GlitterColorMap;
#endif
float4 _GlitterColorMap_ST;
float2 _GlitterColorMapPan;
float _GlitterColorMapUV;
#if defined(PROP_GLITTERTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _GlitterTexture;
#endif
float4 _GlitterTexture_ST;
float2 _GlitterTexturePan;
float _GlitterTextureUV;
#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

#ifdef _GLOSSYREFLECTIONS_OFF
float4 _RimLightColor;
float _RimLightingInvert;
float _RimWidth;
float _RimStrength;
float _RimSharpness;
float _RimLightColorBias;
float _ShadowMix;
float _ShadowMixThreshold;
float _ShadowMixWidthMod;
float _EnableRimLighting;
float _RimBrighten;
float _RimLightNormal;
float _RimHueShiftEnabled;
float _RimHueShiftSpeed;
float _RimHueShift;
float _RimWidthNoiseStrength;

#if defined(PROP_RIMTEX) || !defined(OPTIMIZER_ENABLED)
Texture2D _RimTex;
#endif
float4 _RimTex_ST;
float2 _RimTexPan;
float _RimTexUV;
#if defined(PROP_RIMMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _RimMask;
#endif
float4 _RimMask_ST;
float2 _RimMaskPan;
float _RimMaskUV;
#if defined(PROP_RIMWIDTHNOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _RimWidthNoiseTexture;
#endif
float4 _RimWidthNoiseTexture_ST;
float2 _RimWidthNoiseTexturePan;
float _RimWidthNoiseTextureUV;

#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

#ifdef _SUNDISK_HIGH_QUALITY

UNITY_DECLARE_TEX2DARRAY(_FlipbookTexArray);
float4 _FlipbookTexArray_ST;

float4 _FlipbookColor;
float _FlipbookFPS;
uint _FlipbookTotalFrames;
float4 _FlipbookScaleOffset;
float _FlipbookTiled;
int _FlipbookCurrentFrame;
float _FlipbookEmissionStrength;
float _FlipbookRotation;
float _EnableFlipbook;
uint _FlipbookTexArrayUV;
float _FlipbookAlphaControlsFinalAlpha;
float _FlipbookRotationSpeed;
float _FlipbookIntensityControlsAlpha;
float _FlipbookColorReplaces;
float2 _FlipbookTexArrayPan;

// blending
float _FlipbookReplace;
float _FlipbookMultiply;
float _FlipbookAdd;

#if defined(PROP_FLIPBOOKMASSK) || !defined(OPTIMIZED_ENABLED)
Texture2D _FlipbookMask;
#endif
float4 _FlipbookMask_ST;
float2 _FlipbookMaskPan;
float _FlipbookMaskUV;

// anim
uint _FlipbookMovementType;
float4 _FlipbookStartEndOffset;
float _FlipbookMovementSpeed;

// Crossfade
float _FlipbookCrossfadeEnabled;
float2 _FlipbookCrossfadeRange;

// Hueshift
float _FlipbookHueShiftEnabled;
float _FlipbookHueShiftSpeed;
float _FlipbookHueShift;
#endif

#ifdef DISTORT
float _DissolveType;
float _DissolveEdgeWidth;
float4 _DissolveEdgeColor;
sampler2D _DissolveEdgeGradient;
float4 _DissolveEdgeGradient_ST;
float2 _DissolveEdgeGradientPan;
float _DissolveEdgeGradientUV;
float _DissolveEdgeEmission;
float4 _DissolveTextureColor;

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveToTexture;
#endif
float4 _DissolveToTexture_ST;
float2 _DissolveToTexturePan;
float _DissolveToTextureUV;

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveNoiseTexture;
#endif
float4 _DissolveNoiseTexture_ST;
float2 _DissolveNoiseTexturePan;
float _DissolveNoiseTextureUV;

#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveDetailNoise;
#endif
float4 _DissolveDetailNoise_ST;
float2 _DissolveDetailNoisePan;
float _DissolveDetailNoiseUV;

#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveMask;
#endif
float4 _DissolveMask_ST;
float2 _DissolveMaskPan;
float _DissolveMaskUV;

float _DissolveMaskInvert;
float _DissolveAlpha;
float _ContinuousDissolve;
float _DissolveDetailStrength;
float _DissolveEdgeHardness;
float _DissolveInvertNoise;
float _DissolveInvertDetailNoise;
float _DissolveToEmissionStrength;

// Point to Point
float _DissolveP2PWorldLocal;
float _DissolveP2PEdgeLength;
float4 _DissolveStartPoint;
float4 _DissolveEndPoint;

// World Dissolve
float _DissolveWorldShape;
float4 _DissolveShapePosition;
float4 _DissolveShapeRotation;
float _DissolveShapeScale;
float _DissolveInvertShape;
float _DissolveShapeEdgeLength;

float _DissolveAlpha0;
float _DissolveAlpha1;
float _DissolveAlpha2;
float _DissolveAlpha3;
float _DissolveAlpha4;
float _DissolveAlpha5;
float _DissolveAlpha6;
float _DissolveAlpha7;
float _DissolveAlpha8;
float _DissolveAlpha9;
// Masking
float _DissolveEmissionSide;
float _DissolveEmission1Side;
float _DissolveUseVertexColors;

float4 edgeColor;
float edgeAlpha;
float dissolveAlpha;
float4 dissolveToTexture;

float _DissolveHueShiftEnabled;
float _DissolveHueShiftSpeed;
float _DissolveHueShift;
float _DissolveEdgeHueShiftEnabled;
float _DissolveEdgeHueShiftSpeed;
float _DissolveEdgeHueShift;
#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

//Structs
struct appdata
{
float4 vertex : POSITION;
float3 normal : NORMAL;
float4 tangent : TANGENT;
float4 color : COLOR;
float2 uv0 : TEXCOORD0;
float2 uv1 : TEXCOORD1;
float2 uv2 : TEXCOORD2;
float2 uv3 : TEXCOORD3;
uint vertexId : SV_VertexID;
UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct v2f
{
float4 pos : SV_POSITION;
float2 uv[4] : TEXCOORD0;
float3 objNormal : TEXCOORD4;
float3 normal : TEXCOORD5;
float3 tangent : TEXCOORD6;
float3 binormal : TEXCOORD7;
float4 worldPos : TEXCOORD8;
float4 localPos : TEXCOORD9;
float3 objectPos : TEXCOORD10;
float4 vertexColor : TEXCOORD11;
float3 tangentViewDir : TEXCOORD12;
float4 lightmapUV : TEXCOORD13;
float4 grabPos: TEXCOORD14;
UNITY_SHADOW_COORDS(15)
UNITY_FOG_COORDS(16)
UNITY_VERTEX_INPUT_INSTANCE_ID
UNITY_VERTEX_OUTPUT_STEREO
};

struct PoiMesh
{

// 0 Vertex normal
// 1 Fragment normal
float3 normals[2];
float3 objNormal;
float3 tangentSpaceNormal;
float3 binormal;
float3 tangent;
float3 worldPos;
float3 localPos;
float3 objectPosition;
float isFrontFace;
float4 vertexColor;
float4 lightmapUV;
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 7 Distorted UV
float2 uv[8];
};

struct PoiCam
{
float3 viewDir;
float3 forwardDir;
float3 worldPos;
float distanceToVert;
float2 clipPos;
float3 reflectionDir;
float3 tangentViewDir;
float4 grabPos;
float2 screenUV;
float vDotN;

};

struct PoiMods
{
float4 Mask;
float4 audioLink;
float audioLinkAvailable;
float audioLinkVersion;
float4 audioLinkTexture;
float2 detailMask;
float2 backFaceDetailIntensity;
};

struct PoiLight
{

float3 direction;
float attenuation;
float attenuationStrength;
float3 directColor;
float3 indirectColor;
float occlusion;
float shadowMask;
float detailShadow;
float3 halfDir;
float lightMap;
float3 rampedLightMap;
float nDotL;
float nDotV;
float nDotH;
float lDotv;
float lDotH;
float nDotLSaturated;
float nDotLNormalized;
#ifdef UNITY_PASS_FORWARDADD
float additiveShadow;
#endif
float3 finalLighting;

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
// Non Important Lights
float4 vDotNL;
float3 vColor[4];
float4 vCorrectedDotNL;
float4 vAttenuation;
float4 vAttenuationDotNL;
float3 vPosition[4];
float3 vDirection[4];
float3 vFinalLighting;
float3 vHalfDir[4];
half4 vDotNH;
half4 vDotLH;
#endif

};

struct PoiVertexLights
{

float3 direction;
float3 color;
float attenuation;
};

struct PoiFragData
{
float3 baseColor;
float3 finalColor;
float alpha;
float3 emission;
};

float2 poiUV(float2 uv, float4 tex_st)
{
return uv * tex_st.xy + tex_st.zw;
}

//Lighting Helpers
float calculateluminance(float3 color)
{
return color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
}

/*
* MIT License
*
* Copyright (c) 2018 s-ilent
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

float shEvaluateDiffuseL1Geomerics_local(float L0, float3 L1, float3 n)
{
// average energy
float R0 = max(0, L0);

// avg direction of incoming light
float3 R1 = 0.5f * L1;

// directional brightness
float lenR1 = length(R1);

// linear angle between normal and direction 0-1
//float q = 0.5f * (1.0f + dot(R1 / lenR1, n));
//float q = dot(R1 / lenR1, n) * 0.5 + 0.5;
float q = dot(normalize(R1), n) * 0.5 + 0.5;
q = saturate(q); // Thanks to ScruffyRuffles for the bug identity.

// power for q
// lerps from 1 (linear) to 3 (cubic) based on directionality
float p = 1.0f + 2.0f * lenR1 / R0;

// dynamic range constant
// should vary between 4 (highly directional) and 0 (ambient)
float a = (1.0f - lenR1 / R0) / (1.0f + lenR1 / R0);

return R0 * (a + (1.0f - a) * (p + 1.0f) * pow(q, p));
}

half3 BetterSH9(half4 normal)
{
float3 indirect;
float3 L0 = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
indirect.r = shEvaluateDiffuseL1Geomerics_local(L0.r, unity_SHAr.xyz, normal.xyz);
indirect.g = shEvaluateDiffuseL1Geomerics_local(L0.g, unity_SHAg.xyz, normal.xyz);
indirect.b = shEvaluateDiffuseL1Geomerics_local(L0.b, unity_SHAb.xyz, normal.xyz);
indirect = max(0, indirect);
indirect += SHEvalLinearL2(normal);
return indirect;
}

// Silent's code ends here

float3 getCameraForward()
{
#if UNITY_SINGLE_PASS_STEREO
float3 p1 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 1, 1));
float3 p2 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 0, 1));
#else
float3 p1 = mul(unity_CameraToWorld, float4(0, 0, 1, 1)).xyz;
float3 p2 = mul(unity_CameraToWorld, float4(0, 0, 0, 1)).xyz;
#endif
return normalize(p2 - p1);
}

half3 GetSHLength()
{
half3 x, x1;
x.r = length(unity_SHAr);
x.g = length(unity_SHAg);
x.b = length(unity_SHAb);
x1.r = length(unity_SHBr);
x1.g = length(unity_SHBg);
x1.b = length(unity_SHBb);
return x + x1;
}

float3 BoxProjection(float3 direction, float3 position, float4 cubemapPosition, float3 boxMin, float3 boxMax)
{
#if UNITY_SPECCUBE_BOX_PROJECTION
//UNITY_BRANCH
if (cubemapPosition.w > 0)
{
float3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
float scalar = min(min(factors.x, factors.y), factors.z);
direction = direction * scalar + (position - cubemapPosition.xyz);
}
#endif
return direction;
}

float poiMax(float2 i)
{
return max(i.x, i.y);
}

float poiMax(float3 i)
{
return max(max(i.x, i.y), i.z);
}

float poiMax(float4 i)
{
return max(max(max(i.x, i.y), i.z), i.w);
}

float3 calculateNormal(in float3 baseNormal, in PoiMesh poiMesh, in Texture2D normalTexture, in float4 normal_ST, in float2 normalPan, in float normalUV, in float normalIntensity)
{
float3 normal = UnpackScaleNormal(POI2D_SAMPLER_PAN(normalTexture, _MainTex, poiUV(poiMesh.uv[normalUV], normal_ST), normalPan), normalIntensity);
return normalize(
normal.x * poiMesh.tangent +
normal.y * poiMesh.binormal +
normal.z * baseNormal
);
}

float remap(float x, float minOld, float maxOld, float minNew = 0, float maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float2 remap(float2 x, float2 minOld, float2 maxOld, float2 minNew = 0, float2 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float3 remap(float3 x, float3 minOld, float3 maxOld, float3 minNew = 0, float3 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float4 remap(float4 x, float4 minOld, float4 maxOld, float4 minNew = 0, float4 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float remapClamped(float minOld, float maxOld, float x, float minNew = 0, float maxNew = 1)
{
return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), 0, 1);
}

float2 calcParallax(in float height, in PoiCam poiCam)
{
return((height * - 1) + 1) * (poiCam.tangentViewDir.xy / poiCam.tangentViewDir.z);
}

/*
0: Zero	                float4(0.0, 0.0, 0.0, 0.0),
1: One	                float4(1.0, 1.0, 1.0, 1.0),
2: DstColor	            destinationColor,
3: SrcColor	            sourceColor,
4: OneMinusDstColor	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
5: SrcAlpha	            sourceColor.aaaa,
6: OneMinusSrcColor	    float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
7: DstAlpha	            destinationColor.aaaa,
8: OneMinusDstAlpha	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor.,
9: SrcAlphaSaturate     saturate(sourceColor.aaaa),
10: OneMinusSrcAlpha	float4(1.0, 1.0, 1.0, 1.0) - sourceColor.aaaa,
*/

float4 poiBlend(const float sourceFactor, const  float4 sourceColor, const  float destinationFactor, const  float4 destinationColor, const float4 blendFactor)
{
float4 sA = 1 - blendFactor;
const float4 blendData[11] = {
float4(0.0, 0.0, 0.0, 0.0),
float4(1.0, 1.0, 1.0, 1.0),
destinationColor,
sourceColor,
float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
sA,
float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
sA,
float4(1.0, 1.0, 1.0, 1.0) - sA,
saturate(sourceColor.aaaa),
1 - sA,
};

return lerp(blendData[sourceFactor] * sourceColor + blendData[destinationFactor] * destinationColor, sourceColor, sA);
}

// Average
float3 blendAverage(float3 base, float3 blend)
{
return(base + blend) / 2.0;
}

// Color burn
float blendColorBurn(float base, float blend)
{
return(blend == 0.0)?blend : max((1.0 - ((1.0 - base) / blend)), 0.0);
}

float3 blendColorBurn(float3 base, float3 blend)
{
return float3(blendColorBurn(base.r, blend.r), blendColorBurn(base.g, blend.g), blendColorBurn(base.b, blend.b));
}

// Color Dodge
float blendColorDodge(float base, float blend)
{
return(blend == 1.0)?blend : min(base / (1.0 - blend), 1.0);
}

float3 blendColorDodge(float3 base, float3 blend)
{
return float3(blendColorDodge(base.r, blend.r), blendColorDodge(base.g, blend.g), blendColorDodge(base.b, blend.b));
}

// Darken
float blendDarken(float base, float blend)
{
return min(blend, base);
}

float3 blendDarken(float3 base, float3 blend)
{
return float3(blendDarken(base.r, blend.r), blendDarken(base.g, blend.g), blendDarken(base.b, blend.b));
}

// Exclusion
float3 blendExclusion(float3 base, float3 blend)
{
return base + blend - 2.0 * base * blend;
}

// Reflect
float blendReflect(float base, float blend)
{
return(blend == 1.0)?blend : min(base * base / (1.0 - blend), 1.0);
}

float3 blendReflect(float3 base, float3 blend)
{
return float3(blendReflect(base.r, blend.r), blendReflect(base.g, blend.g), blendReflect(base.b, blend.b));
}

// Glow
float3 blendGlow(float3 base, float3 blend)
{
return blendReflect(blend, base);
}

// Overlay
float blendOverlay(float base, float blend)
{
return base < 0.5?(2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
}

float3 blendOverlay(float3 base, float3 blend)
{
return float3(blendOverlay(base.r, blend.r), blendOverlay(base.g, blend.g), blendOverlay(base.b, blend.b));
}

// Hard Light
float3 blendHardLight(float3 base, float3 blend)
{
return blendOverlay(blend, base);
}

// Vivid light
float blendVividLight(float base, float blend)
{
return(blend < 0.5)?blendColorBurn(base, (2.0 * blend)) : blendColorDodge(base, (2.0 * (blend - 0.5)));
}

float3 blendVividLight(float3 base, float3 blend)
{
return float3(blendVividLight(base.r, blend.r), blendVividLight(base.g, blend.g), blendVividLight(base.b, blend.b));
}

// Hard mix
float blendHardMix(float base, float blend)
{
return(blendVividLight(base, blend) < 0.5)?0.0 : 1.0;
}

float3 blendHardMix(float3 base, float3 blend)
{
return float3(blendHardMix(base.r, blend.r), blendHardMix(base.g, blend.g), blendHardMix(base.b, blend.b));
}

// Lighten
float blendLighten(float base, float blend)
{
return max(blend, base);
}

float3 blendLighten(float3 base, float3 blend)
{
return float3(blendLighten(base.r, blend.r), blendLighten(base.g, blend.g), blendLighten(base.b, blend.b));
}

// Linear Burn
float blendLinearBurn(float base, float blend)
{
// Note : Same implementation as BlendSubtractf
return max(base + blend - 1.0, 0.0);
}

float3 blendLinearBurn(float3 base, float3 blend)
{
// Note : Same implementation as BlendSubtract
return max(base + blend - float3(1.0, 1.0, 1.0), float3(0.0, 0.0, 0.0));
}

// Linear Dodge
float blendLinearDodge(float base, float blend)
{
// Note : Same implementation as BlendAddf
return min(base + blend, 1.0);
}

float3 blendLinearDodge(float3 base, float3 blend)
{
// Note : Same implementation as BlendAdd
return min(base + blend, float3(1.0, 1.0, 1.0));
}

// Linear light
float blendLinearLight(float base, float blend)
{
return blend < 0.5?blendLinearBurn(base, (2.0 * blend)) : blendLinearDodge(base, (2.0 * (blend - 0.5)));
}

float3 blendLinearLight(float3 base, float3 blend)
{
return float3(blendLinearLight(base.r, blend.r), blendLinearLight(base.g, blend.g), blendLinearLight(base.b, blend.b));
}

// Multiply
float3 blendMultiply(float3 base, float3 blend)
{
return base * blend;
}

// Negation
float3 blendNegation(float3 base, float3 blend)
{
return float3(1.0, 1.0, 1.0) - abs(float3(1.0, 1.0, 1.0) - base - blend);
}

// Normal
float3 blendNormal(float3 base, float3 blend)
{
return blend;
}

// Phoenix
float3 blendPhoenix(float3 base, float3 blend)
{
return min(base, blend) - max(base, blend) + float3(1.0, 1.0, 1.0);
}

// Pin light
float blendPinLight(float base, float blend)
{
return(blend < 0.5)?blendDarken(base, (2.0 * blend)) : blendLighten(base, (2.0 * (blend - 0.5)));
}

float3 blendPinLight(float3 base, float3 blend)
{
return float3(blendPinLight(base.r, blend.r), blendPinLight(base.g, blend.g), blendPinLight(base.b, blend.b));
}

// Screen
float blendScreen(float base, float blend)
{
return 1.0 - ((1.0 - base) * (1.0 - blend));
}

float3 blendScreen(float3 base, float3 blend)
{
return float3(blendScreen(base.r, blend.r), blendScreen(base.g, blend.g), blendScreen(base.b, blend.b));
}

// Soft Light
float blendSoftLight(float base, float blend)
{
return(blend < 0.5)?(2.0 * base * blend + base * base * (1.0 - 2.0 * blend)) : (sqrt(base) * (2.0 * blend - 1.0) + 2.0 * base * (1.0 - blend));
}

float3 blendSoftLight(float3 base, float3 blend)
{
return float3(blendSoftLight(base.r, blend.r), blendSoftLight(base.g, blend.g), blendSoftLight(base.b, blend.b));
}

// Subtract
float blendSubtract(float base, float blend)
{
return max(base - blend, 0.0);
}

float3 blendSubtract(float3 base, float3 blend)
{
return max(base - blend, 0.0);
}

// Difference
float blendDifference(float base, float blend)
{
return abs(base - blend);
}

float3 blendDifference(float3 base, float3 blend)
{
return abs(base - blend);
}

// Divide
float blendDivide(float base, float blend)
{
return base / max(blend, 0.0001);
}

float3 blendDivide(float3 base, float3 blend)
{
return base / max(blend, 0.0001);
}

float3 customBlend(float3 base, float3 blend, float blendType)
{
float3 ret = 0;
switch(blendType)
{
case 0:
{
ret = blendNormal(base, blend);
break;
}
case 1:
{
ret = blendDarken(base, blend);
break;
}
case 2:
{
ret = blendMultiply(base, blend);
break;
}
case 3:
{
ret = blendColorBurn(base, blend);
break;
}
case 4:
{
ret = blendLinearBurn(base, blend);
break;
}
case 5:
{
ret = blendLighten(base, blend);
break;
}
case 6:
{
ret = blendScreen(base, blend);
break;
}
case 7:
{
ret = blendColorDodge(base, blend);
break;
}
case 8:
{
ret = blendLinearDodge(base, blend);
break;
}
case 9:
{
ret = blendOverlay(base, blend);
break;
}
case 10:
{
ret = blendSoftLight(base, blend);
break;
}
case 11:
{
ret = blendHardLight(base, blend);
break;
}
case 12:
{
ret = blendVividLight(base, blend);
break;
}
case 13:
{
ret = blendLinearLight(base, blend);
break;
}
case 14:
{
ret = blendPinLight(base, blend);
break;
}
case 15:
{
ret = blendHardMix(base, blend);
break;
}
case 16:
{
ret = blendDifference(base, blend);
break;
}
case 17:
{
ret = blendExclusion(base, blend);
break;
}
case 18:
{
ret = blendSubtract(base, blend);
break;
}
case 19:
{
ret = blendDivide(base, blend);
break;
}
}
return ret;
}

float random(float2 p)
{
return frac(sin(dot(p, float2(12.9898, 78.2383))) * 43758.5453123);
}

float2 random2(float2 p)
{
return frac(sin(float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)))) * 43758.5453);
}

float3 random3(float3 p)
{
return frac(sin(float3(dot(p, float3(127.1, 311.7, 248.6)), dot(p, float3(269.5, 183.3, 423.3)), dot(p, float3(248.3, 315.9, 184.2)))) * 43758.5453);
}

float3 randomFloat3(float2 Seed, float maximum)
{
return(.5 + float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed), float2(12.9898, 78.233))) * 43758.5453)
) * .5) * (maximum);
}

float3 randomFloat3Range(float2 Seed, float Range)
{
return(float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
) * 2 - 1) * Range;
}

float3 randomFloat3WiggleRange(float2 Seed, float Range, float wiggleSpeed)
{
float3 rando = (float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
) * 2 - 1);
float speed = 1 + wiggleSpeed;
return float3(sin((_Time.x + rando.x * pi) * speed), sin((_Time.x + rando.y * pi) * speed), sin((_Time.x + rando.z * pi) * speed)) * Range;
}

void Unity_RandomRange_float(float2 Seed, float Min, float Max, out float Out)
{
float randomno = frac(sin(dot(Seed, float2(12.9898, 78.233))) * 43758.5453);
Out = lerp(Min, Max, randomno);
}

//art

// Based on unity shader graph code

// * Adjustments * //

/*
* Channel Mixer
*
* Controls the amount each of the channels of input In contribute to each of the channels of output Out. The slider
* parameters on the node control the contribution of each of the input channels. The toggle button parameters control
* which of the output channels is currently being edited. Slider controls for editing the contribution of each input
* channnel range between -2 and 2.
*/
void poiChannelMixer(float3 In, float3 _ChannelMixer_Red, float3 _ChannelMixer_Green, float3 _ChannelMixer_Blue, out float3 Out)
{
Out = float3(dot(In, _ChannelMixer_Red), dot(In, _ChannelMixer_Green), dot(In, _ChannelMixer_Blue));
}

/*
* Contrast
*
* Adjusts the contrast of input In by the amount of input Contrast. A Contrast value of 1 will return the input
* unaltered. A Contrast value of 0 will return the midpoint of the input
*/
void poiContrast(float3 In, float Contrast, out float3 Out)
{
float midpoint = pow(0.5, 2.2);
Out = (In - midpoint) * Contrast + midpoint;
}

/*
* Invert Colors
*
* Inverts the colors of input In on a per channel basis. This Node assumes all input values are in the range 0 - 1.
*/
void poiInvertColors(float4 In, float4 InvertColors, out float4 Out)
{
Out = abs(InvertColors - In);
}

/*
* Replace Color
*
* Replaces values in input In equal to input From to the value of input To. Input Range can be used to define a
* wider range of values around input From to replace. Input Fuzziness can be used to soften the edges around the
* selection similar to anti-aliasing.
*/
void poiReplaceColor(float3 In, float3 From, float3 To, float Range, float Fuzziness, out float3 Out)
{
float Distance = distance(From, In);
Out = lerp(To, In, saturate((Distance - Range) / max(Fuzziness, 0.00001)));
}

/*
* Saturation
*
* Adjusts the saturation of input In by the amount of input Saturation. A Saturation value of 1 will return the input
* unaltered. A Saturation value of 0 will return the input completely desaturated.
*/
void poiSaturation(float3 In, float Saturation, out float3 Out)
{
float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
Out = luma.xxx + Saturation.xxx * (In - luma.xxx);
}

/*
* Dither Node
*
* Dither is an intentional form of noise used to randomize quantization error. It is used to prevent large-scale
* patterns such as color banding in images. The Dither node applies dithering in screen-space to ensure a uniform
* distribution of the pattern. This can be adjusted by connecting another node to input Screen Position.
*
* This Node is commonly used as an input to Alpha Clip Threshold on a Master Node to give the appearance of
* transparency to an opaque object. This is useful for creating objects that appear to be transparent but have
* the advantages of rendering as opaque, such as writing depth and/or being rendered in deferred.
*/
void poiDither(float4 In, float4 ScreenPosition, out float4 Out)
{
float2 uv = ScreenPosition.xy * _ScreenParams.xy;
float DITHER_THRESHOLDS[16] = {
1.0 / 17.0, 9.0 / 17.0, 3.0 / 17.0, 11.0 / 17.0,
13.0 / 17.0, 5.0 / 17.0, 15.0 / 17.0, 7.0 / 17.0,
4.0 / 17.0, 12.0 / 17.0, 2.0 / 17.0, 10.0 / 17.0,
16.0 / 17.0, 8.0 / 17.0, 14.0 / 17.0, 6.0 / 17.0
};
uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
Out = In - DITHER_THRESHOLDS[index];
}

/*
* Color Mask
*
* Creates a mask from values in input In equal to input Mask Color. Input Range can be used to define a wider
* range of values around input Mask Color to create the mask. Colors within this range will return 1,
* otherwise the node will return 0. Input Fuzziness can be used to soften the edges around the selection
* similar to anti-aliasing.
*/
void poiColorMask(float3 In, float3 MaskColor, float Range, float Fuzziness, out float4 Out)
{
float Distance = distance(MaskColor, In);
Out = saturate(1 - (Distance - Range) / max(Fuzziness, 0.00001));
}

float3 hueShift(float3 color, float Offset)
{
float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
float4 P = lerp(float4(color.bg, K.wz), float4(color.gb, K.xy), step(color.b, color.g));
float4 Q = lerp(float4(P.xyw, color.r), float4(color.r, P.yzx), step(P.x, color.r));
float D = Q.x - min(Q.w, Q.y);
float E = 0.0000000001;
float3 hsv = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);

float hue = hsv.x + Offset;
hsv.x = frac(hue);

float4 K2 = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
float3 P2 = abs(frac(hsv.xxx + K2.xyz) * 6.0 - K2.www);
return hsv.z * lerp(K2.xxx, saturate(P2 - K2.xxx), hsv.y);
}

static const float Epsilon = 1e-10;
// The weights of RGB contributions to luminance.
// Should sum to unity.
static const float3 HCYwts = float3(0.299, 0.587, 0.114);
static const float HCLgamma = 3;
static const float HCLy0 = 100;
static const float HCLmaxL = 0.530454533953517; // == exp(HCLgamma / HCLy0) - 0.5
static const float3 wref = float3(1.0, 1.0, 1.0);
#define TAU 6.28318531

float3 HUEtoRGB(in float H)
{
float R = abs(H * 6 - 3) - 1;
float G = 2 - abs(H * 6 - 2);
float B = 2 - abs(H * 6 - 4);
return saturate(float3(R, G, B));
}

float3 RGBtoHCV(in float3 RGB)
{
// Based on work by Sam Hocevar and Emil Persson
float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0 / 3.0) : float4(RGB.gb, 0.0, -1.0 / 3.0);
float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
float C = Q.x - min(Q.w, Q.y);
float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
return float3(H, C, Q.x);
}

float3 HSVtoRGB(in float3 HSV)
{
float3 RGB = HUEtoRGB(HSV.x);
return((RGB - 1) * HSV.y + 1) * HSV.z;
}

float3 RGBtoHSV(in float3 RGB)
{
float3 HCV = RGBtoHCV(RGB);
float S = HCV.y / (HCV.z + Epsilon);
return float3(HCV.x, S, HCV.z);
}

float3 HSLtoRGB(in float3 HSL)
{
float3 RGB = HUEtoRGB(HSL.x);
float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
return(RGB - 0.5) * C + HSL.z;
}

float3 RGBtoHSL(in float3 RGB)
{
float3 HCV = RGBtoHCV(RGB);
float L = HCV.z - HCV.y * 0.5;
float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
return float3(HCV.x, S, L);
}

float3 HCYtoRGB(in float3 HCY)
{

float3 RGB = HUEtoRGB(HCY.x);
float Z = dot(RGB, HCYwts);
if (HCY.z < Z)
{
HCY.y *= HCY.z / Z;
}
else if (Z < 1)
{
HCY.y *= (1 - HCY.z) / (1 - Z);
}
return(RGB - Z) * HCY.y + HCY.z;
}

float3 RGBtoHCY(in float3 RGB)
{
// Corrected by David Schaeffer
float3 HCV = RGBtoHCV(RGB);
float Y = dot(RGB, HCYwts);
float Z = dot(HUEtoRGB(HCV.x), HCYwts);
if (Y < Z)
{
HCV.y *= Z / (Epsilon + Y);
}
else
{
HCV.y *= (1 - Z) / (Epsilon + 1 - Y);
}
return float3(HCV.x, HCV.y, Y);
}

float3 HCLtoRGB(in float3 HCL)
{
float3 RGB = 0;
if (HCL.z != 0)
{
float H = HCL.x;
float C = HCL.y;
float L = HCL.z * HCLmaxL;
float Q = exp((1 - C / (2 * L)) * (HCLgamma / HCLy0));
float U = (2 * L - C) / (2 * Q - 1);
float V = C / Q;
float A = (H + min(frac(2 * H) / 4, frac(-2 * H) / 8)) * pi * 2;
float T;
H *= 6;
if (H <= 0.999)
{
T = tan(A);
RGB.r = 1;
RGB.g = T / (1 + T);
}
else if (H <= 1.001)
{
RGB.r = 1;
RGB.g = 1;
}
else if (H <= 2)
{
T = tan(A);
RGB.r = (1 + T) / T;
RGB.g = 1;
}
else if (H <= 3)
{
T = tan(A);
RGB.g = 1;
RGB.b = 1 + T;
}
else if (H <= 3.999)
{
T = tan(A);
RGB.g = 1 / (1 + T);
RGB.b = 1;
}
else if (H <= 4.001)
{
RGB.g = 0;
RGB.b = 1;
}
else if (H <= 5)
{
T = tan(A);
RGB.r = -1 / T;
RGB.b = 1;
}
else
{
T = tan(A);
RGB.r = 1;
RGB.b = -T;
}
RGB = RGB * V + U;
}
return RGB;
}

float3 RGBtoHCL(in float3 RGB)
{
float3 HCL;
float H = 0;
float U = min(RGB.r, min(RGB.g, RGB.b));
float V = max(RGB.r, max(RGB.g, RGB.b));
float Q = HCLgamma / HCLy0;
HCL.y = V - U;
if (HCL.y != 0)
{
H = atan2(RGB.g - RGB.b, RGB.r - RGB.g) / pi;
Q *= U / V;
}
Q = exp(Q);
HCL.x = frac(H / 2 - min(frac(H), frac(-H)) / 6);
HCL.y *= Q;
HCL.z = lerp(-U, V, Q) / (HCLmaxL * 2);
return HCL;
}

//HSL MODIFT
float3 ModifyViaHSL(float3 color, float3 HSLMod)
{
float3 colorHSL = RGBtoHSL(color);
colorHSL.r = frac(colorHSL.r + HSLMod.r);
colorHSL.g = saturate(colorHSL.g + HSLMod.g);
colorHSL.b = saturate(colorHSL.b + HSLMod.b);
return HSLtoRGB(colorHSL);
}

float3 poiSaturation(float3 In, float Saturation)
{
float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
return luma.xxx + Saturation.xxx * (In - luma.xxx);
}
// LCH
float xyzF(float t)
{
return lerp(pow(t, 1. / 3.), 7.787037 * t + 0.139731, step(t, 0.00885645));
}
float xyzR(float t)
{
return lerp(t * t * t, 0.1284185 * (t - 0.139731), step(t, 0.20689655));
}
float3 rgb2lch(in float3 c)
{
c = mul(float3x3(0.4124, 0.3576, 0.1805,
0.2126, 0.7152, 0.0722,
0.0193, 0.1192, 0.9505), c);
c.x = xyzF(c.x / wref.x);
c.y = xyzF(c.y / wref.y);
c.z = xyzF(c.z / wref.z);
float3 lab = float3(max(0., 116.0 * c.y - 16.0), 500.0 * (c.x - c.y), 200.0 * (c.y - c.z));
return float3(lab.x, length(float2(lab.y, lab.z)), atan2(lab.z, lab.y));
}

float3 lch2rgb(in float3 c)
{
c = float3(c.x, cos(c.z) * c.y, sin(c.z) * c.y);

float lg = 1. / 116. * (c.x + 16.);
float3 xyz = float3(wref.x * xyzR(lg + 0.002 * c.y),
wref.y * xyzR(lg),
wref.z * xyzR(lg - 0.005 * c.z));

float3 rgb = mul(float3x3(3.2406, -1.5372, -0.4986,
- 0.9689, 1.8758, 0.0415,
0.0557, -0.2040, 1.0570), xyz);

return rgb;
}

//cheaply lerp around a circle
float lerpAng(in float a, in float b, in float x)
{
float ang = fmod(fmod((a - b), TAU) + pi * 3., TAU) - pi;
return ang * x + b;
}

//Linear interpolation between two colors in Lch space
float3 lerpLch(in float3 a, in float3 b, in float x)
{
float hue = lerpAng(a.z, b.z, x);
return float3(lerp(b.xy, a.xy, x), hue);
}

float3 poiExpensiveColorBlend(float3 col1, float3 col2, float alpha)
{
return lch2rgb(lerpLch(rgb2lch(col1), rgb2lch(col2), alpha));
}

float4x4 poiAngleAxisRotationMatrix(float angle, float3 axis)
{
axis = normalize(axis);
float s = sin(angle);
float c = cos(angle);
float oc = 1.0 - c;

return float4x4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s, 0.0,
oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s, 0.0,
oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c, 0.0,
0.0, 0.0, 0.0, 1.0);
}

float4x4 poiRotationMatrixFromAngles(float x, float y, float z)
{
float angleX = radians(x);
float c = cos(angleX);
float s = sin(angleX);
float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
0, c, -s, 0,
0, s, c, 0,
0, 0, 0, 1);

float angleY = radians(y);
c = cos(angleY);
s = sin(angleY);
float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
0, 1, 0, 0,
- s, 0, c, 0,
0, 0, 0, 1);

float angleZ = radians(z);
c = cos(angleZ);
s = sin(angleZ);
float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
s, c, 0, 0,
0, 0, 1, 0,
0, 0, 0, 1);

return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
}

float4x4 poiRotationMatrixFromAngles(float3 angles)
{
float angleX = radians(angles.x);
float c = cos(angleX);
float s = sin(angleX);
float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
0, c, -s, 0,
0, s, c, 0,
0, 0, 0, 1);

float angleY = radians(angles.y);
c = cos(angleY);
s = sin(angleY);
float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
0, 1, 0, 0,
- s, 0, c, 0,
0, 0, 0, 1);

float angleZ = radians(angles.z);
c = cos(angleZ);
s = sin(angleZ);
float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
s, c, 0, 0,
0, 0, 1, 0,
0, 0, 0, 1);

return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
}

float3 getCameraPosition()
{
#ifdef USING_STEREO_MATRICES
return lerp(unity_StereoWorldSpaceCameraPos[0], unity_StereoWorldSpaceCameraPos[1], 0.5);
#endif
return _WorldSpaceCameraPos;
}

half2 calcScreenUVs(half4 grabPos)
{
half2 uv = grabPos.xy / (grabPos.w + 0.0000000001);
#if UNITY_SINGLE_PASS_STEREO
uv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
#else
uv.xy *= _ScreenParams.xy;
#endif

return uv;
}

float CalcMipLevel(float2 texture_coord)
{
float2 dx = ddx(texture_coord);
float2 dy = ddy(texture_coord);
float delta_max_sqr = max(dot(dx, dx), dot(dy, dy));

return 0.5 * log2(delta_max_sqr);
}

v2f vert(appdata v)
{
UNITY_SETUP_INSTANCE_ID(v);
v2f o;
PoiInitStruct(v2f, o);
UNITY_TRANSFER_INSTANCE_ID(v, o);
UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

o.objectPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
o.objNormal = v.normal;
o.normal = UnityObjectToWorldNormal(v.normal);
o.tangent = UnityObjectToWorldDir(v.tangent);

o.binormal = cross(o.normal, o.tangent) * (v.tangent.w * unity_WorldTransformParams.w);
o.vertexColor = v.color;

o.uv[0] = v.uv0;
o.uv[1] = v.uv1;
o.uv[2] = v.uv2;
o.uv[3] = v.uv3;

#if defined(LIGHTMAP_ON)
o.lightmapUV.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif
#ifdef DYNAMICLIGHTMAP_ON
o.lightmapUV.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif

o.localPos = v.vertex;
o.worldPos = mul(unity_ObjectToWorld, o.localPos);

float3 localOffset = float3(0, 0, 0);
float3 worldOffset = float3(0, 0, 0);

#ifdef POI_PASS_FORWARDOUTLINE
float outlineMask = 1;
//TODO figure out why uvs can't be set dynamically
outlineMask = poiMax(tex2Dlod(_OutlineMask, float4(poiUV(o.uv[0], _OutlineMask_ST) + _Time.x * _OutlineMaskPan, 0, 0)).rgb);

//UNITY_BRANCH
if (_OutlineUseVertexColors == 2)
{
outlineMask *= v.color.r;
}

float3 outlineNormal = o.normal;
//UNITY_BRANCH
if (_OutlineUseVertexColors == 1)
{
//TODO normals appear to be transformed before entering the vertex shader and I'm not sure how to achieve the same results with vertex colors
outlineNormal = UnityObjectToWorldNormal(v.color);
}

half offsetMultiplier = 1;
half distanceOffset = 1;
//UNITY_BRANCH
if (_OutlineFixedSize)
{
distanceOffset *= min(distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, o.localPos).xyz), _OutlinesMaxDistance);
}

float3 offset = outlineNormal * (_LineWidth * _EnableOutlines / 100) * outlineMask * distanceOffset;

//UNITY_BRANCH
if (_OutlineMode == 2)
{
float3 lightDirection = normalize(_WorldSpaceLightPos0 + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz);
offsetMultiplier = saturate(dot(lightDirection, outlineNormal));
offset *= offsetMultiplier;
offset *= distanceOffset;
}
else if (_OutlineMode == 3)
{
half3 viewNormal = mul((float3x3)UNITY_MATRIX_V, outlineNormal);
offsetMultiplier = saturate(dot(viewNormal.xy, normalize(_OutlinePersonaDirection.xy)));

offset *= offsetMultiplier;
offset *= distanceOffset;
}
else if (_OutlineMode == 4)
{
offset = mul((float3x3)transpose(UNITY_MATRIX_V), _OutlineDropShadowOffset);
offset *= distanceOffset;
}

localOffset += mul(unity_WorldToObject, offset);
worldOffset += offset;
#endif

o.localPos.rgb += localOffset;
o.worldPos.rgb += worldOffset;
o.pos = UnityObjectToClipPos(o.localPos);
o.grabPos = ComputeGrabScreenPos(o.pos);

float3x3 objectToTangent = float3x3(
o.tangent.xyz,
cross(o.normal, o.tangent.xyz) * v.tangent.w,
o.normal
);
o.tangentViewDir = mul(objectToTangent, ObjSpaceViewDir(o.localPos));

#ifndef FORWARD_META_PASS
#if !defined(UNITY_PASS_SHADOWCASTER)
UNITY_TRANSFER_SHADOW(o, o.uv[0].xy);
#else
TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
#endif
#endif
UNITY_TRANSFER_FOG(o, o.pos);
return o;
}

#ifdef COLOR_GRADING_LOG_VIEW
//Tests to see if Audio Link texture is available
bool AudioLinkIsAvailable()
{
#if !defined(AUDIOLINK_STANDARD_INDEXING)
int width, height;
_AudioTexture.GetDimensions(width, height);
return width > 16;
#else
return _AudioTexture_TexelSize.z > 16;
#endif
}

//Get version of audiolink present in the world, 0 if no audiolink is present
float AudioLinkGetVersion()
{
int2 dims;
#if !defined(AUDIOLINK_STANDARD_INDEXING)
_AudioTexture.GetDimensions(dims.x, dims.y);
#else
dims = _AudioTexture_TexelSize.zw;
#endif

if (dims.x >= 128)
return AudioLinkData(ALPASS_GENERALVU).x;
else if (dims.x > 16)
return 1;
else
return 0;
}

float getBandAtTime(float band, float time, float width, float size = 1.0f)
{
return pow(UNITY_SAMPLE_TEX2D(_AudioTexture, float2(time * width, band)).r, (1 - size) * 3 + 1);
}

void initAudioBands(inout PoiMods poiMods)
{
poiMods.audioLinkAvailable = AudioLinkIsAvailable();
poiMods.audioLinkAvailable *= _AudioLinkAnimToggle;

if (poiMods.audioLinkAvailable)
{
poiMods.audioLinkVersion = AudioLinkGetVersion();
poiMods.audioLink.x = AudioLinkData(ALPASS_AUDIOBASS).r;
poiMods.audioLink.y = AudioLinkData(ALPASS_AUDIOLOWMIDS).r;
poiMods.audioLink.z = AudioLinkData(ALPASS_AUDIOHIGHMIDS).r;
poiMods.audioLink.w = AudioLinkData(ALPASS_AUDIOTREBLE).r;
}
}
#endif

float2 calculatePolarCoordinate(in PoiMesh poiMesh)
{
float2 delta = poiMesh.uv[_PolarUV] - _PolarCenter;
float radius = length(delta) * 2 * _PolarRadialScale;
float angle = atan2(delta.x, delta.y) * 1.0 / 6.28 * _PolarLengthScale;
return float2(radius, angle + distance(poiMesh.uv[_PolarUV], _PolarCenter) * _PolarSpiralPower);
}

float2 MonoPanoProjection(float3 coords)
{
float3 normalizedCoords = normalize(coords);
float latitude = acos(normalizedCoords.y);
float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
float2 sphereCoords = float2(longitude, latitude) * float2(1.0 / UNITY_PI, 1.0 / UNITY_PI);
sphereCoords = float2(1.0, 1.0) - sphereCoords;
return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).zw;
}

float2 StereoPanoProjection(float3 coords)
{
float3 normalizedCoords = normalize(coords);
float latitude = acos(normalizedCoords.y);
float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
float2 sphereCoords = float2(longitude, latitude) * float2(0.5 / UNITY_PI, 1.0 / UNITY_PI);
sphereCoords = float2(0.5, 1.0) - sphereCoords;
return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
}

float2 calculatePanosphereUV(in PoiMesh poiMesh)
{
float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - poiMesh.worldPos) * - 1;
return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), _StereoEnabled);
}

#ifdef USER_LUT
float2 distortedUV(in PoiMesh poiMesh)
{
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 flowVector = POI2D_SAMPLER_PAN(_DistortionFlowTexture, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTextureUV], _DistortionFlowTexture_ST), _DistortionFlowTexturePan) * 2 - 1;
#else
float4 flowVector = 0;
#endif

#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
float4 flowVector1 = POI2D_SAMPLER_PAN(_DistortionFlowTexture1, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTexture1UV], _DistortionFlowTexture1_ST), _DistortionFlowTexture1Pan) * 2 - 1;
#else
float4 flowVector1 = 0;
#endif

#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
half distortionMask = POI2D_SAMPLER_PAN(_DistortionMask, _MainTex, poiMesh.uv[_DistortionMaskUV], _DistortionMaskPan).r;
#else
half distortionMask = 1;
#endif

half distortionStrength = _DistortionStrength;
half distortionStrength1 = _DistortionStrength1;

flowVector *= distortionStrength;
flowVector1 *= distortionStrength1;
return poiMesh.uv[_DistortionUvToDistort] + ((flowVector.xy + flowVector1.xy) / 2) * distortionMask;
}
#endif

void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{
poiFragData.alpha = saturate(poiFragData.alpha + _AlphaMod);

// Distance Fade
if (_AlphaDistanceFade)
{
float3 position = _AlphaDistanceFadeType ? poiMesh.worldPos : poiMesh.objectPosition;
poiFragData.alpha *= lerp(_AlphaDistanceFadeMinAlpha, _AlphaDistanceFadeMaxAlpha, smoothstep(_AlphaDistanceFadeMin, _AlphaDistanceFadeMax, distance(position, poiCam.worldPos)));
}

// Fresnel Alpha
if (_AlphaFresnel)
{
float holoRim = saturate(1 - smoothstep(min(_AlphaFresnelSharpness, _AlphaFresnelWidth), _AlphaFresnelWidth, poiCam.vDotN));
holoRim = abs(lerp(1, holoRim, _AlphaFresnelAlpha));
poiFragData.alpha *= _AlphaFresnelInvert ?1 - holoRim : holoRim;
}

if (_AlphaAngular)
{
half cameraAngleMin = _CameraAngleMin / 180;
half cameraAngleMax = _CameraAngleMax / 180;
half modelAngleMin = _ModelAngleMin / 180;
half modelAngleMax = _ModelAngleMax / 180;
float3 pos = _AngleCompareTo == 0 ? poiMesh.objectPosition : poiMesh.worldPos;
half3 cameraToModelDirection = normalize(pos - getCameraPosition());
half3 modelForwardDirection = normalize(mul(unity_ObjectToWorld, normalize(_AngleForwardDirection)));
half cameraLookAtModel = remapClamped(cameraAngleMax, cameraAngleMin, .5 * dot(cameraToModelDirection, getCameraForward()) + .5);
half modelLookAtCamera = remapClamped(modelAngleMax, modelAngleMin, .5 * dot(-cameraToModelDirection, modelForwardDirection) + .5);
if (_AngleType == 0)
{
poiFragData.alpha *= max(cameraLookAtModel, _AngleMinAlpha);
}
else if (_AngleType == 1)
{
poiFragData.alpha *= max(modelLookAtCamera, _AngleMinAlpha);
}
else if (_AngleType == 2)
{
poiFragData.alpha *= max(cameraLookAtModel * modelLookAtCamera, _AngleMinAlpha);
}
}
}

inline half Dither8x8Bayer(int x, int y)
{
const half dither[ 64 ] = {
1, 49, 13, 61, 4, 52, 16, 64,
33, 17, 45, 29, 36, 20, 48, 32,
9, 57, 5, 53, 12, 60, 8, 56,
41, 25, 37, 21, 44, 28, 40, 24,
3, 51, 15, 63, 2, 50, 14, 62,
35, 19, 47, 31, 34, 18, 46, 30,
11, 59, 7, 55, 10, 58, 6, 54,
43, 27, 39, 23, 42, 26, 38, 22
};
int r = y * 8 + x;
return dither[r] / 64;
}

half calcDither(half2 grabPos)
{
half dither = Dither8x8Bayer(fmod(grabPos.x, 8), fmod(grabPos.y, 8));
return dither;
}

void applyDithering(inout PoiFragData poiFragData, in PoiCam poiCam)
{
if (_AlphaDithering)
{
poiFragData.alpha = poiFragData.alpha - (calcDither(poiCam.screenUV) * (1 - poiFragData.alpha) * _AlphaDitherGradient);
}
}

void ApplyAlphaToCoverage(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
// Force Model Opacity to 1 if desired
UNITY_BRANCH
if (_Mode == 1)
{
UNITY_BRANCH
if (_AlphaSharpennedA2C)
{
// rescale alpha by mip level
poiFragData.alpha *= 1 + max(0, CalcMipLevel(poiMesh.uv[0] * _MainTex_TexelSize.zw)) * _AlphaMipScale;
// rescale alpha by partial derivative
poiFragData.alpha = (poiFragData.alpha - _Cutoff) / max(fwidth(poiFragData.alpha), 0.0001) + _Cutoff;
}
}
}

#ifdef VIGNETTE_MASKED

void applyShadeMapping(inout PoiFragData poiFragData, PoiMesh poiMesh, PoiLight poiLight)
{
float MainColorFeatherStep = _BaseColor_Step - _BaseShade_Feather;
float firstColorFeatherStep = _ShadeColor_Step - _1st2nd_Shades_Feather;

#if defined(PROP_1ST_SHADEMAP) || !defined(OPTIMIZER_ENABLED)
float4 firstShadeMap = POI2D_SAMPLER_PAN(_1st_ShadeMap, _MainTex, poiUV(poiMesh.uv[_1st_ShadeMapUV], _1st_ShadeMap_ST), _1st_ShadeMapPan);
#else
float4 firstShadeMap = float4(1, 1, 1, 1);
#endif
firstShadeMap = lerp(firstShadeMap, float4(poiFragData.baseColor, 1), _Use_BaseAs1st);

#if defined(PROP_2ND_SHADEMAP) || !defined(OPTIMIZER_ENABLED)
float4 secondShadeMap = POI2D_SAMPLER_PAN(_2nd_ShadeMap, _MainTex, poiUV(poiMesh.uv[_2nd_ShadeMapUV], _2nd_ShadeMap_ST), _2nd_ShadeMapPan);
#else
float4 secondShadeMap = float4(1, 1, 1, 1);
#endif
secondShadeMap = lerp(secondShadeMap, firstShadeMap, _Use_1stAs2nd);

firstShadeMap.rgb *= _1st_ShadeColor.rgb; //* lighColor
secondShadeMap.rgb *= _2nd_ShadeColor.rgb; //* LightColor;

float shadowMask = 1;
shadowMask *= _Use_1stShadeMapAlpha_As_ShadowMask ?(_1stShadeMapMask_Inverse ?(1.0 - firstShadeMap.a) : firstShadeMap.a) : 1;
shadowMask *= _Use_2ndShadeMapAlpha_As_ShadowMask ?(_2ndShadeMapMask_Inverse ?(1.0 - secondShadeMap.a) : secondShadeMap.a) : 1;

float mainShadowMask = saturate(1 - ((poiLight.lightMap) - MainColorFeatherStep) / (_BaseColor_Step - MainColorFeatherStep) * (shadowMask));
float firstSecondShadowMask = saturate(1 - ((poiLight.lightMap) - firstColorFeatherStep) / (_ShadeColor_Step - firstColorFeatherStep) * (shadowMask));

mainShadowMask *= poiLight.shadowMask;
firstSecondShadowMask *= poiLight.shadowMask;

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, lerp(firstShadeMap.rgb, secondShadeMap.rgb, firstSecondShadowMask), mainShadowMask);
}

void ApplySubtractiveLighting(inout UnityIndirect indirectLight)
{
#if SUBTRACTIVE_LIGHTING
poiLight.attenuation = FadeShadows(lerp(1, poiLight.attenuation, _AttenuationMultiplier));

float ndotl = saturate(dot(i.normal, _WorldSpaceLightPos0.xyz));
float3 shadowedLightEstimate = ndotl * (1 - poiLight.attenuation) * _LightColor0.rgb;
float3 subtractedLight = indirectLight.diffuse - shadowedLightEstimate;
subtractedLight = max(subtractedLight, unity_ShadowColor.rgb);
subtractedLight = lerp(subtractedLight, indirectLight.diffuse, _LightShadowData.x);
indirectLight.diffuse = min(subtractedLight, indirectLight.diffuse);
#endif
}

UnityIndirect CreateIndirectLight(in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
UnityIndirect indirectLight;
indirectLight.diffuse = 0;
indirectLight.specular = 0;

#if defined(LIGHTMAP_ON)
indirectLight.diffuse = DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, poiMesh.lightmapUV.xy));

#if defined(DIRLIGHTMAP_COMBINED)
float4 lightmapDirection = UNITY_SAMPLE_TEX2D_SAMPLER(
unity_LightmapInd, unity_Lightmap, poiMesh.lightmapUV.xy
);
indirectLight.diffuse = DecodeDirectionalLightmap(
indirectLight.diffuse, lightmapDirection, poiMesh.normals[1]
);
#endif
ApplySubtractiveLighting(indirectLight);
#endif

#if defined(DYNAMICLIGHTMAP_ON)
float3 dynamicLightDiffuse = DecodeRealtimeLightmap(
UNITY_SAMPLE_TEX2D(unity_DynamicLightmap, poiMesh.lightmapUV.zw)
);

#if defined(DIRLIGHTMAP_COMBINED)
float4 dynamicLightmapDirection = UNITY_SAMPLE_TEX2D_SAMPLER(
unity_DynamicDirectionality, unity_DynamicLightmap,
poiMesh.lightmapUV.zw
);
indirectLight.diffuse += DecodeDirectionalLightmap(
dynamicLightDiffuse, dynamicLightmapDirection, poiMesh.normals[1]
);
#else
indirectLight.diffuse += dynamicLightDiffuse;
#endif
#endif

#if !defined(LIGHTMAP_ON) && !defined(DYNAMICLIGHTMAP_ON)
#if UNITY_LIGHT_PROBE_PROXY_VOLUME
if (unity_ProbeVolumeParams.x == 1)
{
indirectLight.diffuse = SHEvalLinearL0L1_SampleProbeVolume(
float4(poiMesh.normals[1], 1), poiMesh.worldPos
);
indirectLight.diffuse = max(0, indirectLight.diffuse);
#if defined(UNITY_COLORSPACE_GAMMA)
indirectLight.diffuse = LinearToGammaSpace(indirectLight.diffuse);
#endif
}
else
{
indirectLight.diffuse += max(0, ShadeSH9(float4(poiMesh.normals[1], 1)));
}
#else
indirectLight.diffuse += max(0, ShadeSH9(float4(poiMesh.normals[1], 1)));
#endif
#endif

float3 reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
Unity_GlossyEnvironmentData envData;
envData.roughness = 1 - _LightingStandardSmoothness;
envData.reflUVW = BoxProjection(
reflectionDir, poiMesh.worldPos.xyz,
unity_SpecCube0_ProbePosition,
unity_SpecCube0_BoxMin.xyz, unity_SpecCube0_BoxMax.xyz
);
float3 probe0 = Unity_GlossyEnvironment(
UNITY_PASS_TEXCUBE(unity_SpecCube0), unity_SpecCube0_HDR, envData
);
envData.reflUVW = BoxProjection(
reflectionDir, poiMesh.worldPos.xyz,
unity_SpecCube1_ProbePosition,
unity_SpecCube1_BoxMin.xyz, unity_SpecCube1_BoxMax.xyz
);
#if UNITY_SPECCUBE_BLENDING
float interpolator = unity_SpecCube0_BoxMin.w;
//UNITY_BRANCH
if (interpolator < 0.99999)
{
float3 probe1 = Unity_GlossyEnvironment(
UNITY_PASS_TEXCUBE_SAMPLER(unity_SpecCube1, unity_SpecCube0),
unity_SpecCube0_HDR, envData
);
indirectLight.specular = lerp(probe1, probe0, interpolator);
}
else
{
indirectLight.specular = probe0;
}
#else
indirectLight.specular = probe0;
#endif

indirectLight.diffuse *= poiLight.occlusion;
indirectLight.specular *= poiLight.occlusion;

return indirectLight;
}

void applyShading(inout PoiLight poiLight, inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{
#ifdef UNITY_PASS_FORWARDBASE

float shadowStrength = _ShadowStrength * poiLight.shadowMask;

#ifdef POI_PASS_FORWARDOUTLINE
shadowStrength = lerp(0, shadowStrength, _OutlineShadowStrength);
#endif

#ifdef _LIGHTINGMODE_FLAT
poiLight.finalLighting = poiLight.directColor;
poiLight.rampedLightMap = poiLight.nDotLSaturated;
#endif

#ifdef _LIGHTINGMODE_TEXTURERAMP
poiLight.rampedLightMap = lerp(1, UNITY_SAMPLE_TEX2D(_ToonRamp, poiLight.lightMap + _ShadowOffset).rgb, shadowStrength);
poiLight.finalLighting = lerp(_LightingShadowColor * lerp(poiLight.indirectColor, poiLight.rampedLightMap * poiLight.directColor, _LightingIgnoreAmbientColor) * poiLight.occlusion, poiLight.directColor, poiLight.rampedLightMap);
#endif

#ifdef _LIGHTINGMODE_MATHRAMP
if (_LightingMathLinearSmooth)
{
poiLight.rampedLightMap = saturate(1 - remapClamped(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - poiLight.lightMap * poiLight.detailShadow));
}
else
{
poiLight.rampedLightMap = saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - poiLight.lightMap * poiLight.detailShadow));
}
poiLight.finalLighting = lerp((_LightingShadowColor * lerp(poiLight.indirectColor, poiLight.directColor, _LightingIgnoreAmbientColor) * poiLight.occlusion), (poiLight.directColor), saturate(poiLight.rampedLightMap + 1 - shadowStrength));
#endif

#ifdef _LIGHTINGMODE_SHADEMAP
poiLight.finalLighting = poiLight.directColor;
#endif

#ifdef _LIGHTINGMODE_REALISTIC
UnityLight light;
light.dir = poiLight.direction;
light.color = saturate(_LightColor0.rgb * lerp(1, poiLight.attenuation, poiLight.attenuationStrength) * poiLight.detailShadow);
light.ndotl = poiLight.nDotLSaturated;
poiLight.rampedLightMap = poiLight.nDotLSaturated;
poiLight.finalLighting = UNITY_BRDF_PBS(1, 0, 0, _LightingStandardSmoothness, poiMesh.normals[1], poiCam.viewDir, light, CreateIndirectLight(poiMesh, poiCam, poiLight)).xyz;
#endif

#ifdef _LIGHTINGMODE_WRAPPED
poiLight.finalLighting = lerp(POI_ERROR(poiMesh, 20) * poiLight.indirectColor, poiLight.directColor, ceil(poiLight.nDotL));
#endif

#ifdef _LIGHTINGMODE_SKIN
float3 ambientNormalWorld = poiMesh.normals[1];//aTangentToWorld(s, s.blurredNormalTangent);
poiLight.rampedLightMap = poiLight.nDotLSaturated;
// Scattering mask.
float subsurface = 1;
float skinScattering = saturate(subsurface * _SssScale * 2);

// Skin subsurface depth absorption tint.
// cf http://www.crytek.com/download/2014_03_25_CRYENGINE_GDC_Schultz.pdf pg 35
half3 absorption = exp((1.0h - subsurface) * _SssTransmissionAbsorption.rgb);

// Albedo scale for absorption assumes ~0.5 luminance for Caucasian skin.
absorption *= saturate(poiFragData.baseColor * unity_ColorSpaceDouble.rgb);

// Blurred normals for indirect diffuse and direct scattering.
ambientNormalWorld = normalize(lerp(poiMesh.normals[1], ambientNormalWorld, _SssBumpBlur));

float ndlBlur = dot(poiMesh.normals[1], poiLight.direction) * 0.5h + 0.5h;
float lumi = dot(poiLight.directColor, half3(0.2126h, 0.7152h, 0.0722h));
float4 sssLookupUv = float4(ndlBlur, skinScattering * lumi, 0.0f, 0.0f);
half3 sss = poiLight.lightMap * poiLight.attenuation * tex2Dlod(_SkinLUT, sssLookupUv).rgb;
poiLight.finalLighting = min(lerp(poiLight.indirectColor * _LightingShadowColor, _LightingShadowColor, _LightingIgnoreAmbientColor) + (sss * poiLight.directColor), poiLight.directColor);
#endif

#endif

#ifdef UNITY_PASS_FORWARDADD
//UNITY_BRANCH
if (_LightingAdditiveType == 0) // Realistic

{
poiLight.finalLighting = poiLight.directColor * poiLight.attenuation * max(0, poiLight.nDotL) * poiLight.detailShadow * poiLight.additiveShadow;
}
else if (_LightingAdditiveType == 1) // Toon

{
#if defined(POINT) || defined(SPOT)
poiLight.finalLighting = lerp(poiLight.directColor * max(poiLight.additiveShadow, _LightingAdditivePassthrough), poiLight.indirectColor, smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, 1 - (.5 * poiLight.nDotL + .5))) * poiLight.attenuation * poiLight.detailShadow;
#else
poiLight.finalLighting = lerp(poiLight.directColor * max(poiLight.attenuation, _LightingAdditivePassthrough), poiLight.indirectColor, smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, 1 - (.5 * poiLight.nDotL + .5))) * poiLight.detailShadow;
#endif
}
/*
else //if(_LightingAdditiveType == 2) // Wrapped
{
float uv = saturate(RTWrapFunc(poiLight.nDotL, _LightingWrappedWrap, _LightingWrappedNormalization)) * detailShadow;

poiLight.rampedLightMap = 1;
//UNITY_BRANCH
if (_LightingRampType == 1) // Math Gradient
poiLight.rampedLightMap = lerp(_LightingShadowColor, float3(1, 1, 1), saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - uv)));
// TODO: ramp texture or full shade/tint map for atlasing
//poiLight.rampedLightMap = lerp(1, UNITY_SAMPLE_TEX2D(_ToonRamp, float2(uv + _ShadowOffset, 1)), shadowStrength.r);

float shadowatten = max(poiLight.additiveShadow, _LightingAdditivePassthrough);
return poiLight.color * poiLight.rampedLightMap * saturate(poiLight.attenuation * uv * shadowatten);
}
*/
#endif

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
float3 vertexLighting = float3(0, 0, 0);
for (int index = 0; index < 4; index++)
{
//UNITY_BRANCH
if (_LightingAdditiveType == 0)
{
vertexLighting += poiLight.vColor[index] * poiLight.vAttenuationDotNL[index] * poiLight.detailShadow; // Realistic

}

//UNITY_BRANCH
if (_LightingAdditiveType == 1) // Toon

{
vertexLighting += lerp(poiLight.vColor[index] * poiLight.vAttenuation[index], poiLight.vColor[index] * _LightingAdditivePassthrough * poiLight.vAttenuation[index], smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, poiLight.vDotNL[index])) * poiLight.detailShadow;
}

//UNITY_BRANCH
if (_LightingAdditiveType == 2) //if(_LightingAdditiveType == 2) // Wrapped

{
//TODO wrapped vertex lighting
vertexLighting += lerp(poiLight.vColor[index] * poiLight.vAttenuation[index], poiLight.vColor[index] * _LightingAdditivePassthrough * poiLight.vAttenuation[index], smoothstep(_LightingAdditiveGradientStart, _LightingAdditiveGradientEnd, poiLight.vDotNL[index])) * poiLight.detailShadow;
/*
float uv = saturate(RTWrapFunc(-poiLight.vDotNL[index], _LightingWrappedWrap, _LightingWrappedNormalization)) * poiLight.detailShadow;

poiLight.rampedLightMap = 1;
if (_LightingRampType == 1) // Math Gradient
poiLight.rampedLightMap = lerp(_LightingShadowColor, float3(1, 1, 1), saturate(1 - smoothstep(_LightingGradientStart - .000001, _LightingGradientEnd, 1 - uv)));

vertexLighting += poiLight.vColor[index] * poiLight.rampedLightMap * saturate(poiLight.vAttenuation[index] * uv);
*/
}
}
float3 mixedLight = poiLight.finalLighting;
mixedLight = vertexLighting + poiLight.finalLighting;
poiFragData.finalColor = poiFragData.baseColor * mixedLight;
#else
poiFragData.finalColor = poiFragData.baseColor * poiLight.finalLighting;
#endif
}
#endif

#ifdef VIGNETTE_CLASSIC

bool SceneHasReflections(){
float width, height;
unity_SpecCube0.GetDimensions(width, height);
return !(width * height < 2);
}

float3 GetWorldReflections(float3 reflDir, float3 worldPos, float roughness){
float3 baseReflDir = reflDir;
reflDir = BoxProjection(reflDir, worldPos, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
float4 envSample0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
float3 p0 = DecodeHDR(envSample0, unity_SpecCube0_HDR);
float interpolator = unity_SpecCube0_BoxMin.w;
UNITY_BRANCH
if (interpolator < 0.99999){
float3 refDirBlend = BoxProjection(baseReflDir, worldPos, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
float4 envSample1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, refDirBlend, roughness * UNITY_SPECCUBE_LOD_STEPS);
float3 p1 = DecodeHDR(envSample1, unity_SpecCube1_HDR);
p0 = lerp(p1, p0, interpolator);
}
return p0;
}

float3 GetReflections(in PoiCam pc, in PoiLight pl, in PoiMesh pm, float roughness){
float3 reflections = 0;
UNITY_BRANCH
if (SceneHasReflections()){
reflections = GetWorldReflections(pc.reflectionDir, pm.worldPos.xyz, roughness);
}
else {
reflections = texCUBElod(_MochieReflCube, float4(pc.reflectionDir, roughness * UNITY_SPECCUBE_LOD_STEPS));
reflections = DecodeHDR(float4(reflections,1), _MochieReflCube_HDR);
}
reflections *= pl.occlusion;
return reflections;
}

float GetGGXTerm(in PoiLight pl, float roughness){
float visibilityTerm = 0;
if (pl.nDotL > 0){
float rough = roughness;
float rough2 = roughness * roughness;

float lambdaV = pl.nDotL * (pl.nDotV * (1 - rough) + rough);
float lambdaL = pl.nDotV * (pl.nDotL * (1 - rough) + rough);

visibilityTerm = 0.5f / (lambdaV + lambdaL + 1e-5f);
float d = (pl.nDotH * rough2 - pl.nDotH) * pl.nDotH + 1.0f;
float dotTerm = UNITY_INV_PI * rough2 / (d * d + 1e-7f);

visibilityTerm *= dotTerm * UNITY_PI;
}
return visibilityTerm;
}

void GetSpecFresTerm(in PoiLight pl, inout float3 specularTerm, inout float3 fresnelTerm, float3 specCol, float roughness){
specularTerm = GetGGXTerm(pl, roughness);
fresnelTerm = FresnelTerm(specCol, pl.lDotH);
specularTerm = max(0, specularTerm * max(0.00001, pl.nDotL));
}

float GetRoughness(float smoothness){
float rough = 1-smoothness;
rough *= 1.7-0.7*rough;
return rough;
}

void MochieBRDF(inout PoiFragData pfd, in PoiCam pc, in PoiLight pl, in PoiMesh pm){

float smoothness = 1-(POI2D_SAMPLER_PAN(_MochieRoughnessMap, _MainTex, poiUV(pm.uv[_MochieRoughnessMapUV], _MochieRoughnessMap_ST), _MochieRoughnessMapPan) * _MochieRoughnessMultiplier);
float roughness = GetRoughness(smoothness);
float metallic = POI2D_SAMPLER_PAN(_MochieMetallicMap, _MainTex, poiUV(pm.uv[_MochieMetallicMapUV], _MochieMetallicMap_ST), _MochieMetallicMapPan) * _MochieMetallicMultiplier;
float3 specCol = lerp(unity_ColorSpaceDielectricSpec.rgb, pfd.baseColor, metallic);
float omr = unity_ColorSpaceDielectricSpec.a - metallic * unity_ColorSpaceDielectricSpec.a;
float percepRough = 1-smoothness;
float brdfRoughness = percepRough * percepRough;
brdfRoughness = max(brdfRoughness, 0.002);

float3 lighting = pl.finalLighting;
float3 diffuse = pfd.baseColor;
float3 specular = 0;
float3 reflections = 0;
float3 environment = 0;

// Specular
if (_MochieSpecularStrength > 0){
float3 fresnelTerm = 1;
float3 specularTerm = 1;
float specularMask = POI2D_SAMPLER_PAN(_MochieSpecularMask, _MainTex, poiUV(pm.uv[_MochieSpecularMaskUV], _MochieSpecularMask_ST), _MochieSpecularMaskPan);
GetSpecFresTerm(pl, specularTerm, fresnelTerm, specCol, brdfRoughness);
specular = lighting * specularTerm * fresnelTerm * specularMask * _MochieSpecularTint * pl.occlusion * pl.attenuation * _MochieSpecularStrength;
}

// Reflections
if (_MochieReflectionStrength > 0){
float reflectionMask = POI2D_SAMPLER_PAN(_MochieReflectionMask, _MainTex, poiUV(pm.uv[_MochieReflectionMaskUV], _MochieReflectionMask_ST), _MochieReflectionMaskPan);
float surfaceReduction = (1.0 / (brdfRoughness*brdfRoughness + 1.0));
float grazingTerm = saturate(smoothness + (1-omr));
float3 reflCol = GetReflections(pc, pl, pm, roughness);
float reflStr = reflectionMask * _MochieReflectionStrength;
reflections = surfaceReduction * reflCol * FresnelLerp(specCol, grazingTerm, pl.nDotV);
reflections *= _MochieReflectionTint * reflStr;
#ifdef UNITY_PASS_FORWARDADD
reflections *= pl.attenuation;
#endif
diffuse = lerp(diffuse, diffuse*omr, reflStr);
}

environment = specular + reflections;
diffuse *= lighting;
diffuse += environment;
pfd.finalColor = diffuse;
}

#endif

void blendMatcap(in PoiLight poiLight, inout PoiFragData poiFragData, float add, float multiply, float replace, float4 matcapColor, float matcapMask, float emissionStrength, float matcapLightMask
#ifdef POI_BLACKLIGHT
, uint blackLightMaskIndex
#endif
)
{
if (matcapLightMask)
{
matcapMask *= lerp(1, poiLight.rampedLightMap, matcapLightMask);
}
#ifdef POI_BLACKLIGHT
if (blackLightMaskIndex != 4)
{
matcapMask *= blackLightMask[blackLightMaskIndex];
}
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, matcapColor.rgb, replace * matcapMask * matcapColor.a * .999999);
poiFragData.baseColor.rgb *= lerp(1, matcapColor.rgb, multiply * matcapMask * matcapColor.a);
poiFragData.baseColor.rgb += matcapColor.rgb * add * matcapMask * matcapColor.a;
poiFragData.emission += matcapColor.rgb * emissionStrength * matcapMask * matcapColor.a;
}

#if defined(_COLORADDSUBDIFF_ON) || defined(COLOR_GRADING_HDR_3D)
void applyMatcap(inout PoiFragData poiFragData, in PoiCam poiCam, in PoiMesh poiMesh, in PoiLight poiLight)
{
float4 matcap = 0;
float matcapMask = 0;
float4 matcap2 = 0;
float matcap2Mask = 0;

// Both matcaps use the same coordinates
half3 worldViewUp = normalize(half3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, half3(0, 1, 0)));
half3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));

// Matcap 1
#ifdef _COLORADDSUBDIFF_ON

#ifdef POI_MATCAP0_CUSTOM_NORMAL
float3 normal0 = calculateNormal(poiMesh.normals[_MatcapNormal], poiMesh, _Matcap0NormalMap, _Matcap0NormalMap_ST, _Matcap0NormalMapPan, _Matcap0NormalMapUV, _Matcap0NormalMapScale);
#else
float3 normal0 = poiMesh.normals[_MatcapNormal];
#endif

half2 matcapUV = half2(dot(worldViewRight, normal0), dot(worldViewUp, poiMesh.normals[_MatcapNormal])) * _MatcapBorder + 0.5;

#if defined(PROP_MATCAP) || !defined(OPTIMIZER_ENABLED)
matcap = UNITY_SAMPLE_TEX2D_SAMPLER(_Matcap, _MainTex, TRANSFORM_TEX(matcapUV, _Matcap)) * _MatcapColor;
#else
matcap = _MatcapColor;
#endif

matcap.rgb *= _MatcapIntensity;
#if defined(PROP_MATCAPMASK) || !defined(OPTIMIZER_ENABLED)
matcapMask = POI2D_SAMPLER_PAN(_MatcapMask, _MainTex, poiUV(poiMesh.uv[_MatcapMaskUV], _MatcapMask_ST), _MatcapMaskPan);
#else
matcapMask = 1;
#endif

if (_MatcapMaskInvert)
{
matcapMask = 1 - matcapMask;
}

//UNITY_BRANCH
if (_MatcapHueShiftEnabled)
{
matcap.rgb = hueShift(matcap.rgb, _MatcapHueShift + _Time.x * _MatcapHueShiftSpeed);
}

blendMatcap(poiLight, poiFragData, _MatcapAdd, _MatcapMultiply, _MatcapReplace, matcap, matcapMask, _MatcapEmissionStrength, _MatcapLightMask
#ifdef POI_BLACKLIGHT
, _BlackLightMaskMatcap
#endif
);
#endif

// Matcap 2
#ifdef COLOR_GRADING_HDR_3D

#ifdef POI_MATCAP1_CUSTOM_NORMAL
float3 normal1 = calculateNormal(poiMesh.normals[_Matcap2Normal], poiMesh, _Matcap1NormalMap, _Matcap1NormalMap_ST, _Matcap1NormalMapPan, _Matcap1NormalMapUV, _Matcap1NormalMapScale);
#else
float3 normal1 = poiMesh.normals[_Matcap2Normal];
#endif

half2 matcapUV2 = half2(dot(worldViewRight, normal1), dot(worldViewUp, poiMesh.normals[_Matcap2Normal])) * _Matcap2Border + 0.5;
#if defined(PROP_MATCAP2) || !defined(OPTIMIZER_ENABLED)
matcap2 = UNITY_SAMPLE_TEX2D_SAMPLER(_Matcap2, _MainTex, TRANSFORM_TEX(matcapUV2, _Matcap2)) * _Matcap2Color;
#else
matcap2 = _Matcap2Color;
#endif
matcap2.rgb *= _Matcap2Intensity;
#if defined(PROP_MATCAP2MASK) || !defined(OPTIMIZER_ENABLED)
matcap2Mask = POI2D_SAMPLER_PAN(_Matcap2Mask, _MainTex, poiUV(poiMesh.uv[_Matcap2MaskUV], _Matcap2Mask_ST), _Matcap2MaskPan);
#else
matcap2Mask = 1;
#endif
if (_Matcap2MaskInvert)
{
matcap2Mask = 1 - matcap2Mask;
}

//UNITY_BRANCH
if (_Matcap2HueShiftEnabled)
{
matcap2.rgb = hueShift(matcap2.rgb, _Matcap2HueShift + _Time.x * _Matcap2HueShiftSpeed);
}

blendMatcap(poiLight, poiFragData, _Matcap2Add, _Matcap2Multiply, _Matcap2Replace, matcap2, matcap2Mask, _Matcap2EmissionStrength, _Matcap2LightMask
#ifdef POI_BLACKLIGHT
, _BlackLightMaskMatcap2
#endif
);
#endif
}
#endif

#ifdef POI_BACKFACE
void ApplyBackFaceColor(inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods)
{
if (!poiMesh.isFrontFace)
{
float4 backFaceColor = _BackFaceColor;
#if defined(PROP_BACKFACETEXTURE) || !defined(OPTIMIZER_ENABLED)
backFaceColor *= POI2D_SAMPLER_PAN(_BackFaceTexture, _MainTex, poiUV(poiMesh.uv[_BackFaceTextureUV], _BackFaceTexture_ST), _BackFaceTexturePan);
#endif
backFaceColor.rgb = hueShift(backFaceColor.rgb, frac(_BackFaceHueShift + _BackFaceHueShiftSpeed * _Time.x) * _BackFaceHueShiftEnabled);

float backFaceMask = 1;
#if defined(PROP_BACKFACEMASK) || !defined(OPTIMIZER_ENABLED)
backFaceMask *= POI2D_SAMPLER_PAN(_BackFaceMask, _MainTex, poiUV(poiMesh.uv[_BackFaceMaskUV], _BackFaceMask_ST), _BackFaceMaskPan).r * _BackFaceAlpha * backFaceColor.a;
#endif

poiFragData.baseColor = lerp(poiFragData.baseColor, backFaceColor.rgb, backFaceMask);

UNITY_BRANCH
if (_BackFaceReplaceAlpha)
{
poiFragData.alpha = lerp(backFaceColor.a, poiFragData.alpha, backFaceMask);
}

poiFragData.emission += backFaceColor.rgb * _BackFaceEmissionStrength * backFaceMask;
}
}
#endif

#ifdef FINALPASS
void ApplyDetailColor(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiMods poiMods)
{
#if defined(PROP_DETAILTEX) || !defined(OPTIMIZER_ENABLED)
half3 detailTexture = POI2D_SAMPLER_PAN(_DetailTex, _MainTex, poiUV(poiMesh.uv[_DetailTexUV], _DetailTex_ST), _DetailTexPan).rgb * _DetailTint.rgb;
#else
half3 detailTexture = 0.21763764082 * _DetailTint.rgb;
#endif

poiFragData.baseColor.rgb *= LerpWhiteTo(detailTexture * _DetailBrightness * unity_ColorSpaceDouble.rgb, poiMods.detailMask.r * _DetailTexIntensity);
}

void ApplyDetailNormal(inout PoiMods poiMods, inout PoiMesh poiMesh)
{
#if defined(PROP_DETAILMASK) || !defined(OPTIMIZER_ENABLED)
poiMods.detailMask = POI2D_SAMPLER_PAN(_DetailMask, _MainTex, poiUV(poiMesh.uv[_DetailMaskUV], _DetailMask_ST), _DetailMaskPan).rg;
#else
poiMods.detailMask = 1;
#endif

#ifdef POI_BACKFACE
if (!poiMesh.isFrontFace)
{
poiMods.detailMask.g *= _BackFaceDetailIntensity;
}
#endif

#if defined(PROP_DETAILNORMALMAP) || !defined(OPTIMIZER_ENABLED)
half3 detailNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_DetailNormalMap, _MainTex, poiUV(poiMesh.uv[_DetailNormalMapUV], _DetailNormalMap_ST), _DetailNormalMapPan), _DetailNormalMapScale * poiMods.detailMask.g);
poiMesh.tangentSpaceNormal = BlendNormals(detailNormal, poiMesh.tangentSpaceNormal);
#endif
}
#endif

#ifdef VIGNETTE

void calculateRGBNormals(inout PoiMesh poiMesh)
{
float4 rgbMask;
//UNITY_BRANCH
if (_RGBUseVertexColors)
{
rgbMask = poiMesh.vertexColor;
}
else
{
#if defined(PROP_RGBMASK) || !defined(OPTIMIZER_ENABLED)
rgbMask = POI2D_SAMPLER_PAN(_RGBMask, _MainTex, poiUV(poiMesh.uv[_RGBMaskUV], _RGBMask_ST), _RGBMaskPan);
#else
rgbMask = 1;
#endif
}

//UNITY_BRANCH
if (_RgbNormalsEnabled)
{
//UNITY_BRANCH
if (_RGBNormalBlend == 0)
{
//UNITY_BRANCH
if (_RgbNormalRScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalR, _MainTex, poiUV(poiMesh.uv[_RgbNormalRUV], _RgbNormalR_ST), _RgbNormalRPan), _RgbNormalRScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.r);
}

//UNITY_BRANCH
if (_RgbNormalGScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalG, _MainTex, poiUV(poiMesh.uv[_RgbNormalGUV], _RgbNormalG_ST), _RgbNormalGPan), _RgbNormalGScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.g);
}

//UNITY_BRANCH
if (_RgbNormalBScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalB, _MainTex, poiUV(poiMesh.uv[_RgbNormalBUV], _RgbNormalB_ST), _RgbNormalBPan), _RgbNormalBScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.b);
}

//UNITY_BRANCH
if (_RgbNormalAScale > 0)
{
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalA, _MainTex, poiUV(poiMesh.uv[_RgbNormalAUV], _RgbNormalA_ST), _RgbNormalAPan), _RgbNormalAScale);
poiMesh.tangentSpaceNormal = lerp(poiMesh.tangentSpaceNormal, normalToBlendWith, rgbMask.a);
}
}
else
{
half3 newNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalR, _MainTex, poiUV(poiMesh.uv[_RgbNormalRUV], _RgbNormalR_ST), _RgbNormalRPan), _RgbNormalRScale * rgbMask.r);
half3 normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalG, _MainTex, poiUV(poiMesh.uv[_RgbNormalGUV], _RgbNormalG_ST), _RgbNormalGPan), _RgbNormalGScale * rgbMask.g);
newNormal = BlendNormals(newNormal, normalToBlendWith);
normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalB, _MainTex, poiUV(poiMesh.uv[_RgbNormalBUV], _RgbNormalB_ST), _RgbNormalBPan), _RgbNormalBScale * rgbMask.b);
newNormal = BlendNormals(newNormal, normalToBlendWith);
normalToBlendWith = UnpackScaleNormal(POI2D_SAMPLER_PAN(_RgbNormalA, _MainTex, poiUV(poiMesh.uv[_RgbNormalAUV], _RgbNormalA_ST), _RgbNormalAPan), _RgbNormalAScale * rgbMask.a);
newNormal = BlendNormals(newNormal, normalToBlendWith);
poiMesh.tangentSpaceNormal = BlendNormals(newNormal, poiMesh.tangentSpaceNormal);
}
}
}

void calculateRGBMask(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
//If RGB normals are in use this data will already exist
float4 rgbMask = float4(1, 1, 1, 1);
//UNITY_BRANCH
if (_RGBUseVertexColors)
{
rgbMask = poiMesh.vertexColor;
}
else
{
#if defined(PROP_RGBMASK) || !defined(OPTIMIZER_ENABLED)
rgbMask = POI2D_SAMPLER_PAN(_RGBMask, _MainTex, poiUV(poiMesh.uv[_RGBMaskUV], _RGBMask_ST), _RGBMaskPan);
#else
rgbMask = 1;
#endif
}

#if defined(PROP_REDTEXURE) || !defined(OPTIMIZER_ENABLED)
float4 red = POI2D_SAMPLER_PAN(_RedTexure, _MainTex, poiUV(poiMesh.uv[_RedTexureUV], _RedTexure_ST), _RedTexurePan);
#else
float4 red = 1;
#endif
#if defined(PROP_GREENTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 green = POI2D_SAMPLER_PAN(_GreenTexture, _MainTex, poiUV(poiMesh.uv[_GreenTextureUV], _GreenTexture_ST), _GreenTexturePan);
#else
float4 green = 1;
#endif
#if defined(PROP_BLUETEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 blue = POI2D_SAMPLER_PAN(_BlueTexture, _MainTex, poiUV(poiMesh.uv[_BlueTextureUV], _BlueTexture_ST), _BlueTexturePan);
#else
float4 blue = 1;
#endif
#if defined(PROP_ALPHATEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 alpha = POI2D_SAMPLER_PAN(_AlphaTexture, _MainTex, poiUV(poiMesh.uv[_AlphaTextureUV], _AlphaTexture_ST), _AlphaTexturePan);
#else
float4 alpha = 1;
#endif

//UNITY_BRANCH
if (_RGBBlendMultiplicative)
{
float3 RGBColor = 1;
RGBColor = lerp(RGBColor, red.rgb * _RedColor.rgb, rgbMask.r * red.a * _RedColor.a);
RGBColor = lerp(RGBColor, green.rgb * _GreenColor.rgb, rgbMask.g * green.a * _GreenColor.a);
RGBColor = lerp(RGBColor, blue.rgb * _BlueColor.rgb, rgbMask.b * blue.a * _BlueColor.a);
RGBColor = lerp(RGBColor, alpha.rgb * _AlphaColor.rgb, rgbMask.a * alpha.a * _AlphaColor.a);

poiFragData.baseColor *= RGBColor;
}
else
{
poiFragData.baseColor = lerp(poiFragData.baseColor, red.rgb * _RedColor.rgb, rgbMask.r * red.a * _RedColor.a);
poiFragData.baseColor = lerp(poiFragData.baseColor, green.rgb * _GreenColor.rgb, rgbMask.g * green.a * _GreenColor.a);
poiFragData.baseColor = lerp(poiFragData.baseColor, blue.rgb * _BlueColor.rgb, rgbMask.b * blue.a * _BlueColor.a);
poiFragData.baseColor = lerp(poiFragData.baseColor, alpha.rgb * _AlphaColor.rgb, rgbMask.a * alpha.a * _AlphaColor.a);
}
}
#endif

#ifdef GEOM_TYPE_BRANCH

float2 decalUV(float uvNumber, float2 position, half rotation, half rotationSpeed, half2 scale, float depth, in PoiMesh poiMesh, in PoiCam poiCam)
{
float2 uv = poiMesh.uv[uvNumber] + calcParallax(depth + 1, poiCam);
float2 decalCenter = position;
float theta = radians(rotation + _Time.z * rotationSpeed);
float cs = cos(theta);
float sn = sin(theta);
uv = float2((uv.x - decalCenter.x) * cs - (uv.y - decalCenter.y) * sn + decalCenter.x, (uv.x - decalCenter.x) * sn + (uv.y - decalCenter.y) * cs + decalCenter.y);
uv = remap(uv, float2(0, 0) - scale / 2 + position, scale / 2 + position, float2(0, 0), float2(1, 1));
return uv;
}

inline float3 decalHueShift(float enabled, float3 color, float shift, float shiftSpeed)
{
//UNITY_BRANCH
if (enabled)
{
color = hueShift(color, shift + _Time.x * shiftSpeed);
}
return color;
}

inline float applyTilingClipping(float enabled, float2 uv)
{
float ret = 1;
//UNITY_BRANCH
if (!enabled)
{
if (uv.x > 1 || uv.y > 1 || uv.x < 0 || uv.y < 0)
{
ret = 0;
}
}
return ret;
}

void applyDecals(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{

#if defined(PROP_DECALMASK) || !defined(OPTIMIZER_ENABLED)
float4 decalMask = POI2D_SAMPLER_PAN(_DecalMask, _MainTex, poiMesh.uv[_DecalMaskUV], _DecalMaskPan);
#else
float4 decalMask = 1;
#endif

float4 decalColor = 1;
float2 uv = 0;

// Decal 0
float2 decalScale = float2(1, 1);
float decalRotation = 0;
decalScale = _DecalScale;
#if defined(PROP_DECALTEXTURE) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal0Scale.xy, _AudioLinkDecal0Scale.zw, poiMods.audioLink[_AudioLinkDecal0ScaleBand]);
decalRotation += lerp(_AudioLinkDecal0Rotation.x, _AudioLinkDecal0Rotation.y, poiMods.audioLink[_AudioLinkDecal0RotationBand]);
}
#endif
uv = decalUV(_DecalTextureUV, _DecalPosition, _DecalRotation + decalRotation, _DecalRotationSpeed, decalScale, _Decal0Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture, _MainTex, uv, _DecalTexturePan) * _DecalColor;
#else
uv = decalUV(_DecalTextureUV, _DecalPosition, _DecalRotation + decalRotation, _DecalRotationSpeed, decalScale, _Decal0Depth, poiMesh, poiCam);
decalColor = _DecalColor;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled, decalColor.rgb, _DecalHueShift, _DecalHueShiftSpeed);
decalColor.a *= applyTilingClipping(_DecalTiled, uv) * decalMask.r;

float audioLinkDecalAlpha0 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha0 = lerp(_AudioLinkDecal0Alpha.x, _AudioLinkDecal0Alpha.y, poiMods.audioLink[_AudioLinkDecal0AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType), decalColor.a * saturate(_DecalBlendAlpha + audioLinkDecalAlpha0));

float audioLinkDecalEmission0 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission0 = lerp(_AudioLinkDecal0Emission.x, _AudioLinkDecal0Emission.y, poiMods.audioLink[_AudioLinkDecal0EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength + audioLinkDecalEmission0, 0);

#ifdef GEOM_TYPE_BRANCH_DETAIL
// Decal 1
decalScale = _DecalScale1;
decalRotation = 0;
#if defined(PROP_DECALTEXTURE1) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal1Scale.xy, _AudioLinkDecal1Scale.zw, poiMods.audioLink[_AudioLinkDecal1ScaleBand]);
decalRotation += lerp(_AudioLinkDecal1Rotation.x, _AudioLinkDecal1Rotation.y, poiMods.audioLink[_AudioLinkDecal1RotationBand]);
}
#endif
uv = decalUV(_DecalTexture1UV, _DecalPosition1, _DecalRotation1 + decalRotation, _DecalRotationSpeed1, decalScale, _Decal1Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture1, _MainTex, uv, _DecalTexture1Pan) * _DecalColor1;
#else
uv = decalUV(_DecalTexture1UV, _DecalPosition1, _DecalRotation1 + decalRotation, _DecalRotationSpeed1, decalScale, _Decal1Depth, poiMesh, poiCam);
decalColor = _DecalColor1;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled1, decalColor.rgb, _DecalHueShift1, _DecalHueShiftSpeed1);
decalColor.a *= applyTilingClipping(_DecalTiled1, uv) * decalMask.g;

float audioLinkDecalAlpha1 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha1 = lerp(_AudioLinkDecal1Alpha.x, _AudioLinkDecal1Alpha.y, poiMods.audioLink[_AudioLinkDecal1AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType1), decalColor.a * saturate(_DecalBlendAlpha1 + audioLinkDecalAlpha1));

float audioLinkDecalEmission1 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission1 = lerp(_AudioLinkDecal1Emission.x, _AudioLinkDecal1Emission.y, poiMods.audioLink[_AudioLinkDecal1EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength1 + audioLinkDecalEmission1, 0);
#endif
#ifdef GEOM_TYPE_FROND
// Decal 2
decalScale = _DecalScale2;
decalRotation = 0;
#if defined(PROP_DECALTEXTURE2) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal2Scale.xy, _AudioLinkDecal2Scale.zw, poiMods.audioLink[_AudioLinkDecal2ScaleBand]);
decalRotation += lerp(_AudioLinkDecal2Rotation.x, _AudioLinkDecal2Rotation.y, poiMods.audioLink[_AudioLinkDecal2RotationBand]);
}
#endif
uv = decalUV(_DecalTexture2UV, _DecalPosition2, _DecalRotation2 + decalRotation, _DecalRotationSpeed2, decalScale, _Decal2Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture2, _MainTex, uv, _DecalTexture2Pan) * _DecalColor2;
#else
uv = decalUV(_DecalTexture2UV, _DecalPosition2, _DecalRotation2 + decalRotation, _DecalRotationSpeed2, decalScale, _Decal2Depth, poiMesh, poiCam);
decalColor = _DecalColor2;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled2, decalColor.rgb, _DecalHueShift2, _DecalHueShiftSpeed2);
decalColor.a *= applyTilingClipping(_DecalTiled2, uv) * decalMask.b;

float audioLinkDecalAlpha2 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha2 = lerp(_AudioLinkDecal2Alpha.x, _AudioLinkDecal2Alpha.y, poiMods.audioLink[_AudioLinkDecal2AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType2), decalColor.a * saturate(_DecalBlendAlpha2 + audioLinkDecalAlpha2));

float audioLinkDecalEmission2 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission2 = lerp(_AudioLinkDecal2Emission.x, _AudioLinkDecal2Emission.y, poiMods.audioLink[_AudioLinkDecal2EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength2 + audioLinkDecalEmission2, 0);
#endif
#ifdef DEPTH_OF_FIELD_COC_VIEW
// Decal 3
decalScale = _DecalScale3;
decalRotation = 0;
#if defined(PROP_DECALTEXTURE3) || !defined(OPTIMIZER_ENABLED)
#ifdef POI_AUDIOLINK
//UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
decalScale += lerp(_AudioLinkDecal3Scale.xy, _AudioLinkDecal3Scale.zw, poiMods.audioLink[_AudioLinkDecal3ScaleBand]);
decalRotation += lerp(_AudioLinkDecal3Rotation.x, _AudioLinkDecal3Rotation.y, poiMods.audioLink[_AudioLinkDecal3RotationBand]);
}
#endif
uv = decalUV(_DecalTexture3UV, _DecalPosition3, _DecalRotation3 + decalRotation, _DecalRotationSpeed3, decalScale, _Decal3Depth, poiMesh, poiCam);
decalColor = POI2D_SAMPLER_PAN(_DecalTexture3, _MainTex, uv, _DecalTexture3Pan) * _DecalColor3;
#else
uv = decalUV(_DecalTexture3UV, _DecalPosition3, _DecalRotation3 + decalRotation, _DecalRotationSpeed3, decalScale, _Decal3Depth, poiMesh, poiCam);
decalColor = _DecalColor3;
#endif
decalColor.rgb = decalHueShift(_DecalHueShiftEnabled3, decalColor.rgb, _DecalHueShift3, _DecalHueShiftSpeed3);
decalColor.a *= applyTilingClipping(_DecalTiled3, uv) * decalMask.a;

float audioLinkDecalAlpha3 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalAlpha3 = lerp(_AudioLinkDecal3Alpha.x, _AudioLinkDecal3Alpha.y, poiMods.audioLink[_AudioLinkDecal3AlphaBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.baseColor.rgb = lerp(poiFragData.baseColor.rgb, customBlend(poiFragData.baseColor.rgb, decalColor.rgb, _DecalBlendType3), decalColor.a * saturate(_DecalBlendAlpha3 + audioLinkDecalAlpha3));

float audioLinkDecalEmission3 = 0;
#ifdef POI_AUDIOLINK
audioLinkDecalEmission3 = lerp(_AudioLinkDecal3Emission.x, _AudioLinkDecal3Emission.y, poiMods.audioLink[_AudioLinkDecal3EmissionBand]) * poiMods.audioLinkTextureExists;
#endif

poiFragData.emission += decalColor.rgb * decalColor.a * max(_DecalEmissionStrength3 + audioLinkDecalEmission3, 0);
#endif

poiFragData.baseColor = saturate(poiFragData.baseColor);
}
#endif

#ifdef _SUNDISK_SIMPLE

float3 RandomColorFromPoint(float2 rando)
{
fixed hue = random2(rando.x + rando.y).x;
fixed saturation = lerp(_GlitterMinMaxSaturation.x, _GlitterMinMaxSaturation.y, rando.x);
fixed value = lerp(_GlitterMinMaxBrightness.x, _GlitterMinMaxBrightness.y, rando.y);
float3 hsv = float3(hue, saturation, value);
return HSVtoRGB(hsv);
}

void applyGlitter(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
// Scale
float2 st = frac(poiMesh.uv[0] + _GlitterUVPanning.xy * _Time.x) * _GlitterFrequency;

// Tile the space
float2 i_st = floor(st);
float2 f_st = frac(st);

float m_dist = 10.;  // minimun distance
float2 m_point = 0;        // minimum point
float2 randoPoint = 0;
float2 dank;
for (int j = -1; j <= 1; j++)
{
for (int i = -1; i <= 1; i++)
{
float2 neighbor = float2(i, j);
float2 pos = random2(i_st + neighbor);
float2 rando = pos;
pos = 0.5 + 0.5 * sin(_GlitterJitter * 6.2831 * pos);
float2 diff = neighbor + pos - f_st;
float dist = length(diff);

if (dist < m_dist)
{
dank = diff;
m_dist = dist;
m_point = pos;
randoPoint = rando;
}
}
}

float randomFromPoint = random(randoPoint);

float size = _GlitterSize;
UNITY_BRANCH
if (_GlitterRandomSize)
{
size = remapClamped(0, 1, randomFromPoint, _GlitterMinMaxSize.x, _GlitterMinMaxSize.y);
}

// Assign a color using the closest point position
//color += dot(m_point, float2(.3, .6));

// Add distance field to closest point center
// color.g = m_dist;

// Show isolines
//color -= abs(sin(40.0 * m_dist)) * 0.07;

// Draw cell center
half glitterAlpha = 1;
switch(_GlitterShape)
{
case 0: //circle
glitterAlpha = (1. - step(size, m_dist));
break;
case 1: //sqaure
float jaggyFix = pow(poiCam.distanceToVert, 2) * _GlitterJaggyFix;

UNITY_BRANCH
if (_GlitterRandomRotation == 1 || _GlitterTextureRotation != 0)
{
float2 center = float2(0, 0);
float randomBoy = 0;
UNITY_BRANCH
if (_GlitterRandomRotation)
{
randomBoy = random(randoPoint);
}
float theta = radians((randomBoy + _Time.x * _GlitterTextureRotation) * 360);
float cs = cos(theta);
float sn = sin(theta);
dank = float2((dank.x - center.x) * cs - (dank.y - center.y) * sn + center.x, (dank.x - center.x) * sn + (dank.y - center.y) * cs + center.y);
glitterAlpha = (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.x))) * (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.y)));
}
else
{
glitterAlpha = (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.x))) * (1. - smoothstep(size - .1 * jaggyFix, size, abs(dank.y)));
}
break;
}

float3 finalGlitter = 0;

half3 glitterColor = _GlitterColor;

float3 norm = poiMesh.normals[1];
float3 randomRotation = 0;
switch(_GlitterMode)
{
case 0:
UNITY_BRANCH
if (_GlitterSpeed > 0)
{
randomRotation = randomFloat3WiggleRange(randoPoint, _GlitterAngleRange, _GlitterSpeed);
}
else
{
randomRotation = randomFloat3Range(randoPoint, _GlitterAngleRange);
}

float3 glitterReflectionDirection = normalize(mul(poiRotationMatrixFromAngles(randomRotation), norm));
finalGlitter = lerp(0, _GlitterMinBrightness * glitterAlpha, glitterAlpha) + max(pow(saturate(dot(lerp(glitterReflectionDirection, poiCam.viewDir, _GlitterBias), poiCam.viewDir)), _GlitterContrast), 0);
finalGlitter *= glitterAlpha;
break;
case 1:
float offset = random(randoPoint);
float brightness = sin((_Time.x + offset) * _GlitterSpeed) * _glitterFrequencyLinearEmissive - (_glitterFrequencyLinearEmissive - 1);
finalGlitter = max(_GlitterMinBrightness * glitterAlpha, brightness * glitterAlpha * smoothstep(0, 1, 1 - m_dist * _GlitterCenterSize * 10));
break;
case 2:
if (_GlitterSpeed > 0)
{
randomRotation = randomFloat3WiggleRange(randoPoint, _GlitterAngleRange, _GlitterSpeed);
}
else
{
randomRotation = randomFloat3Range(randoPoint, _GlitterAngleRange);
}

float3 glitterLightReflectionDirection = normalize(mul(poiRotationMatrixFromAngles(randomRotation), norm));

#ifdef UNITY_PASS_FORWARDADD
glitterAlpha *= poiLight.nDotLSaturated * poiLight.attenuation;
#endif
#ifdef UNITY_PASS_FORWARDBASE
glitterAlpha *= poiLight.nDotLSaturated;
#endif

float3 halfDir = normalize(poiLight.direction + poiCam.viewDir);
float specAngle = max(dot(halfDir, glitterLightReflectionDirection), 0.0);

finalGlitter = lerp(0, _GlitterMinBrightness * glitterAlpha, glitterAlpha) + max(pow(specAngle, _GlitterContrast), 0);

glitterColor *= poiLight.directColor;
finalGlitter *= glitterAlpha;

break;
}

glitterColor *= lerp(1, poiFragData.baseColor, _GlitterUseSurfaceColor);
#if defined(PROP_GLITTERCOLORMAP) || !defined(OPTIMIZER_ENABLED)
glitterColor *= POI2D_SAMPLER_PAN(_GlitterColorMap, _MainTex, poiUV(poiMesh.uv[_GlitterColorMapUV], _GlitterColorMap_ST), _GlitterColorMapPan).rgb;
#endif
float2 uv = remapClamped(-size, size, dank, 0, 1);
UNITY_BRANCH
if (_GlitterRandomRotation == 1 || _GlitterTextureRotation != 0 && !_GlitterShape)
{
float2 fakeUVCenter = float2(.5, .5);
float randomBoy = 0;
UNITY_BRANCH
if (_GlitterRandomRotation)
{
randomBoy = random(randoPoint);
}
float theta = radians((randomBoy + _Time.x * _GlitterTextureRotation) * 360);
float cs = cos(theta);
float sn = sin(theta);
uv = float2((uv.x - fakeUVCenter.x) * cs - (uv.y - fakeUVCenter.y) * sn + fakeUVCenter.x, (uv.x - fakeUVCenter.x) * sn + (uv.y - fakeUVCenter.y) * cs + fakeUVCenter.y);
}

#if defined(PROP_GLITTERTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 glitterTexture = POI2D_SAMPLER_PAN(_GlitterTexture, _MainTex, poiUV(uv, _GlitterTexture_ST), _GlitterTexturePan);
#else
float4 glitterTexture = 1;
#endif
//float4 glitterTexture = _GlitterTexture.SampleGrad(sampler_MainTex, frac(uv), ddx(uv), ddy(uv));
glitterColor *= glitterTexture.rgb;
#if defined(PROP_GLITTERMASK) || !defined(OPTIMIZER_ENABLED)
float glitterMask = POI2D_SAMPLER_PAN(_GlitterMask, _MainTex, poiUV(poiMesh.uv[_GlitterMaskUV], _GlitterMask_ST), _GlitterMaskPan);
#else
float glitterMask = 1;
#endif

glitterMask *= lerp(1, poiLight.attenuation, _GlitterHideInShadow);

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskGlitter != 4)
{
glitterMask *= blackLightMask[_BlackLightMaskGlitter];
}
#endif

if (_GlitterRandomColors)
{
glitterColor *= RandomColorFromPoint(random2(randoPoint.x + randoPoint.y));
}

UNITY_BRANCH
if (_GlitterHueShiftEnabled)
{
glitterColor.rgb = hueShift(glitterColor.rgb, _GlitterHueShift + _Time.x * _GlitterHueShiftSpeed);
}

UNITY_BRANCH
if (_GlitterBlendType == 1)
{
poiFragData.baseColor = lerp(poiFragData.baseColor, finalGlitter * glitterColor * _GlitterBrightness, finalGlitter * glitterTexture.a * glitterMask);
poiFragData.emission += finalGlitter * glitterColor * max(0, (_GlitterBrightness - 1) * glitterTexture.a) * glitterMask;
}
else
{
poiFragData.emission += finalGlitter * glitterColor * _GlitterBrightness * glitterTexture.a * glitterMask;
}
}
#endif

#ifdef _GLOSSYREFLECTIONS_OFF
void ApplyRimLighting(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam, in PoiLight poiLight)
{
#if defined(PROP_RIMWIDTHNOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
float rimNoise = POI2D_SAMPLER_PAN(_RimWidthNoiseTexture, _MainTex, poiMesh.uv[_RimWidthNoiseTextureUV], _RimWidthNoiseTexturePan);
#else
float rimNoise = 0;
#endif

rimNoise = (rimNoise - .5) * _RimWidthNoiseStrength;

float viewDotNormal = saturate(abs(dot(poiCam.viewDir, poiMesh.normals[_RimLightNormal])));

UNITY_BRANCH
if (_RimLightingInvert)
{
viewDotNormal = 1 - viewDotNormal;
}
float rimStrength = _RimStrength;
float rimBrighten = _RimBrighten;

float rimWidth = lerp( - .05, 1, _RimWidth);
#ifdef POI_AUDIOLINK
UNITY_BRANCH
if (poiMods.audioLinkTextureExists)
{
rimWidth = clamp(rimWidth + lerp(_AudioLinkRimWidthAdd.x, _AudioLinkRimWidthAdd.y, poiMods.audioLink[_AudioLinkRimWidthBand]), - .05, 1);
rimStrength += lerp(_AudioLinkRimEmissionAdd.x, _AudioLinkRimEmissionAdd.y, poiMods.audioLink[_AudioLinkRimEmissionBand]);
rimBrighten += lerp(_AudioLinkRimBrightnessAdd.x, _AudioLinkRimBrightnessAdd.y, poiMods.audioLink[_AudioLinkRimBrightnessBand]);
}
#endif

rimWidth -= rimNoise;
#if defined(PROP_RIMMASK) || !defined(OPTIMIZER_ENABLED)
float rimMask = POI2D_SAMPLER_PAN(_RimMask, _MainTex, poiMesh.uv[_RimMaskUV], _RimMaskPan);
#else
float rimMask = 1;
#endif

#if defined(PROP_RIMTEX) || !defined(OPTIMIZER_ENABLED)
float4 rimColor = POI2D_SAMPLER_PAN(_RimTex, _MainTex, poiMesh.uv[_RimTexUV], _RimTexPan) * _RimLightColor;
#else
float4 rimColor = _RimLightColor;
#endif

UNITY_BRANCH
if (_RimHueShiftEnabled)
{
rimColor.rgb = hueShift(rimColor.rgb, _RimHueShift + _Time.x * _RimHueShiftSpeed);
}

rimWidth = max(lerp(rimWidth, rimWidth * lerp(0, 1, poiLight.lightMap - _ShadowMixThreshold) * _ShadowMixWidthMod, _ShadowMix), 0);
float rim = 1 - smoothstep(min(_RimSharpness, rimWidth), rimWidth, viewDotNormal);
rim *= _RimLightColor.a * rimColor.a * rimMask;
poiFragData.emission += rim * lerp(poiFragData.baseColor, rimColor, _RimLightColorBias) * rimStrength;
poiFragData.baseColor = lerp(poiFragData.baseColor, lerp(poiFragData.baseColor, rimColor, _RimLightColorBias) + lerp(poiFragData.baseColor, rimColor, _RimLightColorBias) * rimBrighten, rim);
}
#endif

#ifdef _SUNDISK_HIGH_QUALITY

void applyFlipbook(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
float4 flipBookPixel = float4(0, 0, 0, 0);
#if defined(PROP_FLIPBOOKMASK) || !defined(OPTIMIZER_ENABLED)
float flipBookMask = POI2D_SAMPLER_PAN(_FlipbookMask, _MainTex, poiMesh.uv[_FlipbookMaskUV], _FlipbookMaskPan).r;
#else
float flipBookMask = 1;
#endif
float4 flipbookScaleOffset = _FlipbookScaleOffset;

#ifdef POI_AUDIOLINK
flipbookScaleOffset.xy += lerp(_AudioLinkFlipbookScale.xy, _AudioLinkFlipbookScale.zw, poiMods.audioLink[_AudioLinkFlipbookScaleBand]);
#endif

flipbookScaleOffset.xy = 1 - flipbookScaleOffset.xy;
float2 uv = frac(poiMesh.uv[_FlipbookTexArrayUV]);
float theta = radians(_FlipbookRotation + _Time.z * _FlipbookRotationSpeed);
float cs = cos(theta);
float sn = sin(theta);
float2 spriteCenter = flipbookScaleOffset.zw + .5;
// 2d rotation
uv = float2((uv.x - spriteCenter.x) * cs - (uv.y - spriteCenter.y) * sn + spriteCenter.x, (uv.x - spriteCenter.x) * sn + (uv.y - spriteCenter.y) * cs + spriteCenter.y);

float2 newUV = remap(uv, float2(0, 0) + flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(1, 1) - flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(0, 0), float2(1, 1));

UNITY_BRANCH
if (_FlipbookTiled == 0)
{
if (max(newUV.x, newUV.y) > 1 || min(newUV.x, newUV.y) < 0)
{
return;
}
}
#if defined(PROP_FLIPBOOKTEXARRAY) || !defined(OPTIMIZER_ENABLED)
float currentFrame = fmod(_FlipbookCurrentFrame, _FlipbookTotalFrames);
if (_FlipbookCurrentFrame < 0)
{
currentFrame = (_Time.y / (1 / _FlipbookFPS)) % _FlipbookTotalFrames;
}
#ifdef POI_AUDIOLINK
currentFrame += lerp(_AudioLinkFlipbookFrame.x, _AudioLinkFlipbookFrame.y, poiMods.audioLink[_AudioLinkFlipbookFrameBand]);
#endif
flipBookPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor(currentFrame)));
UNITY_BRANCH
if (_FlipbookCrossfadeEnabled)
{
float4 flipbookNextPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor((currentFrame + 1) % _FlipbookTotalFrames)));
flipBookPixel = lerp(flipBookPixel, flipbookNextPixel, smoothstep(_FlipbookCrossfadeRange.x, _FlipbookCrossfadeRange.y, frac(currentFrame)));
}
#else
flipBookPixel = 1;
#endif

UNITY_BRANCH
if (_FlipbookIntensityControlsAlpha)
{
flipBookPixel.a = poiMax(flipBookPixel.rgb);
}
UNITY_BRANCH
if (_FlipbookColorReplaces)
{
flipBookPixel.rgb = _FlipbookColor.rgb;
}
else
{
flipBookPixel.rgb *= _FlipbookColor.rgb;
}

#ifdef POI_BLACKLIGHT
UNITY_BRANCH
if (_BlackLightMaskFlipbook != 4)
{
flipBookMask *= blackLightMask[_BlackLightMaskFlipbook];
}
#endif

UNITY_BRANCH
if (_FlipbookHueShiftEnabled)
{
flipBookPixel.rgb = hueShift(flipBookPixel.rgb, _FlipbookHueShift + _Time.x * _FlipbookHueShiftSpeed);
}
half flipbookAlpha = 1;
#ifdef POI_AUDIOLINK
flipbookAlpha = saturate(lerp(_AudioLinkFlipbookAlpha.x, _AudioLinkFlipbookAlpha.y, poiMods.audioLink[_AudioLinkFlipbookAlphaBand]));
#endif

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)

poiFragData.baseColor = lerp(poiFragData.baseColor, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * _FlipbookReplace * flipBookMask * flipbookAlpha);
poiFragData.baseColor = poiFragData.baseColor + flipBookPixel.rgb * _FlipbookAdd * flipBookMask * flipbookAlpha;
poiFragData.baseColor = poiFragData.baseColor * lerp(1, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * flipBookMask * _FlipbookMultiply * flipbookAlpha);

float flipbookEmissionStrength = _FlipbookEmissionStrength;
#ifdef POI_AUDIOLINK
flipbookEmissionStrength += max(lerp(_AudioLinkFlipbookEmission.x, _AudioLinkFlipbookEmission.y, poiMods.audioLink[_AudioLinkFlipbookEmissionBand]), 0);
#endif

poiFragData.emission += lerp(0, flipBookPixel.rgb * flipbookEmissionStrength, flipBookPixel.a * _FlipbookColor.a * flipBookMask * flipbookAlpha);

#endif

UNITY_BRANCH
if (_FlipbookAlphaControlsFinalAlpha)
{
poiFragData.alpha = lerp(poiFragData.alpha, flipBookPixel.a * _FlipbookColor.a, flipBookMask);
}
}

#endif

#ifdef DISTORT
void applyDissolve(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
float dissolveMask = POI2D_SAMPLER_PAN(_DissolveMask, _MainTex, poiUV(poiMesh.uv[_DissolveMaskUV], _DissolveMask_ST), _DissolveMaskPan).r;
#else
float dissolveMask = 1;
#endif
UNITY_BRANCH
if (_DissolveUseVertexColors)
{
// Vertex Color Imprecision hype
dissolveMask = ceil(poiMesh.vertexColor.g * 100000) / 100000;
}

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
dissolveToTexture = POI2D_SAMPLER_PAN(_DissolveToTexture, _MainTex, poiUV(poiMesh.uv[_DissolveToTextureUV], _DissolveToTexture_ST), _DissolveToTexturePan) * _DissolveTextureColor;
#else
dissolveToTexture = _DissolveTextureColor;
#endif

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
float dissolveNoiseTexture = POI2D_SAMPLER_PAN(_DissolveNoiseTexture, _MainTex, poiUV(poiMesh.uv[_DissolveNoiseTextureUV], _DissolveNoiseTexture_ST), _DissolveNoiseTexturePan).r;
#else
float dissolveNoiseTexture = 1;
#endif

float da = _DissolveAlpha
+ _DissolveAlpha0
+ _DissolveAlpha1
+ _DissolveAlpha2
+ _DissolveAlpha3
+ _DissolveAlpha4
+ _DissolveAlpha5
+ _DissolveAlpha6
+ _DissolveAlpha7
+ _DissolveAlpha8
+ _DissolveAlpha9;
float dds = _DissolveDetailStrength;

#ifdef POI_AUDIOLINK
UNITY_BRANCH
if (_EnableDissolveAudioLink && poiMods.audioLinkTextureExists)
{
da += lerp(_AudioLinkDissolveAlpha.x, _AudioLinkDissolveAlpha.y, poiMods.audioLink[_AudioLinkDissolveAlphaBand]);
dds += lerp(_AudioLinkDissolveDetail.x, _AudioLinkDissolveDetail.y, poiMods.audioLink[_AudioLinkDissolveDetailBand]);
}
#endif

da = saturate(da);
dds = saturate(dds);

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskDissolve != 4)
{
dissolveMask *= blackLightMask[_BlackLightMaskDissolve];
}
#endif

if (_DissolveMaskInvert)
{
dissolveMask = 1 - dissolveMask;
}
#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
float dissolveDetailNoise = POI2D_SAMPLER_PAN(_DissolveDetailNoise, _MainTex, poiUV(poiMesh.uv[_DissolveDetailNoiseUV], _DissolveDetailNoise_ST), _DissolveDetailNoisePan);
#else
float dissolveDetailNoise = 0;
#endif
if (_DissolveInvertNoise)
{
dissolveNoiseTexture = 1 - dissolveNoiseTexture;
}
if (_DissolveInvertDetailNoise)
{
dissolveDetailNoise = 1 - dissolveDetailNoise;
}
if (_ContinuousDissolve != 0)
{
da = sin(_Time.y * _ContinuousDissolve) * .5 + .5;
}
da *= dissolveMask;
dissolveAlpha = da;
edgeAlpha = 0;

UNITY_BRANCH
if (_DissolveType == 1) // Basic

{
da = remap(da, 0, 1, -_DissolveEdgeWidth, 1);
dissolveAlpha = da;
//Adjust detail strength to avoid artifacts
dds *= smoothstep(1, .99, da);
float noise = saturate(dissolveNoiseTexture - dissolveDetailNoise * dds);

noise = saturate(noise + 0.001);
//noise = remap(noise, 0, 1, _DissolveEdgeWidth, 1 - _DissolveEdgeWidth);
dissolveAlpha = dissolveAlpha >= noise;
edgeAlpha = remapClamped(da + _DissolveEdgeWidth, da, noise) * (1 - dissolveAlpha);
}
else if (_DissolveType == 2) // Point to Point

{
float3 direction;
float3 currentPos;
float distanceTo = 0;
direction = normalize(_DissolveEndPoint - _DissolveStartPoint);
currentPos = lerp(_DissolveStartPoint, _DissolveEndPoint, dissolveAlpha);

UNITY_BRANCH
if (_DissolveP2PWorldLocal != 1)
{
float3 pos = _DissolveP2PWorldLocal == 0 ? poiMesh.localPos.rgb : poiMesh.vertexColor.rgb;
distanceTo = dot(pos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
else
{
distanceTo = dot(poiMesh.worldPos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
}

#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveHueShiftEnabled)
{
dissolveToTexture.rgb = hueShift(dissolveToTexture.rgb, _DissolveHueShift + _Time.x * _DissolveHueShiftSpeed);
}
#endif

poiFragData.alpha = lerp(poiFragData.alpha, dissolveToTexture.a, dissolveAlpha * .999999);

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)
poiFragData.baseColor = lerp(poiFragData.baseColor, dissolveToTexture.rgb, dissolveAlpha * .999999);

UNITY_BRANCH
if (_DissolveEdgeWidth)
{
edgeColor = tex2D(_DissolveEdgeGradient, poiUV(float2(edgeAlpha, edgeAlpha), _DissolveEdgeGradient_ST)) * _DissolveEdgeColor;
#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveEdgeHueShiftEnabled)
{
edgeColor.rgb = hueShift(edgeColor.rgb, _DissolveEdgeHueShift + _Time.x * _DissolveEdgeHueShiftSpeed);
}
#endif
poiFragData.baseColor = lerp(poiFragData.baseColor, edgeColor.rgb, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
}

poiFragData.emission += lerp(0, dissolveToTexture * _DissolveToEmissionStrength, dissolveAlpha) + lerp(0, edgeColor.rgb * _DissolveEdgeEmission, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
#endif
}
#endif

float4 frag(v2f i, uint facing : SV_IsFrontFace) : SV_Target
{
UNITY_SETUP_INSTANCE_ID(i);
PoiMesh poiMesh;
PoiInitStruct(PoiMesh, poiMesh);

PoiLight poiLight;
PoiInitStruct(PoiLight, poiLight);

PoiVertexLights poiVertexLights;
PoiInitStruct(PoiVertexLights, poiVertexLights);

PoiCam poiCam;
PoiInitStruct(PoiCam, poiCam);

PoiMods poiMods;
PoiInitStruct(PoiMods, poiMods);

PoiFragData poiFragData;
poiFragData.emission = 0;
poiFragData.baseColor = float3(0, 0, 0);
poiFragData.finalColor = float3(0, 0, 0);
poiFragData.alpha = 1;

// Mesh Data
poiMesh.objectPosition = i.objectPos;
poiMesh.objNormal = i.objNormal;
poiMesh.normals[0] = i.normal;
poiMesh.tangent = i.tangent;
poiMesh.binormal = i.binormal;
poiMesh.worldPos = i.worldPos.xyz;
poiMesh.localPos = i.localPos.xyz;
poiMesh.vertexColor = i.vertexColor;
poiMesh.isFrontFace = facing;

#ifndef POI_PASS_FORWARDOUTLINE
if (!poiMesh.isFrontFace)
{
poiMesh.normals[0] *= -1;
poiMesh.tangent *= -1;
poiMesh.binormal *= -1;
}
#endif
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 6 Distorted UV
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
poiMesh.lightmapUV = i.lightmapUV;
#endif
poiMesh.uv[0] = i.uv[0];
poiMesh.uv[1] = i.uv[1];
poiMesh.uv[2] = i.uv[2];
poiMesh.uv[3] = i.uv[3];
poiMesh.uv[4] = poiMesh.uv[0];
poiMesh.uv[5] = poiMesh.worldPos.xz;
poiMesh.uv[6] = poiMesh.uv[0];
poiMesh.uv[7] = poiMesh.uv[0];
poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
#ifdef USER_LUT
poiMesh.uv[7] = distortedUV(poiMesh);
#endif
/*
half3 worldViewUp = normalize(half3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, half3(0, 1, 0)));
half3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
poiMesh[8] = half2(dot(worldViewRight, poiMesh.normals[_MatcapNormal]), dot(worldViewUp, poiMesh.normals[_MatcapNormal])) * _MatcapBorder + 0.5;
*/

float4 mainTexture = UNITY_SAMPLE_TEX2D(_MainTex, poiUV(poiMesh.uv[_MainTexUV].xy, _MainTex_ST) + _Time.x * _MainTexPan);

float3 mainNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_BumpMap, _MainTex, poiUV(poiMesh.uv[_BumpMapUV], _BumpMap_ST), _BumpMapPan), _BumpScale);
poiMesh.tangentSpaceNormal = mainNormal;

#if defined(FINALPASS) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
ApplyDetailNormal(poiMods, poiMesh);
#endif

#if defined(GEOM_TYPE_MESH) && defined(VIGNETTE) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
calculateRGBNormals(poiMesh);
#endif

poiMesh.normals[1] = normalize(
poiMesh.tangentSpaceNormal.x * poiMesh.tangent.xyz +
poiMesh.tangentSpaceNormal.y * poiMesh.binormal +
poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
);

#ifdef POI_PASS_FORWARDOUTLINE
poiMesh.normals[1] = poiMesh.normals[0];
#endif

// Camera data
poiCam.viewDir = normalize(_WorldSpaceCameraPos - i.worldPos.xyz);
poiCam.forwardDir = getCameraForward();
poiCam.worldPos = _WorldSpaceCameraPos;
poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
//poiCam.distanceToModel = distance(poiMesh.modelPos, poiCam.worldPos);
poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
poiCam.grabPos = i.grabPos;
poiCam.screenUV = calcScreenUVs(i.grabPos);
poiCam.tangentViewDir = normalize(i.tangentViewDir);
poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
poiCam.clipPos = i.pos;

#if defined(PROP_LIGHTINGMAPSTEX) || !defined(OPTIMIZER_ENABLED)
float4 lightingMaps = POI2D_SAMPLER_PAN(_LightingMapsTex, _MainTex, poiUV(poiMesh.uv[_LightingMapsTexUV], _LightingMapsTex_ST), _LightingMapsTexPan);
#else
float4 lightingMaps = float4(1, 1, 1, 1);
#endif

poiLight.occlusion = lerp(1, lightingMaps.r, _LightDataAOStrength);
poiLight.detailShadow = lerp(1, lightingMaps.g, _LightDataDetailStrength);
poiLight.shadowMask = lerp(1, lightingMaps.b, _LightDataShadowMaskStrength);

#ifdef UNITY_PASS_FORWARDBASE

bool lightExists = false;
if (any(_LightColor0.rgb >= 0.002))
{
lightExists = true;
}

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
float4 toLightX = unity_4LightPosX0 - i.worldPos.x;
float4 toLightY = unity_4LightPosY0 - i.worldPos.y;
float4 toLightZ = unity_4LightPosZ0 - i.worldPos.z;
float4 lengthSq = 0;
lengthSq += toLightX * toLightX;
lengthSq += toLightY * toLightY;
lengthSq += toLightZ * toLightZ;

float4 lightAttenSq = unity_4LightAtten0;
float4 atten = 1.0 / (1.0 + lengthSq * lightAttenSq);
float4 vLightWeight = saturate(1 - (lengthSq * lightAttenSq / 25));
poiLight.vAttenuation = min(atten, vLightWeight * vLightWeight);

poiLight.vDotNL = 0;
poiLight.vDotNL += toLightX * poiMesh.normals[1].x;
poiLight.vDotNL += toLightY * poiMesh.normals[1].y;
poiLight.vDotNL += toLightZ * poiMesh.normals[1].z;

float4 corr = rsqrt(lengthSq);
poiLight.vDotNL = max(0, poiLight.vDotNL * corr);
poiLight.vAttenuationDotNL = poiLight.vAttenuation * poiLight.vDotNL;

for (int index = 0; index < 4; index++)
{
poiLight.vPosition[index] = float3(unity_4LightPosX0[index], unity_4LightPosY0[index], unity_4LightPosZ0[index]);

float3 vertexToLightSource = poiLight.vPosition[index] - poiMesh.worldPos;
poiLight.vDirection[index] = normalize(vertexToLightSource);
//poiLight.vAttenuationDotNL[index] = 1.0 / (1.0 + unity_4LightAtten0[index] * poiLight.vDotNL[index]);
poiLight.vColor[index] = unity_LightColor[index].rgb;
//UNITY_BRANCH
if (_LightingAdditiveLimitIntensity == 1)
{
float intensity = max(0.001, (0.299 * poiLight.vColor[index].r + 0.587 * poiLight.vColor[index].g + 0.114 * poiLight.vColor[index].b));
poiLight.vColor[index] = min(poiLight.vColor[index], poiLight.vColor[index] / (intensity / _LightingAdditiveMaxIntensity));
}
poiLight.vHalfDir[index] = Unity_SafeNormalize(poiLight.vDirection[index] + poiCam.viewDir);
poiLight.vDotNL[index] = dot(poiMesh.normals[1], -poiLight.vDirection[index]);
poiLight.vCorrectedDotNL[index] = .5 * (poiLight.vDotNL[index] + 1);
poiLight.vDotLH[index] = saturate(dot(poiLight.vDirection[index], poiLight.vHalfDir[index]));

poiLight.vDotNH[index] = saturate(dot(poiMesh.normals[1], poiLight.vHalfDir[index]));
}
#endif

//UNITY_BRANCH
if (_LightingColorMode == 0) // Poi Custom Light Color

{
float3 magic = max(BetterSH9(normalize(unity_SHAr + unity_SHAg + unity_SHAb)), 0);
float3 normalLight = _LightColor0.rgb + BetterSH9(float4(0, 0, 0, 1));

float magiLumi = calculateluminance(magic);
float normaLumi = calculateluminance(normalLight);
float maginormalumi = magiLumi + normaLumi;

float magiratio = magiLumi / maginormalumi;
float normaRatio = normaLumi / maginormalumi;

float target = calculateluminance(magic * magiratio + normalLight * normaRatio);
float3 properLightColor = magic + normalLight;
float properLuminance = calculateluminance(magic + normalLight);
poiLight.directColor = properLightColor * max(0.0001, (target / properLuminance));

poiLight.indirectColor = BetterSH9(float4(lerp(0, poiMesh.normals[1], _LightingIndirectUsesNormals), 1));
}

//UNITY_BRANCH
if (_LightingColorMode == 1) // More standard approach to light color
{
float3 indirectColor = BetterSH9(float4(poiMesh.normals[1], 1));
if (lightExists)
{
poiLight.directColor = _LightColor0.rgb;
poiLight.indirectColor = indirectColor;
}
else
{
poiLight.directColor = indirectColor * 0.6;
poiLight.indirectColor = indirectColor * 0.5;
}
}

float lightMapMode = _LightingMapMode;
//UNITY_BRANCH
if (_LightingDirectiongMode == 0)
{
poiLight.direction = _WorldSpaceLightPos0.xyz + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
}
else
{
//UNITY_BRANCH
if (_LightingDirectiongMode == 1)
{
poiLight.direction = mul(unity_ObjectToWorld, _LightngForcedDirection).xyz;;
}
//UNITY_BRANCH
if (_LightingDirectiongMode == 2)
{
poiLight.direction = _LightngForcedDirection;
}
if (lightMapMode == 0)
{
lightMapMode == 1;
}
}

poiLight.direction = normalize(poiLight.direction);
poiLight.attenuationStrength = _LightingCastedShadows;
poiLight.attenuation = 1;
if (!all(_LightColor0.rgb == 0.0))
{
UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
poiLight.attenuation *= attenuation;
}

poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
poiLight.nDotLSaturated = saturate(poiLight.nDotL);
poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
poiLight.nDotV = dot(poiMesh.normals[1], poiCam.viewDir);
poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);

//UNITY_BRANCH
if (lightMapMode == 0) // Poi special light map

{
float3 ShadeSH9Plus = GetSHLength();
float3 ShadeSH9Minus = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;

float3 greyScaleVector = float3(.33333, .33333, .33333);
float bw_lightColor = dot(poiLight.directColor, greyScaleVector);
float bw_directLighting = (((poiLight.nDotL * 0.5 + 0.5) * bw_lightColor * lerp(1, poiLight.attenuation, poiLight.attenuationStrength)) + dot(ShadeSH9(float4(poiMesh.normals[1], 1)), greyScaleVector));
float bw_bottomIndirectLighting = dot(ShadeSH9Minus, greyScaleVector);
float bw_topIndirectLighting = dot(ShadeSH9Plus, greyScaleVector);
float lightDifference = ((bw_topIndirectLighting + bw_lightColor) - bw_bottomIndirectLighting);
poiLight.lightMap = smoothstep(0, lightDifference, bw_directLighting - bw_bottomIndirectLighting);
}
//UNITY_BRANCH
if (lightMapMode == 1) // Normalized nDotL

{
poiLight.lightMap = poiLight.nDotLNormalized;
}
//UNITY_BRANCH
if (lightMapMode == 2) // Saturated nDotL

{
poiLight.lightMap = poiLight.nDotLSaturated;
}

poiLight.directColor = max(poiLight.directColor, poiLight.directColor / max(0.0001, (calculateluminance(poiLight.directColor) / _LightingMinLightBrightness)));
poiLight.indirectColor = max(poiLight.indirectColor, poiLight.indirectColor / max(0.0001, (calculateluminance(poiLight.indirectColor) / _LightingMinLightBrightness)));

poiLight.directColor = lerp(poiLight.directColor, dot(poiLight.directColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
poiLight.indirectColor = lerp(poiLight.indirectColor, dot(poiLight.indirectColor, float3(0.299, 0.587, 0.114)), _LightingMonochromatic);
//UNITY_BRANCH
if (_LightingCapEnabled)
{
poiLight.directColor = min(poiLight.directColor, _LightingCap);
poiLight.indirectColor = min(poiLight.indirectColor, _LightingCap);
}

//UNITY_BRANCH
if (_LightingForceColorEnabled)
{
poiLight.directColor = _LightingForcedColor;
}

#endif

#ifdef UNITY_PASS_FORWARDADD
#ifndef POI_LIGHT_DATA_ADDITIVE_ENABLE
return float4(mainTexture.rgb * .0001, 1);
#endif

#if defined(POINT) || defined(SPOT)
poiLight.direction = normalize(_WorldSpaceLightPos0.xyz - i.worldPos.xyz);

#ifdef POINT
poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(input, poiMesh.worldPos);
unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1)).xyz;
poiLight.attenuation = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).r;
#endif

#ifdef SPOT
poiLight.additiveShadow = UNITY_SHADOW_ATTENUATION(i, poiMesh.worldPos);
unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(poiMesh.worldPos, 1));
poiLight.attenuation = (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);
#endif
#else
poiLight.direction = _WorldSpaceLightPos0.xyz;
UNITY_LIGHT_ATTENUATION(attenuation, i, poiMesh.worldPos)
poiLight.additiveShadow == 0;
poiLight.attenuation = attenuation;
#endif
poiLight.directColor = _LightingAdditiveLimited ? min(_LightingAdditiveLimit, _LightColor0.rgb) : _LightColor0.rgb;
poiLight.indirectColor = lerp(0, poiLight.directColor, _LightingAdditivePassthrough);

poiLight.halfDir = normalize(poiLight.direction + poiCam.viewDir);
poiLight.nDotL = dot(poiMesh.normals[1], poiLight.direction);
poiLight.nDotLSaturated = saturate(poiLight.nDotL);
poiLight.nDotLNormalized = (poiLight.nDotL + 1) * 0.5;
poiLight.nDotV = dot(poiMesh.normals[1], poiCam.viewDir);
poiLight.nDotH = dot(poiMesh.normals[1], poiLight.halfDir);
poiLight.lDotv = dot(poiLight.direction, poiCam.viewDir);
poiLight.lDotH = dot(poiLight.direction, poiLight.halfDir);
poiLight.lightMap = 1;
#endif

#ifdef POI_LIGHT_DATA_DEBUG

#ifdef UNITY_PASS_FORWARDBASE
//UNITY_BRANCH
if (_LightingDebugVisualize <= 5)
{
switch(_LightingDebugVisualize)
{
case 0: // Direct Light Color
return float4(poiLight.directColor + mainTexture.rgb * .0001, 1);
break;
case 1: // Indirect Light Color
return float4(poiLight.indirectColor + mainTexture.rgb * .0001, 1);
break;
case 2: // Light Map
return float4(poiLight.lightMap + mainTexture.rgb * .0001, 1);
break;
case 3: // Attenuation
return float4(poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 4: // N Dot L
return float4(poiLight.nDotLNormalized, poiLight.nDotLNormalized, poiLight.nDotLNormalized, 1) + mainTexture * .0001;
break;
case 5:
return float4(poiLight.halfDir, 1) + mainTexture * .0001;
break;
}
}
else
{
return POI_SAFE_RGB1;
}
#endif
#ifdef UNITY_PASS_FORWARDADD
//UNITY_BRANCH
if (_LightingDebugVisualize < 6)
{
return POI_SAFE_RGB1;
}
else
{
switch(_LightingDebugVisualize)
{
case 6:
return float4(poiLight.directColor * poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 7:
return float4(poiLight.attenuation + mainTexture.rgb * .0001, 1);
break;
case 8:
return float4(poiLight.additiveShadow + mainTexture.rgb * .0001, 1);
break;
case 9:
return float4(poiLight.nDotLNormalized + mainTexture.rgb * .0001, 1);
break;
case 10:
return float4(poiLight.halfDir, 1) + mainTexture * .0001;
break;
}
}
#endif
#endif

poiFragData.baseColor = mainTexture.rgb * _Color.rgb;
poiFragData.alpha = mainTexture.a * _Color.a;

#if defined(PROP_CLIPPINGMASK) || !defined(OPTIMIZER_ENABLED)
float alphaMask = POI2D_SAMPLER_PAN(_ClippingMask, _MainTex, poiUV(poiMesh.uv[_ClippingMaskUV], _ClippingMask_ST), _ClippingMaskPan).r;
#else
float alphaMask = 1;
#endif

poiFragData.alpha *= alphaMask;

applyAlphaOptions(poiFragData, poiMesh, poiCam);

#if defined(_LIGHTINGMODE_SHADEMAP) && defined(VIGNETTE_MASKED)
applyShadeMapping(poiFragData, poiMesh, poiLight);
#endif

#if defined(_COLORADDSUBDIFF_ON) || defined(COLOR_GRADING_HDR_3D)
applyMatcap(poiFragData, poiCam, poiMesh, poiLight);
#endif

#ifdef POI_BACKFACE
ApplyBackFaceColor(poiFragData, poiMesh, poiMods);
#endif

#ifdef FINALPASS
ApplyDetailColor(poiFragData, poiMesh, poiMods);
#endif

#ifdef VIGNETTE
calculateRGBMask(poiFragData, poiMesh);
#endif

#ifdef GEOM_TYPE_BRANCH
applyDecals(poiFragData, poiMesh, poiCam);
#endif

#ifdef _SUNDISK_SIMPLE
applyGlitter(poiFragData, poiMesh, poiCam, poiLight);
#endif

#ifdef _GLOSSYREFLECTIONS_OFF
ApplyRimLighting(poiFragData, poiMesh, poiCam, poiLight);
#endif

#ifdef _SUNDISK_HIGH_QUALITY
applyFlipbook(poiFragData, poiMesh);
#endif

#ifdef DISTORT
applyDissolve(poiFragData, poiMesh);
#endif

poiFragData.finalColor = poiFragData.baseColor;

#ifdef VIGNETTE_MASKED
#ifdef POI_PASS_FORWARDOUTLINE
//UNITY_BRANCH
if (_OutlineLit)
{
applyShading(poiLight, poiFragData, poiMesh, poiCam);
}
else
{
poiFragData.finalColor = poiFragData.baseColor;
}
#else
applyShading(poiLight, poiFragData, poiMesh, poiCam);
#endif
#endif

#if defined(VIGNETTE_CLASSIC)
MochieBRDF(poiFragData, poiCam, poiLight, poiMesh);
#endif

#ifdef COLOR_GRADING_LOG_VIEW
initAudioBands(poiMods);
#endif

if (_Mode == 1)
{
clip(poiFragData.alpha - _Cutoff);
}

//UNITY_BRANCH
if (_IgnoreFog == 0)
{
UNITY_APPLY_FOG(i.fogCoord, poiFragData.finalColor);
}

//#ifndef UNITY_PASS_SHADOWCASTER
if(_Mode == POI_MODE_OPAQUE)
{
poiFragData.alpha = 1;
}
return float4(poiFragData.finalColor + poiFragData.emission, poiFragData.alpha) + mainTexture * 0.0001;
//#else
//	SHADOW_CASTER_FRAGMENT(i)
//#endif

}

ENDCG

}

Pass
{
Tags { "LightMode" = "ShadowCaster" }

Stencil
{
Ref [_StencilRef]
ReadMask [_StencilReadMask]
WriteMask [_StencilWriteMask]
Comp [_StencilCompareFunction]
Pass [_StencilPassOp]
Fail [_StencilFailOp]
ZFail [_StencilZFailOp]
}

ZWrite [_ZWrite]
Cull [_Cull]
AlphaToMask Off
ZTest [_ZTest]
ColorMask [_ColorMask]
Offset [_OffsetFactor], [_OffsetUnits]

BlendOp [_BlendOp], [_BlendOpAlpha]
Blend [_SrcBlend] [_DstBlend]

CGPROGRAM

#pragma target 5.0

#pragma shader_feature USER_LUT

//#pragma shader_feature KEYWORD

#pragma shader_feature_local POI_LIGHT_DATA_DEBUG
#pragma shader_feature_local POI_LIGHT_DATA_ADDITIVE_ENABLE
#pragma shader_feature_local POI_VERTEXLIGHT_ON

#pragma shader_feature VIGNETTE_MASKED
#pragma multi_compile_local _LIGHTINGMODE_TEXTURERAMP _LIGHTINGMODE_MATHRAMP _LIGHTINGMODE_SHADEMAP _LIGHTINGMODE_REALISTIC _LIGHTINGMODE_WRAPPED _LIGHTINGMODE_SKIN _LIGHTINGMODE_FLAT

#pragma shader_feature VIGNETTE_CLASSIC

#pragma shader_feature _COLORADDSUBDIFF_ON
#pragma shader_feature COLOR_GRADING_HDR_3D
#pragma shader_feature_local POI_MATCAP0_CUSTOM_NORMAL
#pragma shader_feature_local POI_MATCAP1_CUSTOM_NORMAL

#pragma shader_feature _EMISSION
#pragma shader_feature EFFECT_HUE_VARIATION

#pragma shader_feature COLOR_GRADING_LOG_VIEW

#pragma shader_feature_local POI_BACKFACE

#pragma shader_feature FINALPASS

#pragma shader_feature VIGNETTE
#pragma shader_feature GEOM_TYPE_MESH

#pragma shader_feature GEOM_TYPE_BRANCH
#pragma shader_feature GEOM_TYPE_BRANCH_DETAIL
#pragma shader_feature GEOM_TYPE_FROND
#pragma shader_feature DEPTH_OF_FIELD_COC_VIEW

#pragma shader_feature _SUNDISK_SIMPLE

#pragma shader_feature _GLOSSYREFLECTIONS_OFF

#pragma shader_feature _SUNDISK_HIGH_QUALITY

#pragma shader_feature DISTORT

#pragma multi_compile_instancing
#pragma multi_compile_shadowcaster
#pragma multi_compile_fog

// UNITY Includes
#include "UnityCG.cginc"
#include "UnityStandardUtils.cginc"
#include "AutoLight.cginc"
#include "UnityLightingCommon.cginc"
#include "UnityPBSLighting.cginc"
#pragma vertex vert
#pragma fragment frag

#define DielectricSpec float4(0.04, 0.04, 0.04, 1.0 - 0.04)
#define pi float(3.14159265359)

#define POI2D_SAMPLER_PAN(tex, texSampler, uv, pan) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv + _Time.x * pan))
#define POI2D_SAMPLER(tex, texSampler, uv) (UNITY_SAMPLE_TEX2D_SAMPLER(tex, texSampler, uv))
#define POI2D_PAN(tex, uv, pan) (tex2D(tex, uv + _Time.x * pan))
#define POI2D(tex, uv) (tex2D(tex, uv))
#define POI_SAMPLE_TEX2D(tex, uv) (UNITY_SAMPLE_TEX2D(tex, uv))
#define POI_SAMPLE_TEX2D_PAN(tex, uv, pan) (UNITY_SAMPLE_TEX2D(tex, uv + _Time.x * pan))

#define POI_SAFE_RGB1 float4(mainTexture.rgb * .0001, 1)
#define POI_SAFE_RGBA mainTexture

#if defined(UNITY_COMPILER_HLSL)
#define PoiInitStruct(type, name) name = (type)0;
#else
#define PoiInitStruct(type, name)
#endif

#define POI_ERROR(poiMesh, gridSize) lerp(float3(1, 0, 1), float3(0, 0, 0), fmod(floor((poiMesh.worldPos.x) * gridSize) + floor((poiMesh.worldPos.y) * gridSize) + floor((poiMesh.worldPos.z) * gridSize), 2) == 0)

#define POI_MODE_OPAQUE 0
#define POI_MODE_CUTOUT 1
#define POI_MODE_FADE 2
#define POI_MODE_TRANSPARENT 3
#define POI_MODE_ADDITIVE 4
#define POI_MODE_SOFTADDITIVE 5
#define POI_MODE_MULTIPLICATIVE 6
#define POI_MODE_2XMULTIPLICATIVE 7
#define POI_MODE_TRANSCLIPPING 9

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;

[HideInInspector][ThryWideEnum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, Panosphere, 4, World Pos XZ, 5, Polar UV, 6, Distorted UV, 7 )]
*/
// Map of where features in AudioLink are.
#define ALPASS_DFT                      int2(0, 4)
#define ALPASS_WAVEFORM                 int2(0, 6)
#define ALPASS_AUDIOLINK                int2(0, 0)
#define ALPASS_AUDIOBASS                int2(0, 0)
#define ALPASS_AUDIOLOWMIDS             int2(0, 1)
#define ALPASS_AUDIOHIGHMIDS            int2(0, 2)
#define ALPASS_AUDIOTREBLE              int2(0, 3)
#define ALPASS_AUDIOLINKHISTORY         int2(1, 0)
#define ALPASS_GENERALVU                int2(0, 22)
#define ALPASS_GENERALVU_INSTANCE_TIME  int2(2, 22)
#define ALPASS_GENERALVU_LOCAL_TIME     int2(3, 22)
#define ALPASS_GENERALVU_NETWORK_TIME   int2(4, 22)
#define ALPASS_GENERALVU_PLAYERINFO     int2(6, 22)
#define ALPASS_CCINTERNAL               int2(12, 22)
#define ALPASS_CCSTRIP                  int2(0, 24)
#define ALPASS_CCLIGHTS                 int2(0, 25)
#define ALPASS_AUTOCORRELATOR           int2(0, 27)
#define ALPASS_FILTEREDAUDIOLINK        int2(0, 28)

// Some basic constants to use (Note, these should be compatible with
// future version of AudioLink, but may change.
#define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
#define AUDIOLINK_SAMPLEDATA24          2046
#define AUDIOLINK_EXPBINS               24
#define AUDIOLINK_EXPOCT                10
#define AUDIOLINK_ETOTALBINS (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
#define AUDIOLINK_WIDTH                 128
#define AUDIOLINK_SPS                   48000       // Samples per second
#define AUDIOLINK_ROOTNOTE              0
#define AUDIOLINK_4BAND_FREQFLOOR       0.123
#define AUDIOLINK_4BAND_FREQCEILING     1
#define AUDIOLINK_BOTTOM_FREQUENCY      13.75
#define AUDIOLINK_BASE_AMPLITUDE        2.5
#define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
#define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
#define AUDIOLINK_DFT_Q                 4.0
#define AUDIOLINK_TREBLE_CORRECTION     5.0

// ColorChord constants
#define COLORCHORD_EMAXBIN              192
#define COLORCHORD_IIR_DECAY_1          0.90
#define COLORCHORD_IIR_DECAY_2          0.85
#define COLORCHORD_CONSTANT_DECAY_1     0.01
#define COLORCHORD_CONSTANT_DECAY_2     0.0
#define COLORCHORD_NOTE_CLOSEST         3.0
#define COLORCHORD_NEW_NOTE_GAIN        8.0
#define COLORCHORD_MAX_NOTES            10

// We use glsl_mod for most calculations because it behaves better
// on negative numbers, and in some situations actually outperforms
// HLSL's modf().
#ifndef glsl_mod
#define glsl_mod(x, y) (((x) - (y) * floor((x) / (y))))
#endif

uniform float4               _AudioTexture_TexelSize;

#ifdef SHADER_TARGET_SURFACE_ANALYSIS
#define AUDIOLINK_STANDARD_INDEXING
#endif

// Mechanism to index into texture.
#ifdef AUDIOLINK_STANDARD_INDEXING
sampler2D _AudioTexture;
#define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
#else
uniform Texture2D<float4> _AudioTexture;
SamplerState sampler_AudioTexture;
#define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
#endif

float _Mode;

#ifdef USER_LUT
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionFlowTexture;
float4 _DistortionFlowTexture_ST;
float2 _DistortionFlowTexturePan;
float _DistortionFlowTextureUV;
#endif

#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionFlowTexture1;
float4 _DistortionFlowTexture1_ST;
float2 _DistortionFlowTexture1Pan;
float _DistortionFlowTexture1UV;
#endif

#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DistortionMask;
float4 _DistortionMask_ST;
float2 _DistortionMaskPan;
float _DistortionMaskUV;
#endif

float _DistortionUvToDistort;
float _DistortionStrength;
float _DistortionStrength1;
#endif
float _StereoEnabled;
float _PolarUV;
float2 _PolarCenter;
float _PolarRadialScale;
float _PolarLengthScale;
float _PolarSpiralPower;

float _IgnoreFog;

float4 _Color;
UNITY_DECLARE_TEX2D(_MainTex);
float4 _MainTex_ST;
float2 _MainTexPan;
float _MainTexUV;
float4 _MainTex_TexelSize;
Texture2D _BumpMap;
float4 _BumpMap_ST;
float2 _BumpMapPan;
float _BumpMapUV;
float _BumpScale;
Texture2D _ClippingMask;
float4 _ClippingMask_ST;
float2 _ClippingMaskPan;
float _ClippingMaskUV;
float _Inverse_Clipping;
float _Cutoff;

float _AlphaForceOpaque;
float _AlphaMod;

float _AlphaToCoverage;
float _AlphaSharpennedA2C;
float _AlphaMipScale;

float _AlphaDithering;
float _AlphaDitherGradient;

float _AlphaDistanceFade;
float _AlphaDistanceFadeType;
float _AlphaDistanceFadeMinAlpha;
float _AlphaDistanceFadeMaxAlpha;
float _AlphaDistanceFadeMin;
float _AlphaDistanceFadeMax;

float _AlphaFresnel;
float _AlphaFresnelAlpha;
float _AlphaFresnelSharpness;
float _AlphaFresnelWidth;
float _AlphaFresnelInvert;

float _AlphaAngular;
float _AngleType;
float _AngleCompareTo;
float3 _AngleForwardDirection;
float _CameraAngleMin;
float _CameraAngleMax;
float _ModelAngleMin;
float _ModelAngleMax;
float _AngleMinAlpha;

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

#ifdef COLOR_GRADING_LOG_VIEW
float _AudioLinkDelay;
float _AudioLinkAnimToggle;
#endif

#ifdef POI_BACKFACE
float _BackFaceEnabled;
float _BackFaceDetailIntensity;
float _BackFaceEmissionStrength;
float2 _BackFacePanning;
float4 _BackFaceColor;
float _BackFaceReplaceAlpha;
float _BackFaceAlpha;

#if defined(PROP_BACKFACETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _BackFaceTexture;
#endif
float4 _BackFaceTexture_ST;
float2 _BackFaceTexturePan;
float _BackFaceTextureUV;

#if defined(PROP_BACKFACEMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _BackFaceMask;
#endif
float4 _BackFaceMask_ST;
float2 _BackFaceMaskPan;
float _BackFaceMaskUV;

float _BackFaceHueShiftEnabled;
float _BackFaceHueShift;
float _BackFaceHueShiftSpeed;
#endif

//TODO detail strength stuff

#ifdef _SUNDISK_HIGH_QUALITY

UNITY_DECLARE_TEX2DARRAY(_FlipbookTexArray);
float4 _FlipbookTexArray_ST;

float4 _FlipbookColor;
float _FlipbookFPS;
uint _FlipbookTotalFrames;
float4 _FlipbookScaleOffset;
float _FlipbookTiled;
int _FlipbookCurrentFrame;
float _FlipbookEmissionStrength;
float _FlipbookRotation;
float _EnableFlipbook;
uint _FlipbookTexArrayUV;
float _FlipbookAlphaControlsFinalAlpha;
float _FlipbookRotationSpeed;
float _FlipbookIntensityControlsAlpha;
float _FlipbookColorReplaces;
float2 _FlipbookTexArrayPan;

// blending
float _FlipbookReplace;
float _FlipbookMultiply;
float _FlipbookAdd;

#if defined(PROP_FLIPBOOKMASSK) || !defined(OPTIMIZED_ENABLED)
Texture2D _FlipbookMask;
#endif
float4 _FlipbookMask_ST;
float2 _FlipbookMaskPan;
float _FlipbookMaskUV;

// anim
uint _FlipbookMovementType;
float4 _FlipbookStartEndOffset;
float _FlipbookMovementSpeed;

// Crossfade
float _FlipbookCrossfadeEnabled;
float2 _FlipbookCrossfadeRange;

// Hueshift
float _FlipbookHueShiftEnabled;
float _FlipbookHueShiftSpeed;
float _FlipbookHueShift;
#endif

#ifdef DISTORT
float _DissolveType;
float _DissolveEdgeWidth;
float4 _DissolveEdgeColor;
sampler2D _DissolveEdgeGradient;
float4 _DissolveEdgeGradient_ST;
float2 _DissolveEdgeGradientPan;
float _DissolveEdgeGradientUV;
float _DissolveEdgeEmission;
float4 _DissolveTextureColor;

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveToTexture;
#endif
float4 _DissolveToTexture_ST;
float2 _DissolveToTexturePan;
float _DissolveToTextureUV;

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveNoiseTexture;
#endif
float4 _DissolveNoiseTexture_ST;
float2 _DissolveNoiseTexturePan;
float _DissolveNoiseTextureUV;

#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveDetailNoise;
#endif
float4 _DissolveDetailNoise_ST;
float2 _DissolveDetailNoisePan;
float _DissolveDetailNoiseUV;

#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
Texture2D _DissolveMask;
#endif
float4 _DissolveMask_ST;
float2 _DissolveMaskPan;
float _DissolveMaskUV;

float _DissolveMaskInvert;
float _DissolveAlpha;
float _ContinuousDissolve;
float _DissolveDetailStrength;
float _DissolveEdgeHardness;
float _DissolveInvertNoise;
float _DissolveInvertDetailNoise;
float _DissolveToEmissionStrength;

// Point to Point
float _DissolveP2PWorldLocal;
float _DissolveP2PEdgeLength;
float4 _DissolveStartPoint;
float4 _DissolveEndPoint;

// World Dissolve
float _DissolveWorldShape;
float4 _DissolveShapePosition;
float4 _DissolveShapeRotation;
float _DissolveShapeScale;
float _DissolveInvertShape;
float _DissolveShapeEdgeLength;

float _DissolveAlpha0;
float _DissolveAlpha1;
float _DissolveAlpha2;
float _DissolveAlpha3;
float _DissolveAlpha4;
float _DissolveAlpha5;
float _DissolveAlpha6;
float _DissolveAlpha7;
float _DissolveAlpha8;
float _DissolveAlpha9;
// Masking
float _DissolveEmissionSide;
float _DissolveEmission1Side;
float _DissolveUseVertexColors;

float4 edgeColor;
float edgeAlpha;
float dissolveAlpha;
float4 dissolveToTexture;

float _DissolveHueShiftEnabled;
float _DissolveHueShiftSpeed;
float _DissolveHueShift;
float _DissolveEdgeHueShiftEnabled;
float _DissolveEdgeHueShiftSpeed;
float _DissolveEdgeHueShift;
#endif

/*
Texture2D ;
float4 _ST;
float2 Pan;
float UV;
*/

//Structs
struct appdata
{
float4 vertex : POSITION;
float3 normal : NORMAL;
float4 tangent : TANGENT;
float4 color : COLOR;
float2 uv0 : TEXCOORD0;
float2 uv1 : TEXCOORD1;
float2 uv2 : TEXCOORD2;
float2 uv3 : TEXCOORD3;
uint vertexId : SV_VertexID;
UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct v2f
{
float4 pos : SV_POSITION;
float2 uv[4] : TEXCOORD0;
float3 objNormal : TEXCOORD4;
float3 normal : TEXCOORD5;
float3 tangent : TEXCOORD6;
float3 binormal : TEXCOORD7;
float4 worldPos : TEXCOORD8;
float4 localPos : TEXCOORD9;
float3 objectPos : TEXCOORD10;
float4 vertexColor : TEXCOORD11;
float3 tangentViewDir : TEXCOORD12;
float4 lightmapUV : TEXCOORD13;
float4 grabPos: TEXCOORD14;
UNITY_SHADOW_COORDS(15)
UNITY_FOG_COORDS(16)
UNITY_VERTEX_INPUT_INSTANCE_ID
UNITY_VERTEX_OUTPUT_STEREO
};

struct PoiMesh
{

// 0 Vertex normal
// 1 Fragment normal
float3 normals[2];
float3 objNormal;
float3 tangentSpaceNormal;
float3 binormal;
float3 tangent;
float3 worldPos;
float3 localPos;
float3 objectPosition;
float isFrontFace;
float4 vertexColor;
float4 lightmapUV;
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 7 Distorted UV
float2 uv[8];
};

struct PoiCam
{
float3 viewDir;
float3 forwardDir;
float3 worldPos;
float distanceToVert;
float2 clipPos;
float3 reflectionDir;
float3 tangentViewDir;
float4 grabPos;
float2 screenUV;
float vDotN;

};

struct PoiMods
{
float4 Mask;
float4 audioLink;
float audioLinkAvailable;
float audioLinkVersion;
float4 audioLinkTexture;
float2 detailMask;
float2 backFaceDetailIntensity;
};

struct PoiLight
{

float3 direction;
float attenuation;
float attenuationStrength;
float3 directColor;
float3 indirectColor;
float occlusion;
float shadowMask;
float detailShadow;
float3 halfDir;
float lightMap;
float3 rampedLightMap;
float nDotL;
float nDotV;
float nDotH;
float lDotv;
float lDotH;
float nDotLSaturated;
float nDotLNormalized;
#ifdef UNITY_PASS_FORWARDADD
float additiveShadow;
#endif
float3 finalLighting;

#if defined(VERTEXLIGHT_ON) && defined(POI_VERTEXLIGHT_ON)
// Non Important Lights
float4 vDotNL;
float3 vColor[4];
float4 vCorrectedDotNL;
float4 vAttenuation;
float4 vAttenuationDotNL;
float3 vPosition[4];
float3 vDirection[4];
float3 vFinalLighting;
float3 vHalfDir[4];
half4 vDotNH;
half4 vDotLH;
#endif

};

struct PoiVertexLights
{

float3 direction;
float3 color;
float attenuation;
};

struct PoiFragData
{
float3 baseColor;
float3 finalColor;
float alpha;
float3 emission;
};

float2 poiUV(float2 uv, float4 tex_st)
{
return uv * tex_st.xy + tex_st.zw;
}

//Lighting Helpers
float calculateluminance(float3 color)
{
return color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
}

/*
* MIT License
*
* Copyright (c) 2018 s-ilent
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

float shEvaluateDiffuseL1Geomerics_local(float L0, float3 L1, float3 n)
{
// average energy
float R0 = max(0, L0);

// avg direction of incoming light
float3 R1 = 0.5f * L1;

// directional brightness
float lenR1 = length(R1);

// linear angle between normal and direction 0-1
//float q = 0.5f * (1.0f + dot(R1 / lenR1, n));
//float q = dot(R1 / lenR1, n) * 0.5 + 0.5;
float q = dot(normalize(R1), n) * 0.5 + 0.5;
q = saturate(q); // Thanks to ScruffyRuffles for the bug identity.

// power for q
// lerps from 1 (linear) to 3 (cubic) based on directionality
float p = 1.0f + 2.0f * lenR1 / R0;

// dynamic range constant
// should vary between 4 (highly directional) and 0 (ambient)
float a = (1.0f - lenR1 / R0) / (1.0f + lenR1 / R0);

return R0 * (a + (1.0f - a) * (p + 1.0f) * pow(q, p));
}

half3 BetterSH9(half4 normal)
{
float3 indirect;
float3 L0 = float3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w) + float3(unity_SHBr.z, unity_SHBg.z, unity_SHBb.z) / 3.0;
indirect.r = shEvaluateDiffuseL1Geomerics_local(L0.r, unity_SHAr.xyz, normal.xyz);
indirect.g = shEvaluateDiffuseL1Geomerics_local(L0.g, unity_SHAg.xyz, normal.xyz);
indirect.b = shEvaluateDiffuseL1Geomerics_local(L0.b, unity_SHAb.xyz, normal.xyz);
indirect = max(0, indirect);
indirect += SHEvalLinearL2(normal);
return indirect;
}

// Silent's code ends here

float3 getCameraForward()
{
#if UNITY_SINGLE_PASS_STEREO
float3 p1 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 1, 1));
float3 p2 = mul(unity_StereoCameraToWorld[0], float4(0, 0, 0, 1));
#else
float3 p1 = mul(unity_CameraToWorld, float4(0, 0, 1, 1)).xyz;
float3 p2 = mul(unity_CameraToWorld, float4(0, 0, 0, 1)).xyz;
#endif
return normalize(p2 - p1);
}

half3 GetSHLength()
{
half3 x, x1;
x.r = length(unity_SHAr);
x.g = length(unity_SHAg);
x.b = length(unity_SHAb);
x1.r = length(unity_SHBr);
x1.g = length(unity_SHBg);
x1.b = length(unity_SHBb);
return x + x1;
}

float3 BoxProjection(float3 direction, float3 position, float4 cubemapPosition, float3 boxMin, float3 boxMax)
{
#if UNITY_SPECCUBE_BOX_PROJECTION
//UNITY_BRANCH
if (cubemapPosition.w > 0)
{
float3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
float scalar = min(min(factors.x, factors.y), factors.z);
direction = direction * scalar + (position - cubemapPosition.xyz);
}
#endif
return direction;
}

float poiMax(float2 i)
{
return max(i.x, i.y);
}

float poiMax(float3 i)
{
return max(max(i.x, i.y), i.z);
}

float poiMax(float4 i)
{
return max(max(max(i.x, i.y), i.z), i.w);
}

float3 calculateNormal(in float3 baseNormal, in PoiMesh poiMesh, in Texture2D normalTexture, in float4 normal_ST, in float2 normalPan, in float normalUV, in float normalIntensity)
{
float3 normal = UnpackScaleNormal(POI2D_SAMPLER_PAN(normalTexture, _MainTex, poiUV(poiMesh.uv[normalUV], normal_ST), normalPan), normalIntensity);
return normalize(
normal.x * poiMesh.tangent +
normal.y * poiMesh.binormal +
normal.z * baseNormal
);
}

float remap(float x, float minOld, float maxOld, float minNew = 0, float maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float2 remap(float2 x, float2 minOld, float2 maxOld, float2 minNew = 0, float2 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float3 remap(float3 x, float3 minOld, float3 maxOld, float3 minNew = 0, float3 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float4 remap(float4 x, float4 minOld, float4 maxOld, float4 minNew = 0, float4 maxNew = 1)
{
return minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld);
}

float remapClamped(float minOld, float maxOld, float x, float minNew = 0, float maxNew = 1)
{
return clamp(minNew + (x - minOld) * (maxNew - minNew) / (maxOld - minOld), 0, 1);
}

float2 calcParallax(in float height, in PoiCam poiCam)
{
return((height * - 1) + 1) * (poiCam.tangentViewDir.xy / poiCam.tangentViewDir.z);
}

/*
0: Zero	                float4(0.0, 0.0, 0.0, 0.0),
1: One	                float4(1.0, 1.0, 1.0, 1.0),
2: DstColor	            destinationColor,
3: SrcColor	            sourceColor,
4: OneMinusDstColor	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
5: SrcAlpha	            sourceColor.aaaa,
6: OneMinusSrcColor	    float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
7: DstAlpha	            destinationColor.aaaa,
8: OneMinusDstAlpha	    float4(1.0, 1.0, 1.0, 1.0) - destinationColor.,
9: SrcAlphaSaturate     saturate(sourceColor.aaaa),
10: OneMinusSrcAlpha	float4(1.0, 1.0, 1.0, 1.0) - sourceColor.aaaa,
*/

float4 poiBlend(const float sourceFactor, const  float4 sourceColor, const  float destinationFactor, const  float4 destinationColor, const float4 blendFactor)
{
float4 sA = 1 - blendFactor;
const float4 blendData[11] = {
float4(0.0, 0.0, 0.0, 0.0),
float4(1.0, 1.0, 1.0, 1.0),
destinationColor,
sourceColor,
float4(1.0, 1.0, 1.0, 1.0) - destinationColor,
sA,
float4(1.0, 1.0, 1.0, 1.0) - sourceColor,
sA,
float4(1.0, 1.0, 1.0, 1.0) - sA,
saturate(sourceColor.aaaa),
1 - sA,
};

return lerp(blendData[sourceFactor] * sourceColor + blendData[destinationFactor] * destinationColor, sourceColor, sA);
}

// Average
float3 blendAverage(float3 base, float3 blend)
{
return(base + blend) / 2.0;
}

// Color burn
float blendColorBurn(float base, float blend)
{
return(blend == 0.0)?blend : max((1.0 - ((1.0 - base) / blend)), 0.0);
}

float3 blendColorBurn(float3 base, float3 blend)
{
return float3(blendColorBurn(base.r, blend.r), blendColorBurn(base.g, blend.g), blendColorBurn(base.b, blend.b));
}

// Color Dodge
float blendColorDodge(float base, float blend)
{
return(blend == 1.0)?blend : min(base / (1.0 - blend), 1.0);
}

float3 blendColorDodge(float3 base, float3 blend)
{
return float3(blendColorDodge(base.r, blend.r), blendColorDodge(base.g, blend.g), blendColorDodge(base.b, blend.b));
}

// Darken
float blendDarken(float base, float blend)
{
return min(blend, base);
}

float3 blendDarken(float3 base, float3 blend)
{
return float3(blendDarken(base.r, blend.r), blendDarken(base.g, blend.g), blendDarken(base.b, blend.b));
}

// Exclusion
float3 blendExclusion(float3 base, float3 blend)
{
return base + blend - 2.0 * base * blend;
}

// Reflect
float blendReflect(float base, float blend)
{
return(blend == 1.0)?blend : min(base * base / (1.0 - blend), 1.0);
}

float3 blendReflect(float3 base, float3 blend)
{
return float3(blendReflect(base.r, blend.r), blendReflect(base.g, blend.g), blendReflect(base.b, blend.b));
}

// Glow
float3 blendGlow(float3 base, float3 blend)
{
return blendReflect(blend, base);
}

// Overlay
float blendOverlay(float base, float blend)
{
return base < 0.5?(2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
}

float3 blendOverlay(float3 base, float3 blend)
{
return float3(blendOverlay(base.r, blend.r), blendOverlay(base.g, blend.g), blendOverlay(base.b, blend.b));
}

// Hard Light
float3 blendHardLight(float3 base, float3 blend)
{
return blendOverlay(blend, base);
}

// Vivid light
float blendVividLight(float base, float blend)
{
return(blend < 0.5)?blendColorBurn(base, (2.0 * blend)) : blendColorDodge(base, (2.0 * (blend - 0.5)));
}

float3 blendVividLight(float3 base, float3 blend)
{
return float3(blendVividLight(base.r, blend.r), blendVividLight(base.g, blend.g), blendVividLight(base.b, blend.b));
}

// Hard mix
float blendHardMix(float base, float blend)
{
return(blendVividLight(base, blend) < 0.5)?0.0 : 1.0;
}

float3 blendHardMix(float3 base, float3 blend)
{
return float3(blendHardMix(base.r, blend.r), blendHardMix(base.g, blend.g), blendHardMix(base.b, blend.b));
}

// Lighten
float blendLighten(float base, float blend)
{
return max(blend, base);
}

float3 blendLighten(float3 base, float3 blend)
{
return float3(blendLighten(base.r, blend.r), blendLighten(base.g, blend.g), blendLighten(base.b, blend.b));
}

// Linear Burn
float blendLinearBurn(float base, float blend)
{
// Note : Same implementation as BlendSubtractf
return max(base + blend - 1.0, 0.0);
}

float3 blendLinearBurn(float3 base, float3 blend)
{
// Note : Same implementation as BlendSubtract
return max(base + blend - float3(1.0, 1.0, 1.0), float3(0.0, 0.0, 0.0));
}

// Linear Dodge
float blendLinearDodge(float base, float blend)
{
// Note : Same implementation as BlendAddf
return min(base + blend, 1.0);
}

float3 blendLinearDodge(float3 base, float3 blend)
{
// Note : Same implementation as BlendAdd
return min(base + blend, float3(1.0, 1.0, 1.0));
}

// Linear light
float blendLinearLight(float base, float blend)
{
return blend < 0.5?blendLinearBurn(base, (2.0 * blend)) : blendLinearDodge(base, (2.0 * (blend - 0.5)));
}

float3 blendLinearLight(float3 base, float3 blend)
{
return float3(blendLinearLight(base.r, blend.r), blendLinearLight(base.g, blend.g), blendLinearLight(base.b, blend.b));
}

// Multiply
float3 blendMultiply(float3 base, float3 blend)
{
return base * blend;
}

// Negation
float3 blendNegation(float3 base, float3 blend)
{
return float3(1.0, 1.0, 1.0) - abs(float3(1.0, 1.0, 1.0) - base - blend);
}

// Normal
float3 blendNormal(float3 base, float3 blend)
{
return blend;
}

// Phoenix
float3 blendPhoenix(float3 base, float3 blend)
{
return min(base, blend) - max(base, blend) + float3(1.0, 1.0, 1.0);
}

// Pin light
float blendPinLight(float base, float blend)
{
return(blend < 0.5)?blendDarken(base, (2.0 * blend)) : blendLighten(base, (2.0 * (blend - 0.5)));
}

float3 blendPinLight(float3 base, float3 blend)
{
return float3(blendPinLight(base.r, blend.r), blendPinLight(base.g, blend.g), blendPinLight(base.b, blend.b));
}

// Screen
float blendScreen(float base, float blend)
{
return 1.0 - ((1.0 - base) * (1.0 - blend));
}

float3 blendScreen(float3 base, float3 blend)
{
return float3(blendScreen(base.r, blend.r), blendScreen(base.g, blend.g), blendScreen(base.b, blend.b));
}

// Soft Light
float blendSoftLight(float base, float blend)
{
return(blend < 0.5)?(2.0 * base * blend + base * base * (1.0 - 2.0 * blend)) : (sqrt(base) * (2.0 * blend - 1.0) + 2.0 * base * (1.0 - blend));
}

float3 blendSoftLight(float3 base, float3 blend)
{
return float3(blendSoftLight(base.r, blend.r), blendSoftLight(base.g, blend.g), blendSoftLight(base.b, blend.b));
}

// Subtract
float blendSubtract(float base, float blend)
{
return max(base - blend, 0.0);
}

float3 blendSubtract(float3 base, float3 blend)
{
return max(base - blend, 0.0);
}

// Difference
float blendDifference(float base, float blend)
{
return abs(base - blend);
}

float3 blendDifference(float3 base, float3 blend)
{
return abs(base - blend);
}

// Divide
float blendDivide(float base, float blend)
{
return base / max(blend, 0.0001);
}

float3 blendDivide(float3 base, float3 blend)
{
return base / max(blend, 0.0001);
}

float3 customBlend(float3 base, float3 blend, float blendType)
{
float3 ret = 0;
switch(blendType)
{
case 0:
{
ret = blendNormal(base, blend);
break;
}
case 1:
{
ret = blendDarken(base, blend);
break;
}
case 2:
{
ret = blendMultiply(base, blend);
break;
}
case 3:
{
ret = blendColorBurn(base, blend);
break;
}
case 4:
{
ret = blendLinearBurn(base, blend);
break;
}
case 5:
{
ret = blendLighten(base, blend);
break;
}
case 6:
{
ret = blendScreen(base, blend);
break;
}
case 7:
{
ret = blendColorDodge(base, blend);
break;
}
case 8:
{
ret = blendLinearDodge(base, blend);
break;
}
case 9:
{
ret = blendOverlay(base, blend);
break;
}
case 10:
{
ret = blendSoftLight(base, blend);
break;
}
case 11:
{
ret = blendHardLight(base, blend);
break;
}
case 12:
{
ret = blendVividLight(base, blend);
break;
}
case 13:
{
ret = blendLinearLight(base, blend);
break;
}
case 14:
{
ret = blendPinLight(base, blend);
break;
}
case 15:
{
ret = blendHardMix(base, blend);
break;
}
case 16:
{
ret = blendDifference(base, blend);
break;
}
case 17:
{
ret = blendExclusion(base, blend);
break;
}
case 18:
{
ret = blendSubtract(base, blend);
break;
}
case 19:
{
ret = blendDivide(base, blend);
break;
}
}
return ret;
}

float random(float2 p)
{
return frac(sin(dot(p, float2(12.9898, 78.2383))) * 43758.5453123);
}

float2 random2(float2 p)
{
return frac(sin(float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)))) * 43758.5453);
}

float3 random3(float3 p)
{
return frac(sin(float3(dot(p, float3(127.1, 311.7, 248.6)), dot(p, float3(269.5, 183.3, 423.3)), dot(p, float3(248.3, 315.9, 184.2)))) * 43758.5453);
}

float3 randomFloat3(float2 Seed, float maximum)
{
return(.5 + float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed), float2(12.9898, 78.233))) * 43758.5453)
) * .5) * (maximum);
}

float3 randomFloat3Range(float2 Seed, float Range)
{
return(float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
) * 2 - 1) * Range;
}

float3 randomFloat3WiggleRange(float2 Seed, float Range, float wiggleSpeed)
{
float3 rando = (float3(
frac(sin(dot(Seed.xy, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(Seed.yx, float2(12.9898, 78.233))) * 43758.5453),
frac(sin(dot(float2(Seed.x * Seed.y, Seed.y + Seed.x), float2(12.9898, 78.233))) * 43758.5453)
) * 2 - 1);
float speed = 1 + wiggleSpeed;
return float3(sin((_Time.x + rando.x * pi) * speed), sin((_Time.x + rando.y * pi) * speed), sin((_Time.x + rando.z * pi) * speed)) * Range;
}

void Unity_RandomRange_float(float2 Seed, float Min, float Max, out float Out)
{
float randomno = frac(sin(dot(Seed, float2(12.9898, 78.233))) * 43758.5453);
Out = lerp(Min, Max, randomno);
}

//art

// Based on unity shader graph code

// * Adjustments * //

/*
* Channel Mixer
*
* Controls the amount each of the channels of input In contribute to each of the channels of output Out. The slider
* parameters on the node control the contribution of each of the input channels. The toggle button parameters control
* which of the output channels is currently being edited. Slider controls for editing the contribution of each input
* channnel range between -2 and 2.
*/
void poiChannelMixer(float3 In, float3 _ChannelMixer_Red, float3 _ChannelMixer_Green, float3 _ChannelMixer_Blue, out float3 Out)
{
Out = float3(dot(In, _ChannelMixer_Red), dot(In, _ChannelMixer_Green), dot(In, _ChannelMixer_Blue));
}

/*
* Contrast
*
* Adjusts the contrast of input In by the amount of input Contrast. A Contrast value of 1 will return the input
* unaltered. A Contrast value of 0 will return the midpoint of the input
*/
void poiContrast(float3 In, float Contrast, out float3 Out)
{
float midpoint = pow(0.5, 2.2);
Out = (In - midpoint) * Contrast + midpoint;
}

/*
* Invert Colors
*
* Inverts the colors of input In on a per channel basis. This Node assumes all input values are in the range 0 - 1.
*/
void poiInvertColors(float4 In, float4 InvertColors, out float4 Out)
{
Out = abs(InvertColors - In);
}

/*
* Replace Color
*
* Replaces values in input In equal to input From to the value of input To. Input Range can be used to define a
* wider range of values around input From to replace. Input Fuzziness can be used to soften the edges around the
* selection similar to anti-aliasing.
*/
void poiReplaceColor(float3 In, float3 From, float3 To, float Range, float Fuzziness, out float3 Out)
{
float Distance = distance(From, In);
Out = lerp(To, In, saturate((Distance - Range) / max(Fuzziness, 0.00001)));
}

/*
* Saturation
*
* Adjusts the saturation of input In by the amount of input Saturation. A Saturation value of 1 will return the input
* unaltered. A Saturation value of 0 will return the input completely desaturated.
*/
void poiSaturation(float3 In, float Saturation, out float3 Out)
{
float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
Out = luma.xxx + Saturation.xxx * (In - luma.xxx);
}

/*
* Dither Node
*
* Dither is an intentional form of noise used to randomize quantization error. It is used to prevent large-scale
* patterns such as color banding in images. The Dither node applies dithering in screen-space to ensure a uniform
* distribution of the pattern. This can be adjusted by connecting another node to input Screen Position.
*
* This Node is commonly used as an input to Alpha Clip Threshold on a Master Node to give the appearance of
* transparency to an opaque object. This is useful for creating objects that appear to be transparent but have
* the advantages of rendering as opaque, such as writing depth and/or being rendered in deferred.
*/
void poiDither(float4 In, float4 ScreenPosition, out float4 Out)
{
float2 uv = ScreenPosition.xy * _ScreenParams.xy;
float DITHER_THRESHOLDS[16] = {
1.0 / 17.0, 9.0 / 17.0, 3.0 / 17.0, 11.0 / 17.0,
13.0 / 17.0, 5.0 / 17.0, 15.0 / 17.0, 7.0 / 17.0,
4.0 / 17.0, 12.0 / 17.0, 2.0 / 17.0, 10.0 / 17.0,
16.0 / 17.0, 8.0 / 17.0, 14.0 / 17.0, 6.0 / 17.0
};
uint index = (uint(uv.x) % 4) * 4 + uint(uv.y) % 4;
Out = In - DITHER_THRESHOLDS[index];
}

/*
* Color Mask
*
* Creates a mask from values in input In equal to input Mask Color. Input Range can be used to define a wider
* range of values around input Mask Color to create the mask. Colors within this range will return 1,
* otherwise the node will return 0. Input Fuzziness can be used to soften the edges around the selection
* similar to anti-aliasing.
*/
void poiColorMask(float3 In, float3 MaskColor, float Range, float Fuzziness, out float4 Out)
{
float Distance = distance(MaskColor, In);
Out = saturate(1 - (Distance - Range) / max(Fuzziness, 0.00001));
}

float3 hueShift(float3 color, float Offset)
{
float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
float4 P = lerp(float4(color.bg, K.wz), float4(color.gb, K.xy), step(color.b, color.g));
float4 Q = lerp(float4(P.xyw, color.r), float4(color.r, P.yzx), step(P.x, color.r));
float D = Q.x - min(Q.w, Q.y);
float E = 0.0000000001;
float3 hsv = float3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);

float hue = hsv.x + Offset;
hsv.x = frac(hue);

float4 K2 = float4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
float3 P2 = abs(frac(hsv.xxx + K2.xyz) * 6.0 - K2.www);
return hsv.z * lerp(K2.xxx, saturate(P2 - K2.xxx), hsv.y);
}

static const float Epsilon = 1e-10;
// The weights of RGB contributions to luminance.
// Should sum to unity.
static const float3 HCYwts = float3(0.299, 0.587, 0.114);
static const float HCLgamma = 3;
static const float HCLy0 = 100;
static const float HCLmaxL = 0.530454533953517; // == exp(HCLgamma / HCLy0) - 0.5
static const float3 wref = float3(1.0, 1.0, 1.0);
#define TAU 6.28318531

float3 HUEtoRGB(in float H)
{
float R = abs(H * 6 - 3) - 1;
float G = 2 - abs(H * 6 - 2);
float B = 2 - abs(H * 6 - 4);
return saturate(float3(R, G, B));
}

float3 RGBtoHCV(in float3 RGB)
{
// Based on work by Sam Hocevar and Emil Persson
float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0 / 3.0) : float4(RGB.gb, 0.0, -1.0 / 3.0);
float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
float C = Q.x - min(Q.w, Q.y);
float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
return float3(H, C, Q.x);
}

float3 HSVtoRGB(in float3 HSV)
{
float3 RGB = HUEtoRGB(HSV.x);
return((RGB - 1) * HSV.y + 1) * HSV.z;
}

float3 RGBtoHSV(in float3 RGB)
{
float3 HCV = RGBtoHCV(RGB);
float S = HCV.y / (HCV.z + Epsilon);
return float3(HCV.x, S, HCV.z);
}

float3 HSLtoRGB(in float3 HSL)
{
float3 RGB = HUEtoRGB(HSL.x);
float C = (1 - abs(2 * HSL.z - 1)) * HSL.y;
return(RGB - 0.5) * C + HSL.z;
}

float3 RGBtoHSL(in float3 RGB)
{
float3 HCV = RGBtoHCV(RGB);
float L = HCV.z - HCV.y * 0.5;
float S = HCV.y / (1 - abs(L * 2 - 1) + Epsilon);
return float3(HCV.x, S, L);
}

float3 HCYtoRGB(in float3 HCY)
{

float3 RGB = HUEtoRGB(HCY.x);
float Z = dot(RGB, HCYwts);
if (HCY.z < Z)
{
HCY.y *= HCY.z / Z;
}
else if (Z < 1)
{
HCY.y *= (1 - HCY.z) / (1 - Z);
}
return(RGB - Z) * HCY.y + HCY.z;
}

float3 RGBtoHCY(in float3 RGB)
{
// Corrected by David Schaeffer
float3 HCV = RGBtoHCV(RGB);
float Y = dot(RGB, HCYwts);
float Z = dot(HUEtoRGB(HCV.x), HCYwts);
if (Y < Z)
{
HCV.y *= Z / (Epsilon + Y);
}
else
{
HCV.y *= (1 - Z) / (Epsilon + 1 - Y);
}
return float3(HCV.x, HCV.y, Y);
}

float3 HCLtoRGB(in float3 HCL)
{
float3 RGB = 0;
if (HCL.z != 0)
{
float H = HCL.x;
float C = HCL.y;
float L = HCL.z * HCLmaxL;
float Q = exp((1 - C / (2 * L)) * (HCLgamma / HCLy0));
float U = (2 * L - C) / (2 * Q - 1);
float V = C / Q;
float A = (H + min(frac(2 * H) / 4, frac(-2 * H) / 8)) * pi * 2;
float T;
H *= 6;
if (H <= 0.999)
{
T = tan(A);
RGB.r = 1;
RGB.g = T / (1 + T);
}
else if (H <= 1.001)
{
RGB.r = 1;
RGB.g = 1;
}
else if (H <= 2)
{
T = tan(A);
RGB.r = (1 + T) / T;
RGB.g = 1;
}
else if (H <= 3)
{
T = tan(A);
RGB.g = 1;
RGB.b = 1 + T;
}
else if (H <= 3.999)
{
T = tan(A);
RGB.g = 1 / (1 + T);
RGB.b = 1;
}
else if (H <= 4.001)
{
RGB.g = 0;
RGB.b = 1;
}
else if (H <= 5)
{
T = tan(A);
RGB.r = -1 / T;
RGB.b = 1;
}
else
{
T = tan(A);
RGB.r = 1;
RGB.b = -T;
}
RGB = RGB * V + U;
}
return RGB;
}

float3 RGBtoHCL(in float3 RGB)
{
float3 HCL;
float H = 0;
float U = min(RGB.r, min(RGB.g, RGB.b));
float V = max(RGB.r, max(RGB.g, RGB.b));
float Q = HCLgamma / HCLy0;
HCL.y = V - U;
if (HCL.y != 0)
{
H = atan2(RGB.g - RGB.b, RGB.r - RGB.g) / pi;
Q *= U / V;
}
Q = exp(Q);
HCL.x = frac(H / 2 - min(frac(H), frac(-H)) / 6);
HCL.y *= Q;
HCL.z = lerp(-U, V, Q) / (HCLmaxL * 2);
return HCL;
}

//HSL MODIFT
float3 ModifyViaHSL(float3 color, float3 HSLMod)
{
float3 colorHSL = RGBtoHSL(color);
colorHSL.r = frac(colorHSL.r + HSLMod.r);
colorHSL.g = saturate(colorHSL.g + HSLMod.g);
colorHSL.b = saturate(colorHSL.b + HSLMod.b);
return HSLtoRGB(colorHSL);
}

float3 poiSaturation(float3 In, float Saturation)
{
float luma = dot(In, float3(0.2126729, 0.7151522, 0.0721750));
return luma.xxx + Saturation.xxx * (In - luma.xxx);
}
// LCH
float xyzF(float t)
{
return lerp(pow(t, 1. / 3.), 7.787037 * t + 0.139731, step(t, 0.00885645));
}
float xyzR(float t)
{
return lerp(t * t * t, 0.1284185 * (t - 0.139731), step(t, 0.20689655));
}
float3 rgb2lch(in float3 c)
{
c = mul(float3x3(0.4124, 0.3576, 0.1805,
0.2126, 0.7152, 0.0722,
0.0193, 0.1192, 0.9505), c);
c.x = xyzF(c.x / wref.x);
c.y = xyzF(c.y / wref.y);
c.z = xyzF(c.z / wref.z);
float3 lab = float3(max(0., 116.0 * c.y - 16.0), 500.0 * (c.x - c.y), 200.0 * (c.y - c.z));
return float3(lab.x, length(float2(lab.y, lab.z)), atan2(lab.z, lab.y));
}

float3 lch2rgb(in float3 c)
{
c = float3(c.x, cos(c.z) * c.y, sin(c.z) * c.y);

float lg = 1. / 116. * (c.x + 16.);
float3 xyz = float3(wref.x * xyzR(lg + 0.002 * c.y),
wref.y * xyzR(lg),
wref.z * xyzR(lg - 0.005 * c.z));

float3 rgb = mul(float3x3(3.2406, -1.5372, -0.4986,
- 0.9689, 1.8758, 0.0415,
0.0557, -0.2040, 1.0570), xyz);

return rgb;
}

//cheaply lerp around a circle
float lerpAng(in float a, in float b, in float x)
{
float ang = fmod(fmod((a - b), TAU) + pi * 3., TAU) - pi;
return ang * x + b;
}

//Linear interpolation between two colors in Lch space
float3 lerpLch(in float3 a, in float3 b, in float x)
{
float hue = lerpAng(a.z, b.z, x);
return float3(lerp(b.xy, a.xy, x), hue);
}

float3 poiExpensiveColorBlend(float3 col1, float3 col2, float alpha)
{
return lch2rgb(lerpLch(rgb2lch(col1), rgb2lch(col2), alpha));
}

float4x4 poiAngleAxisRotationMatrix(float angle, float3 axis)
{
axis = normalize(axis);
float s = sin(angle);
float c = cos(angle);
float oc = 1.0 - c;

return float4x4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s, 0.0,
oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s, 0.0,
oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c, 0.0,
0.0, 0.0, 0.0, 1.0);
}

float4x4 poiRotationMatrixFromAngles(float x, float y, float z)
{
float angleX = radians(x);
float c = cos(angleX);
float s = sin(angleX);
float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
0, c, -s, 0,
0, s, c, 0,
0, 0, 0, 1);

float angleY = radians(y);
c = cos(angleY);
s = sin(angleY);
float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
0, 1, 0, 0,
- s, 0, c, 0,
0, 0, 0, 1);

float angleZ = radians(z);
c = cos(angleZ);
s = sin(angleZ);
float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
s, c, 0, 0,
0, 0, 1, 0,
0, 0, 0, 1);

return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
}

float4x4 poiRotationMatrixFromAngles(float3 angles)
{
float angleX = radians(angles.x);
float c = cos(angleX);
float s = sin(angleX);
float4x4 rotateXMatrix = float4x4(1, 0, 0, 0,
0, c, -s, 0,
0, s, c, 0,
0, 0, 0, 1);

float angleY = radians(angles.y);
c = cos(angleY);
s = sin(angleY);
float4x4 rotateYMatrix = float4x4(c, 0, s, 0,
0, 1, 0, 0,
- s, 0, c, 0,
0, 0, 0, 1);

float angleZ = radians(angles.z);
c = cos(angleZ);
s = sin(angleZ);
float4x4 rotateZMatrix = float4x4(c, -s, 0, 0,
s, c, 0, 0,
0, 0, 1, 0,
0, 0, 0, 1);

return mul(mul(rotateXMatrix, rotateYMatrix), rotateZMatrix);
}

float3 getCameraPosition()
{
#ifdef USING_STEREO_MATRICES
return lerp(unity_StereoWorldSpaceCameraPos[0], unity_StereoWorldSpaceCameraPos[1], 0.5);
#endif
return _WorldSpaceCameraPos;
}

half2 calcScreenUVs(half4 grabPos)
{
half2 uv = grabPos.xy / (grabPos.w + 0.0000000001);
#if UNITY_SINGLE_PASS_STEREO
uv.xy *= half2(_ScreenParams.x * 2, _ScreenParams.y);
#else
uv.xy *= _ScreenParams.xy;
#endif

return uv;
}

float CalcMipLevel(float2 texture_coord)
{
float2 dx = ddx(texture_coord);
float2 dy = ddy(texture_coord);
float delta_max_sqr = max(dot(dx, dx), dot(dy, dy));

return 0.5 * log2(delta_max_sqr);
}

v2f vert(appdata v)
{
UNITY_SETUP_INSTANCE_ID(v);
v2f o;
PoiInitStruct(v2f, o);
UNITY_TRANSFER_INSTANCE_ID(v, o);
UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

o.objectPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz;
o.objNormal = v.normal;
o.normal = UnityObjectToWorldNormal(v.normal);
o.tangent = UnityObjectToWorldDir(v.tangent);

o.binormal = cross(o.normal, o.tangent) * (v.tangent.w * unity_WorldTransformParams.w);
o.vertexColor = v.color;

o.uv[0] = v.uv0;
o.uv[1] = v.uv1;
o.uv[2] = v.uv2;
o.uv[3] = v.uv3;

#if defined(LIGHTMAP_ON)
o.lightmapUV.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
#endif
#ifdef DYNAMICLIGHTMAP_ON
o.lightmapUV.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
#endif

o.localPos = v.vertex;
o.worldPos = mul(unity_ObjectToWorld, o.localPos);

float3 localOffset = float3(0, 0, 0);
float3 worldOffset = float3(0, 0, 0);

#ifdef POI_PASS_FORWARDOUTLINE
float outlineMask = 1;
//TODO figure out why uvs can't be set dynamically
outlineMask = poiMax(tex2Dlod(_OutlineMask, float4(poiUV(o.uv[0], _OutlineMask_ST) + _Time.x * _OutlineMaskPan, 0, 0)).rgb);

//UNITY_BRANCH
if (_OutlineUseVertexColors == 2)
{
outlineMask *= v.color.r;
}

float3 outlineNormal = o.normal;
//UNITY_BRANCH
if (_OutlineUseVertexColors == 1)
{
//TODO normals appear to be transformed before entering the vertex shader and I'm not sure how to achieve the same results with vertex colors
outlineNormal = UnityObjectToWorldNormal(v.color);
}

half offsetMultiplier = 1;
half distanceOffset = 1;
//UNITY_BRANCH
if (_OutlineFixedSize)
{
distanceOffset *= min(distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, o.localPos).xyz), _OutlinesMaxDistance);
}

float3 offset = outlineNormal * (_LineWidth * _EnableOutlines / 100) * outlineMask * distanceOffset;

//UNITY_BRANCH
if (_OutlineMode == 2)
{
float3 lightDirection = normalize(_WorldSpaceLightPos0 + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz);
offsetMultiplier = saturate(dot(lightDirection, outlineNormal));
offset *= offsetMultiplier;
offset *= distanceOffset;
}
else if (_OutlineMode == 3)
{
half3 viewNormal = mul((float3x3)UNITY_MATRIX_V, outlineNormal);
offsetMultiplier = saturate(dot(viewNormal.xy, normalize(_OutlinePersonaDirection.xy)));

offset *= offsetMultiplier;
offset *= distanceOffset;
}
else if (_OutlineMode == 4)
{
offset = mul((float3x3)transpose(UNITY_MATRIX_V), _OutlineDropShadowOffset);
offset *= distanceOffset;
}

localOffset += mul(unity_WorldToObject, offset);
worldOffset += offset;
#endif

o.localPos.rgb += localOffset;
o.worldPos.rgb += worldOffset;
o.pos = UnityObjectToClipPos(o.localPos);
o.grabPos = ComputeGrabScreenPos(o.pos);

float3x3 objectToTangent = float3x3(
o.tangent.xyz,
cross(o.normal, o.tangent.xyz) * v.tangent.w,
o.normal
);
o.tangentViewDir = mul(objectToTangent, ObjSpaceViewDir(o.localPos));

#ifndef FORWARD_META_PASS
#if !defined(UNITY_PASS_SHADOWCASTER)
UNITY_TRANSFER_SHADOW(o, o.uv[0].xy);
#else
TRANSFER_SHADOW_CASTER_NOPOS(o, o.pos);
#endif
#endif
UNITY_TRANSFER_FOG(o, o.pos);
return o;
}

#ifdef COLOR_GRADING_LOG_VIEW
//Tests to see if Audio Link texture is available
bool AudioLinkIsAvailable()
{
#if !defined(AUDIOLINK_STANDARD_INDEXING)
int width, height;
_AudioTexture.GetDimensions(width, height);
return width > 16;
#else
return _AudioTexture_TexelSize.z > 16;
#endif
}

//Get version of audiolink present in the world, 0 if no audiolink is present
float AudioLinkGetVersion()
{
int2 dims;
#if !defined(AUDIOLINK_STANDARD_INDEXING)
_AudioTexture.GetDimensions(dims.x, dims.y);
#else
dims = _AudioTexture_TexelSize.zw;
#endif

if (dims.x >= 128)
return AudioLinkData(ALPASS_GENERALVU).x;
else if (dims.x > 16)
return 1;
else
return 0;
}

float getBandAtTime(float band, float time, float width, float size = 1.0f)
{
return pow(UNITY_SAMPLE_TEX2D(_AudioTexture, float2(time * width, band)).r, (1 - size) * 3 + 1);
}

void initAudioBands(inout PoiMods poiMods)
{
poiMods.audioLinkAvailable = AudioLinkIsAvailable();
poiMods.audioLinkAvailable *= _AudioLinkAnimToggle;

if (poiMods.audioLinkAvailable)
{
poiMods.audioLinkVersion = AudioLinkGetVersion();
poiMods.audioLink.x = AudioLinkData(ALPASS_AUDIOBASS).r;
poiMods.audioLink.y = AudioLinkData(ALPASS_AUDIOLOWMIDS).r;
poiMods.audioLink.z = AudioLinkData(ALPASS_AUDIOHIGHMIDS).r;
poiMods.audioLink.w = AudioLinkData(ALPASS_AUDIOTREBLE).r;
}
}
#endif

float2 calculatePolarCoordinate(in PoiMesh poiMesh)
{
float2 delta = poiMesh.uv[_PolarUV] - _PolarCenter;
float radius = length(delta) * 2 * _PolarRadialScale;
float angle = atan2(delta.x, delta.y) * 1.0 / 6.28 * _PolarLengthScale;
return float2(radius, angle + distance(poiMesh.uv[_PolarUV], _PolarCenter) * _PolarSpiralPower);
}

float2 MonoPanoProjection(float3 coords)
{
float3 normalizedCoords = normalize(coords);
float latitude = acos(normalizedCoords.y);
float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
float2 sphereCoords = float2(longitude, latitude) * float2(1.0 / UNITY_PI, 1.0 / UNITY_PI);
sphereCoords = float2(1.0, 1.0) - sphereCoords;
return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).zw;
}

float2 StereoPanoProjection(float3 coords)
{
float3 normalizedCoords = normalize(coords);
float latitude = acos(normalizedCoords.y);
float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
float2 sphereCoords = float2(longitude, latitude) * float2(0.5 / UNITY_PI, 1.0 / UNITY_PI);
sphereCoords = float2(0.5, 1.0) - sphereCoords;
return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 0.5).zw;
}

float2 calculatePanosphereUV(in PoiMesh poiMesh)
{
float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - poiMesh.worldPos) * - 1;
return lerp(MonoPanoProjection(viewDirection), StereoPanoProjection(viewDirection), _StereoEnabled);
}

#ifdef USER_LUT
float2 distortedUV(in PoiMesh poiMesh)
{
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
float4 flowVector = POI2D_SAMPLER_PAN(_DistortionFlowTexture, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTextureUV], _DistortionFlowTexture_ST), _DistortionFlowTexturePan) * 2 - 1;
#else
float4 flowVector = 0;
#endif

#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
float4 flowVector1 = POI2D_SAMPLER_PAN(_DistortionFlowTexture1, _MainTex, poiUV(poiMesh.uv[_DistortionFlowTexture1UV], _DistortionFlowTexture1_ST), _DistortionFlowTexture1Pan) * 2 - 1;
#else
float4 flowVector1 = 0;
#endif

#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
half distortionMask = POI2D_SAMPLER_PAN(_DistortionMask, _MainTex, poiMesh.uv[_DistortionMaskUV], _DistortionMaskPan).r;
#else
half distortionMask = 1;
#endif

half distortionStrength = _DistortionStrength;
half distortionStrength1 = _DistortionStrength1;

flowVector *= distortionStrength;
flowVector1 *= distortionStrength1;
return poiMesh.uv[_DistortionUvToDistort] + ((flowVector.xy + flowVector1.xy) / 2) * distortionMask;
}
#endif

void applyAlphaOptions(inout PoiFragData poiFragData, in PoiMesh poiMesh, in PoiCam poiCam)
{
poiFragData.alpha = saturate(poiFragData.alpha + _AlphaMod);

// Distance Fade
if (_AlphaDistanceFade)
{
float3 position = _AlphaDistanceFadeType ? poiMesh.worldPos : poiMesh.objectPosition;
poiFragData.alpha *= lerp(_AlphaDistanceFadeMinAlpha, _AlphaDistanceFadeMaxAlpha, smoothstep(_AlphaDistanceFadeMin, _AlphaDistanceFadeMax, distance(position, poiCam.worldPos)));
}

// Fresnel Alpha
if (_AlphaFresnel)
{
float holoRim = saturate(1 - smoothstep(min(_AlphaFresnelSharpness, _AlphaFresnelWidth), _AlphaFresnelWidth, poiCam.vDotN));
holoRim = abs(lerp(1, holoRim, _AlphaFresnelAlpha));
poiFragData.alpha *= _AlphaFresnelInvert ?1 - holoRim : holoRim;
}

if (_AlphaAngular)
{
half cameraAngleMin = _CameraAngleMin / 180;
half cameraAngleMax = _CameraAngleMax / 180;
half modelAngleMin = _ModelAngleMin / 180;
half modelAngleMax = _ModelAngleMax / 180;
float3 pos = _AngleCompareTo == 0 ? poiMesh.objectPosition : poiMesh.worldPos;
half3 cameraToModelDirection = normalize(pos - getCameraPosition());
half3 modelForwardDirection = normalize(mul(unity_ObjectToWorld, normalize(_AngleForwardDirection)));
half cameraLookAtModel = remapClamped(cameraAngleMax, cameraAngleMin, .5 * dot(cameraToModelDirection, getCameraForward()) + .5);
half modelLookAtCamera = remapClamped(modelAngleMax, modelAngleMin, .5 * dot(-cameraToModelDirection, modelForwardDirection) + .5);
if (_AngleType == 0)
{
poiFragData.alpha *= max(cameraLookAtModel, _AngleMinAlpha);
}
else if (_AngleType == 1)
{
poiFragData.alpha *= max(modelLookAtCamera, _AngleMinAlpha);
}
else if (_AngleType == 2)
{
poiFragData.alpha *= max(cameraLookAtModel * modelLookAtCamera, _AngleMinAlpha);
}
}
}

inline half Dither8x8Bayer(int x, int y)
{
const half dither[ 64 ] = {
1, 49, 13, 61, 4, 52, 16, 64,
33, 17, 45, 29, 36, 20, 48, 32,
9, 57, 5, 53, 12, 60, 8, 56,
41, 25, 37, 21, 44, 28, 40, 24,
3, 51, 15, 63, 2, 50, 14, 62,
35, 19, 47, 31, 34, 18, 46, 30,
11, 59, 7, 55, 10, 58, 6, 54,
43, 27, 39, 23, 42, 26, 38, 22
};
int r = y * 8 + x;
return dither[r] / 64;
}

half calcDither(half2 grabPos)
{
half dither = Dither8x8Bayer(fmod(grabPos.x, 8), fmod(grabPos.y, 8));
return dither;
}

void applyDithering(inout PoiFragData poiFragData, in PoiCam poiCam)
{
if (_AlphaDithering)
{
poiFragData.alpha = poiFragData.alpha - (calcDither(poiCam.screenUV) * (1 - poiFragData.alpha) * _AlphaDitherGradient);
}
}

void ApplyAlphaToCoverage(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
// Force Model Opacity to 1 if desired
UNITY_BRANCH
if (_Mode == 1)
{
UNITY_BRANCH
if (_AlphaSharpennedA2C)
{
// rescale alpha by mip level
poiFragData.alpha *= 1 + max(0, CalcMipLevel(poiMesh.uv[0] * _MainTex_TexelSize.zw)) * _AlphaMipScale;
// rescale alpha by partial derivative
poiFragData.alpha = (poiFragData.alpha - _Cutoff) / max(fwidth(poiFragData.alpha), 0.0001) + _Cutoff;
}
}
}

#ifdef POI_BACKFACE
void ApplyBackFaceColor(inout PoiFragData poiFragData, in PoiMesh poiMesh, inout PoiMods poiMods)
{
if (!poiMesh.isFrontFace)
{
float4 backFaceColor = _BackFaceColor;
#if defined(PROP_BACKFACETEXTURE) || !defined(OPTIMIZER_ENABLED)
backFaceColor *= POI2D_SAMPLER_PAN(_BackFaceTexture, _MainTex, poiUV(poiMesh.uv[_BackFaceTextureUV], _BackFaceTexture_ST), _BackFaceTexturePan);
#endif
backFaceColor.rgb = hueShift(backFaceColor.rgb, frac(_BackFaceHueShift + _BackFaceHueShiftSpeed * _Time.x) * _BackFaceHueShiftEnabled);

float backFaceMask = 1;
#if defined(PROP_BACKFACEMASK) || !defined(OPTIMIZER_ENABLED)
backFaceMask *= POI2D_SAMPLER_PAN(_BackFaceMask, _MainTex, poiUV(poiMesh.uv[_BackFaceMaskUV], _BackFaceMask_ST), _BackFaceMaskPan).r * _BackFaceAlpha * backFaceColor.a;
#endif

poiFragData.baseColor = lerp(poiFragData.baseColor, backFaceColor.rgb, backFaceMask);

UNITY_BRANCH
if (_BackFaceReplaceAlpha)
{
poiFragData.alpha = lerp(backFaceColor.a, poiFragData.alpha, backFaceMask);
}

poiFragData.emission += backFaceColor.rgb * _BackFaceEmissionStrength * backFaceMask;
}
}
#endif

#ifdef _SUNDISK_HIGH_QUALITY

void applyFlipbook(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
float4 flipBookPixel = float4(0, 0, 0, 0);
#if defined(PROP_FLIPBOOKMASK) || !defined(OPTIMIZER_ENABLED)
float flipBookMask = POI2D_SAMPLER_PAN(_FlipbookMask, _MainTex, poiMesh.uv[_FlipbookMaskUV], _FlipbookMaskPan).r;
#else
float flipBookMask = 1;
#endif
float4 flipbookScaleOffset = _FlipbookScaleOffset;

#ifdef POI_AUDIOLINK
flipbookScaleOffset.xy += lerp(_AudioLinkFlipbookScale.xy, _AudioLinkFlipbookScale.zw, poiMods.audioLink[_AudioLinkFlipbookScaleBand]);
#endif

flipbookScaleOffset.xy = 1 - flipbookScaleOffset.xy;
float2 uv = frac(poiMesh.uv[_FlipbookTexArrayUV]);
float theta = radians(_FlipbookRotation + _Time.z * _FlipbookRotationSpeed);
float cs = cos(theta);
float sn = sin(theta);
float2 spriteCenter = flipbookScaleOffset.zw + .5;
// 2d rotation
uv = float2((uv.x - spriteCenter.x) * cs - (uv.y - spriteCenter.y) * sn + spriteCenter.x, (uv.x - spriteCenter.x) * sn + (uv.y - spriteCenter.y) * cs + spriteCenter.y);

float2 newUV = remap(uv, float2(0, 0) + flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(1, 1) - flipbookScaleOffset.xy / 2 + flipbookScaleOffset.zw, float2(0, 0), float2(1, 1));

UNITY_BRANCH
if (_FlipbookTiled == 0)
{
if (max(newUV.x, newUV.y) > 1 || min(newUV.x, newUV.y) < 0)
{
return;
}
}
#if defined(PROP_FLIPBOOKTEXARRAY) || !defined(OPTIMIZER_ENABLED)
float currentFrame = fmod(_FlipbookCurrentFrame, _FlipbookTotalFrames);
if (_FlipbookCurrentFrame < 0)
{
currentFrame = (_Time.y / (1 / _FlipbookFPS)) % _FlipbookTotalFrames;
}
#ifdef POI_AUDIOLINK
currentFrame += lerp(_AudioLinkFlipbookFrame.x, _AudioLinkFlipbookFrame.y, poiMods.audioLink[_AudioLinkFlipbookFrameBand]);
#endif
flipBookPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor(currentFrame)));
UNITY_BRANCH
if (_FlipbookCrossfadeEnabled)
{
float4 flipbookNextPixel = UNITY_SAMPLE_TEX2DARRAY(_FlipbookTexArray, float3(TRANSFORM_TEX(newUV, _FlipbookTexArray) + _Time.x * _FlipbookTexArrayPan, floor((currentFrame + 1) % _FlipbookTotalFrames)));
flipBookPixel = lerp(flipBookPixel, flipbookNextPixel, smoothstep(_FlipbookCrossfadeRange.x, _FlipbookCrossfadeRange.y, frac(currentFrame)));
}
#else
flipBookPixel = 1;
#endif

UNITY_BRANCH
if (_FlipbookIntensityControlsAlpha)
{
flipBookPixel.a = poiMax(flipBookPixel.rgb);
}
UNITY_BRANCH
if (_FlipbookColorReplaces)
{
flipBookPixel.rgb = _FlipbookColor.rgb;
}
else
{
flipBookPixel.rgb *= _FlipbookColor.rgb;
}

#ifdef POI_BLACKLIGHT
UNITY_BRANCH
if (_BlackLightMaskFlipbook != 4)
{
flipBookMask *= blackLightMask[_BlackLightMaskFlipbook];
}
#endif

UNITY_BRANCH
if (_FlipbookHueShiftEnabled)
{
flipBookPixel.rgb = hueShift(flipBookPixel.rgb, _FlipbookHueShift + _Time.x * _FlipbookHueShiftSpeed);
}
half flipbookAlpha = 1;
#ifdef POI_AUDIOLINK
flipbookAlpha = saturate(lerp(_AudioLinkFlipbookAlpha.x, _AudioLinkFlipbookAlpha.y, poiMods.audioLink[_AudioLinkFlipbookAlphaBand]));
#endif

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)

poiFragData.baseColor = lerp(poiFragData.baseColor, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * _FlipbookReplace * flipBookMask * flipbookAlpha);
poiFragData.baseColor = poiFragData.baseColor + flipBookPixel.rgb * _FlipbookAdd * flipBookMask * flipbookAlpha;
poiFragData.baseColor = poiFragData.baseColor * lerp(1, flipBookPixel.rgb, flipBookPixel.a * _FlipbookColor.a * flipBookMask * _FlipbookMultiply * flipbookAlpha);

float flipbookEmissionStrength = _FlipbookEmissionStrength;
#ifdef POI_AUDIOLINK
flipbookEmissionStrength += max(lerp(_AudioLinkFlipbookEmission.x, _AudioLinkFlipbookEmission.y, poiMods.audioLink[_AudioLinkFlipbookEmissionBand]), 0);
#endif

poiFragData.emission += lerp(0, flipBookPixel.rgb * flipbookEmissionStrength, flipBookPixel.a * _FlipbookColor.a * flipBookMask * flipbookAlpha);

#endif

UNITY_BRANCH
if (_FlipbookAlphaControlsFinalAlpha)
{
poiFragData.alpha = lerp(poiFragData.alpha, flipBookPixel.a * _FlipbookColor.a, flipBookMask);
}
}

#endif

#ifdef DISTORT
void applyDissolve(inout PoiFragData poiFragData, in PoiMesh poiMesh)
{
#if defined(PROP_DISSOLVEMASK) || !defined(OPTIMIZER_ENABLED)
float dissolveMask = POI2D_SAMPLER_PAN(_DissolveMask, _MainTex, poiUV(poiMesh.uv[_DissolveMaskUV], _DissolveMask_ST), _DissolveMaskPan).r;
#else
float dissolveMask = 1;
#endif
UNITY_BRANCH
if (_DissolveUseVertexColors)
{
// Vertex Color Imprecision hype
dissolveMask = ceil(poiMesh.vertexColor.g * 100000) / 100000;
}

#if defined(PROP_DISSOLVETOTEXTURE) || !defined(OPTIMIZER_ENABLED)
dissolveToTexture = POI2D_SAMPLER_PAN(_DissolveToTexture, _MainTex, poiUV(poiMesh.uv[_DissolveToTextureUV], _DissolveToTexture_ST), _DissolveToTexturePan) * _DissolveTextureColor;
#else
dissolveToTexture = _DissolveTextureColor;
#endif

#if defined(PROP_DISSOLVENOISETEXTURE) || !defined(OPTIMIZER_ENABLED)
float dissolveNoiseTexture = POI2D_SAMPLER_PAN(_DissolveNoiseTexture, _MainTex, poiUV(poiMesh.uv[_DissolveNoiseTextureUV], _DissolveNoiseTexture_ST), _DissolveNoiseTexturePan).r;
#else
float dissolveNoiseTexture = 1;
#endif

float da = _DissolveAlpha
+ _DissolveAlpha0
+ _DissolveAlpha1
+ _DissolveAlpha2
+ _DissolveAlpha3
+ _DissolveAlpha4
+ _DissolveAlpha5
+ _DissolveAlpha6
+ _DissolveAlpha7
+ _DissolveAlpha8
+ _DissolveAlpha9;
float dds = _DissolveDetailStrength;

#ifdef POI_AUDIOLINK
UNITY_BRANCH
if (_EnableDissolveAudioLink && poiMods.audioLinkTextureExists)
{
da += lerp(_AudioLinkDissolveAlpha.x, _AudioLinkDissolveAlpha.y, poiMods.audioLink[_AudioLinkDissolveAlphaBand]);
dds += lerp(_AudioLinkDissolveDetail.x, _AudioLinkDissolveDetail.y, poiMods.audioLink[_AudioLinkDissolveDetailBand]);
}
#endif

da = saturate(da);
dds = saturate(dds);

#ifdef POI_BLACKLIGHT
if (_BlackLightMaskDissolve != 4)
{
dissolveMask *= blackLightMask[_BlackLightMaskDissolve];
}
#endif

if (_DissolveMaskInvert)
{
dissolveMask = 1 - dissolveMask;
}
#if defined(PROP_DISSOLVEDETAILNOISE) || !defined(OPTIMIZER_ENABLED)
float dissolveDetailNoise = POI2D_SAMPLER_PAN(_DissolveDetailNoise, _MainTex, poiUV(poiMesh.uv[_DissolveDetailNoiseUV], _DissolveDetailNoise_ST), _DissolveDetailNoisePan);
#else
float dissolveDetailNoise = 0;
#endif
if (_DissolveInvertNoise)
{
dissolveNoiseTexture = 1 - dissolveNoiseTexture;
}
if (_DissolveInvertDetailNoise)
{
dissolveDetailNoise = 1 - dissolveDetailNoise;
}
if (_ContinuousDissolve != 0)
{
da = sin(_Time.y * _ContinuousDissolve) * .5 + .5;
}
da *= dissolveMask;
dissolveAlpha = da;
edgeAlpha = 0;

UNITY_BRANCH
if (_DissolveType == 1) // Basic

{
da = remap(da, 0, 1, -_DissolveEdgeWidth, 1);
dissolveAlpha = da;
//Adjust detail strength to avoid artifacts
dds *= smoothstep(1, .99, da);
float noise = saturate(dissolveNoiseTexture - dissolveDetailNoise * dds);

noise = saturate(noise + 0.001);
//noise = remap(noise, 0, 1, _DissolveEdgeWidth, 1 - _DissolveEdgeWidth);
dissolveAlpha = dissolveAlpha >= noise;
edgeAlpha = remapClamped(da + _DissolveEdgeWidth, da, noise) * (1 - dissolveAlpha);
}
else if (_DissolveType == 2) // Point to Point

{
float3 direction;
float3 currentPos;
float distanceTo = 0;
direction = normalize(_DissolveEndPoint - _DissolveStartPoint);
currentPos = lerp(_DissolveStartPoint, _DissolveEndPoint, dissolveAlpha);

UNITY_BRANCH
if (_DissolveP2PWorldLocal != 1)
{
float3 pos = _DissolveP2PWorldLocal == 0 ? poiMesh.localPos.rgb : poiMesh.vertexColor.rgb;
distanceTo = dot(pos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
else
{
distanceTo = dot(poiMesh.worldPos - currentPos, direction) - dissolveDetailNoise * dds;
edgeAlpha = smoothstep(_DissolveP2PEdgeLength + .00001, 0, distanceTo);
dissolveAlpha = step(distanceTo, 0);
edgeAlpha *= 1 - dissolveAlpha;
}
}

#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveHueShiftEnabled)
{
dissolveToTexture.rgb = hueShift(dissolveToTexture.rgb, _DissolveHueShift + _Time.x * _DissolveHueShiftSpeed);
}
#endif

poiFragData.alpha = lerp(poiFragData.alpha, dissolveToTexture.a, dissolveAlpha * .999999);

#if !defined(POI_PASS_FORWARDOUTLINE) && !defined(UNITY_PASS_SHADOWCASTER)
poiFragData.baseColor = lerp(poiFragData.baseColor, dissolveToTexture.rgb, dissolveAlpha * .999999);

UNITY_BRANCH
if (_DissolveEdgeWidth)
{
edgeColor = tex2D(_DissolveEdgeGradient, poiUV(float2(edgeAlpha, edgeAlpha), _DissolveEdgeGradient_ST)) * _DissolveEdgeColor;
#ifndef POI_SHADOW
UNITY_BRANCH
if (_DissolveEdgeHueShiftEnabled)
{
edgeColor.rgb = hueShift(edgeColor.rgb, _DissolveEdgeHueShift + _Time.x * _DissolveEdgeHueShiftSpeed);
}
#endif
poiFragData.baseColor = lerp(poiFragData.baseColor, edgeColor.rgb, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
}

poiFragData.emission += lerp(0, dissolveToTexture * _DissolveToEmissionStrength, dissolveAlpha) + lerp(0, edgeColor.rgb * _DissolveEdgeEmission, smoothstep(0, 1 - _DissolveEdgeHardness * .99999999999, edgeAlpha));
#endif
}
#endif

float4 frag(v2f i, uint facing : SV_IsFrontFace) : SV_Target
{
UNITY_SETUP_INSTANCE_ID(i);
PoiMesh poiMesh;
PoiInitStruct(PoiMesh, poiMesh);

PoiLight poiLight;
PoiInitStruct(PoiLight, poiLight);

PoiVertexLights poiVertexLights;
PoiInitStruct(PoiVertexLights, poiVertexLights);

PoiCam poiCam;
PoiInitStruct(PoiCam, poiCam);

PoiMods poiMods;
PoiInitStruct(PoiMods, poiMods);

PoiFragData poiFragData;
poiFragData.emission = 0;
poiFragData.baseColor = float3(0, 0, 0);
poiFragData.finalColor = float3(0, 0, 0);
poiFragData.alpha = 1;

// Mesh Data
poiMesh.objectPosition = i.objectPos;
poiMesh.objNormal = i.objNormal;
poiMesh.normals[0] = i.normal;
poiMesh.tangent = i.tangent;
poiMesh.binormal = i.binormal;
poiMesh.worldPos = i.worldPos.xyz;
poiMesh.localPos = i.localPos.xyz;
poiMesh.vertexColor = i.vertexColor;
poiMesh.isFrontFace = facing;

#ifndef POI_PASS_FORWARDOUTLINE
if (!poiMesh.isFrontFace)
{
poiMesh.normals[0] *= -1;
poiMesh.tangent *= -1;
poiMesh.binormal *= -1;
}
#endif
// 0-3 UV0-UV3
// 4 Panosphere UV
// 5 world pos xz
// 6 Polar UV
// 6 Distorted UV
#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
poiMesh.lightmapUV = i.lightmapUV;
#endif
poiMesh.uv[0] = i.uv[0];
poiMesh.uv[1] = i.uv[1];
poiMesh.uv[2] = i.uv[2];
poiMesh.uv[3] = i.uv[3];
poiMesh.uv[4] = poiMesh.uv[0];
poiMesh.uv[5] = poiMesh.worldPos.xz;
poiMesh.uv[6] = poiMesh.uv[0];
poiMesh.uv[7] = poiMesh.uv[0];
poiMesh.uv[4] = calculatePanosphereUV(poiMesh);
poiMesh.uv[6] = calculatePolarCoordinate(poiMesh);
#ifdef USER_LUT
poiMesh.uv[7] = distortedUV(poiMesh);
#endif
/*
half3 worldViewUp = normalize(half3(0, 1, 0) - poiCam.viewDir * dot(poiCam.viewDir, half3(0, 1, 0)));
half3 worldViewRight = normalize(cross(poiCam.viewDir, worldViewUp));
poiMesh[8] = half2(dot(worldViewRight, poiMesh.normals[_MatcapNormal]), dot(worldViewUp, poiMesh.normals[_MatcapNormal])) * _MatcapBorder + 0.5;
*/

float4 mainTexture = UNITY_SAMPLE_TEX2D(_MainTex, poiUV(poiMesh.uv[_MainTexUV].xy, _MainTex_ST) + _Time.x * _MainTexPan);

float3 mainNormal = UnpackScaleNormal(POI2D_SAMPLER_PAN(_BumpMap, _MainTex, poiUV(poiMesh.uv[_BumpMapUV], _BumpMap_ST), _BumpMapPan), _BumpScale);
poiMesh.tangentSpaceNormal = mainNormal;

#if defined(FINALPASS) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
ApplyDetailNormal(poiMods, poiMesh);
#endif

#if defined(GEOM_TYPE_MESH) && defined(VIGNETTE) && !defined(UNITY_PASS_SHADOWCASTER) && !defined(POI_PASS_FORWARDOUTLINE)
calculateRGBNormals(poiMesh);
#endif

poiMesh.normals[1] = normalize(
poiMesh.tangentSpaceNormal.x * poiMesh.tangent.xyz +
poiMesh.tangentSpaceNormal.y * poiMesh.binormal +
poiMesh.tangentSpaceNormal.z * poiMesh.normals[0]
);

#ifdef POI_PASS_FORWARDOUTLINE
poiMesh.normals[1] = poiMesh.normals[0];
#endif

// Camera data
poiCam.viewDir = normalize(_WorldSpaceCameraPos - i.worldPos.xyz);
poiCam.forwardDir = getCameraForward();
poiCam.worldPos = _WorldSpaceCameraPos;
poiCam.reflectionDir = reflect(-poiCam.viewDir, poiMesh.normals[1]);
//poiCam.distanceToModel = distance(poiMesh.modelPos, poiCam.worldPos);
poiCam.distanceToVert = distance(poiMesh.worldPos, poiCam.worldPos);
poiCam.grabPos = i.grabPos;
poiCam.screenUV = calcScreenUVs(i.grabPos);
poiCam.tangentViewDir = normalize(i.tangentViewDir);
poiCam.vDotN = abs(dot(poiCam.viewDir, poiMesh.normals[1]));
poiCam.clipPos = i.pos;

poiFragData.baseColor = mainTexture.rgb * _Color.rgb;
poiFragData.alpha = mainTexture.a * _Color.a;

#if defined(PROP_CLIPPINGMASK) || !defined(OPTIMIZER_ENABLED)
float alphaMask = POI2D_SAMPLER_PAN(_ClippingMask, _MainTex, poiUV(poiMesh.uv[_ClippingMaskUV], _ClippingMask_ST), _ClippingMaskPan).r;
#else
float alphaMask = 1;
#endif

poiFragData.alpha *= alphaMask;

applyAlphaOptions(poiFragData, poiMesh, poiCam);

#ifdef POI_BACKFACE
ApplyBackFaceColor(poiFragData, poiMesh, poiMods);
#endif

#ifdef _SUNDISK_HIGH_QUALITY
applyFlipbook(poiFragData, poiMesh);
#endif

#ifdef DISTORT
applyDissolve(poiFragData, poiMesh);
#endif

poiFragData.finalColor = poiFragData.baseColor;

#ifdef COLOR_GRADING_LOG_VIEW
initAudioBands(poiMods);
#endif

if (_Mode == 1)
{
clip(poiFragData.alpha - _Cutoff);
}

//UNITY_BRANCH
if (_IgnoreFog == 0)
{
UNITY_APPLY_FOG(i.fogCoord, poiFragData.finalColor);
}

//#ifndef UNITY_PASS_SHADOWCASTER
if (_Mode == POI_MODE_OPAQUE)
{
poiFragData.alpha = 1;
}
return float4(poiFragData.finalColor + poiFragData.emission, poiFragData.alpha) + mainTexture * 0.0001;
//#else
//	SHADOW_CASTER_FRAGMENT(i)
//#endif

}

ENDCG

}

}
CustomEditor "Thry.ShaderEditor"
}
