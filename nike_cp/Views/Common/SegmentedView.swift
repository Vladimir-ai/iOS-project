//
//  SegmentedView.swift
//  nike_cp
//
//  Created by Adminisrator on 16.12.2023.
//

import SwiftUI

struct SegmentedView<T>: View where T:Identifiable, T:CustomStringConvertible {
    private var segments: [T]
    @Binding var selected: T
    @Namespace private var name
    
    init(_ segmentList: [T], _ selected: Binding<T?>) {
        self.segments = segmentList
        self._selected = selected.toUnwrapped(defaultValue: segments[0])
    }
    
    init(_ segmentList: [T], _ selected: Binding<T>) {
        self.segments = segmentList
        self._selected = selected
    }

    var body: some View {
        HStack() {
            ForEach(segments) { segment in
                Button {
                    selected = segment
                } label: {
                    VStack {
                        Text(segment.description)
                            .fontWeight(.medium)
                            .foregroundColor(selected.id == segment.id ? .black : Color(uiColor: .systemGray))
                            .padding([.leading, .trailing], nil)
                        ZStack {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 4)
                            
                            if selected.id == segment.id {
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }
                .fixedSize()
            }

            Spacer()
        }
    }
}

extension Binding {
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}


struct SegmentedView_Previews: PreviewProvider {
    static let gender = Gender.getAllPossibleGenders()

    static var previews: some View {
        SegmentedView<Gender>(gender, .constant(gender[0]))
    }
}
