//
//  vybazeApp.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

@main
struct vybazeApp: App {
    
    @StateObject var feedbackViewModel = FeedbackViewModel()
    @StateObject var dashboardViewModel = DashboardViewModel()
    @StateObject var profileVM = ProfileViewModel()
    @StateObject var settings = VybazeSettings()
    let defaultAppFont = Font.custom("Satoshi-Regular", size: 16)
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environmentObject(feedbackViewModel)
                .environmentObject(dashboardViewModel)
                .environmentObject(profileVM)
                .environmentObject(settings)
                .environment(\.font, defaultAppFont)
        }
    }
}
