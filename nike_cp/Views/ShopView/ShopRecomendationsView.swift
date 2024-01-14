//
//  ShopRecomendationsView.swift
//  nike_cp
//
//  Created by Adminisrator on 14.01.2024.
//

import SwiftUI

struct ShopRecomendationsView: View {
    @Environment(\.presentationMode) var presentationMode
    var category: Category
    
    // Stores productType list, set these interfaces here just to make binding without
    //  many crutches. The same applies for selectedProduct
    @State private var productTypeList: [ProductType] = []
    @State private var selectedProductType: ProductType?
    
    private let shopAPI = APIFactory.getShopAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    
    var body: some View {
        VStack {
            if (productTypeList.count > 0) {
                ScrollView(.horizontal)
                {
                    SegmentedView<ProductType>(productTypeList, $selectedProductType)
                }
                
                ShopProductTypeGridView(productType: $selectedProductType)
            }
            else {
                ProgressView().task {
                    productTypeList = await shopAPI.getProductTypesByMustHaveCategoryID(category: category)
                    
                    if productTypeList.count > 0 {
                        selectedProductType = productTypeList[0]
                    }
                }
            }
        }
        .navigationTitle(category.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            {
                Button(action: goBack) {
                    Label("Go Back", systemImage: "chevron.backward")
                        .labelStyle(.iconOnly)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                    SearchButtonVIew()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
}
