//
//  AnnotationView.swift
//  ARTest
//
//  Created by Josh Thomas on 1/7/18.
//
//

import UIKit

protocol AnnotationViewDelegate {
  func didTouch(annotationView: AnnotationView)
}

class AnnotationView: ARAnnotationView {
  
  var titleLabel: UILabel?
  var distanceLabel: UILabel?
  var delegate: AnnotationViewDelegate?
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    loadUI()
  }
  
  func loadUI() {
    titleLabel?.removeFromSuperview()
    distanceLabel?.removeFromSuperview()
    
    let label = UILabel(frame: CGRect(x: 10, y: 0, width: self.frame.size.width, height: 30))
    label.font = UIFont.systemFont(ofSize: 16)
    label.numberOfLines = 0
    label.backgroundColor = UIColor(white: 0.4, alpha: 0.8)
    label.textColor = UIColor.white
    self.addSubview(label)
    self.titleLabel = label
    
    distanceLabel = UILabel(frame: CGRect(x: 10, y: 30, width: self.frame.size.width, height: 20))
    distanceLabel?.font = UIFont.systemFont(ofSize: 12)
    distanceLabel?.backgroundColor = UIColor(white: 0.4, alpha: 0.8)
    distanceLabel?.textColor = UIColor.green
    self.addSubview(distanceLabel!)
    
    if let annotation = annotation as? Place {
      titleLabel?.text = annotation.placeName
      distanceLabel?.text = String(format: "%.2f m", annotation.distanceFromUser)
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel?.frame = CGRect(x: 10, y: 0, width: self.frame.size.width, height: 30)
    distanceLabel?.frame = CGRect(x: 10, y: 30, width: self.frame.size.width, height: 20)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    delegate?.didTouch(annotationView: self)
  }
  
}
