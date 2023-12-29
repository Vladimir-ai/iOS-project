//
//  Gender.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

struct Gender: Identifiable, CustomStringConvertible {
    let id = UUID()
    var name: String
    
    static private let allGenders = [Gender(name: "Men"), Gender(name: "Women"), Gender(name: "Kids")]
    
    private init(name: String) {
        self.name = name
    }
    
    var description: String {
        return self.name
    }
    
    static func getAllPossibleGenders() -> [Gender] {
        return allGenders
    }
}


