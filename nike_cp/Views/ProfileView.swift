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
        VStack(alignment: .leading) {
            Image("Profile").resizable().cornerRadius(5)
            Spacer(minLength: 100)
            Text("Welcome to the Nike App").font(.title).frame(width: 300, alignment: .leading).padding(20)
        }
    }
}
