//
//  ProfileView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct ProfileView: View {
    
    
    @State var isFeedbackUpdateOn: Bool = false
    @State var showPremiumPopUp: Bool = false
    var colorModel: ColorModel = ColorModel()
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                List(content: {
                    Section {
                        
                        profileTile
                        
                        Button(action: {
                            showPremiumPopUp.toggle()
                        }) {
                            Text("Upgrade to Vybaze Premium")
                                .foregroundStyle(colorModel.primaryColor)
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                        .sheet(isPresented: $showPremiumPopUp) {
                            VybazePremiumView()
                        }
                        
                        Text("Restore Purchase")
                            .font(.headline)
                            .fontWeight(.medium)
                    } header: {
                        Text("Account")
                            .textCase(.none)
                    }

                    Section {
                        Toggle(isOn: $isFeedbackUpdateOn) {
                            Text("Dark Mode")
                        }
                        .tint(colorModel.primaryColor)
                    } header: {
                        Text("App")
                            .textCase(.none)
                    }
                    
                    Section() {
                        Button(action: {
                            if let url = URL(string: "https://preview--vybaze-song-alchemy-hub.lovable.app/terms") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text("Legal")
                        }
                        Button(action: {
                            if let url = URL(string: "https://preview--vybaze-song-alchemy-hub.lovable.app/privacy") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text("Privacy Policy")
                        }
                        Text("App Version")
                            .badge("1.0")
                    } header: {
                        Text("General")
                            .textCase(.none)
                    }
                })
            }
            .navigationTitle("Settings")
            .navigationBarItems(
                trailing: Button("Cancel") {
                    dismiss()
                }
                    .accentColor(colorModel.primaryColor)
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var profileTile: some View {
        NavigationLink(destination: {
            EditProfileView()
        }) {
            HStack {

                CircularAsyncImage(url: "https://picsum.photos/200")
                
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
        .environmentObject(ProfileViewModel())
}
