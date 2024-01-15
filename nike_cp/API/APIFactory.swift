//
//  APIFactory.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation

class APIFactory {
    
    static func getShopAPI() -> ShopProto {
        return ShopJsonBasedAPI.sharedAPIInstance
    }
    
    static func getLoginAPI() -> LoginProto {
        return LoginStubAPI.sharedAPIInstance
    }
    
    static func getCartAPI() -> CartProto {
        return CartStubAPI.sharedAPIInstance
    }
    
    static func getCommonAPI() -> CommonProto {
        return CommonStubAPI.sharedAPIInstance
    }
    
    static func getFavoritesAPI() -> FavoritesProto {
        return FavoritesStubAPI.sharedAPIInstance
    }
    
    static func getHomeAPI() -> HomeProto {
        return HomeStubAPI.sharedAPIInstance
    }
}
