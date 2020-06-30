//
//  PlaceListBuilder.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit

final class PlaceListBuilder {
    
    static func make() -> PlaceListViewController {
        let storyboard = UIStoryboard(name: "PlaceList", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PlaceListViewController") as! PlaceListViewController
        let router = PlaceListRouter(view: view)
        let interactor = PlaceListInteractor(service: app.service)
        let presenter = PlaceListPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        return view
    }
}
