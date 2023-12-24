//
//  LoginAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

class LoginAPI: StubAPI {
   
    func tryLogin(mail: String, pass: String) async -> UserInfo! {
        await super.waitBeforeReturn()
        return UserInfo(usrID: userId, name: "Carl")
    }
}
