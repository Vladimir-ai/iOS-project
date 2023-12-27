//
//  ShopAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 18.12.2023.
//

import Foundation
import SwiftUI

class ShopStubAPI: StubAPI, ShopProto {
    static let sharedAPIInstance = ShopStubAPI()
    
    static private let recomendationList = [
        Category(id: 0, name: "Best Sellers", photo: Image("ImageBestSellers")),
        Category(id: 1, name: "Featured in Nike Air", photo: Image("ImageFeaturedInNikeAir")),
        Category(id: 2, name: "New Running Essentials", photo: Image("ImageNewRunningEssentials"))
    ]
    
    static private let commonRecomendations = [
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
    
    private override init() {}
        
    func getAllCategoriesByUserID(userInfo: UserInfo) async -> [Category] {
        await super.waitBeforeReturn()
        return ShopStubAPI.recomendationList
    }
    
    
    func getCommonCategoriesByGender(gender: String) async -> [Category] {
        await super.waitBeforeReturn()
        assert(ShopStubAPI.commonRecomendations.keys.contains(gender))
        return ShopStubAPI.commonRecomendations[gender].unsafelyUnwrapped
    }
    
    // Gender should be included into ID
    func getSubcategoriesByCategoryID(userID: UInt64, categoryID: UInt64) async -> [SubCategory] {
        await super.waitBeforeReturn()
        // Ignore -- its just stub
        return [SubCategory(id: 0, name: "All shoes"),
                SubCategory(id: 1, name: "Jordan"),
                SubCategory(id: 2, name: "Running"),
                SubCategory(id: 3, name: "Football"),
                SubCategory(id: 4, name: "Basketball")]
    }
    
    // Gender should be included into ID
    func getProductTypesByCategoryID(userID: UInt64, subCategoryID: UInt64) async -> [ProductType] {
        //TODO: Add code
        return []
    }
    
    // Gender should be included into ID
    func getProductPreviewsByProductTypeID(userID: UInt64, productTypeID: UInt64) async -> [ProductType] {
        //TODO: Add code
        return []
    }
    
    func getFullProductInfo(userID: UInt64, productID: UInt64) async -> Product {
        // TODO: Add code
        return Product(id: 0, name: "a", price: 0, shortDescription: "a", liked: false, photos: [Image("kidsSale")], fullDescription: "AAA", sizes: [Size(type: "EU", size: 10)])
    }

    func searchProducts(userID: UInt64, searchPattern: String, categoryID: UInt64!) async -> [ProductPreview] {
        // TODO: Add code
        return []
    }
}
