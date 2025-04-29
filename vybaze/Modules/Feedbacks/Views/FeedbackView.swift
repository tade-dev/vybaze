//
//  FeedbackView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct FeedbackView: View {
    
    var colorModel: ColorModel = ColorModel()
    @EnvironmentObject var feedbackViewModel: FeedbackViewModel
    
    var body: some View {
        NavigationView {
            List(content: {
                Section {
                    ForEach(0..<5) { index in
                        FeedbackTile(isNavigationLinkActive: $feedbackViewModel.isNavigationLinkActive, details: "Index \(index)")
                    }
                } header: {
                    Text("2022-05-10")
                        .font(.mediumFont(size: 18))
                        .bold()
                        .foregroundStyle(colorModel.textColor)
                }
            })
            .listStyle(.plain)
            .navigationTitle("Feedbacks")
            .searchable(
                text: $feedbackViewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search songs..."
            )
            .navigationBarItems(
                trailing: EditButton()
            )
            .safeAreaInset(
                edge: .bottom) {
                    FTA(showSheet: $feedbackViewModel.showSheet, colorModel: colorModel)
                }
        }
    }
}

#Preview {
    FeedbackView()
        .environmentObject(FeedbackViewModel())
}
