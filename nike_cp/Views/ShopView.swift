//
//  ShopView.swift
//  nike_cp
//
//  Created by Adminisrator on 08.12.2023.
//

import SwiftUI

struct ShopView : View {
    @State private var selectedGender = "Men"
    @State private var shopAPI = ShopAPI()
    @Binding var userInfo: UserInfo
    
    static private let spacing = 20.0
    static private let gender = ["Men", "Women", "Kids"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Spacer()
                VStack(spacing: 0)
                {
                    SegmentedView(segments: ShopView.gender, selected: $selectedGender)
                        .padding([.leading, .trailing], nil)
                    
                    Divider()
                }
                
                Spacer()
                
                ScrollView {
                    HStack {
                        Text(String(localized: "Must-Haves, Best Sellers & More"))
                            .font(.title3)
                            .bold()
                        
                        Spacer()
                    }
                    
                    ShopRecomendGalleryView(userInfo: $userInfo, gender: $selectedGender, shopAPI: $shopAPI)
                
                    ShopCommonRecomendationView(gender: $selectedGender, shopAPI: $shopAPI)
                }
                .padding([.leading, .trailing], nil)
            }
            .navigationTitle(String(localized: "Shop"))
            .toolbar {
                Button(action: searchShop) {
                    Label("Search", systemImage: "magnifyingglass")
                        .labelStyle(.iconOnly)
                }
            }
        }.toolbarBackground(.white, for: .tabBar)
         .toolbarBackground(.visible, for: .tabBar)
            
    }
    
    
    func searchShop()
    {
        //TODO: Add search
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(userInfo: .constant(UserInfo(usrID: 0, name: "Carl")))
    }
}
