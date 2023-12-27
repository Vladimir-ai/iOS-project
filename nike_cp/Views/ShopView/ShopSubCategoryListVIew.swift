//
//  SubcategoryList.swift
//  nike_cp
//
//  Created by Adminisrator on 27.12.2023.
//

import SwiftUI

struct ShopSubCategoryListView: View {
    @Environment(\.presentationMode) var presentationMode
    var category: Category
    
    
    @State private var subcategoryList: [SubCategory] = []
    private let shopAPI = APIFactory.getShopAPI()
    private let userInfo = APIFactory.getLoginAPI().getCurrentLoggedInUser()
    
    var body: some View {
        if subcategoryList.count > 0
        {
            List(subcategoryList) { subCategory in
                NavigationLink {
                    ShopSubCategoryGridView(subCategory: subCategory)
                }
            label:
                {
                    HStack{
                        Text(subCategory.name).font(.title3)
                    }.frame(height: 50)
                }
            }.refreshable {
                assert(userInfo != nil)
                subcategoryList = await shopAPI.getSubcategoriesByCategoryID(userID: userInfo.unsafelyUnwrapped.usrID, categoryID: category.id)
            }
            .accentColor(.black)
            .listStyle(.plain)
            .navigationTitle(category.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading)
                {
                    Button(action: goBack) {
                        Label("Go Back", systemImage: "chevron.backward")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: searchShop) {
                        Label("Search", systemImage: "magnifyingglass")
                            .labelStyle(.iconOnly)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
        else
        {
            ProgressView().task {
                assert(userInfo != nil)
                subcategoryList = await shopAPI.getSubcategoriesByCategoryID(userID: userInfo.unsafelyUnwrapped.usrID, categoryID: category.id)
            }
        }
    }
    
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func searchShop() {
//        TODO: Add code
    }
}
