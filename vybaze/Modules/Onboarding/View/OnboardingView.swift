//
//  OnboardingView.swift
//  vybaze
//
//  Created by BSTAR on 06/05/2025.
//

import SwiftUI

struct OnboardingView: View {

    @StateObject var onboardingV = OnboardingViewModel()
    @State private var animate = false
    @Binding var showOnboarding: Bool
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()

            TimelineView(.animation) {_ in
                ZStack {
                    ForEach(onboardingV.onboardingItem.indices, id: \.self) { index in
                        if onboardingV.currentPage == index {
                            VStack(spacing: 20) {
                                Text(onboardingV.onboardingItem[index].title)
                                    .font(.boldFont(size: 40))
                                    .fontWeight(.bold)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.5)
                                    .scaleEffect(animate ? 1 : 0.8)
                                    .opacity(animate ? 1 : 0)
                                    .animation(.interpolatingSpring(stiffness: 120, damping: 10).delay(0.1), value: animate)

                                Image(onboardingV.onboardingItem[index].image)
                                    .resizable()
                                    .frame(maxWidth: width)
                                    .frame(height: height * 0.4)
                                    .scaleEffect(animate ? 1 : 0.8)
                                    .opacity(animate ? 1 : 0)
                                    .animation(.interpolatingSpring(stiffness: 100, damping: 9).delay(0.2), value: animate)

                                Text(onboardingV.onboardingItem[index].description)
                                    .font(.mediumFont(size: 25))
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .minimumScaleFactor(0.5)
                                    .scaleEffect(animate ? 1 : 0.8)
                                    .opacity(animate ? 1 : 0)
                                    .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.3), value: animate)
                            }
                            .id(index)
                            .onAppear {
                                animate = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                    animate = true
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            
            Spacer()

            Group {
                
                AppBtn(text: onboardingV.currentPage == 2 ? "Get Started" : "Next") {
                    if onboardingV.currentPage < 2 {
                        withAnimation(.easeInOut) {
                            onboardingV.updateCurrentPage(value: onboardingV.currentPage + 1)
                            animate = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                animate = true
                            }
                        }
                    }else {
                        showOnboarding = false
                    }
                }
                .padding(.bottom, 10)

                HStack {
                    ForEach(onboardingV.onboardingItem.indices, id: \.self) { index in
                        Circle()
                            .fill(index == onboardingV.currentPage ? .gray.opacity(0.5) : .gray.opacity(0.3))
                            .frame(width: 10, height: 10)
                            .scaleEffect(index == onboardingV.currentPage ? 1.3 : 1.0)
                            .animation(.spring(), value: onboardingV.currentPage)
                    }
                }
                
            }

        }
        .padding(.horizontal, 20)
        .onAppear {
            animate = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animate = true
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true))
}
