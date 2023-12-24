//
//  Product.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation
import SwiftUI

// Short description of product
class ProductPreview: Identifiable {
    var id: UInt64
    var name: String
    var photos: [Image] // Lets consider that there is only one image
    // Load others later: if user presses btn
    
    init(id: UInt64, name: String, photos: [Image]) {
        self.id = id
        self.name = name
        self.photos = photos
    }
    
    init(other: ProductPreview) {
        self.id = other.id
        self.name = other.name
        self.photos = other.photos
    }
}

class Product: ProductPreview {
    var price: Float
    var description: String
    
    init(previewProduct: ProductPreview, price: Float, description: String) {
        self.price = price
        self.description = description
        super.init(other: previewProduct)
    }
    
    init(id: UInt64, name: String, photos: [Image], price: Float, description: String) {
        self.price = price
        self.description = description
        super.init(id: id, name: name, photos: photos)
    }
}
