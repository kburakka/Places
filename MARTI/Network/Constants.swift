//
//  Constants.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation
import Alamofire
protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
}

struct ProductionServer {
    static var apiKey = "AIzaSyDtWTD73OjF9TnWRsz8r8lIwzByU1qGDpc"
    static let baseURL = "https://maps.googleapis.com/maps/api/place/textsearch/json?key=\(apiKey)"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
