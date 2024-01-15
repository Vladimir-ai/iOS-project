//
//  CheckItemRow.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import SwiftUI

struct CheckItemRow: View {
    @State private var isChecked: Bool = false
    var item: CheckListItem
    
    var body: some View {
        HStack(spacing: 20) {
            item.image
                .resizable()
                .clipShape(Circle())
                .padding(8.0)
                .frame(width: 90, height: 90)
            
            Toggle(isOn: $isChecked) {
                Text(item.text)
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .toggleStyle(CheckboxToggleStyle())
            
            Spacer()
        }
//        .background(.clear)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
            .foregroundColor(.white)
            .imageScale(.large)
            .frame(width: 24, height: 24)
            .onTapGesture { configuration.isOn.toggle() }
    }
  }
}

struct CheckItemRow_Previews: PreviewProvider {
    static var previews: some View {
        CheckItemRow(item: CheckListItem(id: 1, text: "Womens", image: Image("women_avatar")))
    }
}
