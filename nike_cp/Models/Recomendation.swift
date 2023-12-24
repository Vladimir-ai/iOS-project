//
//  RecomendationList.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import Foundation
import SwiftUI

struct Recomendation: Identifiable {
    var id: UInt64
    var name: String
    var photo: Image
    
    private static let shopConnection = ShopAPI()
    
    init(id: UInt64, name: String, photo: Image) {
        self.id = id
        self.name = name
        self.photo = photo
    }
    
    static func getAllRecomendationByUserInfo(user: UserInfo) async -> [Recomendation] {
        return await shopConnection.getAllRecomendations(userID: user.usrID)
    }
}

