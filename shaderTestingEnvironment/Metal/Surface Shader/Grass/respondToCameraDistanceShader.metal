//
//  respondToCameraDistanceShader.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 31/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>
#include "respondToCameraDistanceShader.h"

using namespace realitykit;

void respondToCameraDistanceShader(realitykit::surface_parameters params)
{
    float3 distanceToCamera = params.geometry().world_position();
    
    if (distanceToCamera.z < 0.3 && distanceToCamera.z > -0.3)
    {
        params.surface().set_opacity(distanceToCamera.z * 100);
        params.surface().set_base_color(half3(0.934, 0.902, 0.355));
    }
}


