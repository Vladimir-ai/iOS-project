//
//  SearchView.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct SearchView: View {
    @State private var productPreviewsList: [ProductPreview] = []
    @State private var loaded = false
    private let gridLayout = [
        GridItem(.adaptive(minimum: 170))
    ]
    private let shopAPI = APIFactory.getShopAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    
    @Binding var input: String
    
    var body: some View {
        VStack {
          
            HStack(spacing: .zero) {
                HStack(spacing: .zero) {
                    Image(systemName: "magnifyingglass")
                        .padding(5)
                    
                    TextField("Search", text: $input)
                    .onChange(of: input) { newValue in
                        
                        loaded = false
                        
                       Task {
                           if !newValue.isEmpty {
                               productPreviewsList = await shopAPI.searchProducts(userID: loginAPI.getCurrentLoggedInUser().id,
                                                                                                 searchPattern: newValue,
                                                                                                 categoryID: nil)
                               loaded = true
                           }
                       }
                    }
                }
                .background(.white)
                .cornerRadius(20)
                
                Spacer()
                
                if !input.isEmpty {
                    Button("Cancel") {
                        withAnimation {
                            input = ""
                        }
                    }
                    .tint(.black)
                    .font(.body)
                    .padding(.leading, 10)
                }
            }
            .padding(15)
            .background(Color.init(white: 0.9))
            
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
                    ProgressView()
                }
            }
        }
    }
    
}

