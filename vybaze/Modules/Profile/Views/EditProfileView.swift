//
//  EditProfileView.swift
//  vybaze
//
//  Created by BSTAR on 29/04/2025.
//

import SwiftUI

struct EditProfileView: View {
    
    var colorModel: ColorModel = ColorModel()
    @State var artistName: String = ""
    @State var email: String = ""
    @State var bio: String = ""
    
    var body: some View {
        ScrollView {
            
            VStack {
                Circle()
                    .stroke(colorModel.primaryColor, lineWidth: 1)
                    .frame(width: 150, height: 150)
                    .overlay(content: {
                        Circle()
                            .frame(width: 140, height: 140)
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 5)
                
                Text("Change Photo")
                    .font(.appHeadline)
                    .foregroundStyle(colorModel.primaryColor)
                    .padding(.bottom, 20)
                
                Group {
                    AuthInput(text: $artistName, placeHolder: "Enter name", label: "Artist name")
                    AuthInput(text: $artistName, placeHolder: "Enter email", label: "Email")
                    AuthInput(text: $artistName, placeHolder: "Enter bio", label: "Bio")
                }
                .padding(.horizontal, 20)
                
                AppBtn(text: "Save", action: {
                    
                })
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
            }
            .padding(.top, 20)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditProfileView()
}
