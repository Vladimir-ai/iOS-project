//
//  FavoritesAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation

class FavoritesStubAPI: StubAPI, FavoritesProto {
    static let sharedAPIInstance = FavoritesStubAPI()
    
    private override init() {}
    
    func getFavoritesList(userID: UInt64) async -> [ProductPreview] {
        // TODO: Add code
        return []
    }
}
