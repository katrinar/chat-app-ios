//
//  CTPlace.swift
//  chat-ios
//
//  Created by Katrina Rodriguez on 6/7/16.
//  Copyright © 2016 Kat. All rights reserved.
//

import UIKit
import MapKit

class CTPlace: NSObject, MKAnnotation {
    
    var name: String!
    var city: String!
    var state: String!
    var address: String!
    var zip: String!
    var lat: Double!
    var lng: Double!
    
    
    func populate(placeInfo: Dictionary<String, AnyObject>){
//        if let _name = placeInfo["name"] as? String {
//            self.name = _name
//        }
//        
//        if let _city = placeInfo["city"] as? String {
//            self.city = _city
//        }
//        
//        if let _state = placeInfo["state"] as? String {
//            self.state = _state
//        }
//        
//        if let _address = placeInfo["address"] as? String {
//            self.address = _address
//        }
//        
//        if let _zip = placeInfo["zip"] as? String {
//            self.zip = _zip
//        }
        
        let keys = ["name", "city", "state", "address", "zip"]
        for key in keys {
            let value = placeInfo[key]
            self.setValue(value, forKey: key)
        }
        
        if let _geo = placeInfo["geo"] as? Array<Double> {
            self.lat = _geo[0]
            self.lng = _geo[1]
        }
    }
    
        // MARK: - MKAnnotation Overrides
        var title: String? {
            return self.name
        }
        
        var subtitle: String? {
            return self.address
        }
        
        var coordinate: CLLocationCoordinate2D {
            return CLLocationCoordinate2DMake(self.lat, self.lng)
        }
}
