//
//  greenShader.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

#include <metal_stdlib>
#include <RealityKit/RealityKit.h>
#include "pulsingShader.h"

using namespace metal;

[[visible]]
void greenShader(realitykit::surface_parameters params)
{
    // set the colour and the roughness
    params.surface().set_base_color(half3(0.094, 0.697, 0.088));
    params.surface().set_roughness(0.9);
    
    // animate the opacity over time based on sin value    
    pulsingShader(params);
}

