//
//  ViewController.swift
//  wallScenePractice
//
//  Created by 황지은 on 2021/09/11.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var grids = [Grid]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
    
        sceneView.showsStatistics = true
        sceneView.debugOptions = ARSCNDebugOptions.showFeaturePoints
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        sceneView.addGestureRecognizer(gestureRecognizer)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .vertical

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor, planeAnchor.alignment == .vertical else { return }
        let grid = Grid(anchor: planeAnchor)
        self.grids.append(grid)
        node.addChildNode(grid)
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor, planeAnchor.alignment == .vertical else { return }
        let grid = self.grids.filter { grid in
            return grid.anchor.identifier == planeAnchor.identifier
            }.first

        guard let foundGrid = grid else {
            return
        }

        foundGrid.update(anchor: planeAnchor)
    }
    
    @objc func tapped(gesture: UITapGestureRecognizer) {
        // Get 2D position of touch event on screen
        let touchPosition = gesture.location(in: sceneView)

        // Translate those 2D points to 3D points using hitTest (existing plane)
        let hitTestResults = sceneView.hitTest(touchPosition, types: .existingPlaneUsingExtent)

        // Get hitTest results and ensure that the hitTest corresponds to a grid that has been placed on a wall
        guard let hitTest = hitTestResults.first,
              let anchor = hitTest.anchor as? ARPlaneAnchor,
              let gridIndex = grids.index(where: { $0.anchor == anchor }) else {
            return
        }
        addPainting(hitTest, grids[gridIndex])
    }
    
    func addPainting(_ hitResult: ARHitTestResult, _ grid: Grid) {
        // 1.
        let planeGeometry = SCNPlane(width: 0.2, height: 0.35)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "mona-lisa")
        planeGeometry.materials = [material]

        // 2.
        let paintingNode = SCNNode(geometry: planeGeometry)
        paintingNode.transform = SCNMatrix4(hitResult.anchor!.transform)
        paintingNode.eulerAngles = SCNVector3(paintingNode.eulerAngles.x + (-Float.pi / 2), paintingNode.eulerAngles.y, paintingNode.eulerAngles.z)
        paintingNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)

        sceneView.scene.rootNode.addChildNode(paintingNode)
        grid.removeFromParentNode()
        
        let audioSource = SCNAudioSource(fileNamed: "Blueming.mp3")!
       
        // As an environmental sound layer, audio should play indefinitely
        audioSource.loops = true
        // Decode the audio from disk ahead of time to prevent a delay in playback
        audioSource.load()
        addAudioPlayer(SCNAudioPlayer(source: audioSource))
    }
    
    func addAudioPlayer(_ player: SCNAudioPlayer) {
        var audioListener: SCNNode?
        audioListener?.addAudioPlayer(player)
    }
}
