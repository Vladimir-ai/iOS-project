//
//  ShopRecomendGalleryView.swift
//  nike_cp
//
//  Created by Adminisrator on 19.12.2023.
//

import SwiftUI

struct ShopRecomendGalleryView : View {
    @Binding var userInfo: UserInfo
    @Binding var gender: String
    @Binding var shopAPI: ShopAPI
    @State private var recomendations: [Category] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack {
                if (recomendations.count > 0)
                {
                    ForEach(recomendations) { recomendation in
                        NavigationLink {
                            ShopRecomendationGridView(recomendation: recomendation)
                        }
                    label:
                        {
                            ImgWithTextView(img: recomendation.photo, imgText: recomendation.name)
                        }
                    }
                }
                else
                {
                    ProgressView().task {
                        await recomendations = shopAPI.getAllRecomendations(userInfo: userInfo)
                    }
                }
            }
            .onChange(of: gender){ _ in
                recomendations = []
            }
        }
    }
}

struct ShopRecomendGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRecomendGalleryView(userInfo: .constant(UserInfo(usrID: 0, name: "Carl")), gender: .constant("Men"), shopAPI: .constant(ShopAPI()))
    }
}
