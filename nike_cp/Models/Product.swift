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
    var shortDescription: String
    var liked: Bool
    var price: Float
    var photos: [Image] // Lets consider that there is only one image
    // Load others later: if user presses btn
    
    init(id: UInt64, name: String, price: Float, shortDescription: String, liked: Bool, photos: [Image]) {
        self.id = id
        self.name = name
        self.photos = photos
        self.price = price
        self.liked = liked
        self.shortDescription = shortDescription
    }
    
    init(other: ProductPreview) {
        self.id = other.id
        self.name = other.name
        self.photos = other.photos
        self.price = other.price
        self.shortDescription = other.shortDescription
        self.liked = other.liked
    }
}

class Product: ProductPreview {
    var fullDescription: String
    
    init(previewProduct: ProductPreview, fullDescription: String) {
        self.fullDescription = fullDescription
        super.init(other: previewProduct)
    }
    
    init(id: UInt64, name: String, price: Float, shortDescription: String, liked: Bool, photos: [Image], fullDescription: String) {
        self.fullDescription = fullDescription
        super.init(id: id, name: name, price: price, shortDescription: shortDescription, liked: liked, photos: photos)
    }
}
