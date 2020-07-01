//
//  Place.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

public struct Place:Decodable, Equatable  {
    
    public enum CodingKeys: String, CodingKey {
        case Adress = "formatted_address"
        case icon
        case geometry
        case id
        case name
        case PriceLevel = "price_level"
        case Rating = "rating"
        case Types = "types"
        case UserRatingsTotal = "user_ratings_total"
        case photos
    }
    
    public let Adress: String?
    public let icon: String?
    public let geometry: Geometry?
    public let id: String?
    public let name: String?
    public let PriceLevel: Int?
    public let Types: [String]?
    public let Rating: Double?
    public let UserRatingsTotal: Int?
    public let photos: [Photos]?
    
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

