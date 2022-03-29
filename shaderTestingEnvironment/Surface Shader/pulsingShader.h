//
//  pulsingShader.h
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

#ifndef pulsingShader_h
#define pulsingShader_h


#if defined(__METAL_VERSION__)

#include <RealityKit/RealityKit.h>
#include <RealityKit/RealityKitTextures.h>

#include <metal_stdlib>
#include <metal_types>

using namespace metal;

void pulsingShader(realitykit::surface_parameters params);

#endif /* #if defined(__METAL_VERSION__) */
#endif /* pulsingShader_h */
