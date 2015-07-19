//
//  AppDelegate.swift
//  Location
//
//  Created by Timothy Rodney Nugent on 8/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

// ------
// Location setup
import Cocoa
import CoreLocation

class AppDelegate: NSObject, NSApplicationDelegate,CLLocationManagerDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var longitudeLabel: NSTextField!
    @IBOutlet weak var latitudeLabel: NSTextField!
    @IBOutlet weak var accuracyLabel: NSTextField!
    
    @IBOutlet weak var spinner: NSProgressIndicator!
    
    var locationManager = CLLocationManager()

// ------
// Location applicationDidFinish
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        self.spinner.startAnimation(nil)
    }
// ------
// CLLocationManagerDelegate methods
    func locationManager(manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!)
    {
        // collecting the most recent location from the array of locations
        if let newLocation = locations.last as? CLLocation
        {
            self.longitudeLabel.stringValue = String(format: "%.2f",
                newLocation.coordinate.longitude)
            self.latitudeLabel.stringValue = String(format: "%.2f",
                newLocation.coordinate.latitude)
            self.accuracyLabel.stringValue = String(format: "%.1fm",
                newLocation.horizontalAccuracy)
            self.spinner.stopAnimation(nil);
        }
        else
        {
            println("No location found")
        }
    }
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!)
    {
        // locationManager failed to find a location
        self.longitudeLabel.stringValue = "-"
        self.latitudeLabel.stringValue = "-"
        self.accuracyLabel.stringValue = "-"
        self.spinner.stopAnimation(nil)
    }
}

