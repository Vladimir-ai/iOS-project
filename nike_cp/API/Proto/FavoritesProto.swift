//
//  FavoritesProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation

protocol FavoritesProto {
    func getFavoritesList(userID: UInt64) async -> [ProductPreview]
}
