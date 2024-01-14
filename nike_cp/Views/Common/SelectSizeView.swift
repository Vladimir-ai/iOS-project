//
//  SelectSizeView.swift
//  nike_cp
//
//  Created by tntrol on 14.01.2024.
//

import SwiftUI

struct SelectSizeView: View {
    @Environment(\.presentationMode) var presentationMode
    var sizes: [Size]
    var parent: ProductView
    @State private var sizePressed: Size?
    
    private let gridLayout = [
        GridItem(.adaptive(minimum: 75))
    ]
  
    var body: some View {
            VStack {
                HStack {
                    Text("What's your shoe size?")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                    LazyVGrid(columns: gridLayout, spacing: 8) {
                    ForEach (sizes) { sizeData in
                        VStack {
                            Button {
                                if sizePressed == nil {
                                    sizePressed = sizeData
                                } else {
                                    sizePressed = sizeData
                                }
                            } label: {
                                HStack{
                                    Spacer()
                                    Text(String(format: "%.f", sizeData.size)).font(.system(size: 20))
                                    Spacer()
                                }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing:  5))
                            }
                        }.buttonStyle(.borderedProminent)
                            .tint(self.sizePressed != nil && self.sizePressed?.size == sizeData.size ? .gray : .black )
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        if let sizeUnwrapped = sizePressed {
                            parent.size = sizeUnwrapped.size
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label:{
                        HStack{
                            Text("Ok")
                        }.padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing:  24))
                    }.foregroundColor(.white)
                        .background(Capsule().fill(.black))
                        .font(.system(.title2, design: .rounded, weight: .bold))
                    Spacer()
                }
            }.padding([.leading, .trailing], nil)
    }
}
