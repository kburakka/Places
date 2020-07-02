//
//  PlaceListInteractor.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation
import PromiseKit

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
        if places.count > index{
            let place = places[index]
            delegate?.handleOutput(.showPlaceDetail(place))
        }
    }
    
    func fetchPlaceList(searchText: String){
        delegate?.handleOutput(.setLoading(true))
        
        firstly{
            service.getPlaceList(searchText: searchText)
        }.ensure {
            self.delegate?.handleOutput(.setLoading(false))
        }.map { (search) in
            self.delegate?.handleOutput(.showPlaceList(search))
            self.places = search.results ?? []
        }.catch { (error) in
            self.delegate?.handleOutput(.showError(error))
        }
    }
}
