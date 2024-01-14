//
//  OnboardingChoiceVIew.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct OnboardingChoiceVIew: View {
    var body: some View {
        let adults: [CheckListItem] =
            [
                CheckListItem(id: 0, text: "Mens", image: Image("men_avatar")),
                CheckListItem(id: 1, text: "Womens", image: Image("women_avatar"))
            ]
        let kids: [CheckListItem] =
            [
                CheckListItem(id: 2, text: "Boys", image: Image("boy_avatar")),
                CheckListItem(id: 3, text: "Girls", image: Image("girl_avatar"))
            ]
        
        VStack() {
            ProgressView(value: 2, total: 4)
                .progressViewStyle(.linear)
                .background(Color.gray.opacity(0.5))
                .tint(.white)
                .frame(width: 200)
            
            Text("First up, which products do you use the most?")
                .bold()
                .font(.system(size: 35))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .foregroundColor(.white)
            
            List {
                ForEach(adults) { adult in
                    CheckItemRow(item: adult)
                }
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(.white)
                .listRowInsets(EdgeInsets())
                
                Section(header: Text("Any others?")
                    .foregroundColor(.white)
                    .font(.title2)) {
                        ForEach(kids) { kid in
                            CheckItemRow(item: kid)
                        }
                        .listRowInsets(EdgeInsets())
                }
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(.white)
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            
            Spacer()
            
            NavigationLink(destination: OnboardingTab3View()
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
        .background(.black)
    }
}

struct OnboardingChoiceVIew_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingChoiceVIew()
    }
}
