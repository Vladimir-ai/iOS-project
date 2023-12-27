//
//  CartProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation
import SwiftUI

protocol CartProto {
    func addToCart(userID: UInt64, productID: UInt64, amount: UInt64!) async -> Void
    
    func removeFromCart(userID: UInt64, product_id: UInt64, amount: UInt64!) async -> Void
    
    func getProductsInCart(userID: UInt64) async -> [ProductPreviewWithSize]
}
