//
//  PlaceListRouter.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation
import UIKit

final class PlaceListRouter : PlaceListRouterProtocol{
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: PlaceListRoute) {
        switch route {
        case .showOnMap(let place):
            let detailView = MapBuilder.make(with: place)
            view.show(detailView, sender: nil)
        }
    }
}
