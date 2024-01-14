//
//  ShopGridView.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import SwiftUI

struct ShopProductTypeGridView: View {
    @Binding var productType: ProductType?
    
    @State private var productPreviewsList: [ProductPreview] = []
    @State private var loaded = false
    private let gridLayout = [
        GridItem(.adaptive(minimum: 170))
    ]
    private let shopAPI = APIFactory.getShopAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    
    var body: some View {
        ScrollView(.vertical) {
            if (loaded) {
                LazyVGrid(columns: gridLayout, spacing: 5) {
                    ForEach (productPreviewsList) { productPreview in
                        ProductGridItemView(productPreview: productPreview)
                    }
                }
                .padding([.leading, .trailing], nil)
                .refreshable {
                    
                }
            }
            else
            {
                ProgressView().task {
                    assert(productType != nil)
                    
                    productPreviewsList = await shopAPI.getProductPreviewsByProductType(user: loginAPI.getCurrentLoggedInUser(), productType: productType!)
                    
                    loaded = true
                }
            }
        }.onChange(of: productType) { _ in
            loaded = false
        }
    }
}


struct ShopRecomendationGridView_Previews: PreviewProvider {
    static var previews: some View {
        ShopProductTypeGridView(productType: .constant(ProductType(id: 0, name: "Test")))
    }
}
