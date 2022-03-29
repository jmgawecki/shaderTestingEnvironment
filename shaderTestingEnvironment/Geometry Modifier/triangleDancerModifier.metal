//
//  geometryModifier.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>

using namespace metal;

[[visible]]
void triangleDancerModifier(realitykit::geometry_parameters params)
{
    float3 localPosition = params.geometry().model_position();
    
    float offsetMultiplier = sin(params.uniforms().time() * 1.2);
    float offsetOppositeMultiplier = cos(params.uniforms().time() * 1.2);
    
    if (localPosition.x > 0)
    {
        params.geometry().set_model_position_offset(
                                                    float3(localPosition.x * offsetMultiplier, 0, localPosition.z * offsetMultiplier)
                                                    );
    }
    
    if (localPosition.x < 0)
    {
        params.geometry().set_model_position_offset(
                                                    float3(localPosition.x * offsetOppositeMultiplier, 0, localPosition.z * offsetOppositeMultiplier)
                                                    );
    }
    
    
}

