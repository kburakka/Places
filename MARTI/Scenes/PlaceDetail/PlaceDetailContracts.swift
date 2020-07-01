//
//  PlaceDetailContracts.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

protocol PlaceDetailPresenterProtocol {
    func load()
}

protocol PlaceDetailViewProtocol: class {
    func setDetail(_ place: Place)
}
