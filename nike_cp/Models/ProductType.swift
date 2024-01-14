//
//  ProductType.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation

class ProductType: Identifiable, CustomStringConvertible, Codable, Equatable {
    static func == (lhs: ProductType, rhs: ProductType) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: UInt64
    var name: String
        
    init(id: UInt64, name: String) {
        self.id = id
        self.name = name
    }
    
    var description: String {
        return self.name
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case product_type_id
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UInt64.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .product_type_id)
    }
}

