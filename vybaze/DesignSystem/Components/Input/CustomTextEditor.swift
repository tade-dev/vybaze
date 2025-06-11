//
//  CustomTextEditor.swift
//  vybaze
//
//  Created by BSTAR on 10/06/2025.
//

import SwiftUI

struct CustomTextEditor: View {
    
    @State var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .opacity(text.isEmpty ? 0.25 : 1)
            
            if text.isEmpty {
                Text("Enter your bio")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .allowsHitTesting(false)
            }
        }
        .frame(minHeight: 100)
    }
}

#Preview {
    CustomTextEditor(text: "Active")
}
