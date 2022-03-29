//
//  expandingSquareModifier.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>

using namespace metal;


[[visible]]
void expandingSquareModifier(realitykit::geometry_parameters params)
{
    float3 localPosition = params.geometry().model_position();
    
    float offset = sin(params.uniforms().time() * 2);
    
    if (offset < 0)
    {
        offset *= -1;
    }
    
    params.geometry().set_model_position_offset(
                                                float3(localPosition.x * offset, 0, localPosition.z * offset)
                                                );    
}

