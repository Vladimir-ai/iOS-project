//
//  ImgWithText.swift
//  nike_cp
//
//  Created by Adminisrator on 19.12.2023.
//

import SwiftUI


struct ImgWithTextView : View {
    var imgName: String
    var imgText: String.LocalizationValue
    
    init(imgName: String, imgText: String.LocalizationValue) {
        self.imgName = imgName
        self.imgText = imgText
    }
    
    var body : some View {
        VStack {
            HStack {
                Image(imgName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               
                Spacer()
            }
            
            HStack {
                Text(String(localized: imgText))
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
