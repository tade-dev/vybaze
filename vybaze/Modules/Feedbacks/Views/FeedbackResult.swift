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
            
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                    
                case .empty:
                    
                    ProgressView()
                        .frame(width: 100, height: 100)
                    
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    
                case .failure(_):
                    Image(systemName: "photo")
                        .foregroundStyle(.gray)
                        .frame(width: 100, height: 100)
                    
                @unknown default:
                    Image(systemName: "photos")
                        .foregroundStyle(.gray)
                        .frame(width: 100, height: 100)
                }
            }
            
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
