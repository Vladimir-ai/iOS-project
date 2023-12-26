//
//  RecomendationList.swift
//  nike_cp
//
//  Created by Adminisrator on 23.12.2023.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    var id: UInt64
    var name: String
    var photo: Image
        
    init(id: UInt64, name: String, photo: Image) {
        self.id = id
        self.name = name
        self.photo = photo
    }
}
