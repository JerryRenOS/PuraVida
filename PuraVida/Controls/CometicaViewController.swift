//
//  CometicaViewController.swift
//  PuraVida
//
//  Created by Jerry Ren on 8/11/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Comets

class CometicaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        cometicaSetUp()
        view.backgroundColor = .black
    }
    
    func cometicaSetUp() {

        let width = view.bounds.width
        let height = view.bounds.height
        let comets = [Comet(startPoint: CGPoint(x: 200, y: 0),
                            endPoint: CGPoint(x: 0, y: 200),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink),
                      Comet(startPoint: CGPoint(x: 0.4 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.8 * width),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink),
                      Comet(startPoint: CGPoint(x: 0.8 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.2 * width),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink),
                      Comet(startPoint: CGPoint(x: width, y: 0.2 * height),
                            endPoint: CGPoint(x: 0, y: 0.25 * height),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink),
                      Comet(startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                            endPoint: CGPoint(x: 0.6 * width, y: height),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink),
                      Comet(startPoint: CGPoint(x: width - 100, y: height),
                            endPoint: CGPoint(x: width, y: height - 100),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink),
                      Comet(startPoint: CGPoint(x: 0, y: 0.8 * height),
                            endPoint: CGPoint(x: width, y: 0.75 * height),
                            lineColor: UIColor.systemPink.withAlphaComponent(0.2),
                            cometColor: UIColor.systemPink)]

        for comet in comets {
            view.layer.addSublayer(comet.drawLine())
            view.layer.addSublayer(comet.animate())
        }
        
        
    }
    


}
