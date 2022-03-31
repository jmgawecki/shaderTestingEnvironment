//
//  MyARView+Configuration.swift
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

import ARKit

extension MyARView {
    func configureSession() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        
        if ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) {
            configuration.frameSemantics = [.personSegmentationWithDepth]
        }
        
        session.run(configuration)
    }
}
