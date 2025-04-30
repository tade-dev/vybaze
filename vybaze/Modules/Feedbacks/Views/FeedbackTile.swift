//
//  FeedbackTile.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct FeedbackTile: View {
    
    @Binding var isNavigationLinkActive: Bool
    var details: String
    var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        Button {
            isNavigationLinkActive.toggle()
        } label: {
            HStack() {
                
                cacheImage(url: "https://picsum.photos/200")
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Toxic Love")
                        .font(.appHeadline)
                        .foregroundStyle(colorModel.textColor)
                    Text("Cole Thomson")
                        .font(.regularFont(size: 14))
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 20)
                Spacer()
                Text("83%")
                    .foregroundStyle(colorModel.primaryColor)
                    .font(.appHeadline)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(colorModel.primaryColor)
                            .opacity(0.1)
                    )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
        }
        .sheet(isPresented: $isNavigationLinkActive) {
            AIFeedbackView()
        }
    }
}
