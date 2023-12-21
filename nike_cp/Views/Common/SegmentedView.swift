//
//  SegmentedView.swift
//  nike_cp
//
//  Created by Adminisrator on 16.12.2023.
//

import SwiftUI

struct SegmentedView: View {

    let segments: [String]
    @State private var selected: String
    @Namespace var name
    
    init(segments: [String], selected: String) {
        self.segments = segments
        self.selected = selected
    }

    var body: some View {
        HStack() {
            ForEach(segments, id: \.self) { segment in
                Button {
                    selected = segment
                } label: {
                    VStack {
                        Text(segment)
                            .fontWeight(.medium)
                            .foregroundColor(selected == segment ? .black : Color(uiColor: .systemGray))
                        ZStack {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 4)
                            
                            if selected == segment {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
            }
            .frame(width: 70)

            Spacer()
        }
    }
}


struct SegmentedView_Previews: PreviewProvider {
    static let gender = ["Men", "Women", "Kids"]

    static var previews: some View {
        SegmentedView(segments: gender, selected: "Men")
    }
}
