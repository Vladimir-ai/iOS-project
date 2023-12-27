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
    
    private override init() {}
    
    func likeProduct(userID: UInt64, like: Bool) async -> Void {
        // TODO: Add code
    }
}
