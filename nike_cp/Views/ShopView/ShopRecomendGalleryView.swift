//
//  ShopRecomendGalleryView.swift
//  nike_cp
//
//  Created by Adminisrator on 19.12.2023.
//

import SwiftUI

struct ShopRecomendGalleryView : View {
    @Binding var userInfo: UserInfo
    @State private var recomendations: [Recomendation] = []
    
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
                    Text("Loading...").task {
                        await recomendations = Recomendation.getAllRecomendationByUserInfo(user: userInfo)
                    }
                }
            }
        }
    }
}

struct ShopRecomendGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRecomendGalleryView(userInfo: .constant(UserInfo(usrID: 0, name: "Carl")))
    }
}
