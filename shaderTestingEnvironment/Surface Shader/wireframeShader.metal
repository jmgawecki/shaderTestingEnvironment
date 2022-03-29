//
//  wireframeShader.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>

using namespace metal;

[[visible]]
void wireframeShader(realitykit::surface_parameters params)
{
    float3 localPosition = params.geometry().model_position();
    
    params.surface().set_opacity(0);
    
    if (localPosition.x > 0.24)
    {
        params.surface().set_base_color(half3(0.094, 0.697, 0.088));
        params.surface().set_opacity(1);
    }
    if (localPosition.x < -0.24)
    {
        params.surface().set_base_color(half3(0.094, 0.697, 0.088));
        params.surface().set_opacity(1);
    }
    if (localPosition.z > 0.24)
    {
        params.surface().set_base_color(half3(0.094, 0.697, 0.088));
        params.surface().set_opacity(1);
    }
    if (localPosition.z < -0.24)
    {
        params.surface().set_base_color(half3(0.094, 0.697, 0.088));
        params.surface().set_opacity(1);
    }
}


void wireframeShaderTest(realitykit::surface_parameters params)
{
    float3 localPosition = params.geometry().model_position();
    
    params.surface().set_base_color(half3(0.094, 0.697, 0.088));
    
    if (localPosition.x > 0 && localPosition.z < 0)
    {
        params.surface().set_opacity(0.5);
    } else if (localPosition.x > 0 && localPosition.z > 0) {
        params.surface().set_opacity(1);
        params.surface().set_base_color(half3(0.805, 0.074, 0.352));
    } else {
        params.surface().set_base_color(half3(0.039, 0.883, 0.902));
    }
    
    if (localPosition.x > 0.24)
    {
        params.surface().set_base_color(half3(0.997, 0.918, 0.023));
    }
}

