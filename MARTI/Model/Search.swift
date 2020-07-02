//
//  File.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

public struct Search: Decodable, Equatable{
    
    public enum CodingKeys: String, CodingKey {
                case status
                case results
    }
    
    public let status: String?
    public let results: [Place]?
}
