//
//  ProductView.swift
//  nike_cp
//
//  Created by Adminisrator on 25.12.2023.
//

import SwiftUI

struct ProductGridItemView: View {
    var productPreview: ProductPreview
    
    private let frameWidth = 170.0
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
                            
                            Button(action: onTapBtn) {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width: 28, height: 28)
                                    
                                    Image(systemName: "suit.heart")
                                        .frame(width: 14, height: 14)
                                        .foregroundColor(.black)
                                    
                                    Image(systemName: "heart.fill")
                                        .frame(width: 14, height: 14)
                                        .opacity(productPreview.liked ? 1 : 0)
                                        .scaleEffect(productPreview.liked ? 1.0 : 0.1)
                                        .animation(.linear, value: 1.0)
                                        .foregroundColor(.red)
                                }
                            }
                            .disabled(likeReqInProgress)
                            
                        }
                        .padding([.leading, .trailing, .top], 4)
                        
                        Spacer()
                    }
                    .padding([.leading, .trailing], 4)
                }
                .frame(width: frameWidth, height: frameWidth, alignment: .leading)

                VStack {
                    if productPreview.productState != nil {
                        HStack {
                            Text(productPreview.productState!)
                                .font(.system(size: 14.0))
                                .bold()
                                .foregroundColor(Color(red: 0.937, green: 0.4745, blue: 0.3216))
                            Spacer()
                        }
                    }
                    
                    
                    HStack {
                        Text(productPreview.name)
                            .font(.system(size: 14.0))
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text(productPreview.shortDescription)
                            .foregroundColor(Color(uiColor: .systemGray))
                            .font(.system(size: 14.0))
                            .bold()
                        Spacer()
                    }
                }
                
                HStack {
                    Text(String(format: "US$%.2f", productPreview.price))
                        .font(.system(size: 14.0))
                        .bold()
                    Spacer()
                }
                
                Spacer()
            }
        }
        
        .frame(width: frameWidth)
    }
    
    private func onTapBtn() -> Void {
        likeReqInProgress = true
        
        Task {
            productPreview.liked = !productPreview.liked
            await favoritesAPI.likeProduct(userID: loggedUser.usrID,  like: productPreview.liked)
            likeReqInProgress = false
        }
    }
}


struct ProductGridItemView_Previews: PreviewProvider {
    static let productPreview = ProductPreview(id: 0, name: "Nike Therma", price: 300.300, shortDescription: "Jordan or something", liked: false, photos: [Image("productPreview1")], productState: "In progress")
    
    static var previews: some View {
        ZStack {
            ProductGridItemView(productPreview: ProductGridItemView_Previews.productPreview)
        }
    }
}
