//
//  ViewController.swift
//  Xcanumner
//
//  Created by Tigran Simonyan on 1/6/18.
//  Copyright © 2018 Tigranakert. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate
{
    
    //Properties
    var userLocation: CLLocation?
    
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
        [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let currentLocation = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude)
        let region = MKCoordinateRegionMake(currentLocation, span)
        
        map.setRegion(region, animated: true)
        
        map.showsUserLocation = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            manager.startUpdatingLocation()
        }
    }

//    func getAddressUsing(coordinates location:CLLocation) {
//        let geocoder = CLGeocoder()
//
//        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
//            if error == nil {
//                let firstLocation = placemarks?[0]
//                print(firstLocation?.thoroughfare)
//            }
//        } )
//    }
    
    //Mark - IBActions
    
    @IBAction func getCurrentLocation(_ sender: UIButton) {
//        if let location = userLocation {
//            getAddressUsing(coordinates: location)
//            print(location.coordinate)
//        }
    }
    
}

