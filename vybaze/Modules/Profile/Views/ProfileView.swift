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
                            Text("Feedback Updates")
                        }
                        .tint(colorModel.primaryColor)
                    } header: {
                        Text("Notifications")
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
        }
    }
    
    var profileTile: some View {
        NavigationLink(destination: {
            EditProfileView()
        }) {
            HStack {
                AsyncImage(url: URL(string: "https://picsum.photos/200"), content: { image in
                    
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .clipShape(.circle)
                    
                }, placeholder: {
                    ProgressView()
                })
                
                    .frame(width: 50, height: 50)
                    .clipped()
                    .clipShape(.circle)
                
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
