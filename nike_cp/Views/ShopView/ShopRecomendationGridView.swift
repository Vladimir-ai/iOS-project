//
//  ShopGridView.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import SwiftUI

struct ShopRecomendationGridView: View {
    @State var recomendation: Recomendation
    
    var body: some View {
        VStack {
            Text(recomendation.name)
            recomendation.photo
        }
    }
}
