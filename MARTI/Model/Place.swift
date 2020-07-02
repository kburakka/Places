//
//  Place.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

public struct Place:Decodable, Equatable {
    
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
}

