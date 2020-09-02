Shader "Custom/HDRP/PlanetForSky"
{
    Properties
    {
		[NoScaleOffset]_ColorTexture("Color Texture", 2D) = "gray" {}
		[Toggle]_EnableClouds("Enable Clouds", Float) = 1
		_PolarMask("Polar Mask", 2D) = "white" {}
		[NoScaleOffset]_NecessaryWaterMask("Necessary Water Mask", 2D) = "black" {}
		[NoScaleOffset]_CloudsTexture("CloudsTexture", 2D) = "black" {}
		_CitiesTexture("Cities Texture", 2D) = "black" {}
		[HDR]_ColorA("Color + A", Color) = (4.541205,4.541205,4.541205,0.3607843)
		_CloudSpeed("Cloud Speed", Range( 0 , 10)) = 1
		_ShadowsYOffset("Shadows Y Offset", Range( -0.02 , 0.02)) = -0.005
		_ShadowsXOffset("Shadows X Offset", Range( -0.02 , 0.02)) = -0.005
		_ShadowsSharpness("Shadows Sharpness", Range( 0 , 10)) = 2.5
		[Toggle]_EnableCities("Enable Cities", Float) = 1
		[HDR]_Citiescolor("Cities color", Color) = (7.906699,2.649365,1.200494,0)
		[HDR]_AtmosphereColor("Atmosphere Color", Color) = (0.3764706,1.027451,1.498039,0)
		_InteriorSize("Interior Size", Range( -2 , 10)) = 0.3
		_IlluminationSmoothness("Illumination Smoothness", Float) = 4
		_InteriorIntensity("Interior Intensity", Range( 0 , 1)) = 0.65
		[Toggle]_EnableAtmosphere("Enable Atmosphere", Float) = 1
		_IlluminationAmbient("Illumination Ambient", Color) = (0.09019608,0.06666667,0.1490196,0)
		_LightSource("_LightSource", Vector) = (1,0,0,0)
		_CitiesDetail("Cities Detail", Range( 1 , 20)) = 4
		_EnumFloat("_EnumFloat", Float) = 0
		_WaterColor("Water Color", Color) = (0.282353,0.4431373,0.5176471,0)
		_SpecularIntensity("Specular Intensity", Range( 0 , 1)) = 1
		_Normals("Normals", 2D) = "bump" {}
		_NormalsIntensity("Normals Intensity", Range( 0 , 2)) = 1
		[Toggle]_EnableWater("Enable Water", Float) = 1
		_CloudsNormals("Clouds Normals", 2D) = "bump" {}
		_BaseColormodifier("Base Color modifier", Color) = (1,1,1,0)
		_ShadowColorA("Shadow Color + A", Color) = (0.09803922,0.2313726,0.4117647,1)
		_ReliefIntensity("ReliefIntensity", Float) = 2
		_ReliefSmoothness("Relief Smoothness", Range( 0 , 5)) = 2
		_IlluminationBoost("Illumination Boost", Float) = 1
		_SkyblendA("Sky blend (A)", Color) = (0.55417,0.6973749,0.755,0.4745098)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		[HideInInspector]_EmissionColor("Emission Color", Color) = (1, 1, 1, 1)
        [HideInInspector]_RenderQueueType("Render Queue Type", Float) = 5
		[HideInInspector][ToggleUI]_AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 0.0
		[HideInInspector]_ShadowMatteFilter("Shadow Matte Filter", Float) = 2.006836
        [HideInInspector]_StencilRef("Stencil Ref", Int) = 0
        [HideInInspector]_StencilWriteMask("StencilWrite Mask", Int) = 3
        [HideInInspector]_StencilRefDepth("StencilRefDepth", Int) = 0
        [HideInInspector]_StencilWriteMaskDepth("_StencilWriteMaskDepth", Int) = 32
        [HideInInspector]_StencilRefMV("_StencilRefMV", Int) = 128
        [HideInInspector]_StencilWriteMaskMV("_StencilWriteMaskMV", Int) = 128
        [HideInInspector]_StencilRefDistortionVec("_StencilRefDistortionVec", Int) = 64
        [HideInInspector]_StencilWriteMaskDistortionVec("_StencilWriteMaskDistortionVec", Int) = 64
        [HideInInspector]_StencilWriteMaskGBuffer("_StencilWriteMaskGBuffer", Int) = 3
        [HideInInspector]_StencilRefGBuffer("_StencilRefGBuffer", Int) = 2
        [HideInInspector]_ZTestGBuffer("_ZTestGBuffer", Int) = 4
        [HideInInspector][ToggleUI]_RequireSplitLighting("_RequireSplitLighting", Float) = 0
        [HideInInspector][ToggleUI]_ReceivesSSR("_ReceivesSSR", Float) = 0
        [HideInInspector]_SurfaceType("_SurfaceType", Float) = 1
        [HideInInspector]_BlendMode("_BlendMode", Float) = 0
        [HideInInspector]_SrcBlend("_SrcBlend", Float) = 1
        [HideInInspector]_DstBlend("_DstBlend", Float) = 0
        [HideInInspector]_AlphaSrcBlend("Vec_AlphaSrcBlendtor1", Float) = 1
        [HideInInspector]_AlphaDstBlend("_AlphaDstBlend", Float) = 0
        [HideInInspector][ToggleUI]_ZWrite("_ZWrite", Float) = 1
        [HideInInspector]_CullMode("Cull Mode", Float) = 2
        [HideInInspector]_TransparentSortPriority("_TransparentSortPriority", Int) = 0
        [HideInInspector]_CullModeForward("_CullModeForward", Float) = 2
        [HideInInspector][Enum(Front, 1, Back, 2)]_TransparentCullMode("_TransparentCullMode", Float) = 2
        [HideInInspector]_ZTestDepthEqualForOpaque("_ZTestDepthEqualForOpaque", Int) = 4
        [HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)]_ZTestTransparent("_ZTestTransparent", Float) = 4
        [HideInInspector][ToggleUI]_TransparentBackfaceEnable("_TransparentBackfaceEnable", Float) = 0
        [HideInInspector][ToggleUI]_AlphaCutoffEnable("_AlphaCutoffEnable", Float) = 0
        [HideInInspector]_AlphaCutoff("Alpha Cutoff", Range(0, 1)) = 0.5
        [HideInInspector][ToggleUI]_UseShadowThreshold("_UseShadowThreshold", Float) = 0
        [HideInInspector][ToggleUI]_DoubleSidedEnable("_DoubleSidedEnable", Float) = 0
        [HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)]_DoubleSidedNormalMode("_DoubleSidedNormalMode", Float) = 2
        [HideInInspector]_DoubleSidedConstants("_DoubleSidedConstants", Vector) = (1, 1, -1, 0)
    }

    SubShader
    {
		LOD 0

		
        Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Transparent" "Queue"="Transparent" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 ps4 xboxone vulkan metal switch
		ENDHLSL

		
		
        Pass
        {
			
            Name "Forward Unlit"
            Tags { "LightMode"="ForwardOnly" }
        
            Blend [_SrcBlend] [_DstBlend]
            Cull Back
            ZTest [_ZTestTransparent]
            ZWrite [_ZWrite]
        
			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}

            HLSLPROGRAM
        
			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 60900

        
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_FORWARD_UNLIT
			#pragma multi_compile _ DEBUG_DISPLAY

			#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
				#define LIGHTLOOP_DISABLE_TILE_AND_CLUSTER
				#define HAS_LIGHTLOOP
				#define SHADOW_OPTIMIZE_REGISTER_USAGE 1

				#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Shadow/HDShadowContext.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadow.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/PunctualLightCommon.hlsl"
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/HDShadowLoop.hlsl"
			#endif
                
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma multi_compile_instancing


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float4 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _BaseColormodifier;
			float4 _WaterColor;
			float _EnableWater;
			float4 _ShadowColorA;
			float _EnableClouds;
			float _CloudSpeed;
			float _ShadowsXOffset;
			float _ShadowsYOffset;
			float _ShadowsSharpness;
			float4 _ColorA;
			float _EnumFloat;
			float4 _IlluminationAmbient;
			float _ReliefIntensity;
			float _ReliefSmoothness;
			float _NormalsIntensity;
			float _IlluminationSmoothness;
			float _EnableCities;
			float _CitiesDetail;
			float4 _Citiescolor;
			float _EnableAtmosphere;
			float _InteriorSize;
			float _InteriorIntensity;
			float4 _AtmosphereColor;
			float _SpecularIntensity;
			float4 _SkyblendA;
			float _IlluminationBoost;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _AddPrecomputedVelocity;
			float _ShadowMatteFilter;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			sampler2D _ColorTexture;
			sampler2D _NecessaryWaterMask;
			sampler2D _CloudsTexture;
			sampler2D _PolarMask;
			sampler2D _CloudsNormals;
			sampler2D _Normals;
			sampler2D _CitiesTexture;
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPPlanetForSky)
				UNITY_DEFINE_INSTANCED_PROP(float4, _PolarMask_ST)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSource)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPPlanetForSky)

				
					            
			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float4 ShadowTint;
				float Alpha;
				float AlphaClipThreshold;
			};
		
			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.color = surfaceDescription.Color;
			}
        
			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription , FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				
				#if defined(_ENABLE_SHADOW_MATTE) && SHADERPASS == SHADERPASS_FORWARD_UNLIT
                    HDShadowContext shadowContext = InitShadowContext();
                    float shadow;
                    float3 shadow3;
                    posInput = GetPositionInput(fragInputs.positionSS.xy, _ScreenSize.zw, fragInputs.positionSS.z, UNITY_MATRIX_I_VP, UNITY_MATRIX_V);
                    float3 normalWS = normalize(fragInputs.tangentToWorld[1]);
                    uint renderingLayers = _EnableLightLayers ? asuint(unity_RenderingLayer.x) : DEFAULT_LIGHT_LAYERS;
                    ShadowLoopMin(shadowContext, posInput, normalWS, asuint(_ShadowMatteFilter), renderingLayers, shadow3);
                    shadow = dot(shadow3, float3(1.0f/3.0f, 1.0f/3.0f, 1.0f/3.0f));
        
                    float4 shadowColor = (1 - shadow)*surfaceDescription.ShadowTint.rgba;
                    float  localAlpha  = saturate(shadowColor.a + surfaceDescription.Alpha);
        
                    // Keep the nested lerp
                    // With no Color (bsdfData.color.rgb, bsdfData.color.a == 0.0f), just use ShadowColor*Color to avoid a ring of "white" around the shadow
                    // And mix color to consider the Color & ShadowColor alpha (from texture or/and color picker)
                    #ifdef _SURFACE_TYPE_TRANSPARENT
                        surfaceData.color = lerp(shadowColor.rgb*surfaceData.color, lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow), surfaceDescription.Alpha);
                    #else
                        surfaceData.color = lerp(lerp(shadowColor.rgb, surfaceData.color, 1 - surfaceDescription.ShadowTint.a), surfaceData.color, shadow);
                    #endif
                    localAlpha = ApplyBlendMode(surfaceData.color, localAlpha).a;
        
                    surfaceDescription.Alpha = localAlpha;
                #endif

				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity = surfaceDescription.Alpha;
				builtinData.emissiveColor = surfaceDescription.Emission;
			}
         
			VertexOutput Vert( VertexInput inputMesh  )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS.xyz);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				
				o.ase_texcoord1.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS = inputMesh.normalOS;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.positionRWS = positionRWS;
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				return o;
			}

			float4 Frag( VertexOutput packedInput ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = packedInput.positionRWS;
				
				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float4 color409 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float2 uv_ColorTexture144 = packedInput.ase_texcoord1.xy;
				float4 BaseColor156 = ( tex2D( _ColorTexture, uv_ColorTexture144 ) * _BaseColormodifier );
				float4 WaterColor307 = _WaterColor;
				float4 blendOpSrc359 = BaseColor156;
				float4 blendOpDest359 = WaterColor307;
				float WaterTransparency277 = _WaterColor.a;
				float4 lerpResult175 = lerp( BaseColor156 , ( saturate( (( blendOpDest359 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest359 ) * ( 1.0 - blendOpSrc359 ) ) : ( 2.0 * blendOpDest359 * blendOpSrc359 ) ) )) , WaterTransparency277);
				float4 lerpResult216 = lerp( lerpResult175 , WaterColor307 , WaterTransparency277);
				float4 BaseAndWater292 = lerpResult216;
				float2 uv_NecessaryWaterMask331 = packedInput.ase_texcoord1.xy;
				float clampResult304 = clamp( ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * 10.0 ) , 0.0 , 1.0 );
				float ContinentalMasks248 = clampResult304;
				float4 lerpResult181 = lerp( BaseColor156 , BaseAndWater292 , ContinentalMasks248);
				float3 desaturateInitialColor126 = lerpResult181.rgb;
				float desaturateDot126 = dot( desaturateInitialColor126, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar126 = lerp( desaturateInitialColor126, desaturateDot126.xxx, 0.3 );
				float temp_output_371_0 = ( _CloudSpeed / 1000.0 );
				float4 appendResult317 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 appendResult152 = (float2(_ShadowsXOffset , _ShadowsYOffset));
				float2 uv0325 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + appendResult152;
				float2 panner414 = ( 1.0 * _Time.y * appendResult317.xy + uv0325);
				float2 UVcloudShadows194 = panner414;
				float4 tex2DNode153 = tex2Dlod( _CloudsTexture, float4( UVcloudShadows194, 0, _ShadowsSharpness) );
				float temp_output_378_0 = ( ( tex2DNode153.b + tex2DNode153.b ) * 5.0 );
				float CloudsAlpha302 = _ColorA.a;
				float clampResult221 = clamp( ( (( _EnableClouds )?( 1.0 ):( 0.0 )) * temp_output_378_0 * CloudsAlpha302 ) , 0.0 , 1.0 );
				float CloudsShadows107 = clampResult221;
				float4 _PolarMask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_PolarMask_ST);
				float2 uv_PolarMask = packedInput.ase_texcoord1.xy * _PolarMask_ST_Instance.xy + _PolarMask_ST_Instance.zw;
				float4 PolarMask103 = tex2D( _PolarMask, uv_PolarMask );
				float4 lerpResult169 = lerp( float4( desaturateVar126 , 0.0 ) , _ShadowColorA , ( ( CloudsShadows107 * PolarMask103 ) * _ShadowColorA.a ));
				float4 CloudsColor193 = _ColorA;
				float4 appendResult330 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 uv0142 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner413 = ( 1.0 * _Time.y * appendResult330.xy + uv0142);
				float2 UVClouds308 = panner413;
				float lerpResult323 = lerp( tex2D( _CloudsTexture, UVClouds308 ).g , _EnumFloat , 0.0);
				float saferPower337 = max( lerpResult323 , 0.0001 );
				float Clouds255 = ( (0.0 + (pow( saferPower337 , 0.5 ) - 0.0) * (CloudsAlpha302 - 0.0) / (1.0 - 0.0)) * (( _EnableClouds )?( 1.0 ):( 0.0 )) );
				float4 lerpResult108 = lerp( lerpResult169 , ( 0.5 * CloudsColor193 ) , ( PolarMask103 * Clouds255 ));
				float4 AmbientColor220 = _IlluminationAmbient;
				float4 color163 = IsGammaSpace() ? float4(0.5294118,0.2701871,0.2038235,0) : float4(0.2422812,0.05933543,0.0343086,0);
				float3 _FlatNormals = float3(0,0,1);
				float2 uv0243 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float3 FlatNormal217 = _FlatNormals;
				float3 lerpResult300 = lerp( UnpackNormalmapRGorAG( tex2D( _Normals, uv0243 ), ( (0.0 + (_NormalsIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) * 0.25 ) ) , FlatNormal217 , ContinentalMasks248);
				float clampResult269 = clamp( ( 3.0 * Clouds255 ) , 0.0 , 1.0 );
				float CloudsOcclusion368 = ( 1.0 - clampResult269 );
				float3 lerpResult196 = lerp( UnpackNormalmapRGorAG( tex2Dlod( _CloudsNormals, float4( UVClouds308, 0, _ReliefSmoothness) ), ( _ReliefIntensity * CloudsAlpha302 ) ) , lerpResult300 , CloudsOcclusion368);
				float3 lerpResult415 = lerp( _FlatNormals , lerpResult196 , tex2D( _PolarMask, uv_PolarMask ).rgb);
				float3 Normals229 = lerpResult415;
				float3 ase_worldTangent = packedInput.ase_texcoord2.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord3.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord4.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal168 = Normals229;
				float3 worldNormal168 = normalize( float3(dot(tanToWorld0,tanNormal168), dot(tanToWorld1,tanNormal168), dot(tanToWorld2,tanNormal168)) );
				float3 _LightSource_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_LightSource);
				float3 normalizeResult400 = normalize( _LightSource_Instance );
				float3 LightSourceVector398 = normalizeResult400;
				float dotResult239 = dot( worldNormal168 , LightSourceVector398 );
				float smoothstepResult145 = smoothstep( 0.0 , 1.0 , ( dotResult239 + 0.5 ));
				float BaselLightMask340 = smoothstepResult145;
				float temp_output_353_0 = pow( BaselLightMask340 , _IlluminationSmoothness );
				float clampResult350 = clamp( ( ( ( temp_output_353_0 + 0.0 ) * ( 1.0 - BaselLightMask340 ) ) * 10.0 ) , 0.0 , 1.0 );
				float4 lerpResult303 = lerp( AmbientColor220 , color163 , clampResult350);
				float4 temp_cast_6 = (temp_output_353_0).xxxx;
				float4 lerpResult347 = lerp( lerpResult303 , temp_cast_6 , temp_output_353_0);
				float4 NightDayMask233 = lerpResult347;
				float4 temp_cast_7 = (0.0).xxxx;
				float2 temp_cast_8 = (_CitiesDetail).xx;
				float2 uv0333 = packedInput.ase_texcoord1.xy * temp_cast_8 + float2( 0,0 );
				float2 uv0271 = packedInput.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float clampResult148 = clamp( ContinentalMasks248 , 0.0 , 1.0 );
				float3 desaturateInitialColor265 = ( 1.0 - ( NightDayMask233 * 5.0 ) ).rgb;
				float desaturateDot265 = dot( desaturateInitialColor265, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar265 = lerp( desaturateInitialColor265, desaturateDot265.xxx, 1.0 );
				float3 clampResult314 = clamp( desaturateVar265 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 ase_worldPos = GetAbsolutePositionWS( packedInput.positionRWS );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult382 = dot( ase_worldViewDir , ase_worldNormal );
				float FresnelMask381 = dotResult382;
				float4 Cities130 = (( _EnableCities )?( ( ( float4( ( ( ( ( ( tex2D( _CitiesTexture, uv0333 ).r * ( 1.0 - tex2D( _CitiesTexture, uv0271 ).a ) ) * ( 1.0 - clampResult148 ) ) * clampResult314 ) * pow( FresnelMask381 , 4.0 ) ) * CloudsOcclusion368 ) , 0.0 ) * _Citiescolor ) * 1.0 ) ):( temp_cast_7 ));
				float4 color109 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 normalizeResult157 = normalize( ( ase_worldViewDir + LightSourceVector398 ) );
				float3 SpecularDir226 = normalizeResult157;
				float3 saferPower294 = max( SpecularDir226 , 0.0001 );
				float fresnelNdotV342 = dot( normalize( normalizedWorldNormal ), ase_worldViewDir );
				float fresnelNode342 = ( 0.0 + 1.0 * pow( max( 1.0 - fresnelNdotV342 , 0.0001 ), ( ( 1.0 - ( pow( saferPower294 , 3.0 ) + -1.0 ) ) + _InteriorSize ).x ) );
				float3 temp_cast_12 = (fresnelNode342).xxx;
				float3 temp_cast_13 = (fresnelNode342).xxx;
				float3 linearToGamma264 = FastLinearToSRGB( temp_cast_13 );
				float4 BaseColorAtmospheres407 = _AtmosphereColor;
				float dotResult395 = dot( LightSourceVector398 , normalizedWorldNormal );
				float smoothstepResult394 = smoothstep( -0.4 , 1.0 , dotResult395);
				float AtmosphereLightMask393 = smoothstepResult394;
				float clampResult111 = clamp( AtmosphereLightMask393 , 0.0 , 1.0 );
				float saferPower105 = max( clampResult111 , 0.0001 );
				float smoothstepResult199 = smoothstep( 0.0 , 1.0 , pow( saferPower105 , 1.5 ));
				float4 clampResult213 = clamp( ( ( float4( ( ( linearToGamma264 * ( _InteriorIntensity + ( 1.0 - (0.0 + (_InteriorSize - -2.0) * (1.0 - 0.0) / (10.0 - -2.0)) ) ) ) * _InteriorIntensity ) , 0.0 ) * BaseColorAtmospheres407 ) * smoothstepResult199 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float3 gammaToLinear218 = FastSRGBToLinear( (( _EnableAtmosphere )?( clampResult213 ):( color109 )).rgb );
				float3 SubAtmosphere403 = gammaToLinear218;
				float4 blendOpSrc190 = ( ( lerpResult108 * NightDayMask233 ) + ( Cities130 * PolarMask103 ) );
				float4 blendOpDest190 = float4( SubAtmosphere403 , 0.0 );
				float dotResult357 = dot( ase_worldNormal , SpecularDir226 );
				float clampResult322 = clamp( dotResult357 , 0.0 , 1.0 );
				float temp_output_171_0 = pow( clampResult322 , 2.0 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult388 = dot( LightSourceVector398 , ase_worldViewDir );
				float ViewDotLight387 = dotResult388;
				float clampResult356 = clamp( ( ViewDotLight387 + 0.1 ) , 0.0 , 1.0 );
				float lerpResult273 = lerp( 200.0 , 2000.0 , clampResult356);
				float3 temp_cast_18 = (( pow( temp_output_171_0 , ( lerpResult273 * (0.0 + (0.5 - 0.0) * (1.0 - 0.0) / (30.0 - 0.0)) ) ) * 0.5 )).xxx;
				float3 temp_cast_19 = (( pow( temp_output_171_0 , ( lerpResult273 * (0.0 + (0.5 - 0.0) * (1.0 - 0.0) / (30.0 - 0.0)) ) ) * 0.5 )).xxx;
				float3 gammaToLinear118 = FastSRGBToLinear( temp_cast_19 );
				float clampResult102 = clamp( ViewDotLight387 , 0.0 , 1.0 );
				float lerpResult242 = lerp( 0.25 , _SpecularIntensity , clampResult102);
				float4 temp_output_160_0 = ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * ( ( ( float4( gammaToLinear118 , 0.0 ) * ( temp_output_171_0 * WaterColor307 ) ) * CloudsOcclusion368 ) * ( lerpResult242 * 100.0 ) ) );
				float4 Specular155 = temp_output_160_0;
				float4 lerpResult422 = lerp( ( ( 1.0 - ( 1.0 - blendOpSrc190 ) * ( 1.0 - blendOpDest190 ) ) + ( Specular155 * PolarMask103 ) ) , _SkyblendA , _SkyblendA.a);
				float4 SecondPassInput211 = ( lerpResult422 * _IlluminationBoost );
				
				surfaceDescription.Color =  color409.rgb;
				surfaceDescription.Emission =  SecondPassInput211.rgb;
				surfaceDescription.Alpha = NightDayMask233.r;
				surfaceDescription.AlphaClipThreshold =  0.5;
				float2 Distortion = float2 ( 0, 0 );
				float DistortionBlur = 0;

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );

				float4 outColor = ApplyBlendMode( bsdfData.color + builtinData.emissiveColor * GetCurrentExposureMultiplier(), builtinData.opacity );
				outColor = EvaluateAtmosphericScattering( posInput, V, outColor );

				#ifdef DEBUG_DISPLAY
				int bufferSize = int( _DebugViewMaterialArray[ 0 ] );
				for( int index = 1; index <= bufferSize; index++ )
				{
					int indexMaterialProperty = int( _DebugViewMaterialArray[ index ] );
					if( indexMaterialProperty != 0 )
					{
						float3 result = float3( 1.0, 0.0, 1.0 );
						bool needLinearToSRGB = false;

						GetPropertiesDataDebug( indexMaterialProperty, result, needLinearToSRGB );
						GetVaryingsDataDebug( indexMaterialProperty, input, result, needLinearToSRGB );
						GetBuiltinDataDebug( indexMaterialProperty, builtinData, result, needLinearToSRGB );
						GetSurfaceDataDebug( indexMaterialProperty, surfaceData, result, needLinearToSRGB );
						GetBSDFDataDebug( indexMaterialProperty, bsdfData, result, needLinearToSRGB );

						if( !needLinearToSRGB )
							result = SRGBToLinear( max( 0, result ) );

						outColor = float4( result, 1.0 );
					}
				}
				#endif

				return outColor;
			}

            ENDHLSL
        }

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 60900


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#pragma multi_compile_instancing


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _BaseColormodifier;
			float4 _WaterColor;
			float _EnableWater;
			float4 _ShadowColorA;
			float _EnableClouds;
			float _CloudSpeed;
			float _ShadowsXOffset;
			float _ShadowsYOffset;
			float _ShadowsSharpness;
			float4 _ColorA;
			float _EnumFloat;
			float4 _IlluminationAmbient;
			float _ReliefIntensity;
			float _ReliefSmoothness;
			float _NormalsIntensity;
			float _IlluminationSmoothness;
			float _EnableCities;
			float _CitiesDetail;
			float4 _Citiescolor;
			float _EnableAtmosphere;
			float _InteriorSize;
			float _InteriorIntensity;
			float4 _AtmosphereColor;
			float _SpecularIntensity;
			float4 _SkyblendA;
			float _IlluminationBoost;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _AddPrecomputedVelocity;
			float _ShadowMatteFilter;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END

			CBUFFER_START( UnityMetaPass )
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;
			sampler2D _ColorTexture;
			sampler2D _NecessaryWaterMask;
			sampler2D _CloudsTexture;
			sampler2D _PolarMask;
			sampler2D _CloudsNormals;
			sampler2D _Normals;
			sampler2D _CitiesTexture;
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPPlanetForSky)
				UNITY_DEFINE_INSTANCED_PROP(float4, _PolarMask_ST)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSource)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPPlanetForSky)


			
			struct SurfaceDescription
			{
				float3 Color;
				float3 Emission;
				float Alpha;
				float AlphaClipThreshold;
			};

			void BuildSurfaceData( FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData )
			{
				ZERO_INITIALIZE( SurfaceData, surfaceData );
				surfaceData.color = surfaceDescription.Color;
			}

			void GetSurfaceAndBuiltinData( SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData )
			{
				#if _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData );
				ZERO_INITIALIZE( BuiltinData, builtinData );
				builtinData.opacity = surfaceDescription.Alpha;
				builtinData.emissiveColor = surfaceDescription.Emission;
				builtinData.distortion = float2( 0.0, 0.0 );
				builtinData.distortionBlur = 0.0;
			}

			VertexOutput Vert( VertexInput inputMesh  )
			{
				VertexOutput o;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, o );

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord4.xyz = ase_worldPos;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float2 uv = float2( 0.0, 0.0 );
				if( unity_MetaVertexControl.x )
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if( unity_MetaVertexControl.y )
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}
				
				o.positionCS = float4( uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0 );
				return o;
			}

			float4 Frag( VertexOutput packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE( FragInputs, input );
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 V = float3( 1.0, 1.0, 1.0 ); // Avoid the division by 0

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float4 color409 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float2 uv_ColorTexture144 = packedInput.ase_texcoord.xy;
				float4 BaseColor156 = ( tex2D( _ColorTexture, uv_ColorTexture144 ) * _BaseColormodifier );
				float4 WaterColor307 = _WaterColor;
				float4 blendOpSrc359 = BaseColor156;
				float4 blendOpDest359 = WaterColor307;
				float WaterTransparency277 = _WaterColor.a;
				float4 lerpResult175 = lerp( BaseColor156 , ( saturate( (( blendOpDest359 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest359 ) * ( 1.0 - blendOpSrc359 ) ) : ( 2.0 * blendOpDest359 * blendOpSrc359 ) ) )) , WaterTransparency277);
				float4 lerpResult216 = lerp( lerpResult175 , WaterColor307 , WaterTransparency277);
				float4 BaseAndWater292 = lerpResult216;
				float2 uv_NecessaryWaterMask331 = packedInput.ase_texcoord.xy;
				float clampResult304 = clamp( ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * 10.0 ) , 0.0 , 1.0 );
				float ContinentalMasks248 = clampResult304;
				float4 lerpResult181 = lerp( BaseColor156 , BaseAndWater292 , ContinentalMasks248);
				float3 desaturateInitialColor126 = lerpResult181.rgb;
				float desaturateDot126 = dot( desaturateInitialColor126, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar126 = lerp( desaturateInitialColor126, desaturateDot126.xxx, 0.3 );
				float temp_output_371_0 = ( _CloudSpeed / 1000.0 );
				float4 appendResult317 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 appendResult152 = (float2(_ShadowsXOffset , _ShadowsYOffset));
				float2 uv0325 = packedInput.ase_texcoord.xy * float2( 1,1 ) + appendResult152;
				float2 panner414 = ( 1.0 * _Time.y * appendResult317.xy + uv0325);
				float2 UVcloudShadows194 = panner414;
				float4 tex2DNode153 = tex2Dlod( _CloudsTexture, float4( UVcloudShadows194, 0, _ShadowsSharpness) );
				float temp_output_378_0 = ( ( tex2DNode153.b + tex2DNode153.b ) * 5.0 );
				float CloudsAlpha302 = _ColorA.a;
				float clampResult221 = clamp( ( (( _EnableClouds )?( 1.0 ):( 0.0 )) * temp_output_378_0 * CloudsAlpha302 ) , 0.0 , 1.0 );
				float CloudsShadows107 = clampResult221;
				float4 _PolarMask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_PolarMask_ST);
				float2 uv_PolarMask = packedInput.ase_texcoord.xy * _PolarMask_ST_Instance.xy + _PolarMask_ST_Instance.zw;
				float4 PolarMask103 = tex2D( _PolarMask, uv_PolarMask );
				float4 lerpResult169 = lerp( float4( desaturateVar126 , 0.0 ) , _ShadowColorA , ( ( CloudsShadows107 * PolarMask103 ) * _ShadowColorA.a ));
				float4 CloudsColor193 = _ColorA;
				float4 appendResult330 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 uv0142 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner413 = ( 1.0 * _Time.y * appendResult330.xy + uv0142);
				float2 UVClouds308 = panner413;
				float lerpResult323 = lerp( tex2D( _CloudsTexture, UVClouds308 ).g , _EnumFloat , 0.0);
				float saferPower337 = max( lerpResult323 , 0.0001 );
				float Clouds255 = ( (0.0 + (pow( saferPower337 , 0.5 ) - 0.0) * (CloudsAlpha302 - 0.0) / (1.0 - 0.0)) * (( _EnableClouds )?( 1.0 ):( 0.0 )) );
				float4 lerpResult108 = lerp( lerpResult169 , ( 0.5 * CloudsColor193 ) , ( PolarMask103 * Clouds255 ));
				float4 AmbientColor220 = _IlluminationAmbient;
				float4 color163 = IsGammaSpace() ? float4(0.5294118,0.2701871,0.2038235,0) : float4(0.2422812,0.05933543,0.0343086,0);
				float3 _FlatNormals = float3(0,0,1);
				float2 uv0243 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 FlatNormal217 = _FlatNormals;
				float3 lerpResult300 = lerp( UnpackNormalmapRGorAG( tex2D( _Normals, uv0243 ), ( (0.0 + (_NormalsIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) * 0.25 ) ) , FlatNormal217 , ContinentalMasks248);
				float clampResult269 = clamp( ( 3.0 * Clouds255 ) , 0.0 , 1.0 );
				float CloudsOcclusion368 = ( 1.0 - clampResult269 );
				float3 lerpResult196 = lerp( UnpackNormalmapRGorAG( tex2Dlod( _CloudsNormals, float4( UVClouds308, 0, _ReliefSmoothness) ), ( _ReliefIntensity * CloudsAlpha302 ) ) , lerpResult300 , CloudsOcclusion368);
				float3 lerpResult415 = lerp( _FlatNormals , lerpResult196 , tex2D( _PolarMask, uv_PolarMask ).rgb);
				float3 Normals229 = lerpResult415;
				float3 ase_worldTangent = packedInput.ase_texcoord1.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord2.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal168 = Normals229;
				float3 worldNormal168 = normalize( float3(dot(tanToWorld0,tanNormal168), dot(tanToWorld1,tanNormal168), dot(tanToWorld2,tanNormal168)) );
				float3 _LightSource_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_LightSource);
				float3 normalizeResult400 = normalize( _LightSource_Instance );
				float3 LightSourceVector398 = normalizeResult400;
				float dotResult239 = dot( worldNormal168 , LightSourceVector398 );
				float smoothstepResult145 = smoothstep( 0.0 , 1.0 , ( dotResult239 + 0.5 ));
				float BaselLightMask340 = smoothstepResult145;
				float temp_output_353_0 = pow( BaselLightMask340 , _IlluminationSmoothness );
				float clampResult350 = clamp( ( ( ( temp_output_353_0 + 0.0 ) * ( 1.0 - BaselLightMask340 ) ) * 10.0 ) , 0.0 , 1.0 );
				float4 lerpResult303 = lerp( AmbientColor220 , color163 , clampResult350);
				float4 temp_cast_6 = (temp_output_353_0).xxxx;
				float4 lerpResult347 = lerp( lerpResult303 , temp_cast_6 , temp_output_353_0);
				float4 NightDayMask233 = lerpResult347;
				float4 temp_cast_7 = (0.0).xxxx;
				float2 temp_cast_8 = (_CitiesDetail).xx;
				float2 uv0333 = packedInput.ase_texcoord.xy * temp_cast_8 + float2( 0,0 );
				float2 uv0271 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float clampResult148 = clamp( ContinentalMasks248 , 0.0 , 1.0 );
				float3 desaturateInitialColor265 = ( 1.0 - ( NightDayMask233 * 5.0 ) ).rgb;
				float desaturateDot265 = dot( desaturateInitialColor265, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar265 = lerp( desaturateInitialColor265, desaturateDot265.xxx, 1.0 );
				float3 clampResult314 = clamp( desaturateVar265 , float3( 0,0,0 ) , float3( 1,1,1 ) );
				float3 ase_worldPos = packedInput.ase_texcoord4.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult382 = dot( ase_worldViewDir , ase_worldNormal );
				float FresnelMask381 = dotResult382;
				float4 Cities130 = (( _EnableCities )?( ( ( float4( ( ( ( ( ( tex2D( _CitiesTexture, uv0333 ).r * ( 1.0 - tex2D( _CitiesTexture, uv0271 ).a ) ) * ( 1.0 - clampResult148 ) ) * clampResult314 ) * pow( FresnelMask381 , 4.0 ) ) * CloudsOcclusion368 ) , 0.0 ) * _Citiescolor ) * 1.0 ) ):( temp_cast_7 ));
				float4 color109 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 normalizeResult157 = normalize( ( ase_worldViewDir + LightSourceVector398 ) );
				float3 SpecularDir226 = normalizeResult157;
				float3 saferPower294 = max( SpecularDir226 , 0.0001 );
				float fresnelNdotV342 = dot( normalize( normalizedWorldNormal ), ase_worldViewDir );
				float fresnelNode342 = ( 0.0 + 1.0 * pow( max( 1.0 - fresnelNdotV342 , 0.0001 ), ( ( 1.0 - ( pow( saferPower294 , 3.0 ) + -1.0 ) ) + _InteriorSize ).x ) );
				float3 temp_cast_12 = (fresnelNode342).xxx;
				float3 temp_cast_13 = (fresnelNode342).xxx;
				float3 linearToGamma264 = FastLinearToSRGB( temp_cast_13 );
				float4 BaseColorAtmospheres407 = _AtmosphereColor;
				float dotResult395 = dot( LightSourceVector398 , normalizedWorldNormal );
				float smoothstepResult394 = smoothstep( -0.4 , 1.0 , dotResult395);
				float AtmosphereLightMask393 = smoothstepResult394;
				float clampResult111 = clamp( AtmosphereLightMask393 , 0.0 , 1.0 );
				float saferPower105 = max( clampResult111 , 0.0001 );
				float smoothstepResult199 = smoothstep( 0.0 , 1.0 , pow( saferPower105 , 1.5 ));
				float4 clampResult213 = clamp( ( ( float4( ( ( linearToGamma264 * ( _InteriorIntensity + ( 1.0 - (0.0 + (_InteriorSize - -2.0) * (1.0 - 0.0) / (10.0 - -2.0)) ) ) ) * _InteriorIntensity ) , 0.0 ) * BaseColorAtmospheres407 ) * smoothstepResult199 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float3 gammaToLinear218 = FastSRGBToLinear( (( _EnableAtmosphere )?( clampResult213 ):( color109 )).rgb );
				float3 SubAtmosphere403 = gammaToLinear218;
				float4 blendOpSrc190 = ( ( lerpResult108 * NightDayMask233 ) + ( Cities130 * PolarMask103 ) );
				float4 blendOpDest190 = float4( SubAtmosphere403 , 0.0 );
				float dotResult357 = dot( ase_worldNormal , SpecularDir226 );
				float clampResult322 = clamp( dotResult357 , 0.0 , 1.0 );
				float temp_output_171_0 = pow( clampResult322 , 2.0 );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult388 = dot( LightSourceVector398 , ase_worldViewDir );
				float ViewDotLight387 = dotResult388;
				float clampResult356 = clamp( ( ViewDotLight387 + 0.1 ) , 0.0 , 1.0 );
				float lerpResult273 = lerp( 200.0 , 2000.0 , clampResult356);
				float3 temp_cast_18 = (( pow( temp_output_171_0 , ( lerpResult273 * (0.0 + (0.5 - 0.0) * (1.0 - 0.0) / (30.0 - 0.0)) ) ) * 0.5 )).xxx;
				float3 temp_cast_19 = (( pow( temp_output_171_0 , ( lerpResult273 * (0.0 + (0.5 - 0.0) * (1.0 - 0.0) / (30.0 - 0.0)) ) ) * 0.5 )).xxx;
				float3 gammaToLinear118 = FastSRGBToLinear( temp_cast_19 );
				float clampResult102 = clamp( ViewDotLight387 , 0.0 , 1.0 );
				float lerpResult242 = lerp( 0.25 , _SpecularIntensity , clampResult102);
				float4 temp_output_160_0 = ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * ( ( ( float4( gammaToLinear118 , 0.0 ) * ( temp_output_171_0 * WaterColor307 ) ) * CloudsOcclusion368 ) * ( lerpResult242 * 100.0 ) ) );
				float4 Specular155 = temp_output_160_0;
				float4 lerpResult422 = lerp( ( ( 1.0 - ( 1.0 - blendOpSrc190 ) * ( 1.0 - blendOpDest190 ) ) + ( Specular155 * PolarMask103 ) ) , _SkyblendA , _SkyblendA.a);
				float4 SecondPassInput211 = ( lerpResult422 * _IlluminationBoost );
				
				surfaceDescription.Color = color409.rgb;
				surfaceDescription.Emission = SecondPassInput211.rgb;
				surfaceDescription.Alpha = NightDayMask233.r;
				surfaceDescription.AlphaClipThreshold =  0;

				GetSurfaceAndBuiltinData( surfaceDescription,input, V, posInput, surfaceData, builtinData );
				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );
				LightTransportData lightTransportData = GetLightTransportData( surfaceData, builtinData, bsdfData );

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				if( unity_MetaFragmentControl.x )
				{
					res.rgb = clamp( pow( abs( lightTransportData.diffuseColor ), saturate( unity_OneOverOutputBoost ) ), 0, unity_MaxOutputValue );
				}

				if( unity_MetaFragmentControl.y )
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
        Pass
        {
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			
			Cull [_CullMode]
            ZWrite On

			ColorMask 0
        
            HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 60900


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS
			#pragma editor_sync_compilation
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        
			#pragma multi_compile_instancing

				
			struct VertexInput 
			{
				float3 positionOS : POSITION;
				float4 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct VertexOutput 
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			int _ObjectId;
			int _PassValue;

			CBUFFER_START( UnityPerMaterial )
			float4 _BaseColormodifier;
			float4 _WaterColor;
			float _EnableWater;
			float4 _ShadowColorA;
			float _EnableClouds;
			float _CloudSpeed;
			float _ShadowsXOffset;
			float _ShadowsYOffset;
			float _ShadowsSharpness;
			float4 _ColorA;
			float _EnumFloat;
			float4 _IlluminationAmbient;
			float _ReliefIntensity;
			float _ReliefSmoothness;
			float _NormalsIntensity;
			float _IlluminationSmoothness;
			float _EnableCities;
			float _CitiesDetail;
			float4 _Citiescolor;
			float _EnableAtmosphere;
			float _InteriorSize;
			float _InteriorIntensity;
			float4 _AtmosphereColor;
			float _SpecularIntensity;
			float4 _SkyblendA;
			float _IlluminationBoost;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _AddPrecomputedVelocity;
			float _ShadowMatteFilter;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			sampler2D _CloudsNormals;
			sampler2D _Normals;
			sampler2D _NecessaryWaterMask;
			sampler2D _CloudsTexture;
			sampler2D _PolarMask;
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPPlanetForSky)
				UNITY_DEFINE_INSTANCED_PROP(float4, _PolarMask_ST)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSource)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPPlanetForSky)

				
			                
            struct SurfaceDescription
            {
                float Alpha;
                float AlphaClipThreshold;
            };

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}
        
			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{ 
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;
			}

			VertexOutput Vert( VertexInput inputMesh  )
			{
				VertexOutput o;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS.xyz);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =   defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);  
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				return o;
			}

			void Frag( VertexOutput packedInput
					, out float4 outColor : SV_Target0
					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3(1.0, 1.0, 1.0); // Avoid the division by 0

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float4 AmbientColor220 = _IlluminationAmbient;
				float4 color163 = IsGammaSpace() ? float4(0.5294118,0.2701871,0.2038235,0) : float4(0.2422812,0.05933543,0.0343086,0);
				float3 _FlatNormals = float3(0,0,1);
				float CloudsAlpha302 = _ColorA.a;
				float temp_output_371_0 = ( _CloudSpeed / 1000.0 );
				float4 appendResult330 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 uv0142 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner413 = ( 1.0 * _Time.y * appendResult330.xy + uv0142);
				float2 UVClouds308 = panner413;
				float2 uv0243 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 FlatNormal217 = _FlatNormals;
				float2 uv_NecessaryWaterMask331 = packedInput.ase_texcoord.xy;
				float clampResult304 = clamp( ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * 10.0 ) , 0.0 , 1.0 );
				float ContinentalMasks248 = clampResult304;
				float3 lerpResult300 = lerp( UnpackNormalmapRGorAG( tex2D( _Normals, uv0243 ), ( (0.0 + (_NormalsIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) * 0.25 ) ) , FlatNormal217 , ContinentalMasks248);
				float lerpResult323 = lerp( tex2D( _CloudsTexture, UVClouds308 ).g , _EnumFloat , 0.0);
				float saferPower337 = max( lerpResult323 , 0.0001 );
				float Clouds255 = ( (0.0 + (pow( saferPower337 , 0.5 ) - 0.0) * (CloudsAlpha302 - 0.0) / (1.0 - 0.0)) * (( _EnableClouds )?( 1.0 ):( 0.0 )) );
				float clampResult269 = clamp( ( 3.0 * Clouds255 ) , 0.0 , 1.0 );
				float CloudsOcclusion368 = ( 1.0 - clampResult269 );
				float3 lerpResult196 = lerp( UnpackNormalmapRGorAG( tex2Dlod( _CloudsNormals, float4( UVClouds308, 0, _ReliefSmoothness) ), ( _ReliefIntensity * CloudsAlpha302 ) ) , lerpResult300 , CloudsOcclusion368);
				float4 _PolarMask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_PolarMask_ST);
				float2 uv_PolarMask = packedInput.ase_texcoord.xy * _PolarMask_ST_Instance.xy + _PolarMask_ST_Instance.zw;
				float3 lerpResult415 = lerp( _FlatNormals , lerpResult196 , tex2D( _PolarMask, uv_PolarMask ).rgb);
				float3 Normals229 = lerpResult415;
				float3 ase_worldTangent = packedInput.ase_texcoord1.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord2.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal168 = Normals229;
				float3 worldNormal168 = normalize( float3(dot(tanToWorld0,tanNormal168), dot(tanToWorld1,tanNormal168), dot(tanToWorld2,tanNormal168)) );
				float3 _LightSource_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_LightSource);
				float3 normalizeResult400 = normalize( _LightSource_Instance );
				float3 LightSourceVector398 = normalizeResult400;
				float dotResult239 = dot( worldNormal168 , LightSourceVector398 );
				float smoothstepResult145 = smoothstep( 0.0 , 1.0 , ( dotResult239 + 0.5 ));
				float BaselLightMask340 = smoothstepResult145;
				float temp_output_353_0 = pow( BaselLightMask340 , _IlluminationSmoothness );
				float clampResult350 = clamp( ( ( ( temp_output_353_0 + 0.0 ) * ( 1.0 - BaselLightMask340 ) ) * 10.0 ) , 0.0 , 1.0 );
				float4 lerpResult303 = lerp( AmbientColor220 , color163 , clampResult350);
				float4 temp_cast_2 = (temp_output_353_0).xxxx;
				float4 lerpResult347 = lerp( lerpResult303 , temp_cast_2 , temp_output_353_0);
				float4 NightDayMask233 = lerpResult347;
				
				surfaceDescription.Alpha = NightDayMask233.r;
				surfaceDescription.AlphaClipThreshold =  0;

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
        
            ENDHLSL
        }

		
        Pass
        {
			
            Name "DepthForwardOnly"
            Tags { "LightMode"="DepthForwardOnly" }
			
			Cull [_CullMode]
            ZWrite On
			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}

        
            ColorMask 0 0
        
            HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 60900


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag
        
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_MSAA_DEPTH
        
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        
			#pragma multi_compile_instancing

				
			struct VertexInput 
			{
				float3 positionOS : POSITION;
				float4 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct VertexOutput 
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _BaseColormodifier;
			float4 _WaterColor;
			float _EnableWater;
			float4 _ShadowColorA;
			float _EnableClouds;
			float _CloudSpeed;
			float _ShadowsXOffset;
			float _ShadowsYOffset;
			float _ShadowsSharpness;
			float4 _ColorA;
			float _EnumFloat;
			float4 _IlluminationAmbient;
			float _ReliefIntensity;
			float _ReliefSmoothness;
			float _NormalsIntensity;
			float _IlluminationSmoothness;
			float _EnableCities;
			float _CitiesDetail;
			float4 _Citiescolor;
			float _EnableAtmosphere;
			float _InteriorSize;
			float _InteriorIntensity;
			float4 _AtmosphereColor;
			float _SpecularIntensity;
			float4 _SkyblendA;
			float _IlluminationBoost;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _AddPrecomputedVelocity;
			float _ShadowMatteFilter;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			sampler2D _CloudsNormals;
			sampler2D _Normals;
			sampler2D _NecessaryWaterMask;
			sampler2D _CloudsTexture;
			sampler2D _PolarMask;
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPPlanetForSky)
				UNITY_DEFINE_INSTANCED_PROP(float4, _PolarMask_ST)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSource)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPPlanetForSky)

				
			                
            struct SurfaceDescription
            {
                float Alpha;
                float AlphaClipThreshold;
            };

			void BuildSurfaceData(FragInputs fragInputs, SurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}
        
			void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{ 
				#if _ALPHATEST_ON
				DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData);
				ZERO_INITIALIZE(BuiltinData, builtinData);
				builtinData.opacity =  surfaceDescription.Alpha;
			}

			VertexOutput Vert( VertexInput inputMesh  )
			{
				VertexOutput o;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS.xyz);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =   defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				o.positionCS = TransformWorldToHClip(positionRWS);  
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				return o;
			}

			void Frag( VertexOutput packedInput
					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
					, out float1 depthColor : SV_Target1
					#endif
					#elif defined(WRITE_MSAA_DEPTH) // When only WRITE_MSAA_DEPTH is define and not WRITE_NORMAL_BUFFER it mean we are Unlit and only need depth, but we still have normal buffer binded
					, out float4 outNormalBuffer : SV_Target0
					, out float1 depthColor : SV_Target1
					#else
					, out float4 outColor : SV_Target0
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
					
					)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = float3(1.0, 1.0, 1.0); // Avoid the division by 0

				SurfaceData surfaceData;
				BuiltinData builtinData;
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				float4 AmbientColor220 = _IlluminationAmbient;
				float4 color163 = IsGammaSpace() ? float4(0.5294118,0.2701871,0.2038235,0) : float4(0.2422812,0.05933543,0.0343086,0);
				float3 _FlatNormals = float3(0,0,1);
				float CloudsAlpha302 = _ColorA.a;
				float temp_output_371_0 = ( _CloudSpeed / 1000.0 );
				float4 appendResult330 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 uv0142 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner413 = ( 1.0 * _Time.y * appendResult330.xy + uv0142);
				float2 UVClouds308 = panner413;
				float2 uv0243 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 FlatNormal217 = _FlatNormals;
				float2 uv_NecessaryWaterMask331 = packedInput.ase_texcoord.xy;
				float clampResult304 = clamp( ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * 10.0 ) , 0.0 , 1.0 );
				float ContinentalMasks248 = clampResult304;
				float3 lerpResult300 = lerp( UnpackNormalmapRGorAG( tex2D( _Normals, uv0243 ), ( (0.0 + (_NormalsIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) * 0.25 ) ) , FlatNormal217 , ContinentalMasks248);
				float lerpResult323 = lerp( tex2D( _CloudsTexture, UVClouds308 ).g , _EnumFloat , 0.0);
				float saferPower337 = max( lerpResult323 , 0.0001 );
				float Clouds255 = ( (0.0 + (pow( saferPower337 , 0.5 ) - 0.0) * (CloudsAlpha302 - 0.0) / (1.0 - 0.0)) * (( _EnableClouds )?( 1.0 ):( 0.0 )) );
				float clampResult269 = clamp( ( 3.0 * Clouds255 ) , 0.0 , 1.0 );
				float CloudsOcclusion368 = ( 1.0 - clampResult269 );
				float3 lerpResult196 = lerp( UnpackNormalmapRGorAG( tex2Dlod( _CloudsNormals, float4( UVClouds308, 0, _ReliefSmoothness) ), ( _ReliefIntensity * CloudsAlpha302 ) ) , lerpResult300 , CloudsOcclusion368);
				float4 _PolarMask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_PolarMask_ST);
				float2 uv_PolarMask = packedInput.ase_texcoord.xy * _PolarMask_ST_Instance.xy + _PolarMask_ST_Instance.zw;
				float3 lerpResult415 = lerp( _FlatNormals , lerpResult196 , tex2D( _PolarMask, uv_PolarMask ).rgb);
				float3 Normals229 = lerpResult415;
				float3 ase_worldTangent = packedInput.ase_texcoord1.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord2.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal168 = Normals229;
				float3 worldNormal168 = normalize( float3(dot(tanToWorld0,tanNormal168), dot(tanToWorld1,tanNormal168), dot(tanToWorld2,tanNormal168)) );
				float3 _LightSource_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_LightSource);
				float3 normalizeResult400 = normalize( _LightSource_Instance );
				float3 LightSourceVector398 = normalizeResult400;
				float dotResult239 = dot( worldNormal168 , LightSourceVector398 );
				float smoothstepResult145 = smoothstep( 0.0 , 1.0 , ( dotResult239 + 0.5 ));
				float BaselLightMask340 = smoothstepResult145;
				float temp_output_353_0 = pow( BaselLightMask340 , _IlluminationSmoothness );
				float clampResult350 = clamp( ( ( ( temp_output_353_0 + 0.0 ) * ( 1.0 - BaselLightMask340 ) ) * 10.0 ) , 0.0 , 1.0 );
				float4 lerpResult303 = lerp( AmbientColor220 , color163 , clampResult350);
				float4 temp_cast_2 = (temp_output_353_0).xxxx;
				float4 lerpResult347 = lerp( lerpResult303 , temp_cast_2 , temp_output_353_0);
				float4 NightDayMask233 = lerpResult347;
				
				surfaceDescription.Alpha = NightDayMask233.r;
				surfaceDescription.AlphaClipThreshold =  0;

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4(0.0, 0.0, 0.0, 1.0);
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
				#else
				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#endif
			}
        
            ENDHLSL
        }

		
		Pass
		{
			
			Name "DistortionVectors"
			Tags { "LightMode"="DistortionVectors" }

			Blend One One , One One
			BlendOp Add , Add

			Cull [_CullMode]
			ZTest LEqual
			ZWrite Off

			Stencil
			{
				Ref [_StencilRefDistortionVec]
				WriteMask [_StencilRefDistortionVec]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _RECEIVE_SHADOWS_OFF 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define ASE_SRP_VERSION 60900


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_DISTORTION

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#pragma multi_compile_instancing


			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _BaseColormodifier;
			float4 _WaterColor;
			float _EnableWater;
			float4 _ShadowColorA;
			float _EnableClouds;
			float _CloudSpeed;
			float _ShadowsXOffset;
			float _ShadowsYOffset;
			float _ShadowsSharpness;
			float4 _ColorA;
			float _EnumFloat;
			float4 _IlluminationAmbient;
			float _ReliefIntensity;
			float _ReliefSmoothness;
			float _NormalsIntensity;
			float _IlluminationSmoothness;
			float _EnableCities;
			float _CitiesDetail;
			float4 _Citiescolor;
			float _EnableAtmosphere;
			float _InteriorSize;
			float _InteriorIntensity;
			float4 _AtmosphereColor;
			float _SpecularIntensity;
			float4 _SkyblendA;
			float _IlluminationBoost;
			float4 _EmissionColor;
			float _RenderQueueType;
			float _AddPrecomputedVelocity;
			float _ShadowMatteFilter;
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _AlphaCutoff;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			CBUFFER_END
			sampler2D _CloudsNormals;
			sampler2D _Normals;
			sampler2D _NecessaryWaterMask;
			sampler2D _CloudsTexture;
			sampler2D _PolarMask;
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPPlanetForSky)
				UNITY_DEFINE_INSTANCED_PROP(float4, _PolarMask_ST)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSource)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPPlanetForSky)


			
			struct DistortionSurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
				float2 Distortion;
				float DistortionBlur;
			};

			void BuildSurfaceData(FragInputs fragInputs, inout DistortionSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
			}

			void GetSurfaceAndBuiltinData(DistortionSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData );

				ZERO_INITIALIZE( BuiltinData, builtinData );
				builtinData.opacity = surfaceDescription.Alpha;
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
			}

			VertexOutput Vert( VertexInput inputMesh  )
			{
				VertexOutput o;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o);

				float3 ase_worldTangent = TransformObjectToWorldDir(inputMesh.ase_tangent.xyz);
				o.ase_texcoord1.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				o.ase_texcoord2.xyz = ase_worldNormal;
				float ase_vertexTangentSign = inputMesh.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord3.xyz = ase_worldBitangent;
				
				o.ase_texcoord.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				o.ase_texcoord1.w = 0;
				o.ase_texcoord2.w = 0;
				o.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);

				o.positionCS = TransformWorldToHClip(positionRWS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				return o;
			}

			float4 Frag( VertexOutput packedInput  ) : SV_Target
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				DistortionSurfaceDescription surfaceDescription = (DistortionSurfaceDescription)0;
				float4 AmbientColor220 = _IlluminationAmbient;
				float4 color163 = IsGammaSpace() ? float4(0.5294118,0.2701871,0.2038235,0) : float4(0.2422812,0.05933543,0.0343086,0);
				float3 _FlatNormals = float3(0,0,1);
				float CloudsAlpha302 = _ColorA.a;
				float temp_output_371_0 = ( _CloudSpeed / 1000.0 );
				float4 appendResult330 = (float4(temp_output_371_0 , 0.0 , 0.0 , 0.0));
				float2 uv0142 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner413 = ( 1.0 * _Time.y * appendResult330.xy + uv0142);
				float2 UVClouds308 = panner413;
				float2 uv0243 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float3 FlatNormal217 = _FlatNormals;
				float2 uv_NecessaryWaterMask331 = packedInput.ase_texcoord.xy;
				float clampResult304 = clamp( ( (( _EnableWater )?( tex2D( _NecessaryWaterMask, uv_NecessaryWaterMask331 ).b ):( 0.0 )) * 10.0 ) , 0.0 , 1.0 );
				float ContinentalMasks248 = clampResult304;
				float3 lerpResult300 = lerp( UnpackNormalmapRGorAG( tex2D( _Normals, uv0243 ), ( (0.0 + (_NormalsIntensity - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) * 0.25 ) ) , FlatNormal217 , ContinentalMasks248);
				float lerpResult323 = lerp( tex2D( _CloudsTexture, UVClouds308 ).g , _EnumFloat , 0.0);
				float saferPower337 = max( lerpResult323 , 0.0001 );
				float Clouds255 = ( (0.0 + (pow( saferPower337 , 0.5 ) - 0.0) * (CloudsAlpha302 - 0.0) / (1.0 - 0.0)) * (( _EnableClouds )?( 1.0 ):( 0.0 )) );
				float clampResult269 = clamp( ( 3.0 * Clouds255 ) , 0.0 , 1.0 );
				float CloudsOcclusion368 = ( 1.0 - clampResult269 );
				float3 lerpResult196 = lerp( UnpackNormalmapRGorAG( tex2Dlod( _CloudsNormals, float4( UVClouds308, 0, _ReliefSmoothness) ), ( _ReliefIntensity * CloudsAlpha302 ) ) , lerpResult300 , CloudsOcclusion368);
				float4 _PolarMask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_PolarMask_ST);
				float2 uv_PolarMask = packedInput.ase_texcoord.xy * _PolarMask_ST_Instance.xy + _PolarMask_ST_Instance.zw;
				float3 lerpResult415 = lerp( _FlatNormals , lerpResult196 , tex2D( _PolarMask, uv_PolarMask ).rgb);
				float3 Normals229 = lerpResult415;
				float3 ase_worldTangent = packedInput.ase_texcoord1.xyz;
				float3 ase_worldNormal = packedInput.ase_texcoord2.xyz;
				float3 ase_worldBitangent = packedInput.ase_texcoord3.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal168 = Normals229;
				float3 worldNormal168 = normalize( float3(dot(tanToWorld0,tanNormal168), dot(tanToWorld1,tanNormal168), dot(tanToWorld2,tanNormal168)) );
				float3 _LightSource_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPPlanetForSky,_LightSource);
				float3 normalizeResult400 = normalize( _LightSource_Instance );
				float3 LightSourceVector398 = normalizeResult400;
				float dotResult239 = dot( worldNormal168 , LightSourceVector398 );
				float smoothstepResult145 = smoothstep( 0.0 , 1.0 , ( dotResult239 + 0.5 ));
				float BaselLightMask340 = smoothstepResult145;
				float temp_output_353_0 = pow( BaselLightMask340 , _IlluminationSmoothness );
				float clampResult350 = clamp( ( ( ( temp_output_353_0 + 0.0 ) * ( 1.0 - BaselLightMask340 ) ) * 10.0 ) , 0.0 , 1.0 );
				float4 lerpResult303 = lerp( AmbientColor220 , color163 , clampResult350);
				float4 temp_cast_2 = (temp_output_353_0).xxxx;
				float4 lerpResult347 = lerp( lerpResult303 , temp_cast_2 , temp_output_353_0);
				float4 NightDayMask233 = lerpResult347;
				
				surfaceDescription.Alpha = NightDayMask233.r;
				surfaceDescription.AlphaClipThreshold = 0.5;

				surfaceDescription.Distortion = float2 (0,0);
				surfaceDescription.DistortionBlur = 0;

				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				
				float4 outBuffer;
				EncodeDistortion( builtinData.distortion, builtinData.distortionBlur, true, outBuffer );
				return outBuffer;
			}
			ENDHLSL
		}
		
    }
	CustomEditor "PlanetEditor"
    Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=17700
-1680;203;1680;989;-1350.385;3414.918;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;25;-902.1895,-288.1006;Inherit;False;1312.706;1020.046;Cloud movement;18;375;371;335;330;325;317;253;152;142;81;80;5;4;3;2;1;413;414;Clouds UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;81;-864.959,-253.0244;Inherit;False;201;166;Material Property;1;370;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;375;-867.8691,-66.48047;Float;False;Constant;_modifier;modifier;18;0;Create;True;0;0;False;0;1000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;370;-839.709,-197.6685;Float;False;Property;_CloudSpeed;Cloud Speed;7;0;Create;True;0;0;False;0;1;10;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-883.499,164.0894;Float;False;Constant;_Verticalspeed0;Vertical speed (0);5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;371;-636.6689,-76.89941;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;330;-457.1992,-68.64746;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;142;-290.9395,-200.5244;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;9;-3400.239,-335.0933;Inherit;False;2434.595;1132.719;Clouds;5;67;52;36;24;15;Clouds Color + Shadows;1,1,1,1;0;0
Node;AmplifyShaderEditor.PannerNode;413;-46.61633,156.0895;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;24;-3386.689,-283.8994;Inherit;False;2385.68;386.8506;Clouds Color;5;337;255;191;64;55;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;308;548.5474,143.612;Float;False;UVClouds;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;64;-3374.719,-243.0024;Inherit;False;547;306;Material Property;2;306;295;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;14;-4491.909,-1146.083;Inherit;False;714.9688;1606.319;Comment;5;78;76;70;60;59;Base Colors;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;306;-3344.379,-172.1294;Inherit;False;308;UVClouds;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;55;-2784.119,-244.2056;Inherit;False;412;266;Variable to write last cloud choice;3;358;341;323;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;60;-4455.569,-409.5244;Inherit;False;594.042;308.5696;Material Property;3;302;272;193;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.ColorNode;272;-4438.489,-338.4043;Float;False;Property;_ColorA;Color + A;6;1;[HDR];Create;True;0;0;False;0;4.541205,4.541205,4.541205,0.3607843;4.721922,4.721922,4.721922,0.3647059;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;295;-3153.609,-183.1113;Inherit;True;Property;_CloudsTexture;CloudsTexture;4;1;[NoScaleOffset];Create;True;0;0;False;0;-1;c69ca91c5da35514c837c4e254f7f9d0;c69ca91c5da35514c837c4e254f7f9d0;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;358;-2767.259,-56.98242;Float;False;Constant;_Excludevariable;Exclude variable;34;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;341;-2760.079,-190.9663;Float;False;Property;_EnumFloat;_EnumFloat;22;0;Create;True;0;0;False;0;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;52;-2185.27,112.4775;Inherit;False;397.6903;251.6304;Clouds enabling. ;3;332;279;183;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;323;-2528.119,-194.2056;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;302;-4118.52,-228.0205;Float;False;CloudsAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;337;-2242.079,-172.7295;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;332;-2161.069,258.1445;Float;False;Constant;_Float9;Float 9;31;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;67;-1752.459,-261.1294;Inherit;False;525.9521;1003.333;Transparency;4;336;288;221;209;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;279;-2169.699,163.2495;Float;False;Constant;_Float1;Float 1;31;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;191;-2157.229,-16.18945;Inherit;False;302;CloudsAlpha;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;288;-1625.759,-189.5444;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;6;-3394.169,2139.262;Inherit;False;3397.084;977.5628;Comment;18;318;251;244;161;160;155;149;124;118;93;92;73;69;58;53;42;22;16;Water Mask + Specular;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;183;-2006.709,188.1865;Float;False;Property;_EnableClouds;Enable Clouds;1;0;Create;True;0;0;False;1;;1;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;69;-1476.509,2807.127;Inherit;False;414.3584;267.2147;Material Property;1;331;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;336;-1407.509,-111.2656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;36;-3360.219,113.4297;Inherit;False;1153.539;244.7014; (For Specular / Cities / Normals);6;368;276;269;223;205;146;Clouds occlusion;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;8;293.7305,1760.225;Inherit;False;2185.236;1333.884;Normals;7;71;57;34;30;19;415;416;Normals maps;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;42;-831.4395,2921.383;Inherit;False;796.1543;170.5496;Sharp Coasts mask;4;355;304;283;248;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;331;-1463.369,2864.186;Inherit;True;Property;_NecessaryWaterMask;Necessary Water Mask;3;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;278d0545a2127a040ab5d228b97bd379;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;255;-1216.209,-110.1572;Float;False;Clouds;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;251;-1049.729,2843.219;Float;False;Property;_EnableWater;Enable Water;27;0;Create;True;0;0;False;0;1;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;19;360.0605,2354.336;Inherit;False;1390.077;633.2299;BaseNormals;10;367;312;243;222;184;177;135;134;128;85;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;223;-3340.359,177.5376;Float;False;Constant;_CloudMasksharpening;Cloud Mask sharpening;26;0;Create;True;0;0;False;0;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;276;-3317.099,269.3296;Inherit;False;255;Clouds;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;355;-818.4395,2997.243;Float;False;Constant;_Float5;Float 5;34;0;Create;True;0;0;False;0;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;205;-3045.739,207.4287;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;30;357.9209,1807.056;Inherit;False;554.3193;213;Flat Normals;2;352;217;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;367;389.1006,2511.685;Float;False;Property;_NormalsIntensity;Normals Intensity;26;0;Create;True;0;0;False;0;1;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;283;-658.5488,2964.188;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;312;676.791,2690.168;Float;False;Constant;_Float0;Float 0;34;0;Create;True;0;0;False;0;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;34;358.751,2035.241;Inherit;False;1002.717;297;Clouds Normals;5;376;351;207;202;136;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;269;-2873.579,210.2666;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;177;692.791,2511.168;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;352;381.6611,1856.8;Float;False;Constant;_FlatNormals;Flat Normals;35;0;Create;True;0;0;False;0;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ClampOpNode;304;-464.6387,2967.213;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;207;394.3506,2229.441;Inherit;False;302;CloudsAlpha;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;243;887.6113,2398.844;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;217;593.9707,1856.575;Float;False;FlatNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;146;-2697.149,213.2998;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;248;-288.8086,2961.78;Float;False;ContinentalMasks;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;351;400.1611,2114.263;Float;False;Property;_ReliefIntensity;ReliefIntensity;33;0;Create;True;0;0;False;0;2;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;928.791,2611.168;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;222;1202.011,2722.058;Inherit;False;217;FlatNormal;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;368;-2458.229,207.5273;Float;False;CloudsOcclusion;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;136;623.5205,2251.059;Float;False;Property;_ReliefSmoothness;Relief Smoothness;35;0;Create;True;0;0;False;0;2;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;71;964.751,2065.241;Inherit;False;370;280;loud;1;204;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;85;1438.071,2413.107;Inherit;False;234;206;Makes Water flat ;1;300;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;1163.591,2849.766;Inherit;False;248;ContinentalMasks;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;376;626.4111,2153.982;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;184;1134.411,2457.841;Inherit;True;Property;_Normals;Normals;25;0;Create;True;0;0;False;0;-1;None;90a0fbdb91842ca40b535024a3e39026;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;202;779.751,2105.241;Inherit;False;308;UVClouds;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;204;1015.751,2115.241;Inherit;True;Property;_CloudsNormals;Clouds Normals;28;0;Create;True;0;0;False;0;-1;f630a5adaf8f7d34ea82aae28512b1a7;f630a5adaf8f7d34ea82aae28512b1a7;True;0;True;bump;Auto;True;Object;-1;MipLevel;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;300;1488.071,2463.107;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;20;-5678.148,-2487.678;Inherit;False;1011.591;371.1455;Light Source Vector from script;3;400;398;89;Light Source Vector;1,0.6068678,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;1509.261,2361.676;Inherit;False;368;CloudsOcclusion;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;57;1381.461,2031.055;Inherit;False;982.0687;303.3954;Merges + Polar Mask;2;229;196;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;89;-5645.039,-2422.09;Inherit;False;304;234;Input is set via LightSource.cs;1;401;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;196;1775.429,2096.33;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;416;1607.053,1856.255;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;117;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;7;-5660.09,-1628.85;Inherit;False;1036.854;2187.761;Comment;7;98;97;94;83;61;38;23;Dir Masks;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector3Node;401;-5594.039,-2361.09;Float;False;InstancedProperty;_LightSource;_LightSource;20;0;Create;True;0;0;False;0;1,0,0;4956.403,8278.207,2627.805;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;415;2127.9,1867.602;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;229;2180.756,2112.483;Float;False;Normals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;23;-5643.369,-1581.692;Inherit;False;974.2715;297.7039;Mask Bewteen LightSource and Object;5;239;210;201;168;87;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NormalizeNode;400;-5272.539,-2424.6;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;398;-4969.449,-2332.838;Float;False;LightSourceVector;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;201;-5636.42,-1540.198;Inherit;False;229;Normals;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;168;-5454.59,-1538.403;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;210;-5629.52,-1381.842;Inherit;False;398;LightSourceVector;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;87;-5069.949,-1553.029;Inherit;False;389.0801;265.1631;Softenning controls;4;340;309;200;145;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DotProductOpNode;239;-5253,-1508.54;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;200;-5060.949,-1376.866;Float;False;Constant;_Float11;Float 11;39;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;309;-5046.369,-1506.543;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;145;-4871.869,-1513.029;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;11;-5663.859,863.3057;Inherit;False;1900.826;620.0812;Illumination Control;6;348;328;233;72;63;28;Daylight Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;340;-4757.379,-1380.048;Float;False;BaselLightMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;328;-5637.709,934.0273;Inherit;True;340;BaselLightMask;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;348;-5457.078,1166.482;Float;False;Property;_IlluminationSmoothness;Illumination Smoothness;15;0;Create;True;0;0;False;0;4;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;63;-5331.479,933.5024;Inherit;False;373.0332;285.4538;Illumination transition sharpness;1;353;;1,1,1,1;0;0
Node;AmplifyShaderEditor.PowerNode;353;-5238.318,976.8018;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;78;-4442.419,203.1558;Inherit;False;579;239;Material Property;2;241;220;;0,1,0.3426006,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;266;-5371.18,1504.332;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;344;-5573.738,1620.417;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;241;-4408.349,253.9805;Float;False;Property;_IlluminationAmbient;Illumination Ambient;19;0;Create;True;0;0;False;0;0.09019608,0.06666667,0.1490196,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-5079.469,1547.476;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;324;-4839.479,1572.933;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;220;-4110.589,258.1328;Float;False;AmbientColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;28;-4919.939,925.4204;Inherit;False;892.7568;494.9407;Illumination Ambient;5;321;303;163;68;43;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;350;-4533.599,1570.101;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;321;-4809.398,1227.024;Inherit;False;220;AmbientColor;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;163;-4828.5,1334.08;Float;False;Constant;_EvenigColor;EvenigColor;38;0;Create;True;0;0;False;0;0.5294118,0.2701871,0.2038235,0;0.531,0.3682662,0.234171,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;43;-4305.879,966.1006;Inherit;False;256;212;Ambient VS base darkness;1;347;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;10;-3377.259,-3494.043;Inherit;False;5191.454;670.9656;Comment;8;174;132;90;49;48;45;17;418;Second Shader Pass Outputs merges;1,0.1275665,0,1;0;0
Node;AmplifyShaderEditor.LerpOp;303;-4423.749,1270.92;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;12;-3394.129,987.5718;Inherit;False;3420.514;837.4136;Cities in the dark;14;379;333;301;271;130;88;86;84;77;75;65;50;39;26;Cities;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;18;-3374.219,-1170.57;Inherit;False;2822.225;602.326;Sub atmosphere;18;362;360;299;298;264;250;213;203;187;186;129;109;79;47;44;40;33;29;Sub Atmosphere ;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;16;-3360.499,2538.542;Inherit;False;778.3203;529.9019;Glossiness;7;374;274;273;267;208;114;51;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;347;-4236.879,1002.101;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;22;-2542.919,2549.286;Inherit;False;997.3287;511.567;Intensity;2;62;46;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-1171.549,-3410.393;Inherit;False;2229.833;494.3665;Custom Masks;8;215;120;66;37;32;31;419;422;;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;26;-1248.699,1054.518;Inherit;False;651.2393;391.6387;Cities Color and boost;4;238;158;115;35;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;15;-3375.119,379.6836;Inherit;False;2396.097;388.1884;Cloud Shadows;8;206;192;165;153;123;107;56;54;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;44;-2442.239,-750.6104;Inherit;False;361;165;Material Property;1;363;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;95;2069.631,-3188.124;Inherit;False;841.3491;438.9991;Comment;4;409;0;236;420;Second shader pass output;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;92;-2316.349,2192.663;Inherit;False;292.6709;213.1317;No loss of intensity if sharpnened;1;231;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;77;-3389.579,1044.984;Inherit;False;315;131;Material Property;1;361;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;62;-1799.02,2596.985;Inherit;False;225.5615;349.6675;Artificial boost;2;176;140;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;68;-4904.969,1053.57;Inherit;False;301.9512;136;Material Property;1;249;;0,1,0.3411765,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;29;-2551.619,-1133.841;Inherit;False;435;322;Main input for Sub atmosphere;2;354;342;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;70;-4484.52,-1093.45;Inherit;False;691.3867;341.1844;Material Property;4;293;232;156;144;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;94;-5632.09,-918.5786;Inherit;False;904.2393;398.7203;Hand made fresnel;4;384;383;382;381;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;72;-5291.828,1276.241;Inherit;False;288;160;In Case of needed;1;180;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;59;-4448.239,-734.5874;Inherit;False;616.2021;280;Material Property;3;307;277;147;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;66;-622.1494,-3362.614;Inherit;False;401.837;339.1981;+ Cities with custom mask;3;189;170;112;;1,0,0.02689171,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;45;-2600.039,-3401.853;Inherit;False;614.9385;392.8515;Cloud Shadows + Base ;4;329;234;195;169;;1,0.08789868,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;90;-1952.289,-3404.523;Inherit;False;710.8407;479.5965;Main Clouds + previous;7;366;197;150;138;116;110;108;;1,0.05270513,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;84;-2265.919,1040.491;Inherit;False;238.1333;725.5773;No cities on water;4;339;313;148;141;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;38;-5620.18,261.2275;Inherit;False;868.9688;278.249;Polar Mask;2;117;103;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;61;-5625.35,-107.5186;Inherit;False;877.8633;355.5818;Specular Dir;5;349;270;226;188;157;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;50;-2803.449,1032.502;Inherit;False;445;253;Material Property;2;320;268;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;58;-1120.759,2188.419;Inherit;False;1084.347;465.8962;BaseColor + Water Color / Transparency;8;359;334;310;292;291;216;175;121;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;86;-568.8486,1051.386;Inherit;False;254.9438;307.1033;Cities Toggle;2;315;101;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;93;-3361.069,2191.106;Inherit;False;767.3174;332.6244;Specular Vectors (ViewDir + LightDir . Normals);6;357;322;311;178;171;154;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;88;-1508.009,1039.864;Inherit;False;231.6289;705.7809;No Cities under clouds;2;228;106;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;46;-2538.689,2595.985;Inherit;False;696.2002;352.2983;Intensity = 1 only in Zenith;5;242;230;198;151;102;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;49;1244.241,-3347.843;Inherit;False;359.2549;335.6558;Comment;1;211;Second shader pass Input;1,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;79;-1527.189,-1135.763;Inherit;False;305.6674;534.3516;Daylight Mask controls;4;245;199;111;105;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;98;-5636.709,-1271.76;Inherit;False;910.5537;332.3206;Custom mask for atmohsphere;7;397;396;395;394;393;392;391;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-3268.259,-784.2231;Inherit;False;361;165;Material Property;1;365;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;35;-1235.849,1191.75;Inherit;False;255;228.5527;Material Property;1;278;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;76;-4451.669,-58.67432;Inherit;False;579;239;Material Property;2;408;407;;0,1,0.3426006,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;54;-2563.029,457.8535;Inherit;False;232.7578;211.6535;Shadows boost;2;378;224;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;53;-2549.559,2189.459;Inherit;False;196.7705;218.352;Merge Glossiness + Specular;1;137;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;48;-3343.179,-3403.194;Inherit;False;689.4355;382.7268; Water + Base;5;247;181;133;126;99;;1,0.08972871,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;31;254.8311,-3360.503;Inherit;False;623.6577;353.3621;+ Specular with custom mask;2;227;162;;1,0,0.02568626,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;32;-192.9795,-3357.553;Inherit;False;422.5713;332.9393;+ Sub atmosphere with custom mask;3;275;190;113;;1,0,0.02568626,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;80;-885.3486,456.8936;Inherit;False;312.4492;248.2393;Material Property;2;345;338;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;233;-3981.189,972.7485;Float;False;NightDayMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;40;-3353.139,-1118.228;Inherit;False;788.6973;302.0889;Reduce size if zenith;5;294;280;246;185;166;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;73;-1722.789,2194.687;Inherit;False;234.1953;212.1979;Include Water Color;1;159;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;75;-1757.109,1046.679;Inherit;False;231.8281;706.8076;No Cities on edge ;3;252;173;122;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;51;-3349.039,2850.945;Inherit;False;525;205;Soften glossiness if not Zenith;4;356;296;237;100;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;47;-2057.919,-894.4897;Inherit;False;204;183;Binds size to intensity;1;327;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;65;-2004.189,1043.316;Inherit;False;231.6719;716.6461;No Cities in day light;7;316;314;265;219;167;143;131;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;39;-3065.099,1312.512;Inherit;False;343.6299;273.4307;Alpha Mask to diluate obvious tiling;1;179;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;37;-1140.389,-3368.723;Inherit;False;501.6515;352.6001;Color result + Daylight  mask;2;164;104;;1,0.1204694,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;97;-5630.738,-488.8286;Inherit;False;891.5458;346.1274;Angle Between Light Source and Camera ;4;389;388;387;386;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;56;-3352.039,551.1675;Inherit;False;298;131;Material Property;1;364;;0,1,0.345098,1;0;0
Node;AmplifyShaderEditor.ColorNode;234;-2581.689,-3298.984;Float;False;Property;_ShadowColorA;Shadow Color + A;31;0;Create;True;0;0;False;0;0.09803922,0.2313726,0.4117647,1;0,0.08400001,0.252,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;422;797.5037,-3242.403;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;185;-2869.149,-1071.717;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;162;491.7492,-3275.752;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendOpsNode;190;8.541016,-3301.393;Inherit;False;Screen;False;3;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;141;-2254.809,1670.421;Inherit;False;248;ContinentalMasks;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-2270.669,622.0176;Float;False;Property;_ShadowsIntensity;Shadows Intensity;29;0;Create;True;0;0;False;0;0.6;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;109;-1048.239,-880.4038;Float;False;Constant;_Color4;Color 4;31;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;113;225.7607,-3084.383;Inherit;False;103;PolarMask;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;130;-277.5986,1109.628;Float;False;Cities;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;396;-5569.699,-1098.393;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;122;-1712.449,1360.738;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-2994.779,2489.74;Float;False;Property;_SpecularSize;Specular Size;32;0;Create;True;0;0;False;0;1;1.2;0.1;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;264;-2055.139,-1015.614;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;107;-1210.679,574.9048;Float;False;CloudsShadows;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;118;-1967.009,2232.948;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;103;-5151.578,315.0327;Float;False;PolarMask;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;394;-5169.988,-1195.52;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;161;-1274.709,2334.104;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;174;-2614.089,-3114.944;Inherit;False;107;CloudsShadows;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;175;-617.1094,2258.152;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;100;-3341.849,2898.306;Inherit;False;387;ViewDotLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TimeNode;253;-531.5791,180.0156;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;230;-2489.729,2851.298;Inherit;False;387;ViewDotLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-4880.828,1102.64;Float;False;Property;_IlluminationAmbientold;Illumination Ambient old;16;0;Create;True;0;0;False;0;0.25;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;212;-462.0791,-1255.261;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;293;-4146.179,-922.5933;Float;False;Property;_BaseColormodifier;Base Color modifier;30;0;Create;True;0;0;False;0;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;121;-1051.249,2649.065;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;104;-872.0088,-3330.244;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;231;-2241.099,2255.956;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;173;-1709.289,1092.392;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;133;-3310.009,-3238.883;Inherit;False;292;BaseAndWater;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;226;-5008.18,-22.27637;Float;False;SpecularDir;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;-1740.219,1661.252;Inherit;False;381;FresnelMask;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;213;-1036.419,-1066.348;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;131;-1963.77,1405.366;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;150;-1870.159,-3296.954;Float;False;Constant;_Float25;Float 25;34;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;138;-1907.029,-3207.293;Inherit;False;193;CloudsColor;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;124;-563.4893,2776.051;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-499.6689,1247.258;Float;False;Constant;_Float8;Float 8;27;0;Create;True;0;0;False;0;0;0.83;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;-4136.989,-569.8042;Float;False;WaterTransparency;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;391;-5184.568,-992.5161;Float;False;Constant;_Float7;Float 7;39;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;219;-1952.079,1479.683;Inherit;False;2;2;0;COLOR;1,0,0,0;False;1;FLOAT;20;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;99;-3321.229,-3134.603;Inherit;False;248;ContinentalMasks;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;408;-4408.039,-7.570313;Float;False;Property;_AtmosphereColor;Atmosphere Color;13;1;[HDR];Create;True;0;0;False;0;0.3764706,1.027451,1.498039,0;0.5114095,1.597196,2.029403,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;187;-1722.259,-851.188;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;320;-2771.079,1083.113;Inherit;True;Property;_CitiesTexture;Cities Texture;5;0;Create;False;0;0;False;0;-1;None;488419041cfa862479d186bcee3fd4f0;True;0;False;black;Auto;False;Object;-1;MipLevel;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendOpsNode;359;-869.8291,2331.206;Inherit;False;Overlay;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;294;-3167.139,-1076.699;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;157;-5191.229,-16.20459;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PannerNode;414;-16.11466,488.9557;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;274;-2700.619,2589.939;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;389;-5583.029,-314.0376;Float;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;198;-2334.639,2735.646;Float;False;Constant;_Float2;Float 2;40;0;Create;True;0;0;False;0;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;407;-4131.02,21.36035;Float;False;BaseColorAtmospheres;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;209;-1648.439,490.1558;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;273;-2886.949,2578.131;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;114;-2799.979,2759.64;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;30;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;342;-2340.809,-1082.567;Inherit;False;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;245;-1440.889,-1101.668;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;322;-2869.229,2298.51;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;206;-2692.779,494.9736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;-2570.619,-2995.923;Inherit;False;103;PolarMask;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;227;399.7607,-3180.383;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;298;-2592.179,-787.3862;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;129;-773.4395,-1018.842;Float;False;Property;_EnableAtmosphere;Enable Atmosphere;18;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;193;-4122.729,-333.7085;Float;False;CloudsColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;420;2417.901,-2853.49;Inherit;False;233;NightDayMask;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;102;-2226.129,2853.652;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;216;-458.6387,2437.279;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldNormalVector;383;-5589.238,-681.4126;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;316;-1989.249,1577.141;Float;False;Constant;_SharpenNightMask;Sharpen Night Mask;32;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;181;-3075.849,-3274.043;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;310;-1108.149,2243.673;Inherit;False;156;BaseColor;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;-1988.369,1667.317;Inherit;False;233;NightDayMask;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;381;-5007.75,-792.1919;Float;False;FresnelMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;153;-3016.849,462.7744;Inherit;True;Property;_CloudsTexture2;Clouds Texture2;4;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Instance;295;MipLevel;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DotProductOpNode;382;-5312.699,-791.8091;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;313;-2224.459,1290.041;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;250;-2091.879,-1121.386;Inherit;False;407;BaseColorAtmospheres;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;388;-5314.199,-414.6543;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;108;-1422.389,-3363.383;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;325;-297.3291,586.6587;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;333;-3038.879,1075.885;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;237;-3332.509,2972.848;Float;False;Constant;_Float10;Float 10;34;0;Create;True;0;0;False;0;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;221;-1454.52,489.8477;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;148;-2218.309,1454.699;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;374;-3312.119,2669.149;Float;False;Constant;_SpecularSharpness2;Specular Sharpness2;31;0;Create;True;0;0;False;0;2000;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;167;-1935.149,1092.483;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;218;-458.0791,-1137.261;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;311;-3334.869,2395.04;Inherit;False;226;SpecularDir;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;267;-3317.209,2585.462;Float;False;Constant;_2;2;33;0;Create;True;0;0;False;0;200;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;160;-795.7188,2677.058;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;242;-1992.639,2749.646;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;232;-4143.489,-1041.582;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;126;-2844.589,-3361.713;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.3;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;149;-1691.869,2446.66;Inherit;False;368;CloudsOcclusion;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;246;-3009.319,-1073.635;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;194;542.2399,496.0046;Float;False;UVcloudShadows;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;195;-2356.619,-3115.923;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;224;-2516.449,598.0674;Float;False;Constant;_Float4;Float 4;40;0;Create;True;0;0;False;0;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;314;-1946.359,1182.283;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,1,1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;-1823.489,-945.7046;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;419;827.267,-3066.588;Inherit;False;Property;_IlluminationBoost;Illumination Boost;36;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;154;-3340.589,2229.31;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;247;-3306.029,-3348.414;Inherit;False;156;BaseColor;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;159;-1660.039,2282.021;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;393;-4965.379,-1198.307;Float;False;AtmosphereLightMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;244;-1443.919,2229.023;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;186;-1663.849,-1122.132;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;111;-1457.929,-733.9346;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;151;-2429.489,2660.725;Float;False;Property;_SpecularIntensity;Specular Intensity;24;0;Create;True;0;0;False;0;1;0.455;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;211;1332.331,-3291.694;Float;False;SecondPassInput;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;112;-618.5488,-3183.234;Inherit;False;130;Cities;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;171;-2701.949,2316.894;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;361;-3365.899,1092.86;Float;False;Property;_CitiesDetail;Cities Detail;21;0;Create;True;0;0;False;0;4;3.12;1;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;215;-625.5488,-3080.303;Inherit;False;103;PolarMask;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;105;-1446.919,-850.3726;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;307;-4129.849,-677.4443;Float;False;WaterColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;176;-1782.629,2768.76;Float;False;Constant;_Float16;Float 16;35;0;Create;True;0;0;False;0;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;188;-5603.949,116.5625;Inherit;False;398;LightSourceVector;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;334;-1100.209,2461.229;Inherit;False;307;WaterColor;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;268;-2451.729,1200.242;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;338;-857.0889,506.4224;Float;False;Property;_ShadowsXOffset;Shadows X Offset;9;0;Create;True;0;0;False;0;-0.005;-0.007;-0.02;0.02;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;356;-2995.039,2928.945;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;378;-2498.989,494.3457;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;275;-189.2988,-3111.513;Inherit;False;403;SubAtmosphere;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;152;-483.0586,586.0518;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;165;-3346.639,451.0117;Inherit;False;194;UVcloudShadows;1;0;OBJECT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;156;-4008.289,-1040.724;Float;False;BaseColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;169;-2199.489,-3362.013;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;158;-754.999,1108.91;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;-1714.109,2634.344;Inherit;False;2;2;0;FLOAT;6;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;299;-1790.149,-723.6982;Inherit;False;393;AtmosphereLightMask;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;199;-1477.209,-984.1157;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;164;-1078.159,-3080.773;Inherit;False;233;NightDayMask;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;291;-865.7393,2529.25;Inherit;False;277;WaterTransparency;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;395;-5325.6,-1174.542;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;-2216.819,-3219.414;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;179;-3022.149,1370.693;Inherit;True;Property;_Cities;Cities;5;0;Create;True;0;0;False;0;-1;488419041cfa862479d186bcee3fd4f0;488419041cfa862479d186bcee3fd4f0;True;0;False;white;Auto;False;Instance;320;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;106;-1449.829,1103.458;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;147;-4427.489,-670.9463;Float;False;Property;_WaterColor;Water Color;23;0;Create;True;0;0;False;0;0.282353,0.4431373,0.5176471,0;0.1845441,0.2316618,0.267,0.2392157;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;365;-3241.849,-730.0474;Float;False;Property;_InteriorSize;Interior Size;14;0;Create;True;0;0;False;0;0.3;0.83;-2;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;197;-1624.669,-3053.253;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;360;-2786.779,-772.0244;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-2;False;2;FLOAT;10;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;155;-307.7988,2672.802;Float;False;Specular;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;363;-2394.239,-686.6113;Float;False;Property;_InteriorIntensity;Interior Intensity;17;0;Create;True;0;0;False;0;0.65;0.57;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;278;-1220.349,1236.647;Float;False;Property;_Citiescolor;Cities color;12;1;[HDR];Create;True;0;0;False;0;7.906699,2.649365,1.200494,0;29.50885,18.53959,10.96926,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;116;-1668.099,-3260.583;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;301;-2673.009,1492.693;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;403;-137.8887,-1171.258;Float;False;SubAtmosphere;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;345;-852.5586,611.8774;Float;False;Property;_ShadowsYOffset;Shadows Y Offset;8;0;Create;True;0;0;False;0;-0.005;-0.0139;-0.02;0.02;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;386;-5607.119,-436.7646;Inherit;False;398;LightSourceVector;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;170;-393.5488,-3134.303;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;384;-5598.17,-864.2388;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;354;-2576.939,-1084.216;Inherit;False;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-1928.539,577.9966;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;110;-1901.859,-3118.433;Inherit;False;103;PolarMask;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;271;-3319.899,1363.595;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;280;-3181.209,-966.2349;Float;False;Constant;_Float6;Float 6;37;0;Create;True;0;0;False;0;-1;-1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;189;-380.5693,-3333.293;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;409;2096.35,-3128.059;Inherit;False;Constant;_Color0;Color 0;38;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;392;-5188.76,-1066.356;Float;False;Constant;_Float13;Float 13;38;0;Create;True;0;0;False;0;-0.4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;327;-2007.919,-844.4897;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;379;-3308.419,1206.893;Float;False;Property;_CitiesSharpness;Cities Sharpness;34;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;238;-946.9688,1291.03;Float;False;Constant;_Potentialboost;Potential boost;32;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;315;-525.459,1113.58;Float;False;Property;_EnableCities;Enable Cities;11;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;296;-3139.509,2931.848;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;317;-482.5986,405.9116;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;292;-259.3291,2435.958;Float;False;BaseAndWater;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;387;-5038.939,-388.8086;Float;False;ViewDotLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;-2391.289,2450.849;Inherit;False;307;WaterColor;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;137;-2528.849,2295.738;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;349;-5595.939,-52.31738;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DesaturateOpNode;265;-1964.899,1303.039;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;397;-5620.01,-1198.237;Inherit;False;398;LightSourceVector;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;270;-5324.17,-18.91064;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;364;-3330.199,595.4204;Float;False;Property;_ShadowsSharpness;Shadows Sharpness;10;0;Create;True;0;0;False;0;2.5;3.71;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;362;-3354.929,-1068.707;Inherit;False;226;SpecularDir;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;115;-925.0986,1108.427;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;366;-1899.719,-3025.994;Inherit;False;255;Clouds;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;418;1124.415,-3205.362;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;166;-2700.219,-1078.398;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;180;-5241.828,1326.241;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;339;-2211.259,1103.563;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;357;-3106.689,2280.848;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;236;2105.387,-2897.829;Inherit;False;211;SecondPassInput;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;423;485.5037,-2956.403;Inherit;False;Property;_SkyblendA;Sky blend (A);37;0;Create;True;0;0;False;0;0.55417,0.6973749,0.755,0.4745098;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;228;-1494.729,1660.377;Inherit;False;368;CloudsOcclusion;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;144;-4473.879,-1048.448;Inherit;True;Property;_ColorTexture;Color Texture;0;1;[NoScaleOffset];Create;True;0;0;False;0;-1;None;295b690c4baa2ce44a9f9ab079cd7e39;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;120;248.3506,-3201.074;Inherit;False;155;Specular;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;117;-5557.75,312.8696;Inherit;True;Property;_PolarMask;Polar Mask;2;0;Create;True;0;0;False;0;-1;11de8dcc04cb0904595785802fa79e3a;11de8dcc04cb0904595785802fa79e3a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;208;-3312.389,2764.833;Float;False;Constant;_SpecularSharpness;Specular Sharpness;24;0;Create;True;0;0;False;0;0.5;1;0.01;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=SceneSelectionPass;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;META;0;2;META;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DistortionVectors;0;5;DistortionVectors;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;True;0;True;-26;False;True;True;0;True;-12;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DepthForwardOnly;0;4;DepthForwardOnly;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=DepthForwardOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;2698.29,-3118.651;Float;False;True;-1;2;PlanetEditor;0;15;Exo-Planets/HDRP/PlanetForSky;7f5cb9c3ea6481f469fdd856555439ef;True;Forward Unlit;0;0;Forward Unlit;8;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;True;5;0;True;2;5;True;-21;0;True;-22;0;5;True;-23;0;True;-24;False;False;True;0;False;-26;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;0;True;-25;True;0;True;-31;False;True;1;LightMode=ForwardOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;18;Surface Type;1;  Rendering Pass ;0;  Rendering Pass;1;  Blending Mode;0;  Receive Fog;0;  Distortion;0;    Distortion Mode;0;    Distortion Depth Test;1;  ZWrite;1;  Cull Mode;0;  Z Test;4;Double-Sided;0;Alpha Clipping;0;Add Precomputed Velocity;0;Cast Shadows;0;Receive Shadows;0;GPU Instancing;0;Vertex Position,InvertActionOnDeselection;1;0;6;True;False;True;True;True;True;False;;0
Node;AmplifyShaderEditor.CommentaryNode;83;-5216.988,-1233.52;Inherit;False;245;297.0039;Mask Softening;0;;1,1,1,1;0;0
WireConnection;371;0;370;0
WireConnection;371;1;375;0
WireConnection;330;0;371;0
WireConnection;330;1;335;0
WireConnection;413;0;142;0
WireConnection;413;2;330;0
WireConnection;308;0;413;0
WireConnection;295;1;306;0
WireConnection;323;0;295;2
WireConnection;323;1;341;0
WireConnection;323;2;358;0
WireConnection;302;0;272;4
WireConnection;337;0;323;0
WireConnection;288;0;337;0
WireConnection;288;4;191;0
WireConnection;183;0;279;0
WireConnection;183;1;332;0
WireConnection;336;0;288;0
WireConnection;336;1;183;0
WireConnection;255;0;336;0
WireConnection;251;1;331;3
WireConnection;205;0;223;0
WireConnection;205;1;276;0
WireConnection;283;0;251;0
WireConnection;283;1;355;0
WireConnection;269;0;205;0
WireConnection;177;0;367;0
WireConnection;304;0;283;0
WireConnection;217;0;352;0
WireConnection;146;0;269;0
WireConnection;248;0;304;0
WireConnection;135;0;177;0
WireConnection;135;1;312;0
WireConnection;368;0;146;0
WireConnection;376;0;351;0
WireConnection;376;1;207;0
WireConnection;184;1;243;0
WireConnection;184;5;135;0
WireConnection;204;1;202;0
WireConnection;204;2;136;0
WireConnection;204;5;376;0
WireConnection;300;0;184;0
WireConnection;300;1;222;0
WireConnection;300;2;128;0
WireConnection;196;0;204;0
WireConnection;196;1;300;0
WireConnection;196;2;134;0
WireConnection;415;0;352;0
WireConnection;415;1;196;0
WireConnection;415;2;416;0
WireConnection;229;0;415;0
WireConnection;400;0;401;0
WireConnection;398;0;400;0
WireConnection;168;0;201;0
WireConnection;239;0;168;0
WireConnection;239;1;210;0
WireConnection;309;0;239;0
WireConnection;145;0;309;0
WireConnection;145;2;200;0
WireConnection;340;0;145;0
WireConnection;353;0;328;0
WireConnection;353;1;348;0
WireConnection;266;0;353;0
WireConnection;344;0;328;0
WireConnection;127;0;266;0
WireConnection;127;1;344;0
WireConnection;324;0;127;0
WireConnection;220;0;241;0
WireConnection;350;0;324;0
WireConnection;303;0;321;0
WireConnection;303;1;163;0
WireConnection;303;2;350;0
WireConnection;347;0;303;0
WireConnection;347;1;353;0
WireConnection;347;2;353;0
WireConnection;233;0;347;0
WireConnection;422;0;162;0
WireConnection;422;1;423;0
WireConnection;422;2;423;4
WireConnection;185;0;246;0
WireConnection;162;0;190;0
WireConnection;162;1;227;0
WireConnection;190;0;189;0
WireConnection;190;1;275;0
WireConnection;130;0;315;0
WireConnection;122;0;252;0
WireConnection;264;0;342;0
WireConnection;107;0;221;0
WireConnection;118;0;231;0
WireConnection;103;0;117;0
WireConnection;394;0;395;0
WireConnection;394;1;392;0
WireConnection;394;2;391;0
WireConnection;161;0;244;0
WireConnection;161;1;149;0
WireConnection;175;0;310;0
WireConnection;175;1;359;0
WireConnection;175;2;291;0
WireConnection;121;0;161;0
WireConnection;121;1;140;0
WireConnection;104;0;108;0
WireConnection;104;1;164;0
WireConnection;231;0;137;0
WireConnection;231;1;208;0
WireConnection;173;0;167;0
WireConnection;173;1;122;0
WireConnection;226;0;157;0
WireConnection;213;0;245;0
WireConnection;131;0;219;0
WireConnection;124;0;160;0
WireConnection;277;0;147;4
WireConnection;219;0;143;0
WireConnection;219;1;316;0
WireConnection;187;0;203;0
WireConnection;187;1;363;0
WireConnection;320;1;333;0
WireConnection;359;0;310;0
WireConnection;359;1;334;0
WireConnection;294;0;362;0
WireConnection;157;0;270;0
WireConnection;414;0;325;0
WireConnection;414;2;317;0
WireConnection;274;0;273;0
WireConnection;274;1;114;0
WireConnection;407;0;408;0
WireConnection;209;0;183;0
WireConnection;209;1;378;0
WireConnection;209;2;191;0
WireConnection;273;0;267;0
WireConnection;273;1;374;0
WireConnection;273;2;356;0
WireConnection;114;0;208;0
WireConnection;342;0;354;0
WireConnection;342;3;166;0
WireConnection;245;0;186;0
WireConnection;245;1;199;0
WireConnection;322;0;357;0
WireConnection;206;0;153;3
WireConnection;206;1;153;3
WireConnection;227;0;120;0
WireConnection;227;1;113;0
WireConnection;298;0;360;0
WireConnection;129;0;109;0
WireConnection;129;1;213;0
WireConnection;193;0;272;0
WireConnection;102;0;230;0
WireConnection;216;0;175;0
WireConnection;216;1;334;0
WireConnection;216;2;291;0
WireConnection;181;0;247;0
WireConnection;181;1;133;0
WireConnection;181;2;99;0
WireConnection;381;0;382;0
WireConnection;153;1;165;0
WireConnection;153;2;364;0
WireConnection;382;0;384;0
WireConnection;382;1;383;0
WireConnection;313;0;148;0
WireConnection;388;0;386;0
WireConnection;388;1;389;0
WireConnection;108;0;169;0
WireConnection;108;1;116;0
WireConnection;108;2;197;0
WireConnection;325;1;152;0
WireConnection;333;0;361;0
WireConnection;221;0;209;0
WireConnection;148;0;141;0
WireConnection;167;0;339;0
WireConnection;167;1;314;0
WireConnection;218;0;129;0
WireConnection;160;0;251;0
WireConnection;160;1;121;0
WireConnection;242;0;198;0
WireConnection;242;1;151;0
WireConnection;242;2;102;0
WireConnection;232;0;144;0
WireConnection;232;1;293;0
WireConnection;126;0;181;0
WireConnection;246;0;294;0
WireConnection;246;1;280;0
WireConnection;194;0;414;0
WireConnection;195;0;174;0
WireConnection;195;1;132;0
WireConnection;314;0;265;0
WireConnection;203;0;264;0
WireConnection;203;1;327;0
WireConnection;159;0;171;0
WireConnection;159;1;318;0
WireConnection;393;0;394;0
WireConnection;244;0;118;0
WireConnection;244;1;159;0
WireConnection;186;0;187;0
WireConnection;186;1;250;0
WireConnection;111;0;299;0
WireConnection;211;0;418;0
WireConnection;171;0;322;0
WireConnection;105;0;111;0
WireConnection;307;0;147;0
WireConnection;268;0;320;1
WireConnection;268;1;301;0
WireConnection;356;0;296;0
WireConnection;378;0;206;0
WireConnection;378;1;224;0
WireConnection;152;0;338;0
WireConnection;152;1;345;0
WireConnection;156;0;232;0
WireConnection;169;0;126;0
WireConnection;169;1;234;0
WireConnection;169;2;329;0
WireConnection;158;0;115;0
WireConnection;158;1;238;0
WireConnection;140;0;242;0
WireConnection;140;1;176;0
WireConnection;199;0;105;0
WireConnection;395;0;397;0
WireConnection;395;1;396;0
WireConnection;329;0;195;0
WireConnection;329;1;234;4
WireConnection;179;1;271;0
WireConnection;106;0;173;0
WireConnection;106;1;228;0
WireConnection;197;0;110;0
WireConnection;197;1;366;0
WireConnection;360;0;365;0
WireConnection;155;0;160;0
WireConnection;116;0;150;0
WireConnection;116;1;138;0
WireConnection;301;0;179;4
WireConnection;403;0;218;0
WireConnection;170;0;112;0
WireConnection;170;1;215;0
WireConnection;192;0;378;0
WireConnection;192;1;123;0
WireConnection;189;0;104;0
WireConnection;189;1;170;0
WireConnection;327;0;363;0
WireConnection;327;1;298;0
WireConnection;315;0;101;0
WireConnection;315;1;158;0
WireConnection;296;0;100;0
WireConnection;296;1;237;0
WireConnection;317;0;371;0
WireConnection;317;1;335;0
WireConnection;292;0;216;0
WireConnection;387;0;388;0
WireConnection;137;0;171;0
WireConnection;137;1;274;0
WireConnection;265;0;131;0
WireConnection;270;0;349;0
WireConnection;270;1;188;0
WireConnection;115;0;106;0
WireConnection;115;1;278;0
WireConnection;418;0;422;0
WireConnection;418;1;419;0
WireConnection;166;0;185;0
WireConnection;166;1;365;0
WireConnection;339;0;268;0
WireConnection;339;1;313;0
WireConnection;357;0;154;0
WireConnection;357;1;311;0
WireConnection;0;0;409;0
WireConnection;0;1;236;0
WireConnection;0;2;420;0
ASEEND*/
//CHKSM=525D431654C68CA4C776670DB1FADAFC34A2F269