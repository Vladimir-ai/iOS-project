//
//  LoginAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

class LoginStubAPI: StubAPI, LoginProto {
    static let sharedAPIInstance = LoginStubAPI()
    
    private override init() {}
    
    func login(mail: String, pass: String) async -> UserInfo! {
        await super.waitBeforeReturn()
        return UserInfo(usrID: userId, name: "Carl")
    }
    
    func logout() async -> Void {
        // TODO: Add code
    }
    
}
