//
//  3DSceneKitPlaya.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/26/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import SceneKit

class ThreeDSceneKitPlayaViewController: UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        

        let sceneView = SCNView(frame: CGRect(x: 11, y: 200, width: 389, height: 370))

        let scene = SCNScene()

        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.white // default's black
        sceneView.autoenablesDefaultLighting = true
        
        view.addSubview(sceneView)
        self.view = view
        
         
        // MARK: - Separator
        
        let eNode = SCNNode()
        
   //      eNode.geometry = SCNSphere(radius: 1)
   //     eNode.geometry =  SCNCylinder(radius: 10, height: 2)
        eNode.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5 )
    //    eNode.geometry = SCNText(string: "Planet", extrusionDepth: 3.8)

        eNode.geometry?.firstMaterial?.diffuse.contents =
            UIImage(named: "NASAfrozen.jpg")
            // UIImage(named: "NASAfrozen.jpg")
            // UIImage(named: "NASAcloudy.jpg")
            // UIImage(named: "NASApolars.jpg")
            // UIImage(named: "NASAtooCloudy.jpg")
            // UIImage(named: "NASAdiffuse.png")
            // UIImage(named: "earthComputerGraphics.png")
            // UIImage(named: "earthOrganic.jpg")
            // UIImage(named: "EarthyTexture2K.jpg")
            // UIImage(named: "earthcloudmap.jpg")
            // UIImage(named: "earthmap1k.jpg")
               
         eNode.geometry?.firstMaterial?.specular.contents =
            UIImage(named: "EarthySpecular2k.tif")
            //UIColor.lightGray
        
        eNode.geometry?.firstMaterial?.normal.contents = UIImage(named: "Normal")
        
        // eNode.geometry?.firstMaterial?.multiply.contents = UIColor.red
        // eNode.geometry?.firstMaterial?.shininess = 50
        // eNode.geometry?.firstMaterial?.transparency = 0.8 // dim lighter ones
        
        scene.rootNode.addChildNode(eNode)
          
        let rotation = SCNAction.rotate(by: -90 * CGFloat(M_PI / 180.0), around: SCNVector3(x: 2, y: 1, z: 1) , duration: 3)
                                //  SCNVector3(x: 0, y: 1, z: 1)
        
        let repetitveRotation = SCNAction.repeatForever(rotation)
        eNode.runAction(repetitveRotation)

        // MARK: - Separator
        
        let customNode = SCNNode()
        
        customNode.geometry = SCNPlane(width: 1, height: 1)
            
        customNode.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        customNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        
   //   scene.rootNode.addChildNode(customNode)
        
        customNode.runAction(repetitveRotation)
        
        
        
        // MARK: - Shapes haha

        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 1, y: 1))
        bezierPath.addLine(to: CGPoint(x: 2, y: 0))
        bezierPath.addLine(to: CGPoint(x: 1, y: -1))
        bezierPath.close()

        let shaggyShape = SCNShape(path: bezierPath, extrusionDepth: 0.2)

        let boxyBox = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.77) // with cyan diffuse & white specular
        let torusDonut = SCNTorus(ringRadius: 1, pipeRadius:  0.5 )

        let periPyramid = SCNPyramid(width: 1, height: 1, length: 1) // around y
        let textyText = SCNText(string: "Apple", extrusionDepth: 5) // around y

        let coneyCone = SCNCone(topRadius: 0, bottomRadius: 1, height:  2)
        let sifySphere = SCNSphere(radius: 1)
        let capsyCapsule = SCNCapsule(capRadius: 0.5, height: 2 )
        let cilyCylinder = SCNCylinder(radius: 10, height: 2)
        let plainPlane = SCNPlane(width: 1, height: 1)

        let tubyTube = SCNTube(innerRadius: 0.8, outerRadius: 1, height: 1)

    }
}
     
//  let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.7))



// import PlaygroundSupport
// import XCPlayground

// PlaygroundPage.current.liveView = MyViewController()
    
 
