//
//  AuthView.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct AuthView: View {
    
    @State var colorModel: ColorModel = ColorModel()
    @Environment(\.presentationMode) var presentationMode
    @State var emailText: String = ""
    @State var passwordText: String = ""
    
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
                .font(.title)
                .bold()
            
            AuthInput(text: $emailText, placeHolder: "Enter email")
                .padding(.bottom, 5)
            
            AuthInput(text: $passwordText, placeHolder: "Enter password", isPasswordField: true)
                .padding(.bottom, 10)
            
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
