//
//  RecomendationList.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import Foundation
import SwiftUI

struct Category: Codable, Identifiable {
    var id: UInt64
    var name: String
    var photo: Image
        
    init(id: UInt64, name: String, photo: Image) {
        self.id = id
        self.name = name
        self.photo = photo
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo
        case category_id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UInt64.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        photo = try Utils.base64StringToImage(base64Str: try container.decode(String.self, forKey: .photo))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .category_id)
    }
}
