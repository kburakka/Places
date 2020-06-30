//
//  Place.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

final class Place: Decodable {
    
    let formatted_address: String?
    let icon: String?
    let geometry: Geometry?
    let id: String?
    let name: String?
    let place_id: String?
    let price_level: Int?
    let rating: Double?
    let types: [String]?
    let user_ratings_total: Int?
//    
//    init(formatted_address: String, icon: String,geometry: Geometry, id: String, name:String, place_id: String, price_level: Int,rating: Double, types: [String], user_ratings_total: Int) {
//        self.formatted_address = formatted_address
//        self.icon = icon
//        self.geometry = geometry
//        self.id = id
//        self.name = name
//        self.place_id = place_id
//        self.price_level = price_level
//        self.rating = rating
//        self.types = types
//        self.user_ratings_total = user_ratings_total
//        super.init()
//    }
//    
//    override func isEqual(_ object: Any?) -> Bool {
//        guard let other = object as? Place else { return false }
//        return self.formatted_address == other.formatted_address && self.icon == other.icon && self.geometry == other.geometry && self.id == other.id  && self.name == other.name && self.place_id == other.place_id && self.price_level == other.price_level && self.types == other.types && self.user_ratings_total == other.user_ratings_total
//    }
}
