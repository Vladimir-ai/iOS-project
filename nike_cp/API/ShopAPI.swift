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
    
    static let commonRecomendations = [
        "Men": [Recomendation(id: 3, name: "New & Featured", photo: Image("menFeatured")),
                Recomendation(id: 4, name: "Clothing", photo: Image("menClothing")),
                Recomendation(id: 5, name: "Shoes", photo: Image("menShoes")),
                Recomendation(id: 6, name: "Accescories and Equipment", photo: Image("menEquipment")),
                Recomendation(id: 7, name: "Sale & Offers", photo: Image("menSale"))],
        "Women": [Recomendation(id: 8, name: "New & Featured", photo: Image("womenFeatured")),
                  Recomendation(id: 9, name: "Clothing", photo: Image("womenClothing")),
                  Recomendation(id: 10, name: "Shoes", photo: Image("womenShoes")),
                  Recomendation(id: 11, name: "Accescories and Equipment", photo: Image("womenEquipment")),
                  Recomendation(id: 12, name: "Sale & Offers", photo: Image("womenSale"))],
        "Kids": [Recomendation(id: 13, name: "New & Featured", photo: Image("kidsFeatured")),
                 Recomendation(id: 14, name: "Clothing", photo: Image("kidsClothing")),
                 Recomendation(id: 15, name: "Shoes", photo: Image("kidsShoes")),
                 Recomendation(id: 16, name: "Accescories and Equipment", photo: Image("kidsEquipment")),
                 Recomendation(id: 17, name: "Sale & Offers", photo: Image("kidsSale"))]
    ]
    
    func getAllRecomendations(userInfo: UserInfo) async -> [Recomendation] {
        await super.waitBeforeReturn()
        return ShopAPI.recomendationList
    }
    
    
    func getCommonRecomendationsByGender(gender: String) async -> [Recomendation] {
        await super.waitBeforeReturn()
        assert(ShopAPI.commonRecomendations.keys.contains(gender))
        return ShopAPI.commonRecomendations[gender].unsafelyUnwrapped
    }
    
    
    func getProductPreviewListByRecomendataionId(id: UInt64) async -> [ProductPreview] {
        await super.waitBeforeReturn()
        return [
            ProductPreview(id: 0,
                           name: ShopAPI.recomendationList[Int(id)].name,
                           price: 300.300,
                           shortDescription: "Blah blah",
                           liked: false,
                           photos: [ShopAPI.recomendationList[Int(id)].photo])]
    }
}
