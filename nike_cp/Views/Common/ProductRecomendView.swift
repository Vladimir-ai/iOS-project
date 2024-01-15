//
//  ProductRecomend.swift
//  nike_cp
//
//  Created by tntrol on 06.01.2024.
//


import SwiftUI

struct ProductRecomendView: View {
    var productPreview: ProductPreview
    
    private let frameWidth = 300.0
    private let copypastedBackgroundColor = Color(red: 0.9647, green: 0.9647, blue: 0.9647)
    
    private let favoritesAPI = APIFactory.getCommonAPI()
    
    @State private var loggedUser = APIFactory.getLoginAPI().loggedUser
    @State private var likeReqInProgress = false
    
    
    var body: some View {
        NavigationLink {
            ProductView(productPreview: productPreview)
        }
    label:
        {
            VStack (spacing: 5) {
                ZStack {
                    productPreview.photos[0]
                        .resizable()
                        .background(copypastedBackgroundColor)
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                        }
                        .padding([.leading, .trailing, .top], 4)
                        
                        Spacer()
                    }
                    .padding([.leading, .trailing], 4)
                }
                .frame(width: frameWidth, height: frameWidth, alignment: .leading)

                VStack {
                    Spacer()
                    
                    
                    HStack {
                        Text(productPreview.name)
                            .font(.system(size: 16.0))
                            .bold()
                        Spacer()
                    }

                }
                
                HStack {
                    Text(String(format: "US$%.2f", productPreview.price))
                        .foregroundColor(Color(uiColor: .systemGray))                        .font(.system(size: 16.0))
                        .bold()
                    Spacer()
                }
                
                Spacer()
            }
        }
        
        .frame(width: frameWidth)
    }
    
}
