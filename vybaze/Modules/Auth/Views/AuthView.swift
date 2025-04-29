//
//  AuthView.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct AuthView: View {
    
    var colorModel: ColorModel = ColorModel()
    @Environment(\.presentationMode) var presentationMode
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .accentColor(colorModel.primaryColor)
            }
            .padding(.vertical, 20)
            
            Text("Log in or Sign up")
                .font(.appTitle)
                .bold()
                .padding(.bottom, 10)
            
            AuthInput(text: $authViewModel.emailText, placeHolder: "Enter email", label: "Email")
                .padding(.bottom, 5)
            
            AuthInput(text: $authViewModel.passwordText, placeHolder: "Enter password", label: "Password", isPasswordField: true)
                .padding(.bottom, 20)
            
            AppBtn(text: "Continue") {
                
            }
            
            Text("or")
                .font(.headline)
                .foregroundStyle(.gray)
            
            SocialBtn(text: "Continue with google", action: {
                
            }, icon: "Google")
            .padding(.bottom, 10)

            SocialBtn(text: "Continue with apple", action: {
                
            }, icon: "Apple")

        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    AuthView()
}
