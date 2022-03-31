//
//  grassWindModifier.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 31/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>

using namespace metal;


[[visible]]
void grassWindModifier(realitykit::geometry_parameters params)
{
    float spatialScale = 8.0;
    
    // Amplitude for precising how far we want the grass to flow from its center
    float amplitude = 0.1;
    
    // Wind velocity
    float windVelocity = 0.2;
    
    float3 worldPosition = params.geometry().world_position();
    
    // Model position to determine current height of the grass. Based on the
    float3 modelPosition = params.geometry().model_position();
    
    float phaseOffset = 3.0 * dot(worldPosition, float3(1.0, 0.5, 0.7));
    float time = windVelocity * params.uniforms().time() + phaseOffset;
    
    float3 maxOffset = float3(sin(spatialScale * 1.1 * (worldPosition.x + time)),
                              sin(spatialScale * 1.2 * (worldPosition.y + time)),
                              sin(spatialScale * 1.2 * (worldPosition.z + time)));
    
    float3 offset = maxOffset * amplitude * max(0.0, modelPosition.y);
    
    params.geometry().set_model_position_offset(offset);
}

