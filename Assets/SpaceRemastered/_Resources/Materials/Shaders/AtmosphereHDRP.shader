Shader "Custom/HDRP/Atmosphere"
{
    Properties
    {
		_ExteriorIntensity("Exterior Intensity", Range( 0 , 1)) = 0.25
		_ExteriorSize("Exterior Size", Range( 0.1 , 1)) = 0.3
		[Toggle]_EnableAtmosphere("Enable Atmosphere", Float) = 1
		_LightSourceAtmo("_LightSourceAtmo", Vector) = (1,0,0,0)
		[HDR]_AtmosphereColor("Atmosphere Color", Color) = (0.3764706,1.027451,1.498039,0)

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
        [HideInInspector][Enum(Front, 1, Back, 2)]_TransparentCullMode("_TransparentCullMode", Float) = 1
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

		
        Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Transparent" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 ps4 xboxone vulkan metal switch
		ENDHLSL

		
		
        Pass
        {
			
            Name "Forward Unlit"
            Tags { "LightMode"="ForwardOnly" }
        
            Blend [_SrcBlend] [_DstBlend] , [_AlphaSrcBlend] [_AlphaDstBlend]
            Cull [_CullMode]
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
			#define HAVE_MESH_MODIFICATION 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float _ExteriorSize;
			float _EnableAtmosphere;
			float4 _AtmosphereColor;
			float _ExteriorIntensity;
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
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPAtmosphere)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSourceAtmo)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPAtmosphere)

				
					            
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

				float3 AtmosphereSize39 = ( (0.0 + (_ExteriorSize - 0.0) * (1.0 - 0.0) / (3.0 - 0.0)) * ( inputMesh.positionOS * 1 ) );
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS.xyz);
				o.ase_texcoord1.xyz = ase_worldNormal;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = AtmosphereSize39;
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
				float4 color49 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float4 color46 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 BaseColorAtmospheres77 = _AtmosphereColor;
				float3 _LightSourceAtmo_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPAtmosphere,_LightSourceAtmo);
				float3 normalizeResult72 = normalize( _LightSourceAtmo_Instance );
				float3 LightSourceVector70 = ( normalizeResult72 / 1.0 );
				float3 ase_worldPos = GetAbsolutePositionWS( packedInput.positionRWS );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult57 = dot( LightSourceVector70 , ase_worldViewDir );
				float ViewDotLight56 = dotResult57;
				float3 ase_worldNormal = packedInput.ase_texcoord1.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float dotResult66 = dot( LightSourceVector70 , normalizedWorldNormal );
				float smoothstepResult65 = smoothstep( -0.4 , 1.0 , dotResult66);
				float AtmosphereLightMask64 = smoothstepResult65;
				float smoothstepResult45 = smoothstep( 0.0 , 20.0 , ( (0.0 + (ViewDotLight56 - 0.0) * (0.1 - 0.0) / (10.0 - 0.0)) + ( ( ViewDotLight56 * 0.0 ) + AtmosphereLightMask64 ) ));
				float4 color20 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult52 = dot( ase_worldViewDir , ase_worldNormal );
				float FresnelMask51 = dotResult52;
				float saferPower33 = max( -FresnelMask51 , 0.0001 );
				float saferPower30 = max( pow( saferPower33 , 1.5 ) , 0.0001 );
				float4 temp_cast_1 = (( (0.0 + (pow( saferPower30 , (3.0 + (_ExteriorSize - 0.0) * (3.5 - 3.0) / (1.0 - 0.0)) ) - 0.0) * (10.0 - 0.0) / (0.01 - 0.0)) * 1.0 )).xxxx;
				float4 lerpResult43 = lerp( color20 , temp_cast_1 , _ExteriorIntensity);
				float3 gammaToLinear27 = FastSRGBToLinear( lerpResult43.rgb );
				float4 clampResult22 = clamp( ( BaseColorAtmospheres77 * float4( ( (0.0 + (smoothstepResult45 - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) * gammaToLinear27 ) , 0.0 ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 AtmosphereColor29 = (( _EnableAtmosphere )?( clampResult22 ):( color46 ));
				
				surfaceDescription.Color =  color49.rgb;
				surfaceDescription.Emission =  AtmosphereColor29.rgb;
				surfaceDescription.Alpha = 1;
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
			#define HAVE_MESH_MODIFICATION 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			CBUFFER_START( UnityPerMaterial )
			float _ExteriorSize;
			float _EnableAtmosphere;
			float4 _AtmosphereColor;
			float _ExteriorIntensity;
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
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPAtmosphere)
				UNITY_DEFINE_INSTANCED_PROP(float3, _LightSourceAtmo)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPAtmosphere)


			
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

				float3 AtmosphereSize39 = ( (0.0 + (_ExteriorSize - 0.0) * (1.0 - 0.0) / (3.0 - 0.0)) * ( inputMesh.positionOS * 1 ) );
				
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				o.ase_texcoord.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				o.ase_texcoord1.xyz = ase_worldNormal;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.w = 0;
				o.ase_texcoord1.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = AtmosphereSize39;
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
				float4 color49 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				
				float4 color46 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 BaseColorAtmospheres77 = _AtmosphereColor;
				float3 _LightSourceAtmo_Instance = UNITY_ACCESS_INSTANCED_PROP(ExoPlanetsHDRPAtmosphere,_LightSourceAtmo);
				float3 normalizeResult72 = normalize( _LightSourceAtmo_Instance );
				float3 LightSourceVector70 = ( normalizeResult72 / 1.0 );
				float3 ase_worldPos = packedInput.ase_texcoord.xyz;
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - ase_worldPos );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float dotResult57 = dot( LightSourceVector70 , ase_worldViewDir );
				float ViewDotLight56 = dotResult57;
				float3 ase_worldNormal = packedInput.ase_texcoord1.xyz;
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float dotResult66 = dot( LightSourceVector70 , normalizedWorldNormal );
				float smoothstepResult65 = smoothstep( -0.4 , 1.0 , dotResult66);
				float AtmosphereLightMask64 = smoothstepResult65;
				float smoothstepResult45 = smoothstep( 0.0 , 20.0 , ( (0.0 + (ViewDotLight56 - 0.0) * (0.1 - 0.0) / (10.0 - 0.0)) + ( ( ViewDotLight56 * 0.0 ) + AtmosphereLightMask64 ) ));
				float4 color20 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float dotResult52 = dot( ase_worldViewDir , ase_worldNormal );
				float FresnelMask51 = dotResult52;
				float saferPower33 = max( -FresnelMask51 , 0.0001 );
				float saferPower30 = max( pow( saferPower33 , 1.5 ) , 0.0001 );
				float4 temp_cast_1 = (( (0.0 + (pow( saferPower30 , (3.0 + (_ExteriorSize - 0.0) * (3.5 - 3.0) / (1.0 - 0.0)) ) - 0.0) * (10.0 - 0.0) / (0.01 - 0.0)) * 1.0 )).xxxx;
				float4 lerpResult43 = lerp( color20 , temp_cast_1 , _ExteriorIntensity);
				float3 gammaToLinear27 = FastSRGBToLinear( lerpResult43.rgb );
				float4 clampResult22 = clamp( ( BaseColorAtmospheres77 * float4( ( (0.0 + (smoothstepResult45 - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) * gammaToLinear27 ) , 0.0 ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 AtmosphereColor29 = (( _EnableAtmosphere )?( clampResult22 ):( color46 ));
				
				surfaceDescription.Color = color49.rgb;
				surfaceDescription.Emission = AtmosphereColor29.rgb;
				surfaceDescription.Alpha = 1;
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
			#define HAVE_MESH_MODIFICATION 1
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
        
			
				
			struct VertexInput 
			{
				float3 positionOS : POSITION;
				float4 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct VertexOutput 
			{
				float4 positionCS : SV_Position;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			int _ObjectId;
			int _PassValue;

			CBUFFER_START( UnityPerMaterial )
			float _ExteriorSize;
			float _EnableAtmosphere;
			float4 _AtmosphereColor;
			float _ExteriorIntensity;
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
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPAtmosphere)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPAtmosphere)

				
			                
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

				float3 AtmosphereSize39 = ( (0.0 + (_ExteriorSize - 0.0) * (1.0 - 0.0) / (3.0 - 0.0)) * ( inputMesh.positionOS * 1 ) );
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  AtmosphereSize39;
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
				
				surfaceDescription.Alpha = 1;
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
			#define HAVE_MESH_MODIFICATION 1
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
        
			
				
			struct VertexInput 
			{
				float3 positionOS : POSITION;
				float4 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
        
			struct VertexOutput 
			{
				float4 positionCS : SV_Position;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float _ExteriorSize;
			float _EnableAtmosphere;
			float4 _AtmosphereColor;
			float _ExteriorIntensity;
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
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPAtmosphere)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPAtmosphere)

				
			                
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

				float3 AtmosphereSize39 = ( (0.0 + (_ExteriorSize - 0.0) * (1.0 - 0.0) / (3.0 - 0.0)) * ( inputMesh.positionOS * 1 ) );
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  AtmosphereSize39;
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
				
				surfaceDescription.Alpha = 1;
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
			#define HAVE_MESH_MODIFICATION 1
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

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_Position;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float _ExteriorSize;
			float _EnableAtmosphere;
			float4 _AtmosphereColor;
			float _ExteriorIntensity;
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
			UNITY_INSTANCING_BUFFER_START(ExoPlanetsHDRPAtmosphere)
			UNITY_INSTANCING_BUFFER_END(ExoPlanetsHDRPAtmosphere)


			
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

				float3 AtmosphereSize39 = ( (0.0 + (_ExteriorSize - 0.0) * (1.0 - 0.0) / (3.0 - 0.0)) * ( inputMesh.positionOS * 1 ) );
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = AtmosphereSize39;

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
				
				surfaceDescription.Alpha = 1;
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
	CustomEditor "AtmosphereEditor"
    Fallback "Hidden/InternalErrorShader"
	
}
/*ASEBEGIN
Version=17700
-1680;203;1680;989;4077.094;1050.094;3.710641;True;False
Node;AmplifyShaderEditor.CommentaryNode;6;-3226.747,-398.277;Inherit;False;3207.77;1197.935;Atmosphere Emissive + Vertex Offset;5;39;29;12;8;7;Atmosphere ;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;7;-3186.926,-348.2125;Inherit;False;2693.273;464.8405;Atmosphere Controls ;24;4;3;2;1;46;44;43;41;40;33;32;31;30;27;26;25;23;20;19;14;13;10;9;22;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;12;-1034.067,179.4272;Inherit;False;554.1529;385.2613;Vertex offset;4;42;24;21;15;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;10;-3175.466,-78.97423;Inherit;False;346;136;Material Property;1;47;;0,1,0.3411765,1;0;0
Node;AmplifyShaderEditor.PosVertexDataNode;24;-993.2964,415.8656;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;47;-3168.556,-34.76915;Float;False;Property;_ExteriorSize;Exterior Size;1;0;Create;True;0;0;False;0;0.3;0.35;0.1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;8;-3165.957,186.7416;Inherit;False;1530.697;503.61;Fine tuning of Dir mask;1;11;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;68;-6088.463,496.3987;Inherit;False;1011.591;371.1455;Light Source Vector from script;5;74;72;71;70;69;Light Source Vector;1,0.6068678,0,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;21;-983.0767,234.0453;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleNode;42;-806.3267,359.0463;Inherit;False;1;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-672.2661,274.7963;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;76;-1673.249,1131.954;Inherit;False;579;239;Material Property;3;78;77;5;;0,1,0.3426006,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;69;-6055.354,561.9867;Inherit;False;304;234;Input is set via LightSource.cs;1;73;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;75;-4697.25,688.8053;Inherit;False;891.5458;346.1274;Angle Between Light Source and Camera ;4;56;58;57;55;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;50;-4680.73,173.2502;Inherit;False;904.2393;398.7203;Hand made fresnel;4;54;53;52;51;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-3155.086,248.476;Inherit;False;1495.317;370.623;Mask controls for Atmosphere;10;45;38;37;36;35;34;28;18;17;16;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;9;-2315.376,-72.2545;Inherit;False;346;136;Material Property;1;48;;0,1,0.3411765,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;60;-4750.514,1080.29;Inherit;False;910.5537;332.3206;Custom mask for atmohsphere;7;67;66;65;64;63;62;61;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;64;-4079.184,1153.743;Float;False;AtmosphereLightMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;37;-2358.056,312.4633;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LinearToGammaNode;14;-500.6664,-49.61973;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;57;-4327.965,804.6321;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-2672.716,464.1117;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;72;-5682.854,559.4769;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-3160.256,-167.2965;Inherit;False;51;FresnelMask;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;45;-2102.657,307.4095;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-309.4467,-141.9215;Float;False;AtmosphereColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-4302.564,1285.694;Float;False;Constant;_Float13;Float 13;38;0;Create;True;0;0;False;0;-0.4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;77;-1368.6,1199.989;Float;False;BaseColorAtmospheres;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;58;-4574.129,806.3435;Float;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-1154.266,-156.2535;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;32;-2535.747,-281.4586;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.01;False;3;FLOAT;0;False;4;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;49;16.3407,-206.4667;Inherit;False;Constant;_Color0;Color 0;3;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-2258.876,458.6556;Float;False;Constant;_Float15;Float 15;38;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-2294.167,-261.7418;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;65;-4283.793,1156.53;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;30;-2807.607,-279.6852;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;4.15;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;38;-2693.626,288.0287;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0;False;4;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-2267.876,544.6566;Float;False;Constant;_Float18;Float 18;39;0;Create;True;0;0;False;0;20;16.17;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;55;-4689.704,744.1694;Inherit;False;70;LightSourceVector;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-4298.373,1359.534;Float;False;Constant;_Float0;Float 0;39;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;34;-2462.567,515.3265;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;70;-5327.764,618.2386;Float;False;LightSourceVector;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;51;-4056.39,299.6369;Float;False;FresnelMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;54;-4646.811,227.59;Float;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PowerNode;33;-3000.086,-271.4645;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-392.6215,278.68;Float;False;AtmosphereSize;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;56;-4030.039,731.5725;Float;False;ViewDotLight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-5707.623,700.1371;Float;False;Constant;_Float2;Float 2;36;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;73;-6004.354,622.9867;Float;False;InstancedProperty;_LightSourceAtmo;_LightSourceAtmo;3;0;Create;True;0;0;False;0;1,0,0;0,100,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TFHCRemapNode;40;-2766.747,-147.5484;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;3;False;4;FLOAT;3.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;26;-1454.756,-277.2477;Inherit;False;77;BaseColorAtmospheres;1;0;OBJECT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;52;-4361.339,300.0197;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;16;-3083.586,536.9203;Inherit;False;64;AtmosphereLightMask;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GammaToLinearNode;27;-1715.996,-273.9703;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GammaToLinearNode;13;-502.6664,-226.6197;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;66;-4439.404,1177.509;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;19;-3151.167,-271.3785;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;22;-970.6205,-108.067;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-2259.876,-21.80626;Float;False;Property;_ExteriorIntensity;Exterior Intensity;0;0;Create;True;0;0;False;0;0.25;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;78;-1629.619,1183.058;Float;False;Property;_AtmosphereColor;Atmosphere Color;4;1;[HDR];Create;True;0;0;False;0;0.3764706,1.027451,1.498039,0;0.6806549,2.230592,2.628011,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;20;-2125.216,-300.6403;Float;False;Constant;_Color2;Color 2;39;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;53;-4637.879,410.4162;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;62;-4733.814,1153.813;Inherit;False;70;LightSourceVector;1;0;OBJECT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;67;-4683.504,1253.657;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-1465.416,-135.0758;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;71;-5491.754,676.8129;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;43;-1892.796,-295.3746;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;36;-3081.766,311.3685;Inherit;False;56;ViewDotLight;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;41;-766.147,-148.8551;Float;False;Property;_EnableAtmosphere;Enable Atmosphere;2;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCRemapNode;28;-1873.147,306.5306;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;46;-976.2867,-315.5035;Float;False;Constant;_Color1;Color 1;39;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;META;0;2;META;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;2;False;-1;False;False;False;False;False;True;1;LightMode=Meta;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;4;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DepthForwardOnly;0;4;DepthForwardOnly;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=DepthForwardOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=ShadowCaster;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;3;0,0;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;True;0;True;-26;True;False;False;False;False;0;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=SceneSelectionPass;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;285.833,82.31126;Float;False;True;-1;2;AtmosphereEditor;0;15;Exo-Planets/HDRP/Atmosphere;7f5cb9c3ea6481f469fdd856555439ef;True;Forward Unlit;0;0;Forward Unlit;8;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;0;True;4;1;True;-21;0;True;-22;1;0;True;-23;0;True;-24;False;False;True;0;True;-26;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;0;True;-25;True;0;True;-31;False;True;1;LightMode=ForwardOnly;False;0;Hidden/InternalErrorShader;0;0;Standard;18;Surface Type;1;  Rendering Pass ;0;  Rendering Pass;1;  Blending Mode;0;  Receive Fog;0;  Distortion;0;    Distortion Mode;0;    Distortion Depth Test;1;  ZWrite;1;  Cull Mode;1;  Z Test;0;Double-Sided;0;Alpha Clipping;0;Add Precomputed Velocity;0;Cast Shadows;0;Receive Shadows;0;GPU Instancing;0;Vertex Position,InvertActionOnDeselection;1;0;6;True;False;True;True;True;True;False;;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;5;-1468.973,1342.084;Float;False;False;-1;2;UnityEditor.Experimental.Rendering.HDPipeline.HDLitGUI;0;15;New Amplify Shader;7f5cb9c3ea6481f469fdd856555439ef;True;DistortionVectors;0;5;DistortionVectors;0;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;True;0;True;-26;False;True;True;0;True;-12;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;0;Hidden/InternalErrorShader;0;0;Standard;0;0
Node;AmplifyShaderEditor.CommentaryNode;59;-4330.793,1118.53;Inherit;False;245;297.0039;Mask Softening;0;;1,1,1,1;0;0
WireConnection;21;0;47;0
WireConnection;42;0;24;0
WireConnection;15;0;21;0
WireConnection;15;1;42;0
WireConnection;64;0;65;0
WireConnection;37;0;38;0
WireConnection;37;1;34;0
WireConnection;14;0;41;0
WireConnection;57;0;55;0
WireConnection;57;1;58;0
WireConnection;17;0;36;0
WireConnection;72;0;73;0
WireConnection;45;0;37;0
WireConnection;45;1;18;0
WireConnection;45;2;35;0
WireConnection;29;0;41;0
WireConnection;77;0;78;0
WireConnection;23;0;26;0
WireConnection;23;1;25;0
WireConnection;32;0;30;0
WireConnection;31;0;32;0
WireConnection;65;0;66;0
WireConnection;65;1;63;0
WireConnection;65;2;61;0
WireConnection;30;0;33;0
WireConnection;30;1;40;0
WireConnection;38;0;36;0
WireConnection;34;0;17;0
WireConnection;34;1;16;0
WireConnection;70;0;71;0
WireConnection;51;0;52;0
WireConnection;33;0;19;0
WireConnection;39;0;15;0
WireConnection;56;0;57;0
WireConnection;40;0;47;0
WireConnection;52;0;54;0
WireConnection;52;1;53;0
WireConnection;27;0;43;0
WireConnection;13;0;41;0
WireConnection;66;0;62;0
WireConnection;66;1;67;0
WireConnection;19;0;44;0
WireConnection;22;0;23;0
WireConnection;25;0;28;0
WireConnection;25;1;27;0
WireConnection;71;0;72;0
WireConnection;71;1;74;0
WireConnection;43;0;20;0
WireConnection;43;1;31;0
WireConnection;43;2;48;0
WireConnection;41;0;46;0
WireConnection;41;1;22;0
WireConnection;28;0;45;0
WireConnection;0;0;49;0
WireConnection;0;1;29;0
WireConnection;0;6;39;0
ASEEND*/
//CHKSM=DA21D9DF745AC987B9A65728B509F93CBB9E3552