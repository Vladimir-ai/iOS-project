//
//  ImgWithText.swift
//  nike_cp
//
//  Created by Adminisrator on 19.12.2023.
//

import SwiftUI


struct ImgWithTextView : View {
    var img: Image
    var imgText: String
   
    init(img: Image, imgText: String) {
        self.img = img
        self.imgText = imgText
    }
    
    var body : some View {
        VStack {
            HStack {
                img
                .resizable()
                .aspectRatio(contentMode: .fit)
               
                Spacer()
            }
            
            HStack {
                Text(imgText)
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
}
