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
}
