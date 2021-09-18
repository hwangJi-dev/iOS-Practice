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
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
