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
    @State var dashboardViewModel = DashboardViewModel()
    let defaultAppFont = Font.custom("Satoshi-Regular", size: 16)
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environmentObject(feedbackViewModel)
                .environmentObject(dashboardViewModel)
                .environment(\.font, defaultAppFont)
        }
    }
}
