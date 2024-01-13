//
//  Product.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation
import SwiftUI

struct IndentifiableImage: Identifiable{
    let id = UUID()
    let photo: Image
}

// Short description of product
class ProductPreview: Identifiable {
    var id: UInt64
    var name: String
    var shortDescription: String
    var liked: Bool
    var price: Float
    var photos: [Image] // Lets consider that there is only one image
    // Load others later: if user presses btn
    var productState: String?
    
    init(id: UInt64, name: String, price: Float, shortDescription: String, liked: Bool, photos: [Image], productState: String?) {
        self.id = id
        self.name = name
        self.photos = photos
        self.price = price
        self.liked = liked
        self.shortDescription = shortDescription
        self.productState = productState
    }
    
    init(other: ProductPreview) {
        self.id = other.id
        self.name = other.name
        self.photos = other.photos
        self.price = other.price
        self.shortDescription = other.shortDescription
        self.liked = other.liked
        self.productState = other.productState
    }
    
    func getIdentifiableImageList()-> [IndentifiableImage] {
        var images = [IndentifiableImage]()
        photos.forEach{ photo in
            images.append(IndentifiableImage(photo: photo))
        }
        return images
    }
}

struct Size {
    var type: String
    var size: Float
    
    init(type: String, size: Float) {
        self.type = type
        self.size = size
    }
}

class ProductPreviewWithSize: ProductPreview {
    var size: Size
    
    init(id: UInt64, name: String, price: Float, shortDescription: String, liked: Bool, photos: [Image], productState: String?, size: Size) {
        self.size = size
        super.init(id: id, name: name, price: price, shortDescription: shortDescription, liked: liked, photos: photos, productState: productState)
    }
    
    init(other: ProductPreview, size: Size) {
        self.size = size
        super.init(other: other)
    }
    
    init(other: ProductPreviewWithSize) {
        self.size = other.size
        super.init(id: other.id, name: other.name, price: other.price, shortDescription: other.shortDescription, liked: other.liked, photos: other.photos, productState: other.productState)
    }
}

class Product: ProductPreview {
    var fullDescription: String
    var sizes: [Size]
    
    init(previewProduct: ProductPreview, fullDescription: String, sizes: [Size]) {
        self.fullDescription = fullDescription
        self.sizes = sizes
        super.init(other: previewProduct)
    }
    
    init(id: UInt64, name: String, price: Float, shortDescription: String, liked: Bool, photos: [Image], fullDescription: String, productState: String?, sizes: [Size]) {
        self.fullDescription = fullDescription
        self.sizes = sizes
        super.init(id: id, name: name, price: price, shortDescription: shortDescription, liked: liked, photos: photos, productState: productState)
    }
}
