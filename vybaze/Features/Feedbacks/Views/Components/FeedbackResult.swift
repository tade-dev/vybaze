//
//  FeedbackResult.swift
//  vybaze
//
//  Created by BSTAR on 23/04/2025.
//

import SwiftUI

struct FeedbackResultW: View {
    
    var imageUrl: URL?
    var progress: Double
    var colorModel: ColorModel
    
    var body: some View {
        HStack {
            
            CircularAsyncImage(
                url: imageUrl?.absoluteString ?? "",
                size: 100,
                cornerRadius: 10
            )
            
            VStack(alignment: .leading) {
                Text("Reflections")
                    .font(.appHeadline)
                    .fontWeight(.semibold)
                Text("Reverb Zn")
                    .font(.appBody)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            CircularProgressView(progress: 0.79, colorModel: colorModel)
                .frame(width: 100, height: 100)
        }
    }
}
