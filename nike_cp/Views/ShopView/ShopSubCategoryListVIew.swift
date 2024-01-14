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
    @State private var loaded = false
    private let shopAPI = APIFactory.getShopAPI()
    private let userInfo = APIFactory.getLoginAPI().getCurrentLoggedInUser()
    
    var body: some View {
        if loaded
        {
            List(subcategoryList) { subCategory in
                    Text(subCategory.name)
                        .font(.title3)
                        .frame(height: 50)
                        .background(
                            NavigationLink {
                                ShopSubCategoryView(subCategory: subCategory)
                            }
                            label: {
                                   EmptyView()
                            })
            }.refreshable {
                assert(userInfo != nil)
                subcategoryList = await shopAPI.getSubcategoriesByCategoryID(user: userInfo.unsafelyUnwrapped, category: category)
            }
            .padding([.leading, .trailing], 0.0)
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
                subcategoryList = await shopAPI.getSubcategoriesByCategoryID(user: userInfo.unsafelyUnwrapped, category: category)
                loaded = true
            }
        }
    }
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func searchShop() {
//        TODO: Add code
    }
}

struct ShopSubCategoryListView_Previews: PreviewProvider
{
    static var previews: some View {
        ShopSubCategoryListView(category: Category(id: 0, name: "TMP", photo: Image("productPreview1")))
    }
}
