//
//  ShopProductView.swift
//  nike_cp
//
//  Created by Adminisrator on 29.12.2023.
//

import Foundation
import SwiftUI

struct ProductView: View {
    var productPreview: ProductPreview
    
    @State private var product: Product?
    
    var body: some View {
        VStack {
            Text("Stub " + productPreview.name + " Stub")
        }
        .navigationTitle(productPreview.name)
    }
        
}
