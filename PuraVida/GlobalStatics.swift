//
//  GlobalStatics.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/8/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
import MapKit
import Foundation

public struct GlobalStatics {
     
    static let reusableHeaders = [
        "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
        "x-rapidapi-key": "97d3dd987bmsh0f149682eeaad3dp1bc909jsn637214192f0b"
    ]
    static let universalCelloIdentifier = "celloc"
    static let mappyStoryID = "mappy"
    static let mainDotSB = "Main" 
                       
}

public var placesNamesArrayLeft = ["Statue of Liberty", "Effiel Tower", "Golden State Bridge", "Statue of Liberty", "Effiel Tower", "Golden State Bridge"]
public var placesNamesArrayRight = ["Golden State Bridge", "Statue of Liberty", "Effiel Tower", "Golden State Bridge", "Statue of Liberty", "Effiel Tower"]
public var placesPhotographsArrayLeft = ["pic-statueofLiberty.jpg", "pic-goldenState.jpg", "pic-eiffelTower.jpg", "pic-goldenState.jpg", "pic-eiffelTower.jpg", "pic-statueofLiberty.jpg"]
   
// MARK: - on-going collection of significant coordinates

var empireState = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
     
