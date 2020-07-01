//
//  MapBuilder.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit

final class MapBuilder {
    
    static func make(with place: Place) -> MapViewController {
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        let router = MapRouter(view: view)
        let presenter = MapPresenter(view: view, place: place, router: router)
        view.presenter = presenter
        return view
    }
}
