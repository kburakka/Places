//
//  MapViewController.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController,MapViewProtocol,GMSMapViewDelegate {
    
    var presenter: MapPresenter!
    var addedPlace: Place?
    @IBOutlet weak var mapview: GMSMapView!
    func addMarker(_ presentation: Place) {
        guard let lat = presentation.geometry?.location?.lat, let lng = presentation.geometry?.location?.lng else { return }
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.map = mapview
        
        let cameraPosition = GMSCameraPosition.camera(withLatitude:lat, longitude:lng, zoom: 15.0)
        
        mapview.animate(to: cameraPosition)
        addedPlace = presentation
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let place = addedPlace{
            presenter.selectMarker(place: place)
        }
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
}
