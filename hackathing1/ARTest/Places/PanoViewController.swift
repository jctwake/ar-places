//
//  PanoViewController.swift
//  ARTest
//
//  Created by Josh Thomas on 1/7/18.
//
//

import UIKit
import GoogleMaps
import CoreMotion

class PanoViewController: UIViewController {
  
  open var coordinate: CLLocationCoordinate2D?
  open var markerTitle: String?
  
  var motionManager: CMMotionManager!
  
  override func loadView() {
    let panoView = GMSPanoramaView(frame: .zero)
    panoView.camera = GMSPanoramaCamera(heading: 0, pitch: 0, zoom: 1)
    self.view = panoView
    
    panoView.moveNearCoordinate(coordinate!)
    let marker = GMSMarker(position: coordinate!)
    marker.panoramaView = panoView
    marker.title = markerTitle
    
    motionManager = CMMotionManager()
    
    //This code was from stackoverflow   https://stackoverflow.com/questions/34326694/google-street-view-rotate-camera-with-device-gyroscope
    if motionManager.isGyroAvailable {
      motionManager.startGyroUpdates(to: OperationQueue.main, withHandler: { (gyroData: CMGyroData?, error: Error?) in
        let y = gyroData!.rotationRate.y
        print("gyrodata: \(y)")
        let cameraUpdate = GMSPanoramaCameraUpdate.rotate(by: -CGFloat((gyroData?.rotationRate.y)!))
        panoView.updateCamera(cameraUpdate, animationDuration: 0)
      })
    }
    
    
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
