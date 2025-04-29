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
    var label: String
    var isPasswordField: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
            if isPasswordField {
                SecureField(placeHolder, text: $text)
                    .textInputAutocapitalization(.never)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                            .frame(height: 50)
                            .cornerRadius(5)
                    )
                    .padding(.bottom, 10)
            } else {
                TextField(placeHolder, text: $text)
                    .textInputAutocapitalization(.never)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                            .frame(height: 50)
                            .cornerRadius(5)
                    )
                    .padding(.bottom, 10)
            }
        }
    }
}
