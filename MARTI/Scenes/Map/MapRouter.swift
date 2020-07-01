//
//  MapRouter.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit

final class MapRouter : MapRouterProtocol{
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MapRoute) {
        switch route {
        case .showDetail(let place):
            let detailView = PlaceDetailBuilder.make(with: place)
            view.show(detailView, sender: nil)
        }
    }
}
