//
//  ConfirmBTN.swift
//  vybaze
//
//  Created by BSTAR on 10/06/2025.
//

import SwiftUI

struct ConfirmBTN: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        if #available(iOS 26.0, *) {
            Button {
                dismiss()
            } label: {
                Circle()
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .bold()
                    }
                    .glassEffect()
            }
            .accentColor(.primaryColor)
        }
    }
}

#Preview {
    ConfirmBTN()
}
