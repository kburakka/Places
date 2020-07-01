//
//  MapContracts.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

protocol MapPresenterProtocol {
    func load()
}

protocol MapViewProtocol: class {
    func addMarker(_ presentation: Place)
}
