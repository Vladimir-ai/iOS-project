//
//  ShopAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 18.12.2023.
//

import Foundation
import SwiftUI

class ShopAPI: StubAPI {
    static let recomendationList = [
        Recomendation(id: 0, name: "Best Sellers", photo: Image("ImageBestSellers")),
        Recomendation(id: 1, name: "Featured in Nike Air", photo: Image("ImageFeaturedInNikeAir")),
        Recomendation(id: 2, name: "New Running Essentials", photo: Image("ImageNewRunningEssentials"))
    ]
    
    func getAllRecomendations(userID: UInt64) async -> [Recomendation] {
        await super.waitBeforeReturn()
        return ShopAPI.recomendationList
    }
    
    
    func getProductPreviewListByRecomendataionId(id: UInt64) async -> [ProductPreview] {
        await super.waitBeforeReturn()
        return [
            ProductPreview(id: 0,
                           name: ShopAPI.recomendationList[Int(id)].name,
                           photos: [ShopAPI.recomendationList[Int(id)].photo])]
    }
}
