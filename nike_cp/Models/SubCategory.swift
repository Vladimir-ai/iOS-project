//
//  Subcategory.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation

struct SubCategory: Identifiable {
    var id: UInt64
    var name: String
        
    init(id: UInt64, name: String) {
        self.id = id
        self.name = name
    }
}
