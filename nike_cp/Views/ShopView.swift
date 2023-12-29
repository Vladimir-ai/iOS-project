//
//  ShopView.swift
//  nike_cp
//
//  Created by Adminisrator on 08.12.2023.
//

import SwiftUI

struct ShopView : View {
    @State private var selectedGenderId: Gender = ShopView.gender[0]
    @Binding var userInfo: UserInfo
    private let shopAPI = APIFactory.getShopAPI()
    
    static private let spacing = 20.0
    static private let gender = Gender.getAllPossibleGenders()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Spacer()
                VStack(spacing: 0)
                {
                    HStack {
                        SegmentedView<Gender>(ShopView.gender,
                                              $selectedGenderId)
                        .padding([.leading, .trailing], nil)
                    }
                    
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
                    
                    ShopRecomendGalleryView(userInfo: $userInfo, gender: $selectedGenderId.name)
                
                    ShopCommonRecomendationView(gender: $selectedGenderId.name)
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
    
    private func updateSelectedGender(newValue: some Identifiable) {
        selectedGenderId = ShopView.gender.first {$0.id == newValue.id as! UUID} ?? ShopView.gender[0]
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
