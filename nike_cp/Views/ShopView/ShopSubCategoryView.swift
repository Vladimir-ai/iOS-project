//
//  ShopCategoryView.swift
//  nike_cp
//
//  Created by Adminisrator on 29.12.2023.
//

import Foundation
import SwiftUI

struct ShopSubCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    var subCategory: SubCategory
    
    // Stores productType list, set these interfaces here just to make binding without
    //  many crutches. The same applies for selectedProduct
    @State private var productTypeList: [ProductType] = []
    @State private var currentUser: UserInfo!
    @State private var selectedProductType: ProductType?
    @State private var loaded = false
    
    private let shopAPI = APIFactory.getShopAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    
    var body: some View {
        VStack {
            if (loaded && productTypeList.count > 0 && currentUser != nil) {
                ScrollView(.horizontal)
                {
                    SegmentedView<ProductType>(productTypeList, $selectedProductType)
                }
                
                ShopProductTypeGridView(productType: $selectedProductType)
            }
            else if (loaded && productTypeList.count == 0)
            {
                Text("No such products")
                Image("sad_kitty")
            }
            else {
                ProgressView().task {
                    currentUser = loginAPI.getCurrentLoggedInUser()
                    productTypeList = await shopAPI.getProductTypesBySubCategoryID(user: currentUser, subCategory: subCategory)
                    
                    loaded = true
                    
                    if productTypeList.count > 0 {
                        selectedProductType = productTypeList[0]
                    }
                }
            }
        }
        .navigationTitle(subCategory.name)
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
    
    func searchShop() {
        
    }
}
