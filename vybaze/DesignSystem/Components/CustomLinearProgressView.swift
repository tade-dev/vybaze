//
//  CustomLinearProgressView.swift
//  vybaze
//
//  Created by BSTAR on 09/05/2025.
//


import SwiftUI

struct CustomLinearProgressView: View {
    var progress: CGFloat
    var height: CGFloat = 8
    var backgroundColor: Color = Color.gray.opacity(0.2)
    var foregroundColor: Color = .blue
    var cornerRadius: CGFloat = 4

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(height: height)

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(foregroundColor)
                    .frame(width: geometry.size.width * progress, height: height)
                    .animation(.easeInOut(duration: 0.25), value: progress)
            }
        }
        .frame(height: height)
    }
}
