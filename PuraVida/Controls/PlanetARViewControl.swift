//
//  PlanetARViewControl.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/14/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import ARKit
import UIKit
import SceneKit


class PlanetARViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var planetARSceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        planetARSceneView.delegate = self
        planetARSceneView.showsStatistics = true

        let scene = SCNScene()

        planetARSceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        planetARSceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        planetARSceneView.session.pause()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let yourTouch = touches.first
        let location = yourTouch?.location(in: planetARSceneView)
        
        guard let unwrappedLocation = location else { return }
        let hitResults = planetARSceneView.hitTest(unwrappedLocation, types: .featurePoint)

        if let hitTestFirstResult = hitResults.first {
            let transform = hitTestFirstResult.worldTransform
            let position = SCNVector3(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
            
            let newPlanetNode = PlanetNode()
            newPlanetNode.position = position
            
            planetARSceneView.scene.rootNode.addChildNode(newPlanetNode)
 
        }
    }
    
    
    

    // MARK: - ARSCNViewDelegate

}
