//
//  WelcomeView.swift
//  nike_cp
//
//  Created by Kathiir on 1/8/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            
            Image("StartScreenView")
                .resizable()
                .scaledToFill()
                .brightness(-0.05)
                .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                
            VStack(alignment: .leading, spacing: 10) {
                Spacer().frame(maxWidth: .infinity)
                
                Image("NikeLogo")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("Nike App\nBringing Nike Members the best products, inspiration and stories in sport.")
                    .bold()
                    .font(.system(size: 38))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                HStack {
                    NavigationLink(destination: LoginView()) {
                        Text("Join Us")
                            .frame(maxWidth: 150)
                            .padding()
                            .background(.white)
                            .foregroundColor(.black)
                            .font(.title2)
                            .cornerRadius(30)
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Sign In")
                            .frame(maxWidth: 150)
                            .padding()
                            .background(.black)
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.white, lineWidth: 2)
                            )
                    }
                }
                .padding()
                
                Spacer(minLength: 100)
            }
            
            
                
        }
        .background(Color.black)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
