//
//  ShopRecomendGalleryView.swift
//  nike_cp
//
//  Created by Adminisrator on 19.12.2023.
//

import SwiftUI

struct ShopRecomendGalleryView : View {
    
    private let galleryList = [
        GalleryItem(destinationView: AnyView(ShopBestSellersView()), imgName: "ImageBestSellers", imgText: "Best Sellers"),
        GalleryItem(destinationView: AnyView(ShopFeaturedInNikeAirView()), imgName: "ImageFeaturedInNikeAir", imgText: "Featured in Nike Air"),
        GalleryItem(destinationView: AnyView(ShopNewRunningEssentials()), imgName: "ImageNewRunningEssentials", imgText: "New Running Essentials")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack {
                ForEach(galleryList) { galleryItem in
                    NavigationLink {
                        galleryItem.destinationView
                    }
                label:
                    {
                        ImgWithTextView(imgName: galleryItem.imgName, imgText: galleryItem.imgText)
                    }
                }
            }
        }
    }
}
            
            
private struct GalleryItem: Identifiable {
    let id = UUID()
    var destinationView: AnyView
    var imgName: String
    var imgText: String.LocalizationValue
    
    init(destinationView: AnyView, imgName: String, imgText: String.LocalizationValue) {
        self.destinationView =  destinationView
        self.imgName = imgName
        self.imgText = imgText
    }
}


struct ShopRecomendGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRecomendGalleryView()
    }
}
