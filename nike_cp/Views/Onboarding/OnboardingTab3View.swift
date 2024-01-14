//
//  OnboardingTab3View.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct OnboardingTab3View: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(RadialGradient(colors: [.gray, .black], center: .center, startRadius: 1, endRadius: 400))
            
            VStack() {
                ProgressView(value: 3, total: 4)
                    .progressViewStyle(.linear)
                    .background(Color.gray.opacity(0.5))
                    .tint(.white)
                    .frame(width: 200)
                
                Text("Stay in the know with notifications about First Access to products, invites to experiences, personalized offers, and order updates.")
                    .bold()
                    .font(.system(size: 35))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .foregroundColor(.white)
                
                            
                Spacer()
                
                NavigationLink(destination: OnboardingInterestListView()
                        .toolbar(.hidden)) {
                    Text("Next")
                    .frame(maxWidth: 150)
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .font(.title2)
                    .cornerRadius(30)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.black)
    }
}

struct OnboardingTab3View_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTab3View()
    }
}
