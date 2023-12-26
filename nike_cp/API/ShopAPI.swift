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
        Category(id: 0, name: "Best Sellers", photo: Image("ImageBestSellers")),
        Category(id: 1, name: "Featured in Nike Air", photo: Image("ImageFeaturedInNikeAir")),
        Category(id: 2, name: "New Running Essentials", photo: Image("ImageNewRunningEssentials"))
    ]
    
    static let commonRecomendations = [
        "Men": [Category(id: 3, name: "New & Featured", photo: Image("menFeatured")),
                Category(id: 4, name: "Clothing", photo: Image("menClothing")),
                Category(id: 5, name: "Shoes", photo: Image("menShoes")),
                Category(id: 6, name: "Accescories and Equipment", photo: Image("menEquipment")),
                Category(id: 7, name: "Sale & Offers", photo: Image("menSale"))],
        "Women": [Category(id: 8, name: "New & Featured", photo: Image("womenFeatured")),
                  Category(id: 9, name: "Clothing", photo: Image("womenClothing")),
                  Category(id: 10, name: "Shoes", photo: Image("womenShoes")),
                  Category(id: 11, name: "Accescories and Equipment", photo: Image("womenEquipment")),
                  Category(id: 12, name: "Sale & Offers", photo: Image("womenSale"))],
        "Kids": [Category(id: 13, name: "New & Featured", photo: Image("kidsFeatured")),
                 Category(id: 14, name: "Clothing", photo: Image("kidsClothing")),
                 Category(id: 15, name: "Shoes", photo: Image("kidsShoes")),
                 Category(id: 16, name: "Accescories and Equipment", photo: Image("kidsEquipment")),
                 Category(id: 17, name: "Sale & Offers", photo: Image("kidsSale"))]
    ]
    
    func getAllRecomendations(userInfo: UserInfo) async -> [Category] {
        await super.waitBeforeReturn()
        return ShopAPI.recomendationList
    }
    
    
    func getCommonRecomendationsByGender(gender: String) async -> [Category] {
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
