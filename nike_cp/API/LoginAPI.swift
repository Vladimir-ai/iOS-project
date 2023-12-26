//
//  LoginAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 24.12.2023.
//

import Foundation

class LoginAPI: StubAPI {
   
    func login(mail: String, pass: String) async -> UserInfo! {
        await super.waitBeforeReturn()
        return UserInfo(usrID: userId, name: "Carl")
    }
    
    func logout() async -> Void {
        // TODO: Add code
    }
    
}
