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
                Category(id: 7, name: "Sale & Offers", photo: Image("menSales"))],
        "Women": [Category(id: 8, name: "New & Featured", photo: Image("womenFeatured")),
                  Category(id: 9, name: "Clothing", photo: Image("womenClothing")),
                  Category(id: 10, name: "Shoes", photo: Image("womenShoes")),
                  Category(id: 11, name: "Accescories and Equipment", photo: Image("womenEquipment")),
                  Category(id: 12, name: "Sale & Offers", photo: Image("womenSales"))],
        "Kids": [Category(id: 13, name: "New & Featured", photo: Image("kidsFeatured")),
                 Category(id: 14, name: "Clothing", photo: Image("kidsClothing")),
                 Category(id: 15, name: "Shoes", photo: Image("kidsShoes")),
                 Category(id: 16, name: "Accescories and Equipment", photo: Image("kidsEquipment")),
                 Category(id: 17, name: "Sale & Offers", photo: Image("kidsSale"))]
    ]
    
    private override init() {}
        
    func getMustHaveCategoriesByUserID(userInfo: UserInfo, gender: String) async -> [Category] {
        await super.waitBeforeReturn()
        return ShopStubAPI.recomendationList
    }
    
    func getProductTypesByMustHaveCategoryID(category: Category) async -> [ProductType] {
        await super.waitBeforeReturn()
        return [ProductType(id: 0, name: "AAAA"),
                ProductType(id: 1, name: "BBBBB"),
                ProductType(id: 2, name: "CCCCC")]
    }

    
    
    func getCommonCategoriesByGender(gender: String) async -> [Category] {
        await super.waitBeforeReturn()
        assert(ShopStubAPI.commonRecomendations.keys.contains(gender))
        return ShopStubAPI.commonRecomendations[gender].unsafelyUnwrapped
    }
    
    // Gender should be included into ID
    func getSubcategoriesByCategoryID(user: UserInfo, category: Category) async -> [SubCategory] {
        await super.waitBeforeReturn()
        // Ignore -- its just stub
        return [SubCategory(id: 0, name: "All shoes"),
                SubCategory(id: 1, name: "Jordan"),
                SubCategory(id: 2, name: "Running"),
                SubCategory(id: 3, name: "Football"),
                SubCategory(id: 4, name: "Basketball")]
    }
    
    // Gender should be included into ID
    func getProductTypesBySubCategoryID(user: UserInfo, subCategory: SubCategory) async -> [ProductType] {
        await super.waitBeforeReturn()
        return [
            ProductType(id: 0, name: "AAAA"),
            ProductType(id: 1, name: "BBBBB"),
            ProductType(id: 2, name: "CCCCC"),
            ProductType(id: 3, name: "DDDDDD"),
            ProductType(id: 4, name: "EEEEEEE"),
            ProductType(id: 5, name: "FFFFFFFF")
        ]
    }
    
    // Gender should be included into ID
    func getProductPreviewsByProductType(user: UserInfo, productType: ProductType) async -> [ProductPreview] {
        return [
            ProductPreview(id: 0, name: "AAA", price: 300.0, shortDescription: "Three hundred bucks", liked: false, photos: [Image("productPreview1")], productState: "Lorem Ipsum"),
            ProductPreview(id: 1, name: "BBB", price: 400.0, shortDescription: "DDD product", liked: false, photos: [Image("productPreview2")], productState: nil),
            ProductPreview(id: 2, name: "CCC", price: 499.0, shortDescription: "CCC product", liked: true, photos: [Image("productPreview3")], productState: nil),
            ProductPreview(id: 3, name: "CCC", price: 499.0, shortDescription: "CCC product", liked: true, photos: [Image("productPreview3")], productState: "Works")
        ]
    }
    
    func getFullProductInfo(userID: UInt64, productID: UInt64) async -> Product {
        // TODO: Add code
        return Product(id: 0, name: "Boots", price: 0, shortDescription: "a", liked: false, photos: [Image("kidsSale")], fullDescription: "AAA  djdkgk dgkjsflfsh sdgg fhjy ertry rytuturydvbf cgfghthth dgfhfjtgj fhtgjt", productState: nil, sizes: [Size(type: "EU", size: 10), Size(type: "EU", size: 11), Size(type: "EU", size: 12), Size(type: "EU", size: 14)])
    }

    func searchProducts(userID: UInt64, searchPattern: String, categoryID: UInt64!) async -> [ProductPreview] {
        // TODO: Add code
        return []
    }
}
