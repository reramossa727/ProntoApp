//
//  MapViewController.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class MapViewController: BaseViewController, CLLocationManagerDelegate   {
    
    var mapView:GMSMapView?
    var coordinator: MapCoordinator?
    var viewModel: MapViewModel!
    var locationManager:CLLocationManager! = CLLocationManager.init()
    var listRest: [Results]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar("Mapa")
        
        let camera = GMSCameraPosition.camera(withLatitude: 19.411036, longitude: -99.174402, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView?.isMyLocationEnabled = true
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        listRest?.forEach{
            if let lat = $0.geometry?.location?.lat, let long = $0.geometry?.location?.lng {
                
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
                marker.title = $0.name
                marker.snippet = $0.formatted_address
                marker.tracksInfoWindowChanges = true
                marker.map = mapView
                
            }
        }
        
    }
    
    
    override func observe() {
        
        viewModel.listRestaurant.asObservable().bind { [weak self] (listRest) in
            self?.listRest = listRest
            }.disposed(by: disposeBag)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 12.0)
        self.mapView?.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
        
    }

}
