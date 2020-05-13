//
//  MappyViewControl.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/10/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import MapKit
import UIKit

class MappyViewController: UIViewController {
    
    var camera: MKMapCamera?
    let distance: CLLocationDistance = 1200
    let heading = 45.0
    let pitch: CGFloat = 40.0
    
    
    @IBOutlet weak var mappyMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mappyMapView.mapType = .satelliteFlyover
        let coordiantes = empireState
            // CLLocationCoordinate2D(latitude: 25.1412, longitude: 55.1852)
        camera = MKMapCamera(lookingAtCenter: coordiantes, fromDistance: distance, pitch: pitch, heading: heading)
        
        if let unwrappedCamera = camera {
            mappyMapView.camera = unwrappedCamera
        }
    }
    
    
    @IBAction func leftRotation(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.camera!.heading -= 20
            self.mappyMapView.camera = self.camera! // force unwrapp alert
        }
    }
    
    @IBAction func rightRotation(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.camera?.heading += 20
            self.mappyMapView.camera = self.camera!
        }
    }
    
}



// mapView.isZoomEnabled = false
//mapView.isScrollEnabled = false
//mapView.isUserInteractionEnabled = false
