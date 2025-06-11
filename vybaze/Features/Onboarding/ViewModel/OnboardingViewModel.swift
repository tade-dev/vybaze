//
//  OnboardingViewModel.swift
//  vybaze
//
//  Created by Tade on 06/05/2025.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var currentPage: Int = 0
    @Published var onboardingItem: [Onboarding] = [
        Onboarding(
            title: "AI-Powered\nMusic Feedback",
            description: "Recieve detailed analysis and insights on your tracks",
            image: "ai-image"
        ),
        Onboarding(
            title: "Understand\nYour Songs",
            description: "Discover strengths and areas of improvement",
            image: "vocals"
        ),
        Onboarding(
            title: "Get Personalized\nAdvice",
            description: "Use custom suggestions to refine your music",
            image: "advice"
        )
    ]
    
    func updateCurrentPage(value: Int) {
        currentPage = value
    }
    
}
