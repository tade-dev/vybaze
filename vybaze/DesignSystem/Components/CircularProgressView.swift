//
//  CircularProgressView.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

import SwiftUI

struct CircularProgressView: View {
    var progress: Double
    @State var colorModel: ColorModel = ColorModel()

    var body: some View {
        ZStack {
            Circle()
                .stroke(colorModel.primaryColor.opacity(0.1), lineWidth: 8)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    colorModel.primaryColor,
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: progress)

            Text("\(Int(progress * 100))%")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(width: 100, height: 100)
    }
}
