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
    
    @IBOutlet weak var planetSceneKitView: SCNView!
    
    let scene = SCNScene()
    
    let froDo = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        planetaryManifestation(visibility: 1)
    }
    
    let planetNode = PlanetNode()
    
    private func planetaryManifestation(visibility: CGFloat) {

            planetSceneKitView.scene = scene
            planetSceneKitView.backgroundColor = .black
            planetSceneKitView.allowsCameraControl = true
            
            let cameraNode = SCNNode()
            cameraNode.camera = SCNCamera()
            cameraNode.position = SCNVector3(0, 0, 5) // how far
            scene.rootNode.addChildNode(cameraNode)
            
            let lightoNodo = SCNNode()
            lightoNodo.light = SCNLight()
            lightoNodo.light?.type = .omni // play around
            lightoNodo.position = SCNVector3(0, 10, 2)
            
            planetNode.geometry?.firstMaterial?.transparency = CGFloat(visibility) //key line
        
            scene.rootNode.addChildNode(planetNode)
    }
    @IBOutlet weak var donutButton: CurvedButton!
    
    @IBAction func donutoTransmutation(_ sender: UIButton) {
        
        planetaryManifestation(visibility: 0)
        
        self.frozenDonut()

        donutButton.setTitle("Speed up", for: .normal)
    }
    
    private func freezeThePlanet() {
        planetNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "NASAfrozen.jpg")
    }
    
}


extension EarthKitViewControl {
    
    func frozenDonut() {

        froDo.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5 )
        
        froDo.geometry?.firstMaterial?.diffuse.contents =
            UIImage(named: "NASAfrozen.jpg")
        
        froDo.geometry?.firstMaterial?.specular.contents =
            UIImage(named: "EarthySpecular2k.tif")
        
        froDo.geometry?.firstMaterial?.normal.contents = UIImage(named: "Normal")
        
        scene.rootNode.addChildNode(froDo)
        
        let rotation = SCNAction.rotate(by: -90 * CGFloat(M_PI / 180.0), around: SCNVector3(x: 2, y: 1, z: 1) , duration: 3)
        
        let repetitveRotation = SCNAction.repeatForever(rotation)
        froDo.runAction(repetitveRotation)
        
    }
}



// override var prefersStatusBarHidden: Bool {
//        return true
//    }


//        let sceneView = self.view as! SCNView
//        sceneView.scene = scene
//        sceneView.backgroundColor = .black
//        sceneView.showsStatistics = true
//        sceneView.allowsCameraControl = true
