//
//  ContentView.swift
//  nike_cp
//
//  Created by Adminisrator on 25.11.2023.
//

import SwiftUI

struct RootView: View {
    @State var userInfo = APIFactory.getLoginAPI().loggedUser
    
    var body: some View {
        // Please note that every icon will be filled, not outlined as shown in the Figma.
        // @see https://developer.apple.com/design/human-interface-guidelines/tab-bars
        // > "Prefer filled symbols or icons for consistency with the platform."
        TabView {
            HomeView(userInfo: $userInfo).tabItem {
                Label("Home", systemImage: "house")
            }
            
            ShopView(userInfo: $userInfo).tabItem {
                Label("Shop", systemImage: "magnifyingglass")
            }
            
            FavoritesView(userInfo: $userInfo).tabItem {
                Label("Favorites", systemImage: "heart")
            }
            
            BagView(userInfo: $userInfo).tabItem {
                Label("Bag", systemImage: "bag")
            }
            
            ProfileView(userInfo: $userInfo).tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .accentColor(.black)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
