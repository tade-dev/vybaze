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
//        if #available(iOS 26.0, *) {
//            Button(action: action, label: {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(bgnColor ?? colorModel.primaryColor)
//                    .frame(height: 50)
//                    .frame(maxWidth: .infinity)
//                    .overlay {
//                        Text(text)
//                            .font(.appHeadline)
//                            .bold()
//                            .foregroundStyle(.white)
//                    }
//            })
//        }
        Button(action: action, label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(bgnColor ?? colorModel.primaryColor)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .overlay {
                    Text(text)
                        .font(.appHeadline)
                        .bold()
                        .foregroundStyle(.white)
                }
        })
    }
    
}
