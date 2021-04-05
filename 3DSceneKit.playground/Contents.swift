//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import SceneKit
import XCPlayground

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hola at ya!"
        label.textColor = .black
        
        
        // MARK: - Add-ons
        
        let newSceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 360, height: 360))
        let newScene = SCNScene()

        newSceneView.scene = newScene

        newSceneView.backgroundColor = UIColor.gray
        newSceneView.autoenablesDefaultLighting = true

        let pyramid = SCNNode()
        pyramid.geometry = SCNPyramid(width: 1, height: 1, length: 1)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.white

        newScene.rootNode.addChildNode(pyramid)


        let supportingBox = SCNNode()
        supportingBox.position = SCNVector3(x: 0, y: -1.2, z: 0) //relative position
        supportingBox.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.3)
        supportingBox.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        pyramid.addChildNode(supportingBox)
        
        let floor = SCNNode()
        floor.position = SCNVector3(x: 0, y: 0, z: 0)
        floor.geometry = SCNFloor()
        newScene.rootNode.addChildNode(floor)
        
        
        
        // MARK: - SCNTransition
        
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 5.0

        pyramid.position = SCNVector3(x: 0, y: 2, z: -7)

        let eulerConstant = Float(30 * M_PI/180.0)

        pyramid.eulerAngles = SCNVector3(50 * eulerConstant, 26 * eulerConstant ,24 * eulerConstant)
        // 翻跟头哈哈

        SCNTransaction.commit()
        
        
        
//        let pyraRotation = SCNAction.rotate(by: -90 * CGFloat(M_PI / 180.0), around: SCNVector3(x: 2, y: 1, z: 1) , duration: 3)
//                                 //  SCNVector3(x: 0, y: 1, z: 1)
//         let pyraRotationNonStop = SCNAction.repeatForever(pyraRotation)
//
//        pyramid.runAction(pyraRotationNonStop)
        
        
        
  
        view.addSubview(newSceneView)

        
        // MARK: - Originals - untouched

        let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 370, height: 370))
        let scene = SCNScene()

        sceneView.scene = scene
        sceneView.backgroundColor = UIColor.black
        sceneView.autoenablesDefaultLighting = true
        
         
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
        
  //      view.addSubview(sceneView)

        self.view = view
        
        
        // MARK: - Separator
        
        let customNode = SCNNode()
        
        customNode.geometry = SCNPlane(width: 1, height: 1)
            
        customNode.geometry?.firstMaterial?.diffuse.contents = UIColor.cyan
        customNode.geometry?.firstMaterial?.specular.contents = UIColor.white
        
   //   scene.rootNode.addChildNode(customNode)
        
        customNode.runAction(repetitveRotation)

    }
}

PlaygroundPage.current.liveView = MyViewController()




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

