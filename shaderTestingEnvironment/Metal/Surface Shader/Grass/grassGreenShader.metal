//
//  grassGreenShader.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 31/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>

using namespace metal;

[[visible]]
void grassGreenShader(realitykit::surface_parameters params)
{
    float intensity = sin(params.uniforms().time());
    
    if (intensity < 0)
    {
        intensity *= -1;
    }
    
    intensity += 0.85;
    
    params.surface().set_base_color(half3(0.094, 0.697, 0.088));
    params.surface().set_opacity(0.85);
}


