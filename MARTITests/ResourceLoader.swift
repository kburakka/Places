////
////  ResourceLoader.swift
////  MARTITests
////
////  Created by burak kaya on 01/07/2020.
////  Copyright © 2020 burak kaya. All rights reserved.
////
//
//import Foundation
//import MARTI
//
//class ResourceLoader {
//    
//    enum PlaceResource: String {
//        case place1
//        case place2
//        case place3
//    }
//    
//    static func loadPlace(resource: PlaceResource) throws -> Search {
//        let bundle = Bundle.test
//        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
//        let data = try Data(contentsOf: url)
//        let decoder = Decoder()
//        let movie = try decoder.decode(Search.self, from: data)
//        return movie
//    }
//}
//
//private extension Bundle {
//    class Dummy { }
//    static let test = Bundle(for: Dummy.self)
//}
