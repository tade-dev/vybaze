//
//  SocialBTN.swift
//  vybaze
//
//  Created by BSTAR on 20/05/2025.
//

import SwiftUI

struct SocialBTN: View {
    
    var action: () -> Void
    var title: String
    var hasBorder: Bool = false
    var icon: String? = nil
    var bgColor: Color?
    var titleColor: Color?
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(titleColor ?? .white)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                }
                .overlay(alignment: .leading) {
                    Image(systemName: "apple.logo")
                        .foregroundStyle(.white)
                        .font(.mediumFont(size: 22))
                        .padding(.leading, 20)
                }
        }
        .accentColor(.text)
    }
}

#Preview {
    SocialBTN(action: {
        
    }, title: "Continue with Apple")
}
