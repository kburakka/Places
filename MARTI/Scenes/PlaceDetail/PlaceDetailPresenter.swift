//
//  PlaceDetailPresenter.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

final class PlaceDetailPresenter: PlaceDetailPresenterProtocol {
    
    unowned var view: PlaceDetailViewProtocol
    private let place: Place
    
    init(view: PlaceDetailViewProtocol, place: Place) {
        self.view = view
        self.place = place
    }
    
    func load() {
        view.update(place)
    }
}
