//
//  Promotion.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation
import SwiftUI

struct Promotion: Identifiable {
    var id: UInt64
    var img: Image
    var link: URL
    
    init(id: UInt64, img: Image, link: URL) {
        self.id = id
        self.img = img
        self.link = link
    }
}
