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
        
        service.getPlaceList(searchText: searchText)
            .done { (search) in
                self.delegate?.handleOutput(.setLoading(false))
                if let search = search{
                    self.places = search.results ?? []
                    self.delegate?.handleOutput(.showPlaceList(search))
                }
        }.catch { (error) in
            self.delegate?.handleOutput(.setLoading(false))
            self.delegate?.handleOutput(.showError(error))
        }
    }
}
