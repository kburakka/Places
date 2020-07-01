//
//  Helper.swift
//  MARTI
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

class Helper{
    static func unwrap<T>(_ any: T) -> Any
    {
        let mirror = Mirror(reflecting: any)
        guard mirror.displayStyle == .optional, let first = mirror.children.first else {
            return any
        }
        return first.value
    }
    
    static func formatTypes(types: [String]) -> String
    {
        var result = types.joined(separator: ", ")
        result = result.replacingOccurrences(of: "_", with: " ").capitalized

        return result
    }
}
