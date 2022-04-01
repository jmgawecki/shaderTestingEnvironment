//
//  grassGreenShader.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 31/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>
#include "respondToCameraDistanceShader.h"

using namespace metal;

[[visible]]
void grassGreenShader(realitykit::surface_parameters params)
{
    params.surface().set_base_color(half3(0.094, 0.697, 0.088));
    params.surface().set_opacity(1);
    respondToCameraDistanceShader(params);
}


