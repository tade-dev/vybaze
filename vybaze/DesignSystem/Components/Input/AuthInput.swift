//
//  AuthInput.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//s

import SwiftUI

struct AuthInput: View {
    
    @Binding var text: String
    var placeHolder: String
    var isPasswordField: Bool = false
    var visibility: Bool = false
    var keyboardType: UIKeyboardType = .default
    var isDisabled: Bool = false
    var textContentType: UITextContentType = .name
    var submitLabel: SubmitLabel = .done
    var onSubmit: (()-> Void)?
    
    
    var body: some View {
        
        Group {
            if isPasswordField {
                HStack {
                    if visibility {
                        TextField(placeHolder, text: $text)
                    }else {
                        SecureField(placeHolder, text: $text)
                    }
                    Image(systemName: visibility ? "eye.slash" : "eye")
                }
            } else {
                TextField(placeHolder, text: $text)
            }
        }
        .textContentType(textContentType)
        .keyboardType(keyboardType)
        .disabled(isDisabled)
        .onSubmit(onSubmit ?? { })
        .submitLabel(submitLabel)
        .autocorrectionDisabled(false)
        
    }
}
