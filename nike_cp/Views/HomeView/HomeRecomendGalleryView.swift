//
//  HomeRecomendGalleryView.swift
//  nike_cp
//
//  Created by tntrol on 05.01.2024.
//


import SwiftUI

struct HomeRecomendGalleryView : View {
    @Binding var userInfo: UserInfo
    //@Binding var gender: String
    @State private var recomendedProductList: [ProductPreview] = []
    
    private let homeAPI = APIFactory.getHomeAPI()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack {
                if (recomendedProductList.count > 0)
                {
                    ForEach(recomendedProductList) { product in
                        ProductRecomendView(productPreview: product)
                    }
                }
                else
                {
                    ProgressView().task {
                        await recomendedProductList = homeAPI.getRecomendedProducts( userID: userInfo.usrID)
                    }
                }
            }
        }
    }
}
