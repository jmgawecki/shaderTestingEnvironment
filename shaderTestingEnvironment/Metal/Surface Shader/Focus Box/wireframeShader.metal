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
//    
//    float3 position = params.geometry().model_position();
//    
//    float xValue = position.x;
//    float zValue = position.z;
//    
//    if (position.x > (xValue - 0.05))
//    {
//        params.surface().set_base_color(half3(0.094, 0.697, 0.088));
//        params.surface().set_opacity(1);
//    }
}

