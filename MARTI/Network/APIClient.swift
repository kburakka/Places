//
//  APIClient.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Alamofire

public protocol APIClientProtocol {
    func getPlaceList(searchText : String, completion:@escaping (Result<Search, AFError>?) -> Void)
}
class APIClient: APIClientProtocol {

    @discardableResult
    private func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    func getPlaceList(searchText : String, completion:@escaping (Result<Search, AFError>?)->Void) {
        performRequest(route: APIRouter.search(text: searchText), completion: completion)
    }

}


