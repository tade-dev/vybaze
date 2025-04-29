//
//  ProfileView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct ProfileView: View {
    
    
    @State var isToggleOn: Bool = false
    var colorModel: ColorModel = ColorModel()
    @State var showPremiumPopUp: Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List(content: {
                    Section {
                        profileTile
                        
                        Button(action: {
                            withAnimation(.spring(
                                response: 0.4,
                                dampingFraction: 0.5,
                                blendDuration: 0.8
                            )) {
                                showPremiumPopUp = true
                            }
                        }) {
                            Text("Upgrade to Vybaze Premium")
                                .foregroundStyle(colorModel.primaryColor)
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                        Text("Restore Purchase")
                            .font(.headline)
                            .fontWeight(.medium)
                    } header: {
                        Text("Account")
                    }
                    
                    Section {
                        Toggle(isOn: $isToggleOn) {
                            Text("Feedback Updates")
                        }
                        .tint(colorModel.primaryColor)
                    } header: {
                        Text("Notifications")
                    }
                    
                    Section {
                        NavigationLink(destination: {
                            
                        }) {
                            Text("Legal")
                        }
                        NavigationLink(destination: {
                            
                        }) {
                            Text("Privacy Policy")
                        }
                        Text("App Version")
                            .badge("1.0")
                    } header: {
                        Text("Notifications")
                    }
                    
                })
                
                if showPremiumPopUp {
                    PremiumSheet(showPremiumPopUp: $showPremiumPopUp)
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                }
                
            }
            .navigationTitle("Settings")
        }
    }
    
    var profileTile: some View {
        NavigationLink(destination: {
            
        }) {
            HStack {
                Circle()
                    .fill(.pink)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 5)
                
                VStack(alignment: .leading) {
                    Text("Akintade Oluwaseun")
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Text("akintadeseun816@gmail.com")
                        .accentColor(.gray)
                        .font(.headline)
                        .fontWeight(.regular)
                }
                
            }
        }
    }
}

#Preview {
    ProfileView()
}

struct PremiumSheet: View {
    
    @Binding var showPremiumPopUp: Bool
    var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Vybaze Premium")
                    .font(.title)
                    .bold()
                Text("Get unlimited feedback generations")
                Text("1-month free trial")
                    .foregroundStyle(colorModel.primaryColor)
            }
            
            VStack(alignment: .leading) {
                Text("Monthly")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$9.99 per month")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            )
            .padding(.top)
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("Monthly")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$9.99 per month")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            )
            .padding(.bottom, 20)
            
            Text("Cancel")
                .foregroundStyle(.blue)
                .frame(maxWidth: .infinity, alignment: .center)
                .onTapGesture {
                    showPremiumPopUp = false
                }
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 40)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width * 0.9)
        )
        .ignoresSafeArea()
    }
}
