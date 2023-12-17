//
//  ShopView.swift
//  nike_cp
//
//  Created by Adminisrator on 08.12.2023.
//

import SwiftUI

struct ShopView : View {
    static let spacing = 20.0
    static let gender = [String(localized: "Men"), String(localized: "Women"), String(localized: "Kids")]

    @StateObject var ShowMgr = ShopMgr()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SegmentedView(segments: ShopView.gender, selected: String(localized: "Men"))
                Divider()
                ScrollView
                {
                    
                }
            }
            .navigationTitle(String(localized: "Shop"))
            .toolbar {
                Button(action: searchShop) {
                    Label("Search", systemImage: "magnifyingglass")
                        .labelStyle(.iconOnly)
                }
            }
        }
    }
    
    func searchShop()
    {
        //TODO: Add search
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
