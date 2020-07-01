//
//  MapPresenter.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

final class MapPresenter: MapPresenterProtocol {
    
    unowned var view: MapViewProtocol
    private let place: Place
    
    init(view: MapViewProtocol, place: Place) {
        self.view = view
        self.place = place
    }
    
    func load() {
        view.addMarker(place)
    }
}
