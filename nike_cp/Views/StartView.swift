//
//  StartView.swift
//  nike_cp
//
//  Created by Kathiir on 1/8/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            if UserDefaults.standard.bool(forKey: "LoggedIn") == false {
                NavigationStack {
                    WelcomeView()
                }
            }
            else
            {
                if UserDefaults.standard.bool(forKey: "KeyOnBoardingViewShown") == false {
                    NavigationStack {
                        OnboardingView()
                    }
                }
                else {
                    RootView()
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
