//
//  APIRouter.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case search(text :String)
    case placeDetail(id: String)
    case photo(photoreference: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        case .placeDetail:
            return .get
        case .photo:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .search(let text):
            return "&query=\(text)"
        case .placeDetail(let id):
            return "&i=\(id)"
        case .photo(let photoreference):
            return "&photoreference=\(photoreference)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = ProductionServer.searchUrl + path
        print(urlString)
        let url = try urlString.asURL()

        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        return urlRequest
    }
}
