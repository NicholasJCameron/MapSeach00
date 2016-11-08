//
//  ViewController.swift
//  MapSeach00
//
//  Created by Nicholas Cameron on 2016-11-07.
//  Copyright © 2016 IBM. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBookUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        forwardGeocoding(address: "423 Myrtle Streett")
        reverseGeocoding(latitude: 37.3316851, longitude: -122.0300674);
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func forwardGeocoding(address: String) {
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if error != nil {
                print(error)
                return
            }
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                print("\nlat: \(coordinate!.latitude), long: \(coordinate!.longitude)")
                if (placemark?.areasOfInterest?.count)! > 0 {
                    let areaOfInterest = placemark!.areasOfInterest![0]
                    print(areaOfInterest)
                } else {
                    print("No area of interest found.")
                }
            }
        })
    }
    
    
    
    ////Reverse geodecoding
    func reverseGeocoding(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
    let location = CLLocation(latitude: latitude, longitude: longitude)
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
    if error != nil {
    print(error)
    return
    }
    else if (placemarks?.count)! > 0 {
    let pm = placemarks![0]
    let address = ABCreateStringWithAddressDictionary(pm.addressDictionary!, false)
    print("\n\(address)")
    if (pm.areasOfInterest?.count)! > 0 {
    let areaOfInterest = pm.areasOfInterest?[0]
    print(areaOfInterest!)
    } else {
    print("No area of interest found.")
    }
    }
    })
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

