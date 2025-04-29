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
            HStack(spacing: 20) {
                Image(systemName: "music.note")
                    .foregroundStyle(colorModel.primaryColor)
                    .font(.headline)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(colorModel.primaryColor.opacity(0.3))
                            .opacity(0.1)
                            .frame(width: 40, height: 40)
                    )
                    .padding(.horizontal, 10)
                VStack(alignment: .leading) {
                    Text("Toxic Love")
                        .font(.appHeadline)
                        .foregroundStyle(colorModel.textColor)
                    Text("4 min")
                        .font(.regularFont(size: 14))
                        .foregroundStyle(.gray)
                }
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
                    .padding(.horizontal, 10)
                
            }
            .padding(.vertical, 5)
        }
        .sheet(isPresented: $isNavigationLinkActive) {
            AIFeedbackView()
        }
    }
}
