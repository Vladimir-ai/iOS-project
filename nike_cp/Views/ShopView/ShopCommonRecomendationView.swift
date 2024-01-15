//
//  ShopCommonRecomendation.swift
//  nike_cp
//
//  Created by Adminisrator on 25.12.2023.
//

import SwiftUI

struct ShopCommonRecomendationView: View {
    @Binding var gender: String
    private let shopAPI = APIFactory.getShopAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    
    @State private var categoryList: [Category] = []
    @State private var loaded = false
    
    var body: some View {
        if loaded {
            VStack {
                ForEach(categoryList) { category in
                    NavigationLink {
                        ShopSubCategoryListView(category: category)
                    }
                    label:
                    {
                        category.photo
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }.onChange(of: gender) { _ in
                loaded = false
            }
        }
        else
        {
            ProgressView().task {
                categoryList = await shopAPI.getCommonCategoriesByGender(gender: gender)
                loaded = true
            }
        }
    }
}
