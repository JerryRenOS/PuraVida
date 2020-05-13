//
//  ViewController.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import SceneKit

class EarthKitViewControl: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        let sceneView = self.view as! SCNView
        sceneView.scene = scene
        
        sceneView.backgroundColor = .black
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 7) // how far
        scene.rootNode.addChildNode(cameraNode)
        
        let lightoNodo = SCNNode()
        lightoNodo.light = SCNLight()
        lightoNodo.light?.type = .omni // play around 
        lightoNodo.position = SCNVector3(0, 10, 2)
        
        let planetNode = PlanetNode()
        scene.rootNode.addChildNode(planetNode)
        
    }

    
}
             






// override var prefersStatusBarHidden: Bool {
//        return true
//    }
