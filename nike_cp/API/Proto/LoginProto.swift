//
//  LoginProto.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import Foundation

protocol LoginProto {
    var loggedUser: UserInfo {get}
    
    func login(mail: String, pass: String) async -> UserInfo!
    
    func logout() async -> Void
    
    func getCurrentLoggedInUser() -> UserInfo!
}
