//
//  ContentView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @State var selectedTab: Int = 0
    @State var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                }
            
            FeedbackView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv.music.note")
                        Text("Feedbacks")
                    }
                }
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                
        }
        .accentColor(colorModel.primaryColor)
    }
}

#Preview {
    DashboardView()
}
