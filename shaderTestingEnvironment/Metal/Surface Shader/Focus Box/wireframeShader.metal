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
    float2 uv = params.geometry().uv0();
    float2 uv1 = params.geometry().uv1();

    
    float maxX = max(0.0, localPosition.x) - 0.01;
    float minX = min(-localPosition.x, 0.0) + 0.01;
    float maxZ = max(0.0, localPosition.z) - 0.01;
    float minZ = min(-localPosition.z, 0.0) + 0.01;
    
    
    if (localPosition.x < maxX && localPosition.x > minX && localPosition.z < maxZ && localPosition.z > minZ)
    {
        discard_fragment();
    }
    
    params.surface().set_base_color(half3(0.094, 0.697, 0.088));
    params.surface().set_opacity(0.85);
}


