//
//  HomeView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct HomeView: View {
    
    var colorModel: ColorModel = ColorModel()
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            List(content: {
                
                LatestFeedbackW(colorModel: colorModel, progress: 0.3, isHomeView: true)
                
                Section {
                    ForEach(0..<3) { index in
                        FeedbackTile(isNavigationLinkActive: $dashboardViewModel.isNavigationLinkActive, details: "Active", colorModel: colorModel)
                    }
                } header: {
                    Text("Recent Feedbacks")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(colorModel.textColor)
                }
                
                VStack(alignment: .leading) {
                    Text("Unlock Unlimited Feedbacks")
                        .font(.title3)
                        .foregroundStyle(colorModel.textColor)
                    Text("Go Premium")
                        .font(.headline)
                        .foregroundStyle(colorModel.primaryColor)
                }

            })
            .navigationTitle("Welcome Back, Tade!")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DashboardViewModel())
}
