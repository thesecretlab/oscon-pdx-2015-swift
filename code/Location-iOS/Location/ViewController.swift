//
//  ViewController.swift
//  Location
//
//  Created by Jon Manning on 23/06/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var altitude: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        // requesting permission to use the location services
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
        {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let newLocation = locations.last as? CLLocation
        {
            self.latitude.text = String(format: "%.2f", newLocation.coordinate.latitude)
            self.longitude.text = String(format: "%.2f", newLocation.coordinate.longitude)
            self.altitude.text = String(format: "%.2f", newLocation.altitude)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

