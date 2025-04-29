//
//  DashboardViewModel.swift
//  vybaze
//
//  Created by Tade on 26/04/2025.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var selectedTab: Int = 0
    @Published var isNavigationLinkActive: Bool = false
    @Published var showSheet: Bool = false
    
}
