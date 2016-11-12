//
//  ViewController.swift
//  FillUp
//
//  Created by Siavash Baratchi on 11/6/16.
//  Copyright © 2016 Siavash Baratchi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager!
    
    //var resultSearchController:UISearchController! = nil
    var resultSearchController = UISearchController(searchResultsController: nil)

    //Map pin
    var selectedPin:MKPlacemark? = nil
    
    @IBOutlet weak var FillUpMapView: MKMapView!
    
    //Search controler

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setting up the location manager for centering map at the current location
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Centering map to the current location
        self.centerMapOnLocation(initialLocation: locationManager.location!)
        
        
        FillUpMapView.showsUserLocation = true
        self.FillUpMapView.layer.borderWidth = 5
        self.FillUpMapView.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
        
        // instantiating locationSearchTable
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController.searchResultsUpdater = locationSearchTable
        
        
        //setting locationtable map view
        locationSearchTable.mapView = FillUpMapView
        
        
        //Setting up the search bar
        let searchBar = resultSearchController.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController.searchBar
        
        
        // Navigation bar behavior
        resultSearchController.hidesNavigationBarDuringPresentation = false
        resultSearchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationSearchTable.handleMapSearchDelegate = self

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func centerMapOnLocation(initialLocation: CLLocation) {
        
        let regionRadius: CLLocationDistance = 1000

        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        FillUpMapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func GoToCurrentLocarion(_ sender: UIButton) {
        
        self.locationManager.startUpdatingLocation()
        
        self.centerMapOnLocation(initialLocation: self.locationManager.location!)

    }
    
}

extension ViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        FillUpMapView.removeAnnotations(FillUpMapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        FillUpMapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        FillUpMapView.setRegion(region, animated: true)
    }
}


