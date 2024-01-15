//
//  Subcategory.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation

struct SubCategory: Identifiable, Codable {
    var id: UInt64
    var name: String
        
    init(id: UInt64, name: String) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case subcategory_id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UInt64.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .subcategory_id)
    }
}
