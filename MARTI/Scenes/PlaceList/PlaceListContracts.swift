//
//  PlaceListContracts.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Interactor
protocol PlaceListInteractorProtocol: class {
    var delegate: PlaceListInteractorDelegate? { get set }
    func selectPlace(at index: Int)
    func searchPlace(searchText: String)
}

enum PlaceListInteractorOutput {
    case setLoading(Bool)
    case showPlaceList(Search)
    case showPlaceDetail(Place)
    case showError(Error)
}

protocol PlaceListInteractorDelegate: class {
    func handleOutput(_ output: PlaceListInteractorOutput)
}


// MARK: - Presenter
protocol PlaceListPresenterProtocol: class {
    func selectPlace(at index: Int)
    func searchPlace(searchText: String)
}

enum PlaceListPresenterOutput {
    case setLoading(Bool)
    case showPlaceList(Search)
    case showError(Error)
}


// MARK: - View
protocol PlaceListViewProtocol: class {
    func handleOutput(_ output: PlaceListPresenterOutput)
}


// MARK: - Router
enum PlaceListRoute{
    case showOnMap(Place)
}

protocol PlaceListRouterProtocol: class {
    func navigate(to route: PlaceListRoute)
}
