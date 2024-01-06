//
//  HomeView.swift
//  nike_cp
//
//  Created by Adminisrator on 08.12.2023.
//

import SwiftUI

struct HomeView : View {
    @Binding var userInfo: UserInfo
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 5) {
                HStack {
                    Text("What's new")
                    Spacer()
                }
                Text("The latest arrivals from\n Nike").font(.system(size: 32)).foregroundColor(.gray)
                Spacer()
                ScrollView {
                    HomeRecomendGalleryView(userInfo: $userInfo)
                    HomeProductPromotionView()
                }
                
            }.padding([.leading, .trailing], nil)
        }
    }
}
