//
//  HomeProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation

protocol HomeProto {
    func getRecomendedProducts(userID: UInt64) async -> [ProductPreview]
    
    func getPromotions(userID: UInt64) async -> [Promotion] 
}
