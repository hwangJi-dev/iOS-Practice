//
//  ViewController.swift
//  ARExampleRK
//
//  Created by 황지은 on 2021/09/18.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        let noteEntity = boxAnchor.note
        
        //Single Instruction Multiple Data: Vector Type in Swift (x,y,z) in meter
        noteEntity?.setPosition(SIMD3<Float>(0.2,0.0,0.0), relativeTo: boxAnchor)
            
        // 추가로 커스텀 상자 2개 추가
        let boxMesh = MeshResource.generateBox(width: 0.1, height: 0.1, depth: 0.1)
        let materialOne = SimpleMaterial(color: UIColor.red, roughness: 0.3, isMetallic: true)
        let boxOne = ModelEntity(mesh: boxMesh, materials: [materialOne])
        let materialTwo = SimpleMaterial(color: UIColor.blue, roughness: 0.3, isMetallic: true)
        let boxTwo = ModelEntity(mesh: boxMesh, materials: [materialTwo])
        let boxEntity = boxAnchor.steelBox
        boxEntity?.addChild(boxOne)
        noteEntity?.addChild(boxTwo)
        boxOne.setPosition(SIMD3<Float>(0.0, 0.3, 0.0), relativeTo: boxEntity) // in meter boxTwo.setPosition(SIMD3<Float>(0.0, 0.3, 0.0), relativeTo: soldierEntity)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
