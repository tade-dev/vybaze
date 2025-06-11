//
//  LatestFeedbackW.swift
//  vybaze
//
//  Created by BSTAR on 22/04/2025.
//

import SwiftUI

struct LatestFeedbackW: View {
    
    @State var showSheet: Bool = false
    var colorModel: ColorModel = ColorModel()
    var progress: Double
    var isHomeView: Bool
    var songTitle: String?
    var artistName: String?
    
    var body: some View {
        VStack(spacing: isHomeView ? 30 : 20) {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    
                    if isHomeView {
                        Text("Latest Feedback")
                            .font(.appHeadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .padding(.bottom, 5)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Lost in the Groove")
                                .font(.title2)
                                .dynamicTypeSize(...DynamicTypeSize.medium)
                                .fontWeight(.bold)
                            Group {
                                Text("Cody Moore")
                                Text("1hr ago")
                            }
                            .foregroundStyle(.gray)
                            .font(.appBody)
                            .fontWeight(.medium)
                        }
                        .font(.mediumFont(size: 20))
                        .foregroundStyle(colorModel.textColor)
                    }else {
                        Text(songTitle ?? "")
                            .font(.appTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorModel.textColor)
                            .padding(.bottom, 2)
                        
                        Text(artistName ?? "")
                            .font(.boldFont(size: 25))
                            .foregroundStyle(colorModel.textColor)
                    }
                    
                    
                }
                Spacer()
                CircularProgressView(progress: progress)
            }
            if isHomeView {
                AppBtn(text: "Generate New Feedback") {
                    showSheet.toggle()
                }
                .sheet(isPresented: $showSheet) {
                    GenerateNewFeedback()
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.gray.opacity(0.1))
        )
    }
}

#Preview {
    LatestFeedbackW(progress: 0.5, isHomeView: true, songTitle: "Active", artistName: "Neno")
}
