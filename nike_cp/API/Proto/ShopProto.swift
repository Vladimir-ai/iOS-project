//
//  ShopProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation
import SwiftUI

protocol ShopProto {
    func getMustHaveCategoriesByUserID(userInfo: UserInfo, gender: String) async -> [Category]
    
    func getCommonCategoriesByGender(gender: String) async -> [Category]
   
    func getProductTypesByMustHaveCategoryID(category: Category) async -> [ProductType]
    
    // Gender should be included into ID
    func getSubcategoriesByCategoryID(user: UserInfo, category: Category) async -> [SubCategory]
    
    // Gender should be included into ID
    func getProductTypesBySubCategoryID(user: UserInfo, subCategory: SubCategory) async -> [ProductType]
    
    // Gender should be included into ID
    func getProductPreviewsByProductType(user: UserInfo, productType: ProductType) async -> [ProductPreview]
    
    func getFullProductInfo(userID: UInt64, productID: UInt64) async -> Product

    func searchProducts(userID: UInt64, searchPattern: String, categoryID: UInt64!) async -> [ProductPreview]
}
