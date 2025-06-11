//
//  ContentView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct DashboardView: View {
    
    @State var colorModel: ColorModel = ColorModel()
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State var showOnboarding: Bool = false
    
    var body: some View {
        TabView(selection: $dashboardViewModel.selectedTab) {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.circle")
                        Text("Home")
                    }
                }.tag(0)
            
            FeedbackView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv.music.note")
                        Text("Feedbacks")
                    }
                }.tag(1)
        }
        .accentColor(colorModel.primaryColor)
        .sheet(isPresented: $showOnboarding, content: {
            OnboardingView(showOnboarding: $showOnboarding)
                .presentationDetents([.height(UIScreen.main.bounds.height)])
                .interactiveDismissDisabled()
                
        })
        .onAppear {
            showOnboarding = true
        }
    }
}

#Preview {
    DashboardView()
        .environmentObject(DashboardViewModel())
        .environmentObject(FeedbackViewModel())
        .environmentObject(ProfileViewModel())
}
