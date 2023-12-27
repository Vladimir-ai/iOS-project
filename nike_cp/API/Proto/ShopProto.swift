//
//  ShopProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation
import SwiftUI

protocol ShopProto {
    func getAllCategoriesByUserID(userInfo: UserInfo) async -> [Category]
    
    func getCommonCategoriesByGender(gender: String) async -> [Category]
    
    // Gender should be included into ID
    func getSubcategoriesByCategoryID(userID: UInt64, categoryID: UInt64) async -> [SubCategory]
    
    // Gender should be included into ID
    func getProductTypesByCategoryID(userID: UInt64, subCategoryID: UInt64) async -> [ProductType]
    
    // Gender should be included into ID
    func getProductPreviewsByProductTypeID(userID: UInt64, productTypeID: UInt64) async -> [ProductType]
    
    func getFullProductInfo(userID: UInt64, productID: UInt64) async -> Product

    func searchProducts(userID: UInt64, searchPattern: String, categoryID: UInt64!) async -> [ProductPreview]
}
