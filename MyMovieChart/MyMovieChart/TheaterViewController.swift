//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by Park Jae Han on 26/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng) // 중심위치
        let regionRadius: CLLocationDistance = 100 // 표현 거리
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        self.map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        self.map.addAnnotation(point)
    }
    
}
