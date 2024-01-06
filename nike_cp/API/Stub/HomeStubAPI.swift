//
//  HomeAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation
import SwiftUI

class HomeStubAPI: StubAPI, HomeProto {
    static let sharedAPIInstance = HomeStubAPI()
    
    static private let recomendationList = [
        ProductPreview(id: 0, name: "Air Jordan", price: 1555, shortDescription: "Short", liked: false, photos: [Image("Boots1"), Image("menShoes")], productState: "State"),
        ProductPreview(id: 1, name: "Revolution", price: 1200, shortDescription: "Short", liked: false, photos: [Image("Boots2"), Image("menShoes")], productState: "State")
    ]
    
    static private let promotionList = [
        Promotion(id: 0, img: Image("Promotion1"), link: URL(string: "https://www.apple.com")!),
        Promotion(id: 1, img: Image("Promotion2"), link: URL(string: "https://www.apple.com")!)
    ]
    
    private override init() {}
    
    func getRecomendedProducts(userID: UInt64) async -> [ProductPreview] {
        await super.waitBeforeReturn()
        return HomeStubAPI.recomendationList
        
    }
    
    func getPromotions(userID: UInt64) async -> [Promotion] {
        await super.waitBeforeReturn()
        return HomeStubAPI.promotionList
    }
}
