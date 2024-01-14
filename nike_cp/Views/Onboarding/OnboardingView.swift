//
//  OnboardingView.swift
//  nike_cp
//
//  Created by Kathiir on 1/8/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Image("OnboardingScreenView")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .mask(LinearGradient(gradient: Gradient(colors: [.clear, .black, .black, .clear]),
                                     startPoint: .top, endPoint: .bottom))
            
            VStack() {
                ProgressView(value: 1, total: 4)
                    .progressViewStyle(.linear)
                    .background(Color.gray.opacity(0.5))
                    .tint(.white)
                    .frame(width: 200)
                
                Text("To personalize your experience and connect you to sport, we've got a few questions for you.")
                    .bold()
                    .font(.system(size: 35))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .foregroundColor(.white)
                    
                
                Spacer()
                
                NavigationLink(destination: OnboardingChoiceVIew()
                        .toolbar(.hidden)) {
                    Text("Get Started")
                    .frame(maxWidth: 150)
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .font(.title2)
                    .cornerRadius(30)
                }
            }
            .padding()
        }
        .background(Color.black)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
