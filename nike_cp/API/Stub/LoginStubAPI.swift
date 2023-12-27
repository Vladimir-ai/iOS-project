//
//  LoginAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

class LoginStubAPI: StubAPI, LoginProto {
    static let sharedAPIInstance = LoginStubAPI()
    private let loggedUser = UserInfo(usrID: 0, name: "Carl")
    
    private override init() {}
    
    func login(mail: String, pass: String) async -> UserInfo! {
        await super.waitBeforeReturn()
        return loggedUser
    }
    
    func logout() async -> Void {
        // TODO: Add code
    }
    
    func getCurrentLoggedInUser() -> UserInfo! {
        return loggedUser
    }
    
}
