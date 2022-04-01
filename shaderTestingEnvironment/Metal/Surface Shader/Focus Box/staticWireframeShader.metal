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

/// Static wireframe shader. Shader relies on width and depth 0.5 by 0.5 meters.
void staticWireframeShader(realitykit::surface_parameters params)
{
    float3 localPosition = params.geometry().model_position();
    
    params.surface().set_opacity(0.2);
    
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



