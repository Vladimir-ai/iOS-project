//
//  CommonJsonBasedAPI.swift
//  nike_cp
//
//  Created by Adminisrator on 15.01.2024.
//

import Foundation

class CommonJsonBasedAPI: CommonProto {
    static let sharedAPIInstance = CommonJsonBasedAPI()
    
    private init () {}
    
    func likeProduct(userID: UInt64, productID: UInt64, like: Bool) async {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/common/like_product")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let jsonDict = ["user_id": String(userID), "product_id": String(productID), "like": String(like)]
        let data = try! encoder.encode(jsonDict)
        
        request.httpBody = data
        
        do {
            (_, _) = try await URLSession.shared.upload(for: request, from: data)
        } catch {
            print("Can't do anything")
        }
    }

}
