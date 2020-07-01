//
//  PlaceDetailBuilder.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit

final class PlaceDetailBuilder {
    
    static func make(with place: Place) -> PlaceDetailViewController {
        let storyboard = UIStoryboard(name: "PlaceDetail", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PlaceDetailViewController") as! PlaceDetailViewController
        let presenter = PlaceDetailPresenter(view: view, place: place)
        view.presenter = presenter
        return view
    }
}
