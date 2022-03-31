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
    let coaching = ARCoachingOverlayView()
    var grassField: [ModelEntity] = []
    
    private lazy var occlusionBox: ModelEntity = {
        let occlusionBox = ModelEntity(mesh: .generateBox(width: 1, height: 0.05, depth: 1))
        occlusionBox.model?.materials = [OcclusionMaterial()]
        return occlusionBox
    }()
   
    
    
    required init() {
        super.init(frame: .zero)
        configureSession()
        addTapGestureRecogniser()
        addCoaching()
        session.delegate = self
        
        anchor = AnchorEntity(
            plane: .horizontal,
            classification: .floor,
            minimumBounds: [0.5, 0.5]
        )
        
        scene.addAnchor(anchor!)
        anchor?.addChild(occlusionBox)
        
        activateFocusBox()
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @MainActor required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    
    // MARK: - Gesture Recogniser
    
    func addTapGestureRecogniser() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(placeGrass))
        addGestureRecognizer(tap)
    }
    
    // MARK: - Focus Box
    
    func activateFocusBox() {
        plane = ModelEntity(mesh: .generatePlane(width: 0.5, depth: 0.5))
        
        do {
            if let material = try createCustomMaterialWithShader(shader: .staticWireframeShader) {
                plane?.model?.materials = [material]
            }
        } catch {
            plane?.model?.materials = [SimpleMaterial(color: .cyan, isMetallic: true)]
        }
        
        anchor?.addChild(plane!)
    }
    
    // MARK: - Grass generator
    
    @objc
    func placeGrass() {
        if let raycastResult = raycastCentreView() {
            let grassHeight = Float.random(in: 0.4...0.8)
            let grass = ModelEntity(mesh: .generateBox(width: 0.015, height: grassHeight, depth: 0.025))
            do {
                if let material = try createCustomMaterialWithShaderAndModifier(shader: .grassGreenShader, modifier: .grassWindModifier) {
                    grass.model?.materials = [material]
                }
            } catch {
                grass.model?.materials = [SimpleMaterial(color: .green, isMetallic: false)]
            }
            
            var finalTransform = Transform(matrix: raycastResult.worldTransform)
            finalTransform.translation.y = 0.06
            var growTransform = finalTransform
            growTransform.translation.y = -grassHeight
            
            grass.transform = growTransform
            grassField.append(grass)
            anchor?.addChild(grass)
            
            grass.move(to: finalTransform, relativeTo: occlusionBox, duration: 1)
        }
    }
    
    // MARK: - Custom Material
    
    fileprivate func createCustomMaterialWithShaderAndModifier(shader: CustomSurfaceShader, modifier: CustomGeometryModifier) throws -> CustomMaterial? {
        guard
            let surfaceShader = generateSurfaceShader(shader),
            let geometryModifier = generateGeometryModifier(modifier)
        else { return nil }
        
        return try CustomMaterial(
            surfaceShader: surfaceShader,
            geometryModifier: geometryModifier,
            lightingModel: .lit
        )
    }
    
    fileprivate func createCustomMaterialWithShader(shader: CustomSurfaceShader) throws -> CustomMaterial? {
        guard let surfaceShader = generateSurfaceShader(shader)
        else { return nil }
        
        return try CustomMaterial(
            surfaceShader: surfaceShader,
            lightingModel: .lit
        )
    }
    
    // MARK: - Metal
    fileprivate func generateSurfaceShader(_ shader: CustomSurfaceShader) -> CustomMaterial.SurfaceShader? {
        guard
            let device = MTLCreateSystemDefaultDevice(),
            let library = device.makeDefaultLibrary()
        else { return nil }
        
        return CustomMaterial.SurfaceShader(named: shader.rawValue, in: library)
    }
    
    fileprivate func generateGeometryModifier(_ modifier: CustomGeometryModifier) -> CustomMaterial.GeometryModifier? {
        guard
            let device = MTLCreateSystemDefaultDevice(),
            let library = device.makeDefaultLibrary()
        else { return nil }
        
        return CustomMaterial.GeometryModifier(named: modifier.rawValue, in: library)
    }
    
    // MARK: - Raycast
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
