//
//  FeedbackView.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct FeedbackView: View {
    
    @State var colorModel: ColorModel = ColorModel()
    @State var showSheet: Bool = false
    @State var isNavigationLinkActive: Bool = false
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(content: {
                Section {
                    ForEach(0..<5) { index in
                        FeedbackTile(isNavigationLinkActive: $isNavigationLinkActive, details: "Index \(index)")
                    }
                } header: {
                    Text("2022-05-10")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(colorModel.textColor)
                }

            })
            .listStyle(.plain)
            .navigationTitle("Feedbacks")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search songs..."
            )
            .navigationBarItems(
                trailing: EditButton()
            )
            .safeAreaInset(
                edge: .bottom) {
                    FTA(showSheet: $showSheet, colorModel: colorModel)
                }
        }
    }
}

#Preview {
    FeedbackView()
}
