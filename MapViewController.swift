//
//  MapViewController.swift
//  MMHS_Colleges
//
//  Created by Mobile Makers Academy on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textField: UITextField!

    var college : College!
    var colleges : [College]!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        spanToLocation(college.location)

        textField.delegate = self

        navigationItem.title = college.name

        for object in colleges
        {
            setAnnotation(object)
        }
    }

    func spanToLocation(location: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if error
            {
                println(error.localizedDescription)
            }
            else
            {
                let placemark = placemarks[0] as CLPlacemark
                self.mapView.centerCoordinate = placemark.location.coordinate
                self.mapView.region.span = MKCoordinateSpanMake(1.0, 1.0)
            }
            })
    }

    func setAnnotation(object: College)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(object.location, completionHandler: {placemarks, error in
            if error
            {
                println(error.localizedDescription)
            }
            else
            {
                let placemark = placemarks[0] as CLPlacemark
                let annotation = MKPointAnnotation()
                annotation.coordinate = placemark.location.coordinate
                annotation.title = object.name
                self.mapView.addAnnotation(annotation)
            }
            })
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        spanToLocation(textField.text)
        textField.resignFirstResponder()
        return true
    }
}
