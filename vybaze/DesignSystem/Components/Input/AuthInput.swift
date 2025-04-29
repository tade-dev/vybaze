//
//  AuthInput.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct AuthInput: View {
    
    @Binding var text: String
    var placeHolder: String
    var isPasswordField: Bool = false
    
    var body: some View {
        
        if isPasswordField {
            SecureField(placeHolder, text: $text)
                .textInputAutocapitalization(.never)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    .gray.opacity(0.2)
                )
                .cornerRadius(5)
            
        } else {
            TextField(placeHolder, text: $text)
                .textInputAutocapitalization(.never)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(
                    .gray.opacity(0.2)
                )
                .cornerRadius(5)
        }

    }
}
