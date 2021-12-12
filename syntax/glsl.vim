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

" Statements {{{
syntax keyword glslConditional if else switch
syntax keyword glslRepeat while do for
syntax keyword glslLabel case default
syntax keyword glslStatement break continue discard return subroutine
" }}}

" PreProc {{{
syntax match glslPreProc "\v#.*$"
syntax keyword glslPreProc __FILE__ __LINE__ __VERSION__ GL_core_profile GL_compatibility_profile
" }}}

" {{{
syntax keyword glslStructure struct
syntax keyword glslTypedef precision
syntax keyword glslStorage lowp mediump highp
" }}}

" Idenfifiers {{{
let types = [ "void", "bool", "int", "uint", "float", "double", "vec2", "vec3", "vec4", "dvec2", "dvec3", "dvec4", "bvec2", "bvec3", "bvec4", "ivec2", "ivec3", "ivec4", "uvec2", "uvec3", "uvec4", "mat2", "mat3", "mat4", "mat2x2", "mat2x3", "mat2x4", "mat3x2", "mat3x3", "mat3x4", "mat4x2", "mat4x3", "mat4x4", "dmat2", "dmat3", "dmat4", "dmat2x2", "dmat2x3", "dmat2x4", "dmat3x2", "dmat3x3", "dmat3x4", "dmat4x2", "dmat4x3", "dmat4x4", "sampler1D", "image1D", "sampler2D", "image2D", "sampler3D", "image3D", "samplerCube", "imageCube", "sampler2DRect", "image2DRect", "sampler1DArray", "image1DArray", "sampler2DArray", "image2DArray", "samplerBuffer", "imageBuffer", "sampler2DMS", "image2DMS", "sampler2DMSArray", "image2DMSArray", "samplerCubeArray", "imageCubeArray", "sampler1DShadow", "sampler2DShadow", "sampler2DRectShadow", "sampler1DArrayShadow", "sampler2DArrayShadow", "samplerCubeShadow", "samplerCubeArrayShadow", "isampler1D", "iimage1D", "isampler2D", "iimage2D", "isampler3D", "iimage3D", "isamplerCube", "iimageCube", "isampler2DRect", "iimage2DRect", "isampler1DArray", "iimage1DArray", "isampler2DArray", "iimage2DArray", "isamplerBuffer", "iimageBuffer", "isampler2DMS", "iimage2DMS", "isampler2DMSArray", "iimage2DMSArray", "isamplerCubeArray", "iimageCubeArray", "atomic_uint", "usampler1D", "uimage1D", "usampler2D", "uimage2D", "usampler3D", "uimage3D", "usamplerCube", "uimageCube", "usampler2DRect", "uimage2DRect", "usampler1DArray", "uimage1DArray", "usampler2DArray", "uimage2DArray", "usamplerBuffer", "uimageBuffer", "usampler2DMS", "uimage2DMS", "usampler2DMSArray", "uimage2DMSArray", "usamplerCubeArray", "uimageCubeArray"]
let builtin_variables = ["gl_PerVertex", "gl_NumWorkGroups", "gl_WorkGroupSize", "gl_WorkGroupID", "gl_LocalInvocationID", "gl_GlobalInvocationID", "gl_LocalInvocationIndex", "gl_VertexID", "gl_InstanceID", "gl_Position", "gl_PointSize", "gl_ClipDistance", "gl_CullDistance", "gl_in", "gl_PrimitiveIDIn", "gl_InvocationID", "gl_PrimitiveID", "gl_Layer", "gl_ViewportIndex", "gl_PatchVerticesIn", "gl_out", "gl_TessLevelOuter", "gl_TessLevelInner", "gl_PrimitiveID", "gl_TessCoord", "gl_FragCoord", "gl_FrontFacing", "gl_PointCoord", "gl_SampleID", "gl_SamplePosition", "gl_SampleMaskIn", "gl_HelperInvocation", "gl_FragDepth", "gl_SampleMask"]
let builtin_constants = ["gl_MaxComputeWorkGroupCount", "gl_MaxComputeWorkGroupSize", "gl_MaxComputeUniformComponents", "gl_MaxComputeTextureImageUnits", "gl_MaxComputeImageUniforms", "gl_MaxComputeAtomicCounters", "gl_MaxComputeAtomicCounterBuffers", "gl_MaxVertexAttribs", "gl_MaxVertexUniformComponents", "gl_MaxVaryingComponents", "gl_MaxVertexOutputComponents", "gl_MaxGeometryInputComponents", "gl_MaxGeometryOutputComponents", "gl_MaxFragmentInputComponents", "gl_MaxVertexTextureImageUnits", "gl_MaxCombinedTextureImageUnits", "gl_MaxTextureImageUnits", "gl_MaxImageUnits", "gl_MaxCombinedImageUnitsAndFragmentOutputs", "gl_MaxCombinedShaderOutputResources", "gl_MaxImageSamples", "gl_MaxVertexImageUniforms", "gl_MaxTessControlImageUniforms", "gl_MaxTessEvaluationImageUniforms", "gl_MaxGeometryImageUniforms", "gl_MaxFragmentImageUniforms", "gl_MaxCombinedImageUniforms", "gl_MaxFragmentUniformComponents", "gl_MaxDrawBuffers", "gl_MaxClipDistances", "gl_MaxGeometryTextureImageUnits", "gl_MaxGeometryOutputVertices", "gl_MaxGeometryTotalOutputComponents", "gl_MaxGeometryUniformComponents", "gl_MaxGeometryVaryingComponents", "gl_MaxTessControlInputComponents", "gl_MaxTessControlOutputComponents", "gl_MaxTessControlTextureImageUnits", "gl_MaxTessControlUniformComponents", "gl_MaxTessControlTotalOutputComponents", "gl_MaxTessEvaluationInputComponents", "gl_MaxTessEvaluationOutputComponents", "gl_MaxTessEvaluationTextureImageUnits", "gl_MaxTessEvaluationUniformComponents", "gl_MaxTessPatchComponents", "gl_MaxPatchVertices", "gl_MaxTessGenLevel", "gl_MaxViewports", "gl_MaxVertexUniformVectors", "gl_MaxFragmentUniformVectors", "gl_MaxVaryingVectors", "gl_MaxVertexAtomicCounters", "gl_MaxTessControlAtomicCounters", "gl_MaxTessEvaluationAtomicCounters", "gl_MaxGeometryAtomicCounters", "gl_MaxFragmentAtomicCounters", "gl_MaxCombinedAtomicCounters", "gl_MaxAtomicCounterBindings", "gl_MaxVertexAtomicCounterBuffers", "gl_MaxTessControlAtomicCounterBuffers", "gl_MaxTessEvaluationAtomicCounterBuffers", "gl_MaxGeometryAtomicCounterBuffers", "gl_MaxFragmentAtomicCounterBuffers", "gl_MaxCombinedAtomicCounterBuffers", "gl_MaxAtomicCounterBufferSize", "gl_MinProgramTexelOffset", "gl_MaxProgramTexelOffset", "gl_MaxTransformFeedbackBuffers", "gl_MaxTransformFeedbackInterleavedComponents", "gl_MaxCullDistances", "gl_MaxCombinedClipAndCullDistances", "gl_MaxSamples", "gl_MaxVertexImageUniforms", "gl_MaxFragmentImageUniforms", "gl_MaxComputeImageUniforms", "gl_MaxCombinedImageUniforms", "gl_MaxCombinedShaderOutputResources"]
let builtin_functions = [
	\"radians", "degrees", "sin", "cos", "tan", "asin", "acos", "atan", "sinh", "cosh", "tanh", "asinh", "acosh", "atanh",
	\"pow", "exp", "log", "exp2", "log2", "sqrt", "inversesqrt",
	\"abs", "sign", "floor", "trunc", "round", "roundEven", "ceil", "fract", "mod", "modf", "min", "max", "clamp", "mix", "step", "smoothstep", "isnan", "isinf", "floatBitsToInt", "floatBitsToUInt", "intBitsToFloat", "uintBitsToFloat", "fma", "frexp", "ldexp",
	\"packUnorm2x16", "packSnorm2x16", "packUnorm4x8", "packSnorm4x8", "unpackUnorm2x16", "unpackSnorm2x16", "unpackUnorm4x8", "unpackSnorm4x8", "packDouble2x32", "unpackDouble2x32", "packHalf2x16", "unpackHalf2x16",
	\"length", "distance", "dot", "cross", "normalize", "faceforward", "reflect", "refract",
	\"matrixCompMult", "outerProduct", "transpose", "determinant", "inverse",
	\"lessThan", "lessThanEqual", "greaterThan", "greaterThanEqual", "equal", "notEqual", "any", "all", "not",
	\"uaddCarry", "usubBorrow", "umulExtended", "imulExtended", "bitfieldExtract", "bitfieldInsert", "bitfieldReverse", "bitCount", "findLSB", "findMSB",
	\"textureSize", "textureQueryLod", "textureQueryLevels", "textureSamples", "texture", "textureProj", "textureLod", "textureOffset", "texelFetch", "texelFetchOffset", "textureProjOffset", "textureLodOffset", "textureProjLod", "textureProjLodOffset", "textureGrad", "textureGradOffset", "textureProjGrad", "textureProjGradOffset", "textureGather", "textureGatherOffset", "textureGatherOffsets",
	\"atomicCounterIncrement", "atomicCounterDecrement", "atomicCounter", "atomicAdd", "atomicMin", "atomicMax", "atomicAnd", "atomicOr", "atomicXor", "atomicExchange", "atomicCompSwap",
	\"imageSize", "imageSamples", "imageLoad", "imageStore", "imageAtomicAdd", "imageAtomicMin", "imageAtomicMax", "imageAtomicAnd", "imageAtomicOr", "imageAtomicXor", "imageAtomicExchange", "imageAtomicCompSwap",
	\"dFdx", "dFdy", "dFdxFine", "dFdyFine", "dFdxCoarse", "dFdyCoarse", "fwidth", "fwidthFine", "fwidthCoarse",
	\"interpolateAtCentroid", "interpolateAtSample", "interpolateAtOffset",
	\"noise1", "noise2", "noise3", "noise4",
	\"EmitStreamVertex", "EndStreamPrimitive", "EmitVertex", "EndPrimitive",
	\"barrier", "memoryBarrier", "memoryBarrierAtomicCounter", "memoryBarrierBuffer", "memoryBarrierShared", "memoryBarrierImage", "groupMemoryBarrier",
\]
let qualifiers = [ "const", "in", "out", "inout", "attribute", "uniform", "varying", "buffer", "shared", "centroid", "sample", "patch", "smooth", "flat", "noperspective", "invariant", "precise", "coherent", "volatile", "restrict", "readonly", "writeonly", "layout" ]
let layout_qualifiers = [ "packed", "std140", "std430", "row_major", "column_major", "binding", "offset", "align", "location", "component", "index", "triangles", "quads", "isolines", "equal_spacing", "fractional_even_spacing", "fractional_odd_spacing", "cw", "ccw", "point_mode", "points", "lines", "lines_adjacency", "triangles_adjacency", "invocations", "origin_upper_left", "pixel_center_integer", "early_fragment_tests", "local_size_x", "local_size_y", "local_size_z", "xfb_buffer", "xfb_stride", "xfb_offset", "vertices", "line_strip", "triangle_strip", "max_vertices", "stream", "depth_any", "depth_greater", "depth_less", "depth_unchanged", "rgba32f", "rgba16f", "rg32f", "rg16f", "r11f_g11f_b10f", "r32f", "r16f", "rgba16", "rgb10_a2", "rgba8", "rg16", "rg8", "r16", "r8", "rgba16_snorm", "rgba8_snorm", "rg16_snorm", "rg8_snorm", "r16_snorm", "r8_snorm", "rgba32i", "rgba16i", "rgba8i", "rg32i", "rg16i", "rg8i", "r32i", "r16i", "r8i", "rgba32ui", "rgba16ui", "rgb10_a2ui", "rgba8ui", "rg32ui", "rg16ui", "rg8ui", "r32ui", "r16ui", "r8ui" ]

for name in types
	execute "syntax keyword glslType " . name
endfor

for name in builtin_variables
	execute "syntax keyword glslIdentifier " . name
endfor

for name in builtin_constants
	execute "syntax keyword glslIdentifier " . name
endfor

for name in builtin_functions
	execute "syntax keyword glslFunction " . name
endfor

for name in qualifiers
	execute "syntax keyword glslQualifier " . name
endfor

for name in layout_qualifiers
	execute "syntax keyword glslIdentifier " . name
endfor

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
highlight link glslQualifier StorageClass
highlight link glslStructure Structure
highlight link glslTypedef Typedef
" }}}

let b:current_syntax = "glsl"
