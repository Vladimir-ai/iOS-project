//
//  ProfileView.swift
//  nike_cp
//
//  Created by Adminisrator on 08.12.2023.
//

import SwiftUI

struct ProfileView : View {
    @Binding var userInfo: UserInfo
    
    var body: some View {
        VStack {
            Label("Profile view stub", systemImage: "bolt.fill").labelStyle(.titleOnly)
        }.toolbarBackground(.white, for: .tabBar)
         .toolbarBackground(.visible, for: .tabBar)
            
    }
}
