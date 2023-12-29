//
//  CommonAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 26.12.2023.
//

import Foundation
import SwiftUI

class CommonStubAPI: StubAPI, CommonProto {
    static let sharedAPIInstance = CommonStubAPI()
    
    private var likesCache: Dictionary<UInt64, Bool> = Dictionary<UInt64, Bool>()
    
    private override init() {}
    
    func likeProduct(userID: UInt64, like: Bool) async -> Void {
        await super.waitBeforeReturn()
        likesCache[userID] = like
    }
}
