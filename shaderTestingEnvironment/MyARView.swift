//
//  MyARView.swift
//  shaderTestingEnvironment
//
//  Created by Jakub Gawecki on 29/03/2022.
//

import SwiftUI
import RealityKit
import ARKit
import MetalKit

class MyARView: ARView {
    
    var anchor: AnchorEntity?
    var plane: ModelEntity?
    
    
    required init() {
        super.init(frame: .zero)
        configureSession()
        session.delegate = self
        
        plane = ModelEntity(mesh: .generatePlane(width: 0.5, depth: 0.5))
        anchor = AnchorEntity(
            plane: .horizontal,
            classification: .floor,
            minimumBounds: [0.5, 0.5]
        )
        plane?.model?.materials = [SimpleMaterial(color: .cyan, isMetallic: true)]
        
        if let surfaceShader = generateSurfaceShader(),
        let geometryModifier = generateGeometryModifier() {
            do {
                let customMaterial = try CustomMaterial(surfaceShader: surfaceShader,
                                                        geometryModifier: geometryModifier,
                                                        lightingModel: .lit)
                
                plane?.model?.materials = [customMaterial]
            } catch {}
        }
        
        scene.addAnchor(anchor!)
        anchor?.addChild(plane!)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @MainActor required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    
    fileprivate func generateSurfaceShader() -> CustomMaterial.SurfaceShader? {
        guard
            let device = MTLCreateSystemDefaultDevice(),
            let library = device.makeDefaultLibrary()
        else { return nil }
        
        return CustomMaterial.SurfaceShader(named: "greenShader", in: library)
    }
    
    fileprivate func generateGeometryModifier() -> CustomMaterial.GeometryModifier? {
        guard
            let device = MTLCreateSystemDefaultDevice(),
            let library = device.makeDefaultLibrary()
        else { return nil }
        
        return CustomMaterial.GeometryModifier(named: "geometryModifier", in: library)
    }
    
    
    func raycastCentreView() -> ARRaycastResult? {
        raycast(
            from: CGPoint.init(
                x: UIScreen.main.bounds.size.width * 0.5 ,
                y: UIScreen.main.bounds.size.height * 0.5),
            allowing: .estimatedPlane,
            alignment: .horizontal
        ).first
    }
}
