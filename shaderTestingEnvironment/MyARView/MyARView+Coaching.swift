//
//  MyARView+Coaching.swift
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 31/03/2022.
//

import ARKit
import RealityKit

extension MyARView: ARCoachingOverlayViewDelegate {
    func addCoaching() {
        coaching.session = session
        coaching.activatesAutomatically = true
        coaching.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        coaching.goal = .horizontalPlane
        coaching.delegate = self
        addSubview(coaching)
    }
}
