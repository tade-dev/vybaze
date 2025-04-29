//
//  LatestFeedbackW.swift
//  vybaze
//
//  Created by BSTAR on 22/04/2025.
//

import SwiftUI

struct LatestFeedbackW: View {
    
    @State var showSheet: Bool = false
    var colorModel: ColorModel
    var progress: Double
    var isHomeView: Bool
    var songTitle: String?
    var artistName: String?
    
    var body: some View {
        VStack(spacing: isHomeView ? 30 : 20) {
            HStack {
                CircularProgressView(progress: progress)
                Spacer()
                VStack(alignment: .leading) {
                    
                    if isHomeView {
                        Text("Latest Feedback")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorModel.textColor)
                            .padding(.bottom, 2)
                        
                        VStack(alignment: .leading) {
                            Text("Clarity: High")
                                .font(.title3)
                                .foregroundStyle(colorModel.textColor)
                            Text("Energy: Good")
                                .font(.title3)
                                .foregroundStyle(colorModel.textColor)
                        }
                    }else {
                        Text(songTitle ?? "")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(colorModel.textColor)
                            .padding(.bottom, 2)
                        
                        Text(artistName ?? "")
                            .font(.title2)
                            .foregroundStyle(colorModel.textColor)
                    }
                    
                    
                }
            }
            .padding(.horizontal, 20)
            if isHomeView {
                AppBtn(text: "Generate New Feedback") {
                    showSheet.toggle()
                }
                .fullScreenCover(isPresented: $showSheet) {
                    GenerateNewFeedback()
                }
            }
        }
        .padding(.vertical, 20)
    }
}
