//
//  ProductType.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation

class ProductType: Identifiable, CustomStringConvertible {
    var id: UInt64
    var name: String
        
    init(id: UInt64, name: String) {
        self.id = id
        self.name = name
    }
    
    var description: String {
        return self.name
    }
}

