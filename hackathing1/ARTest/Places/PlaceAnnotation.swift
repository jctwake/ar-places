//
//  PlaceAnnotation.swift
//  ARTest
//
//  Created by Josh Thomas on 1/7/18.
//
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
  
  let coordinate: CLLocationCoordinate2D
  let title: String?
  
  init(location: CLLocationCoordinate2D, title: String) {
    self.coordinate = location
    self.title = title
    
    super.init()
  }
}


