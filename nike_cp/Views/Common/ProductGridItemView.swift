//
//  ProductView.swift
//  nike_cp
//
//  Created by Adminisrator on 25.12.2023.
//

import SwiftUI

struct ProductGridItemView: View {
    @Binding var productPreview: ProductPreview
    
    // TODO: Is this size is ok?
    private let frameWidth = 180.0
    
    
    var body: some View {
        VStack {
            productPreview.photos[0]
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: frameWidth)
            HStack {
                Text(productPreview.name)
                Spacer()
            }
            
            HStack {
                Text(productPreview.shortDescription)
                Spacer()
            }
            
            HStack {
                Text("$" + productPreview.price.description)
                Spacer()
            }
        }
        .frame(width: frameWidth)
    }
}


struct ProductGridItemView_Previews: PreviewProvider {
    static let productPreview = ProductPreview(id: 0, name: "Jordan", price: 300.300, shortDescription: "Jordan or something", liked: false, photos: [Image("productPreview1")])
    
    static var previews: some View {
        ProductGridItemView(productPreview: .constant(ProductGridItemView_Previews.productPreview))
    }
}

