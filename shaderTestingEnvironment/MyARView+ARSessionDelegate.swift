//
//  MyARView+ARSessionDelegate.swift
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

import ARKit

extension MyARView: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        if let raycastResult = raycastCentreView(),
           let plane = plane {
            plane.move(to: raycastResult.worldTransform, relativeTo: nil, duration: 0.5)
        }
    }
}

