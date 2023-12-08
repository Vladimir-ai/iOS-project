//
//  ContentView.swift
//  nike_cp
//
//  Created by Adminisrator on 25.11.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        // Please note that every icon will be filled, not outlined as shown in the Figma.
        // @see https://developer.apple.com/design/human-interface-guidelines/tab-bars
        // > "Prefer filled symbols or icons for consistency with the platform."
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            
            ShopView().tabItem {
                Label("Shop", systemImage: "magnifyingglass")
            }
            
            FavoritesView().tabItem {
                Label("Favorites", systemImage: "heart")
            }
            
            BagView().tabItem {
                Label("Bag", systemImage: "bag")
            }
            
            ProfileView().tabItem {
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
