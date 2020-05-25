//
//  TouchesBegan.swift
//  AlphaRadioactive
//
//  Created by Jerry Ren on 5/21/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
import UIKit
import ARKit
import SceneKit

extension AlphaRadioactiveViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let firstTouchLocation = firstTouch.location(in: sceneView)
            
            let hitSpots = sceneView.hitTest(firstTouchLocation, types: .existingPlaneUsingExtent)
            
            if let hitSpotsFirst = hitSpots.first {
                createDicie(atSpot: hitSpotsFirst)
            }
        }
    }
}

extension AlphaRadioactiveViewController {  // supplementing touchesBegan()
    
    func createDicie(atSpot spot: ARHitTestResult) {
        let diceyScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceyNode = diceyScene.rootNode.childNode(withName: "Dice", recursively: true) {
            diceyNode.position = SCNVector3(x: spot.worldTransform.columns.3.x ,  y: spot.worldTransform.columns.3.y + diceyNode.boundingSphere.radius, z: spot.worldTransform.columns.3.z)
            
            diceyArray.append(diceyNode)
            
            sceneView.scene.rootNode.addChildNode(diceyNode)
            
            rolling(diciNode: diceyNode)
            
        }
    }
}



extension AlphaRadioactiveViewController {
    
    func spinEveryDiciness() {
        
        if !diceyArray.isEmpty {
            for dici in diceyArray {
                rolling(diciNode: dici)
            }
        }
    }
    
    func rolling(diciNode: SCNNode) {
        let randomXro = (Float.pi/2) * Float(arc4random_uniform(4) + 1)
        let randomZro = (Float.pi/2) * Float(arc4random_uniform(4) + 1)
        let randomYro = (Float.pi/2) * Float(arc4random_uniform(4) + 1)
        // Yro only for the planets (with a button for spin)
        
        diciNode.runAction(
            SCNAction.rotateBy(x: CGFloat(7 * randomXro), y: 0,
                               z: CGFloat(7 * randomZro), duration: 0.6)
        )
    }
    
}  
