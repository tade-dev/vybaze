//
//  CircularAsyncImage.swift
//  vybaze
//
//  Created by BSTAR on 11/06/2025.
//

import SwiftUI

// MARK: - AnyShape Type Eraser
struct AnyShape: Shape {
    private let _path: (CGRect) -> Path
    
    init<S: Shape>(_ shape: S) {
        _path = shape.path(in:)
    }
    
    func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}

struct CircularAsyncImage: View {
    let url: String
    let size: CGFloat
    let borderColor: Color?
    let borderWidth: CGFloat
    let placeholderColor: Color
    let errorIcon: String
    let cornerRadius: CGFloat?
    
    init(
        url: String,
        size: CGFloat = 50,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        placeholderColor: Color = .gray,
        errorIcon: String = "photo",
        cornerRadius: CGFloat? = nil
    ) {
        self.url = url
        self.size = size
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.placeholderColor = placeholderColor
        self.errorIcon = errorIcon
        self.cornerRadius = cornerRadius
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
                    .clipShape(clipShape())
                    
            case .failure(_):
                ZStack {
                    backgroundShape()
                        .fill(placeholderColor.opacity(0.3))
                        .frame(width: size, height: size)
                    
                    Image(systemName: errorIcon)
                        .foregroundColor(placeholderColor)
                        .font(.system(size: size * 0.4))
                }
                
            case .empty:
                ZStack {
                    backgroundShape()
                        .fill(placeholderColor.opacity(0.3))
                        .frame(width: size, height: size)
                    
                    ProgressView()
                        .scaleEffect(0.8)
                        .tint(placeholderColor)
                }
                
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: size, height: size)
        .overlay(
            borderShape()
                .stroke(borderColor ?? Color.clear, lineWidth: borderWidth)
        )
    }
    
    // MARK: - Shape Helpers
    
    private func clipShape() -> AnyShape {
        if let cornerRadius = cornerRadius {
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
        } else {
            return AnyShape(Circle())
        }
    }
    
    private func backgroundShape() -> AnyShape {
        if let cornerRadius = cornerRadius {
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
        } else {
            return AnyShape(Circle())
        }
    }
    
    private func borderShape() -> AnyShape {
        if let cornerRadius = cornerRadius {
            return AnyShape(RoundedRectangle(cornerRadius: cornerRadius))
        } else {
            return AnyShape(Circle())
        }
    }
}

// MARK: - Convenience Initializers
extension CircularAsyncImage {
    
    /// Creates a circular image (default behavior)
    static func circular(
        url: String,
        size: CGFloat = 50,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        placeholderColor: Color = .gray,
        errorIcon: String = "photo"
    ) -> CircularAsyncImage {
        CircularAsyncImage(
            url: url,
            size: size,
            borderColor: borderColor,
            borderWidth: borderWidth,
            placeholderColor: placeholderColor,
            errorIcon: errorIcon,
            cornerRadius: nil
        )
    }
    
    /// Creates a rounded rectangle image
    static func rounded(
        url: String,
        size: CGFloat = 50,
        cornerRadius: CGFloat = 8,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        placeholderColor: Color = .gray,
        errorIcon: String = "photo"
    ) -> CircularAsyncImage {
        CircularAsyncImage(
            url: url,
            size: size,
            borderColor: borderColor,
            borderWidth: borderWidth,
            placeholderColor: placeholderColor,
            errorIcon: errorIcon,
            cornerRadius: cornerRadius
        )
    }
    
    /// Creates a square image with sharp corners
    static func square(
        url: String,
        size: CGFloat = 50,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 0,
        placeholderColor: Color = .gray,
        errorIcon: String = "photo"
    ) -> CircularAsyncImage {
        CircularAsyncImage(
            url: url,
            size: size,
            borderColor: borderColor,
            borderWidth: borderWidth,
            placeholderColor: placeholderColor,
            errorIcon: errorIcon,
            cornerRadius: 0
        )
    }
}
