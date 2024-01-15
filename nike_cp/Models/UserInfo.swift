//
//  LoginInfo.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

struct UserInfo: Codable {
    var id: UInt64
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case user_id
        case user_name
    }
    
    init(usrID: UInt64, name: String) {
        self.id = usrID
        self.name = name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UInt64.self, forKey: .user_id)
        name = try container.decode(String.self, forKey: .user_name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .user_id)
    }
}
