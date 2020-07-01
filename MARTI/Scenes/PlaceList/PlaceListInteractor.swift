//
//  PlaceListInteractor.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

final class PlaceListInteractor : PlaceListInteractorProtocol{

    var delegate: PlaceListInteractorDelegate?
    private var places: [Place] = []
    private let service: APIClientProtocol
    
    init(service: APIClientProtocol) {
        self.service = service
    }
    
    func searchPlace(searchText: String) {
        fetchPlaceList(searchText: searchText)
    }
    
    
    func selectPlace(at index: Int) {
        let place = places[index]
        delegate?.handleOutput(.showPlaceDetail(place))
    }
    
    func fetchPlaceList(searchText: String){
        delegate?.handleOutput(.setLoading(true))
        service.getPlaceList(searchText :searchText){ [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            switch result {
            case .success(let placeList):
                self.places = placeList.results ?? []
                self.delegate?.handleOutput(.showPlaceList(placeList))
            case .failure(let error):
                print(error)
            case .none:
                print("fail")
            }
        }
    }
    
    
}
