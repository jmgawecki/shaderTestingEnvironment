//
//  MetalShaders.swift
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

import Foundation

enum CustomSurfaceShader: String {
    case greenShader = "greenShader"
    case wireframeShader = "wireframeShader"
    case staticWireframeShader = "staticWireframeShader"
    case grassGreenShader = "grassGreenShader"
}

enum CustomGeometryModifier: String {
    case triangleDancer = "triangleDancerModifier"
    case expandingSquare = "expandingSquareModifier"
    case rotationModifier = "rotationModifier"
    case grassWindModifier = "grassWindModifier"
}
