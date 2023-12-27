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
    
    
    @State private var recommendationsList: [Category] = []
    
    var body: some View {
        if recommendationsList.count > 0 {
            VStack {
                ForEach(recommendationsList) { recomendation in
                    NavigationLink {
                        ShopRecomendationGridView(recomendation: recomendation)
                    }
                    label:
                    {
                        recomendation.photo
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }.onChange(of: gender) { _ in
                    recommendationsList = []
            }
        }
        else
        {
            ProgressView().task {
                recommendationsList = await shopAPI.getCommonCategoriesByGender(gender: gender)
            }
        }
    }
}
