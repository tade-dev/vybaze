//
//  VybazePremiumView.swift
//  vybaze
//
//  Created by BSTAR on 29/04/2025.
//

import SwiftUI

struct VybazePremiumView: View {
    
    @State private var animate = false
    var colorModel: ColorModel = ColorModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                Image("vybaze_logo")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray.opacity(0.4), lineWidth: 0.5)
                            .frame(width: 80, height: 80)
                    }
                    .padding(.bottom, 10)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.1), value: animate)
                
                Text("Vybaze Premium")
                    .font(.appTitle)
                    .padding(.bottom, 5)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.2), value: animate)
                
                Text("Unlock the full power of your sound")
                    .font(.appHeadline)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 30)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.3), value: animate)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    buildPremiumTile(icon: "music", title: "Unlimited Feedbacks", desc: "Upload unlimited tracks and get detailed AI feedback anytime")
                    
                    buildPremiumTile(icon: "rocket", title: "Priority Processing", desc: "Your tracks get processed and analyzed faster than free users")
                    
                    buildPremiumTile(icon: "google-docs", title: "Full Feedback History", desc: "Regenerate and compare your past feedbacks overtime")
                    
                    buildPremiumTile(icon: "microphone", title: "Voice-Note Feedback ", desc: "Record or upload a vocal demo for instant AI lyric & performance coaching.”")

                    buildPremiumTile(icon: "sparkling", title: "Early Access to New Features", desc: "Be the first to try out upcoming tools and experimental AI models before public release.")

                }
                .padding(.bottom, 10)
                .opacity(animate ? 1 : 0)
                .offset(y: animate ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.4), value: animate)
                
                Text("7 days free trial, then $4.99/month or $49.99/year")
                    .font(.appBody)
                    .multilineTextAlignment(.center)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.5), value: animate)
                
                AppBtn(text: "Try Vybaze Premium ✨") {
                    // handle action
                }
                .padding(.horizontal, 20)
                .opacity(animate ? 1 : 0)
                .offset(y: animate ? 0 : 20)
                .animation(.easeOut(duration: 0.6).delay(0.6), value: animate)
            }
            .padding(.top, 50)
        }
        .overlay(alignment: .topTrailing, content: {
            ConfirmBTN()
                .padding()
        })
        .onAppear {
            animate = true
        }
        
    }
    
    func buildPremiumTile(icon: String, title: String, desc: String) -> some View {
        HStack(alignment: .top) {
            Image(icon)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.appHeadline)
                    .fontWeight(.medium)
                Text(desc)
                    .font(.appBody)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    VybazePremiumView()
}
