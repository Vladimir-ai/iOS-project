//
//  ShopGridView.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import SwiftUI

struct ShopRecomendationGridView: View {
    @State var recomendation: Recomendation
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical)
        {
            Grid {
                
            }
        }
        .navigationTitle(recomendation.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading)
            {
                Button(action: goBack) {
                    Label("Go Back", systemImage: "chevron.backward")
                        .labelStyle(.iconOnly)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: searchShop) {
                    Label("Search", systemImage: "magnifyingglass")
                        .labelStyle(.iconOnly)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func searchShop()
    {
        //TODO: Add search
    }
}


struct ShopRecomendationGridView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRecomendationGridView(recomendation:
            Recomendation(id: 0, name: "Test", photo: Image("ImageBestSellers")))
    }
}
