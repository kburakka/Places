//
//  Geometry.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

public struct Geometry: Decodable, Equatable {
    
    public let location: Location?

    public enum CodingKeys: String, CodingKey {
                case location
    }
}
