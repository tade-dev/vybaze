//
//  CircularAsyncImage.swift
//  vybaze
//
//  Created by BSTAR on 11/06/2025.
//
import SwiftUI

struct CircularAsyncImage: View {
    let url: String
    let size: CGFloat
    let borderColor: Color?
    let borderWidth: CGFloat
    let placeholderColor: Color
    let errorIcon: String
    
    init(
        url: String,
        size: CGFloat = 50,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        placeholderColor: Color = .gray,
        errorIcon: String = "photo"
    ) {
        self.url = url
        self.size = size
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.placeholderColor = placeholderColor
        self.errorIcon = errorIcon
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipped()
                    .clipShape(Circle())
                    
            case .failure(_):
                ZStack {
                    Circle()
                        .fill(placeholderColor.opacity(0.3))
                        .frame(width: size, height: size)
                    
                    Image(systemName: errorIcon)
                        .foregroundColor(placeholderColor)
                        .font(.system(size: size * 0.4))
                }
                
            case .empty:
                ZStack {
                    Circle()
                        .fill(placeholderColor.opacity(0.3))
                        .frame(width: size, height: size)
                    
                    ProgressView()
                        .scaleEffect(0.8)
                }
                
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: size, height: size)
        .overlay(
            Circle()
                .stroke(borderColor ?? Color.clear, lineWidth: borderWidth)
        )
    }
}
