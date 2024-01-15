//
//  CheckListItem.swift
//  nike_cp
//
//  Created by Kathiir on 1/14/24.
//

import Foundation
import SwiftUI

struct CheckListItem: Identifiable {
    var id: UInt64
    var text: String
    var image: Image
    
    init(id: UInt64, text: String, image: Image) {
        self.id = id
        self.text = text
        self.image = image
    }
}
