//
//  AppBtn.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct AppBtn: View {
    
    var bgnColor: Color?
    var height: CGFloat?
    var text: String
    var action: () -> Void
    var icon: String?
    var isImageBtn: Bool = false
    var hasBorder: Bool = false
    @State var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: height ?? 50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(bgnColor ?? colorModel.primaryColor)
            )
            .onTapGesture(perform: action)
    }
    
}

struct SocialBtn: View {
    
    var bgnColor: Color?
    var height: CGFloat?
    var text: String
    var action: () -> Void
    var icon: String
    @State var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        HStack(spacing: 10, content: {
            Image(icon)
                .resizable()
                .frame(width: 20, height: 20)
                .scaledToFill()
            Text(text)
                .font(.headline)
                .foregroundStyle(colorModel.textColor)
        })
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: height ?? 50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .onTapGesture(perform: action)
    }
    
}
