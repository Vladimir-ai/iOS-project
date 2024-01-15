//
//  OnboardingInterestListView.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct OnboardingInterestListView: View {
    var body: some View {
        let items: [CheckListItem] =
            [
                CheckListItem(id: 0, text: "Air Max", image: Image("Interest_1")),
                CheckListItem(id: 1, text: "Baseball", image: Image("Interest_2")),
                CheckListItem(id: 2, text: "Big & Tall", image: Image("Interest_3")),
                CheckListItem(id: 3, text: "Cross-Training", image: Image("Interest_4")),
                CheckListItem(id: 4, text: "Dance", image: Image("Interest_5")),
                CheckListItem(id: 5, text: "Lacrosse", image: Image("Interest_6")),
                CheckListItem(id: 6, text: "Maternity", image: Image("Interest_7")),
                CheckListItem(id: 7, text: "N7", image: Image("Interest_8")),
                CheckListItem(id: 8, text: "Nike Sportswear", image: Image("Interest_9"))
            ]
        
        
        ZStack {
            Image("StartScreenView")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .brightness(-0.4)
                .blur(radius: 50)
            
            VStack {
                List {
                    ForEach(items) { adult in
                        CheckItemRow(item: adult)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparatorTint(.white)
                    .listRowInsets(EdgeInsets())
                    
                }
                .listStyle(.grouped)
                .scrollContentBackground(.hidden)
            }
            
            VStack {
                ProgressView(value: 4, total: 4)
                    .progressViewStyle(.linear)
                    .background(Color.gray.opacity(0.5))
                    .tint(.white)
                    .frame(width: 200)
                
                Spacer()
                
                NavigationLink(destination: StartView()
                        .toolbar(.hidden)) {
                    Text("Next")
                    .frame(maxWidth: 150)
                    .padding()
                    .background(.white)
                    .foregroundColor(.black)
                    .font(.title2)
                    .cornerRadius(30)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    UserDefaults.standard.setValue(true, forKey: "KeyOnBoardingViewShown")
                })
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.black)
    }
}

struct OnboardingInterestListView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInterestListView()
    }
}
