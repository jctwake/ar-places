//
//  PanoViewController.swift
//  ARTest
//
//  Created by Josh Thomas on 1/7/18.
//
//

import UIKit
import GoogleMaps

class PanoViewController: UIViewController {
  
  open var coordinate: CLLocationCoordinate2D?
  open var markerTitle: String?
  
  override func loadView() {
    let panoView = GMSPanoramaView(frame: .zero)
    self.view = panoView
    
    panoView.moveNearCoordinate(coordinate!)
    let marker = GMSMarker(position: coordinate!)
    marker.panoramaView = panoView
    marker.title = markerTitle
    
    let button = UIButton(frame: CGRect(x: 5, y: 5, width: 100, height: 50))
    button.backgroundColor = .gray
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.textAlignment = .center
    button.setTitle("Back", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
    self.view.addSubview(button)
    
  }
  
  func buttonAction(sender: UIButton!) {
    self.dismiss(animated: true, completion: nil)
  }
  
}
