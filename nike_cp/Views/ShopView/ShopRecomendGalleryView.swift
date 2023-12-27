//
//  ShopRecomendGalleryView.swift
//  nike_cp
//
//  Created by Adminisrator on 19.12.2023.
//

import SwiftUI

struct ShopRecomendGalleryView : View {
    @Binding var userInfo: UserInfo
    @Binding var gender: String
    @State private var recomendedCategoriesList: [Category] = []
    
    private let shopAPI = APIFactory.getShopAPI()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack {
                if (recomendedCategoriesList.count > 0)
                {
                    ForEach(recomendedCategoriesList) { category in
                        NavigationLink {
                            ShopSubCategoryListView(category: category)
                        }
                    label:
                        {
                            ImgWithTextView(img: category.photo, imgText: category.name)
                        }
                    }
                }
                else
                {
                    ProgressView().task {
                        await recomendedCategoriesList = shopAPI.getAllCategoriesByUserID(userInfo: userInfo)
                    }
                }
            }
            .onChange(of: gender){ _ in
                recomendedCategoriesList = []
            }
        }
    }
}

struct ShopRecomendGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRecomendGalleryView(userInfo: .constant(UserInfo(usrID: 0, name: "Carl")), gender: .constant("Men"))
    }
}
