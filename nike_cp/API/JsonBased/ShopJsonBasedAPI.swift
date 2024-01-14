//
//  ShopJsonBased.swift
//  nike_cp
//
//  Created by Adminisrator on 14.01.2024.
//

import Foundation

class ShopJsonBasedAPI: ShopProto {
    static let sharedAPIInstance = ShopJsonBasedAPI()

    private init() {}
    
    func getMustHaveCategoriesByUserID(userInfo: UserInfo, gender: String) async -> [Category] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_must_haves_categories")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(userGenderRequestModel(user: userInfo, gender: gender))
        
        request.httpBody = data
        
        var ret: [Category] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            ret = try JSONDecoder().decode([Category].self, from: data)
        } catch {
            print("get_must_haves_categories error")
        }
        
        return ret
    }
    
    func getCommonCategoriesByGender(gender: String) async -> [Category] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_common_categories")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let gender = ["gender": gender]
        let data = try! encoder.encode(gender)
        
        request.httpBody = data
        
        var ret: [Category] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode([Category].self, from: data)
        } catch {
            print("get_common_categories error")
        }
        
        return ret
    }
    
    func getProductTypesByMustHaveCategoryID(category: Category) async -> [ProductType] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_product_types_by_must_have_category_id")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(category)
        
        request.httpBody = data
        
        var ret: [ProductType] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode([ProductType].self, from: data)
        } catch {
            print("Can't do anything")
        }
        
        return ret
    }
    
    func getSubcategoriesByCategoryID(user: UserInfo, category: Category) async -> [SubCategory] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_subcategories_list")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(genericRequestModelForTwoFields<UserInfo, Category>(type1: user, type2: category))
        
        request.httpBody = data
        
        var ret: [SubCategory] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode([SubCategory].self, from: data)
        } catch {
            print("Can't do anything")
        }
        
        return ret
    }
    
    func getProductTypesBySubCategoryID(user: UserInfo, subCategory: SubCategory) async -> [ProductType] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_product_types_by_subcategories")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(genericRequestModelForTwoFields<UserInfo, SubCategory>(type1: user, type2: subCategory))
        
        request.httpBody = data
        
        var ret: [ProductType] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode([ProductType].self, from: data)
        } catch {
            print("Can't do anything")
        }
        
        return ret
    }
    
    func getProductPreviewsByProductType(user: UserInfo, productType: ProductType) async -> [ProductPreview] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_preview_list_by_product_type")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let data = try! encoder.encode(genericRequestModelForTwoFields<UserInfo, ProductType>(type1: user, type2: productType))
        
        request.httpBody = data
        
        var ret: [ProductPreview] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode([ProductPreview].self, from: data)
        } catch {
            print("Can't do anything")
        }
        
        return ret
    }
    
    func getFullProductInfo(userID: UInt64, productID: UInt64) async -> Product {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/get_full_product_info")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let jsonDict = ["user_id": userID, "product_id": productID]
        let data = try! encoder.encode(jsonDict)
        
        request.httpBody = data
        
        var ret = Product(id: 1, name: "stub", price: 299.9, shortDescription: "", liked: false, photos: [], fullDescription: "awd", productState: nil, sizes: [])
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode(Product.self, from: data)
        } catch {
            print("Can't do anything")
        }
        
        return ret
    }
    
    func searchProducts(userID: UInt64, searchPattern: String, categoryID: UInt64!) async -> [ProductPreview] {
        let url = URL(string: JsonApiConfig.getBaseUrl() + "api/shop/find_products")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let jsonDict = ["user_id": String(userID), "search_pattern": searchPattern]
        let data = try! encoder.encode(jsonDict)
        
        request.httpBody = data
        
        var ret: [ProductPreview] = []
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: data)
            let decoder = JSONDecoder()
            ret = try decoder.decode([ProductPreview].self, from: data)
        } catch {
            print("Can't do anything")
        }
        
        return ret
    }
    
    
}

struct userGenderRequestModel: Encodable {
    let user: UserInfo
    let gender: String
    
    public func encode(to encoder: Encoder) throws {
        try user.encode(to: encoder)
        try ["gender": gender].encode(to: encoder)
    }
}

struct genericRequestModelForTwoFields<T1:Encodable, T2:Encodable> : Encodable {
    let type1: T1
    let type2: T2
    
    public func encode(to encoder: Encoder) throws {
        try type1.encode(to: encoder)
        try type2.encode(to: encoder)
    }
}
