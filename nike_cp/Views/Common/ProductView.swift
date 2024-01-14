//
//  ShopProductView.swift
//  nike_cp
//
//  Created by Adminisrator on 29.12.2023.
//

import Foundation
import SwiftUI

struct ProductView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var productPreview: ProductPreview
    
    @State private var product: Product?
    @State private var currPhoto: IndentifiableImage?
    @State private var index = 0
    @State private var currentUser: UserInfo!
    @State var size: Float = 0
    private let shopAPI = APIFactory.getShopAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    private let cartAPI = APIFactory.getCartAPI()
    private let frameWidth = 170.0

    var body: some View {
        VStack {
            if let productUnwrap = product {
                ScrollView(.vertical) {
                    //Text("Stub " + productPreview.name + " Stub")
                    let photos = productPreview.getIdentifiableImageList()
                    currPhoto?.photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.frame(width: 460, height: 460)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(photos) { photo in
                                Button(action: {
                                    currPhoto = photo
                                }, label: {
                                    photo.photo
                                        .resizable()
                                        .frame(width: frameWidth, height: frameWidth, alignment: .leading)
                                })
                            }
                        }
                    }
                    VStack {
                        Group{
                            HStack{
                                Text(productUnwrap.shortDescription)
                                    .font(.system(size: 20.0))
                                Spacer()
                            }
                            HStack{
                                Text(productUnwrap.name)
                                    .font(.system(size: 28.0))
                                    .bold()
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text(String(format: "US$%.2f", productUnwrap.price))
                                    .font(.system(size: 20.0))
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text(productUnwrap.fullDescription)
                                    .font(.system(size: 20.0))
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("About product")
                                    .foregroundColor(Color(uiColor: .systemGray))
                                    .font(.system(size: 20.0))
                                Spacer()
                            }
                        }
                        Button {
                            
                        } label:{
                            HStack{
                                NavigationLink {
                                    SelectSizeView(sizes: productUnwrap.sizes, parent: self).toolbar(.hidden)
                                } label : {
                                    Spacer()
                                    Text("Select size")
                                    Label("Go Back", systemImage: "chevron.down")
                                        .labelStyle(.iconOnly)
                                    Spacer()
                                }
                            }.padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing:  24))
                        }
                            .background(Capsule().stroke(.gray, lineWidth: 2))
                            .font(.system(.title2, design: .rounded, weight: .bold))
                        
                        Button {
                            //cartAPI.addToCart(userID: currentUser.usrID, productID: product?.id)
                        } label:{
                            HStack{
                                Spacer()
                                Text("Add to cart")
                                Spacer()
                            }.padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing:  24))
                        }.foregroundColor(.white)
                            .background(Capsule().fill(.black))
                            .font(.system(.title2, design: .rounded, weight: .bold))
                        
                        HStack{
                            Button {
                                
                            } label:{
                                HStack{
                                    Spacer()
                                    Text("Buy")
                                    Spacer()
                                }.padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing:  24))
                            }.background(Capsule().stroke(.gray, lineWidth: 2))
                            .font(.system(.title2, design: .rounded, weight: .bold))
                            
                            
                                Button {
                                    
                                } label:{
                                    HStack{
                                        Spacer()
                                        Label("", systemImage: "suit.heart").labelStyle(.iconOnly)
                                        Spacer()
                                    }.padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing:  24))
                                }.background(Capsule().stroke(.gray, lineWidth: 2))
                                    .font(.system(.title2, design: .rounded, weight: .bold))
                
                        }
                        Spacer()
                    }.padding([.leading, .trailing], nil)
                }
            }
            else
            {
                ProgressView().task {
                    currentUser = loginAPI.getCurrentLoggedInUser()
                    product = await shopAPI.getFullProductInfo(userID: currentUser.id, productID: productPreview.id)
                    let photos = productPreview.getIdentifiableImageList()
                    currPhoto = photos[0]
                }
            }
        }
        .navigationTitle(productPreview.name)
        //.listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            {
                Button(action: goBack) {
                    Label("Go Back", systemImage: "chevron.backward")
                        .labelStyle(.iconOnly)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
        
}
