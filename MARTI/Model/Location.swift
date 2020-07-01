//
//  Location.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

public struct Location: Decodable, Equatable {
    
    public let lat: Double?
    public let lng: Double?

    public enum CodingKeys: String, CodingKey {
                    case lat
                    case lng
    }
    
//    init(lat: Double, lng: Double) {
//        self.lat = lat
//        self.lng = lng
//        super.init()
//    }
//    
//    override func isEqual(_ object: Any?) -> Bool {
//        guard let other = object as? Location else { return false }
//        return self.lat == other.lat && self.lng == other.lng
//    }
}
