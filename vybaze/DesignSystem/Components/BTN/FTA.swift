//
//  FTA.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct FTA: View {
    
    @Binding var showSheet: Bool
    var colorModel: ColorModel
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                showSheet.toggle()
            } label: {
                Circle()
                    .fill(colorModel.primaryColor)
                    .frame(width: 60, height: 60)
                    .overlay {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                    .padding(.vertical, 20)
                    .padding(.trailing, 20)
            }
            .sheet(isPresented: $showSheet) {
                GenerateNewFeedback()
            }
            
        }
    }
}
