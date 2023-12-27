//
//  CartAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation
import SwiftUI

class CartStubAPI: StubAPI, CartProto {
    static let sharedAPIInstance = CartStubAPI()
    
    private override init() {}
    
    func addToCart(userID: UInt64, productID: UInt64, amount: UInt64!) async -> Void {
        // TODO: Add code
    }
    
    func removeFromCart(userID: UInt64, product_id: UInt64, amount: UInt64!) async -> Void {
        // TODO: Add code
    }
    
    func getProductsInCart(userID: UInt64) async -> [ProductPreviewWithSize] {
        // TOOD: Add code
        return []
    }
}
