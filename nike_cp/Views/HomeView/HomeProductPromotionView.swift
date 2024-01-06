//
//  HomeProductPromotion.swift
//  nike_cp
//
//  Created by tntrol on 06.01.2024.
//



import SwiftUI

struct HomeProductPromotionView: View {
    private let homeAPI = APIFactory.getHomeAPI()
    private let loginAPI = APIFactory.getLoginAPI()
    
    @State private var currentUser: UserInfo!
    @State private var promotionList: [Promotion] = []
    
    var body: some View {
        if promotionList.count > 0 {
            VStack {
                ForEach(promotionList) { promotion in
                    Link(destination: promotion.link, label:
                    {
                        promotion.img
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
                }
            }
        }
        else
        {
            ProgressView().task {
                currentUser	 = loginAPI.getCurrentLoggedInUser()
                promotionList = await homeAPI.getPromotions(userID: currentUser.usrID)
            }
        }
    }
}
