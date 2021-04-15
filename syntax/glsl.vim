if exists("b:current_syntax")
	finish
endif

" Comment {{{
syntax match glslComment "\v//.*$"
syntax region glslComment start=/\v\/\*/ skip=/\v\\./ end=/\v\*\//
" }}}

" Constants {{{
syntax match glslFloat "\v\d*\.\d*((e|E)\d+)?(f|F|lf|LF)?"
syntax match glslFloat "\v\d+((e|E)\d+)(f|F|lf|LF)?"
syntax match glslNumber "\v\d+(u|U)?"
syntax match glslNumber "\v0(x|X)[0-9a-fA-F]+(u|U)?"
syntax keyword glslBoolean true false
" }}}

" Identifiers {{{
" builtin Identifier {{{
syntax keyword glslIdentifier gl_VertexID gl_InstanceID
syntax keyword glslIdentifier gl_DrawID gl_BaseVertex gl_BaseInstance
syntax keyword glslIdentifier gl_PerVertex
syntax keyword glslIdentifier gl_Position gl_PointSize gl_ClipDistance

syntax keyword glslIdentifier gl_PatchVerticesIn gl_PrimitiveID gl_InvocationID
syntax keyword glslIdentifier gl_in gl_out gl_MaxPatchVertices
syntax keyword glslIdentifier gl_TessLevelOuter gl_TessLevelInner
syntax keyword glslIdentifier gl_TessCoord
syntax keyword glslIdentifier gl_NumWorkGroups gl_WorkGroupSize
syntax keyword glslIdentifier gl_WorkGroupID gl_LocalInvocationID
syntax keyword glslIdentifier gl_GlobalInvocationID gl_LocalInvocationIndex
syntax keyword glslIdentifier gl_Layer gl_ViewportIndex

syntax keyword glslIdentifier gl_FragCoord gl_FrontFacing gl_PointCoord
syntax keyword glslIdentifier gl_SampleID gl_SamplePosition gl_SampleMaskIn
syntax keyword glslIdentifier gl_FragDepth gl_SampleMask

syntax keyword glslIdentifier gl_NumWorkGroups gl_WorkGroupID gl_LocalInvocationID gl_GlobalInvocationID gl_LocalInvocationIndex gl_WorkGroupSize
syntax keyword glslIdentifier gl_DepthRange.near gl_DepthRange.far gl_DepthRange.diff
syntax keyword glslIdentifier gl_NumSamples
syntax keyword glslType gl_DepthRangeParameters

syntax keyword glslIndentifier gl_MaxVertexAttribs gl_MaxVertexOutputComponents gl_MaxVertexUniformComponents gl_MaxVertexTextureImageUnits
syntax keyword glslIndentifier gl_MaxGeometryInputComponents gl_MaxGeometryOutputComponents gl_MaxGeometryUniformComponents gl_MaxGeometryVaryingComponents gl_MaxGeometryTotalOutputComponents
syntax keyword glslIndentifier gl_MaxGeometryTextureImageUnits gl_MaxGeometryOutputVertices
syntax keyword glslIndentifier gl_MaxFragmentInputComponents gl_MaxFragmentUniformComponents
syntax keyword glslIndentifier gl_MaxDrawBuffers gl_MaxTextureImageUnits1 gl_MaxClipDistances gl_MaxCombinedTextureImageUnits

syntax keyword glslIndentifier gl_MaxTessControlInputComponents gl_MaxTessControlOutputComponents gl_MaxTessControlUniformComponents gl_MaxTessControlTextureImageUnits gl_MaxTessControlTotalOutputComponents
syntax keyword glslIndentifier gl_MaxTessEvaluationInputComponents gl_MaxTessEvaluationOutputComponents gl_MaxTessEvaluationUniformComponents gl_MaxTessEvaluationTextureImageUnits
syntax keyword glslIndentifier gl_MaxTessPatchComponents gl_MaxPatchVertices gl_MaxTessGenLevel

syntax keyword glslIndentifier gl_MaxViewports gl_MaxVertexUniformVectors gl_MaxFragmentUniformVectors gl_MaxVaryingVectors

syntax keyword glslIndentifier gl_MaxVertexImageUniforms gl_MaxVertexAtomicCounters gl_MaxVertexAtomicCounterBuffers
syntax keyword glslIndentifier gl_MaxTessControlImageUniforms gl_MaxTessControlAtomicCounters gl_MaxTessControlAtomicCounterBuffers gl_MaxTessEvaluationImageUniforms gl_MaxTessEvaluationAtomicCounters gl_MaxTessEvaluationAtomicCounterBuffers
syntax keyword glslIndentifier gl_MaxGeometryImageUniforms gl_MaxGeometryAtomicCounters gl_MaxGeometryAtomicCounterBuffers
syntax keyword glslIndentifier gl_MaxFragmentImageUniforms gl_MaxFragmentAtomicCounters gl_MaxFragmentAtomicCounterBuffers
syntax keyword glslIndentifier gl_MaxCombinedImageUniforms gl_MaxCombinedAtomicCounters gl_MaxCombinedAtomicCounterBuffers
syntax keyword glslIndentifier gl_MaxImageUnits gl_MaxCombinedImageUnitsAndFragmentOutputs
syntax keyword glslIndentifier gl_MaxImageSamples gl_MaxAtomicCounterBindings gl_MaxAtomicCounterBufferSize
syntax keyword glslIndentifier gl_MinProgramTexelOffset gl_MaxProgramTexelOffset

syntax keyword glslIndentifier gl_MaxComputeWorkGroupCount gl_MaxComputeWorkGroupSize
syntax keyword glslIndentifier gl_MaxComputeUniformComponents gl_MaxComputeTextureImageUnits gl_MaxComputeImageUniforms
syntax keyword glslIndentifier gl_MaxComputeAtomicCounters gl_MaxComputeAtomicCounterBuffers

syntax keyword glslIndentifier gl_MaxTransformFeedbackBuffers gl_MaxTransformFeedbackInterleavedComponents
" }}}
" builtin Functions {{{
syntax keyword glslFunction radians degrees sin cos tan asin acos atan sinh cosh tanh asinh acosh atanh
syntax keyword glslFunction pow exp log exp2 log2 sqrt inversesqrt
syntax keyword glslFunction abs sign floor trunc round roundEven ceil fract mod modf min max clamp mix step smoothstep isnan isinf floatBitsToInt intBitsToFloat fma frexp ldexp
syntax keyword glslFunction packUnorm2x16 packSnorm2x16 packUnorm4x8 packSnorm4x8 unpackUnorm2x16 unpackSnorm2x16 unpackUnorm4x8 unpackSnorm4x8 packDouble2x32 unpackDouble2x32 packHalf2x16 unpackHalf2x16
syntax keyword glslFunction length distance dot cross normalize ftransform faceforward reflect refract
syntax keyword glslFunction matrixCompMult outerProduct transpose determinant inverse
syntax keyword glslFunction lessThan lessThanEqual greaterThan greaterThanEqual equal notEqual any all not
syntax keyword glslFunction uaddCarry usubBorrow umulExtended imulExtended bitfieldExtract bitfieldInsert bitfieldReverse bitCount findLSP findMSB
syntax keyword glslFunction textureSize textureQueryLod textureQueryLevels textureSamples texture textureProj textureLod textureOffset texelFetch textelFetchOffset textureProjOffset textureLodOffset textureProjLod textureProjLodOffset textureGrad textureGradOffset textureProjGrad textureProjGradOffset textureGather textureGatherOffset textureGatherOffsets
syntax keyword glslFunction texture1D texture1DProj texture1DLod texture1DProjLod texture2D texture2DProj texture2DLod texture2DProjLod texture3D texture3DProj textureLod texture3DProjLod textureCube textureCubeLod
syntax keyword glslFunction shadow1D shadow2D shadow1DProj shadow2DProj shadow1DLod shadow2DLod shadow1DProjLod shadow2DProjLod
syntax keyword glslFunction atomicCounterIncrement atomicCounterDecrement atomicCounter atomicAdd atomicMin atomicMax atomicAnd atomicOr atomicXor atomicExchange atomicCompSwap
syntax keyword glslFunction imageSize imageSamples imageLoad imageStore imageAtomicAdd imageAtomicMin imageAtomicMax imageAtomicAnd imageAtomicOr imageAtomicXor imageAtomicExchange imageAtomicCompSwap
syntax keyword glslFunction dFdx dFdy dFdxFine dFdyFine dFdxCoarse dFdyCoarse fwidth fwidthFine fwidthCoarse
syntax keyword glslFunction interpolateAtCentroid interpolateAtSample interpolateAtOffset
syntax keyword glslFunction noise1 noise2 noise3 noise4
syntax keyword glslFunction EmitStreamVertex EndStreamPrimitive EmitVertex EndPrimitive
syntax keyword glslFunction barrier
syntax keyword glslFunction memoryBarrier memoryBarrierAtomicCounter memoryBarrierBuffer memoryBarrierShared memoryBarrierImage groupMemoryBarrier
" }}}
" }}}

" Statements {{{
syntax keyword glslRepeat break continue do for while
syntax keyword glslLabel switch case default
syntax keyword glslConditional if else
syntax keyword glslStatement discard return
" }}}

" PreProc {{{
syntax match glslPreProc "\v#.*$"
" }}}

" Type {{{
" Types {{{
syntax keyword glslType atomic_uint
syntax keyword glslType float double int void bool
syntax keyword glslType mat2 mat3 mat4 dmat2 dmat3 dmat4
syntax keyword glslType mat2x2 mat2x3 mat2x4 dmat2x2 dmat2x3 dmat2x4
syntax keyword glslType mat3x2 mat3x3 mat3x4 dmat3x2 dmat3x3 dmat3x4
syntax keyword glslType mat4x2 mat4x3 mat4x4 dmat4x2 dmat4x3 dmat4x4
syntax keyword glslType vec2 vec3 vec4 ivec2 ivec3 ivec4 bvec2 bvec3 bvec4 dvec2 dvec3 dvec4
syntax keyword glslType uint uvec2 uvec3 uvec4
syntax keyword glslType sampler1D sampler2D sampler3D samplerCube
syntax keyword glslType sampler1DShadow sampler2DShadow samplerCubeShadow
syntax keyword glslType sampler1DArray sampler2DArray sampler1DArrayShadow sampler2DArrayShadow
syntax keyword glslType isampler1D isampler2D isampler3D isamplerCube
syntax keyword glslType isampler1DArray isampler2DArray
syntax keyword glslType usampler1D usampler2D usampler3D usamplerCube
syntax keyword glslType usampler1DArray usampler2DArray
syntax keyword glslType sampler2DRect sampler2DRectShadow isampler2DRect usampler2DRect
syntax keyword glslType samplerBuffer isamplerBuffer usamplerBuffer
syntax keyword glslType sampler2DMS isampler2DMS usampler2DMS
syntax keyword glslType sampler2DMSArray isampler2DMSArray usampler2DMSArray
syntax keyword glslType samplerCubeArray samplerCubeArrayShadow isamplerCubeArray usamplerCubeArray
syntax keyword glslType image1D iimage1D uimage1D
syntax keyword glslType image2D iimage2D uimage2D
syntax keyword glslType image3D iimage3D uimage3D
syntax keyword glslType image2DRect iimage2DRect uimage2DRect
syntax keyword glslType imageCube iimageCube uimageCube
syntax keyword glslType imageBuffer iimageBuffer uimageBuffer
syntax keyword glslType image1DArray iimage1DArray uimage1DArray
syntax keyword glslType image2DArray iimage2DArray uimage2DArray
syntax keyword glslType imageCubeArray iimageCubeArray uimageCubeArray
syntax keyword glslType image2DMS iimage2DMS uimage2DMS
syntax keyword glslType image2DMSArray iimage2DMSArray uimage2DMSArray
" }}}

" StorageClass {{{
syntax keyword glslStorageClass attribute const uniform varying buffer shared
syntax keyword glslStorageClass coherent volatile restrict readonly writeonly
syntax keyword glslStorageClass layout
syntax keyword glslStorageClass centroid flat smooth noperspective
syntax keyword glslStorageClass patch sample
syntax keyword glslStorageClass subroutine
syntax keyword glslStorageClass in out inout
syntax keyword glslStorageClass invariant precise
syntax keyword glslStorageClass lowp mediump highp
" }}}

syntax keyword glslStructure struct

syntax keyword glslTypedef precision
" }}}

" Highlights {{{
highlight link glslComment Comment

highlight link glslConstant glslConstant
highlight link glslNumber Number
highlight link glslBoolean Boolean
highlight link glslFloat Float

highlight link glslIdentifier Identifier
highlight link glslFunction Function

highlight link glslRepeat Repeat
highlight link glslLabel Label
highlight link glslConditional Conditional
highlight link glslOperator Operator
highlight link glslStatement Statement

highlight link glslPreProc PreProc

highlight link glslType Type
highlight link glslStorageClass StorageClass
highlight link glslStructure Structure
highlight link glslTypedef Typedef
" }}}

let b:current_syntax = "glsl"
