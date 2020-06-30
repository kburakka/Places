//
//  PlaceListPresenter.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

final class PlaceListPresenter: PlaceListPresenterProtocol{

    private unowned let view: PlaceListViewProtocol
    private let interactor: PlaceListInteractorProtocol
    private let router: PlaceListRouterProtocol

    init(view: PlaceListViewProtocol,
          interactor: PlaceListInteractorProtocol,
          router: PlaceListRouterProtocol) {
         self.view = view
         self.interactor = interactor
         self.router = router
         
         self.interactor.delegate = self
    }
        
//    func load() {
//        view.handleOutput(.updateTitle("Places"))
////        interactor.load()
//    }
    
    func searchPlace(searchText: String) {
        interactor.searchPlace(searchText: searchText)
    }
    
    func selectPlace(at index: Int) {
        interactor.selectPlace(at: index)
    }
}

extension PlaceListPresenter: PlaceListInteractorDelegate{
    func handleOutput(_ output: PlaceListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showPlaceList(let places):
            view.handleOutput(.showPlaceList(places))
        case .showPlaceDetail(let place):
            router.navigate(to: .detail(place))                
        }
    }
}
