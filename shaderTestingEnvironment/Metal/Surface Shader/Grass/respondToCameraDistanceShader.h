//
//  respondToCameraDistanceShader.h
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 31/03/2022.
//

#ifndef respondToCameraDistanceShader_h
#define respondToCameraDistanceShader_h

#if defined(__METAL_VERSION__)

#include <RealityKit/RealityKit.h>

#include <metal_stdlib>
#include <metal_types>

using namespace metal;

void respondToCameraDistanceShader(realitykit::surface_parameters params);

#endif /* #if defined(__METAL_VERSION__) */
#endif /* respondToCameraDistanceShader_h */
