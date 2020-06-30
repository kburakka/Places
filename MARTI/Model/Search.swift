//
//  File.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation

public final class Search: NSObject,Decodable {
    
    let status: String?
    let results: [Place]?

    init(status: String, results: [Place]) {
        self.status = status
        self.results = results

        super.init()
    }
    
//    override public func isEqual(_ object: Any?) -> Bool {
//        guard let other = object as? Search else { return false }
//        return self.results == other.results && self.status == other.status
//    }
}
