//
//  APIClient.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Alamofire
import PromiseKit

public protocol APIClientProtocol {
    func getPlaceList(searchText : String)-> Promise<Search?>
}

class APIClient: APIClientProtocol {    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
  
    private func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder()) -> Promise<T?>{
        return Promise(){ resolver in
            Alamofire.request(route).responseData { (response) in
                switch response.result{
                case .success(let data):
                    do{
                        let tDecoded = try decoder.decode(T.self, from: data)
                        resolver.fulfill(tDecoded)
                    }catch{
                        resolver.reject(Error.serializationError(internal: error))
                    }
                case .failure(let error):
                    resolver.reject(Error.networkError(internal: error))
                }
            }
        }
    }
    
    func getPlaceList(searchText : String)-> Promise<Search?>{
       return performRequest(route: APIRouter.search(text: searchText))
    }
}
