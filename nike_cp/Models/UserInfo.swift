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
    
    init(usrID: UInt64, name: String) {
        self.usrID = usrID
        self.name = name
    }
}
