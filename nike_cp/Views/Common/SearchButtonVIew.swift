//
//  SearchButtonVIew.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct SearchButtonVIew: View {
    @State private var input: String = ""
    
    var body: some View {
        NavigationLink(destination: SearchView(input: $input)) {
            Label("Search", systemImage: "magnifyingglass")
                .labelStyle(.iconOnly)
        }
    }
}

struct SearchButtonVIew_Previews: PreviewProvider {
    static var previews: some View {
        SearchButtonVIew()
    }
}
