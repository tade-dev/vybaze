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
    @State var showUploadSheet: Bool = false
    
    var body: some View {
        NavigationView {
            List(content: {
                Section {
                    ForEach(0..<5) { index in
                        FeedbackTile(isNavigationLinkActive: $feedbackViewModel.isNavigationLinkActive, details: "Index \(index)")
                    }
                    .onDelete { indexSet in
                        
                    }
                } header: {
                    Text("2022-05-10")
                        .font(.mediumFont(size: 18))
                        .bold()
                        .foregroundStyle(colorModel.textColor)
                }
                .listRowSeparator(.hidden)
            })
            .listStyle(.plain)
            .navigationTitle("Feedbacks")
            .toolbar(content: {
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        Button {
                            showUploadSheet.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showUploadSheet) {
                            GenerateNewFeedback()
                        }
                    }
                )
                ToolbarItem(
                    placement: .topBarTrailing,
                    content: {
                        EditButton()
                    }
                )
            })
            .searchable(
                text: $feedbackViewModel.searchText,
                placement: .toolbarPrincipal,
                prompt: "Search songs..."
            )
        }
    }
}

#Preview {
    FeedbackView()
        .environmentObject(FeedbackViewModel())
}
