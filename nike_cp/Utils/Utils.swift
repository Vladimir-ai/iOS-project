//
//  Utils.swift
//  nike_cp
//
//  Created by Adminisrator on 14.01.2024.
//

import SwiftUI

class Utils {
    public static func base64StringToImage(base64Str: String) throws -> Image {
        if let data = Data(base64Encoded: base64Str), let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        else
        {
            throw CustomException.cantDecodeImage
        }
    }
}
