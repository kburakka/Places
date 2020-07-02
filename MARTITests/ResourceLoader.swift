//
//  ResourceLoader.swift
//  MARTITests
//
//  Created by burak kaya on 01/07/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import Foundation
@testable import MARTI

class ResourceLoader {
    static func loadSearch() throws -> Search?{
        if let path = Bundle.test.path(forResource: "search", ofType: "json"){
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let decoder = JSONDecoder()
                  let search = try decoder.decode(Search.self, from: data)
                return search
 
        }else{
            return nil
        }
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
