//
//  LoginInfo.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

struct UserInfo {
    var usrID: UInt64
    var name: String
    private static let apiCall = LoginAPI()
    
    init(usrID: UInt64, name: String) {
        self.usrID = usrID
        self.name = name
    }
    
    static func login(email: String, passwd: String) async -> UserInfo! {
        return await UserInfo.apiCall.tryLogin(mail: email, pass: passwd)
    }
}
