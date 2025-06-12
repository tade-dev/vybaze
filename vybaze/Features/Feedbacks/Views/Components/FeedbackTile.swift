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
                
                CircularAsyncImage(
                    url: "https://picsum.photos/200",
                    size: 50,
                    cornerRadius: 5
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Toxic Love")
                        .font(.appHeadline)
                        .foregroundStyle(colorModel.textColor)
                    Text("Cole Thomson")
                        .font(.regularFont(size: 14))
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 10)
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
        }
        .sheet(isPresented: $isNavigationLinkActive) {
            AIFeedbackView()
        }
    }
}
