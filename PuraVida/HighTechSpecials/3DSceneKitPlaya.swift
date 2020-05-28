//
//  3DSceneKitPlaya.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/26/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import SceneKit

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        

        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 370, height: 370))
        let scene = SCNScene()

        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.lightGray
        sceneView.autoenablesDefaultLighting = true
        
        // MARK: - Shapes haha
        
        // MARK: - Customized BezierPath
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 1, y: 1))
        bezierPath.addLine(to: CGPoint(x: 2, y: 0))
        bezierPath.addLine(to: CGPoint(x: 1, y: -1))
        bezierPath.close()
        
        let shaggyShape = SCNShape(path: bezierPath, extrusionDepth: 0.2)

        // MARK: ------------------------
        
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
        
        
        // MARK: - Separator
        
        let customNode = SCNNode()
        customNode.geometry = boxyBox
            
        customNode.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        customNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        scene.rootNode.addChildNode(customNode)
        
        let action = SCNAction.rotate(by: 90 * CGFloat(M_PI / 180.0), around: SCNVector3(x: 1, y: 0, z: 0) , duration: 3)
        
        let repeatAction = SCNAction.repeatForever(action )
         
        customNode.runAction(repeatAction)

        view.addSubview(sceneView)

        self.view = view
    }
}

// import PlaygroundSupport
// import XCPlayground

// PlaygroundPage.current.liveView = MyViewController()
    
 
