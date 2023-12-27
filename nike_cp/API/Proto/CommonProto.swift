//
//  CommonProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation

protocol CommonProto {
    func likeProduct(userID: UInt64, like: Bool) async -> Void
}
