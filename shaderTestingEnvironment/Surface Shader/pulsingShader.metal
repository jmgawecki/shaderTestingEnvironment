//
//  pulsingShader.metal
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

#include <metal_stdlib>
#include "pulsingShader.h"
#include <RealityKit/RealityKit.h>

using namespace realitykit;

void pulsingShader(realitykit::surface_parameters params)
{
    float intensity = sin(params.uniforms().time());
    params.surface().set_opacity(intensity);
}
