//
//  LoginView.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct LoginView: View {
//    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image("NikeLogo")
                .resizable()
                .colorInvert()
                .frame(width: 100, height: 100)
            
            Text("Enter your email to join us or sign in.")
                .font(.title)
                .padding()
            
            HStack {
                Text("Uganda")
                    .fontWeight(.thin)
                
                Text("Change")
                    .underline()
            }
            .padding(.horizontal)
            
            Form {
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                }
//                Section(header: Text("Username")) {
//                    TextField("Username", text: $username)
//                }
                Section(header: Text("Password")) {
                    SecureField("Password", text: $password)
                }
                
//                Button(action: {}) {
//                    Text("Login")
//                }
                
                NavigationLink(destination: StartView()
                        .toolbar(.hidden)) {
                            
                            Text("Login")
                                .foregroundColor(.cyan)
//                    .frame(maxWidth: 150)
//                    .padding()
//                    .background(.white)
//                    .foregroundColor(.black)
//                    .font(.title2)
//                    .cornerRadius(30)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    UserDefaults.standard.setValue(true, forKey: "LoggedIn")
                })
            }
            .padding(.vertical)
//            .background(Color.white)
//            .scrollContentBackground(.hidden)
                        
//            Spacer()
//
//            NavigationLink(destination: OnboardingInterestListView()
//                    .toolbar(.hidden)) {
//                Text("Next")
//                .frame(maxWidth: 150)
//                .padding()
//                .background(.white)
//                .foregroundColor(.black)
//                .font(.title2)
//                .cornerRadius(30)
//            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
        
//    func register() {
//      print("hello")
//    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
