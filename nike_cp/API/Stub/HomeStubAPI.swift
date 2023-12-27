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
    
    private override init() {}
    
    func getRecomendedProducts(userID: UInt64) async -> [ProductPreview] {
        // TODO: Add code
        return []
    }
    
    func getPromotions(userID: UInt64) async -> [Promotion] {
        // TODO: Add code
        return []
    }
}
