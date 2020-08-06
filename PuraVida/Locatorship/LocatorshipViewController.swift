//
//  LocatorshipViewController.swift
//  PuraVida
//
//  Created by Jerry Ren on 7/31/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation

// API_key from LocatorShipPuraVida on Google Cloud platform:
// AIzaSyCXFHtBl4qVSFV1zS7Kyct0pbGFB8qE7hc

// https://www.raywenderlich.com/7363101-google-maps-ios-sdk-tutorial-getting-started
// useful link, keep following on the weekend to see where it goes

class LocatorshipViewController: UIViewController {
    
    let locatorManager = CLLocationManager()
    let gooMarker = GMSMarker()
    
    // MARS: - 
    @IBOutlet weak var gmsMapView: GMSMapView!
       
    var locationHandler: LocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locatorManager.delegate = self
        locatorManager.requestWhenInUseAuthorization()
        locatorManager.requestLocation()
        
        
  //      goomPinPointer(lati: 21, longti: -157, title: "Honululu", snippet: "Volcanoe")
        
        // MARS: -
        
        //     settingUpLocationHandler()
    }
    
    func goomPinPointer(lati: Double, longti: Double, title: String, snippet: String) {
        
        let birdsEyeCamera = GMSCameraPosition.camera(withLatitude: lati, longitude: longti, zoom: 6.0)
        
        let gooMapView = GMSMapView.map(withFrame: self.view.frame, camera: birdsEyeCamera)
        self.view.addSubview(gooMapView)

        gooMarker.position = CLLocationCoordinate2D(latitude: lati, longitude: longti)
        
        gooMarker.title = title
        gooMarker.snippet = snippet
        
        gooMarker.map = gooMapView
    }
}


extension LocatorshipViewController {
    
    func settingUpLocationHandler() {
        
        _ = LocationManager.shared
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "LocaError"), object: nil, queue: .main) { (notific) in
            print(notific.description)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "NewLocationReceived"), object: nil, queue: .main) { (notific) in
            print(notific)
            print(notific.description)
        }
        
        print("setting up called")
    }
}

// MARK: - CLLocationManagerDelegate

extension LocatorshipViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        if let currentLoca = locations.last {
            locatorManager.stopUpdatingLocation()
            let lati = currentLoca.coordinate.latitude
            let longti = currentLoca.coordinate.longitude
            
            print("latitude is, longtitude is")
            print(lati, longti)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
          return
        }
        
        locatorManager.startUpdatingLocation()
        
        gmsMapView.isMyLocationEnabled = true
        gmsMapView.settings.myLocationButton = true

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // call stopupdatingocatioons?
        print("did fail with error called")
    }
}


// singleton pattern

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager.init()
    private var locationHandler: CLLocationManager?
    
    private override init() { // private or not?
        super.init()
        initializingLocationHandler()
    }
    
    func initializingLocationHandler() {
        locationHandler = CLLocationManager.init()
        locationHandler?.delegate = self
        locationHandler?.requestAlwaysAuthorization()
        locationHandler?.startUpdatingLocation()
        
        print("initializing called")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NewLocationReceived"), object: nil, userInfo: ["location" : locations.last])
        
        print(locations.last)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LocationError"), object: nil, userInfo: ["error": error])
    }
}
