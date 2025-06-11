//
//  AIFeedbackView.swift
//  vybaze
//
//  Created by BSTAR on 21/04/2025.
//

import SwiftUI

struct AIFeedbackView: View {
    
    var colorModel: ColorModel = ColorModel()
    @Environment(\.presentationMode) var presentationMode
    @State var imageUrl = URL(string: "https://plus.unsplash.com/premium_photo-1699544856963-49c417549268?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dXJsfGVufDB8fDB8fHww")
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10 ,content: {
                    
                    FeedbackResultW(
                        imageUrl: imageUrl,
                        progress: 0.86,
                        colorModel: colorModel
                    )
                    .padding(.bottom, 20)
                    
                    ResultTile(
                        title: "Vocal Performance",
                        description: "Vocals are strong, but need better mixing in high frequencies.",
                        point: 78
                    )
                    
                    ResultTile(
                        title: "Production Quality",
                        description: "Polished and professional sounds.",
                        point: 49
                    )

                    ResultTile(
                        title: "Lyrics & Structure",
                        description: "Melody is catchy, but could be further developed.",
                        point: 59
                    )

                    ResultTile(
                        title: "Commercial Appeal",
                        description: "Mix is decent; try enhancing bass and treble.",
                        point: 99
                    )
                    
                    suggestions(suggestions: [
                        FeedbackSuggestions(title: "Consider adding more dynamic range to your chorus"),
                        FeedbackSuggestions(title: "Work on vocal control during the bridge section"),
                        FeedbackSuggestions(title: "Add more bass presence in the mix"),
                    ])
                    
                    genre()

                })
                .padding(.horizontal, 20)
                .navigationBarItems(
                    trailing: Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                        .accentColor(colorModel.primaryColor)
                )
                .navigationTitle("Feedback Results")
            }
            .safeAreaInset(edge: .bottom) {
                AppBtn(text: "Generate New Feedback") {
                    
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    func suggestions(suggestions: [FeedbackSuggestions]) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("PrimaryColor").opacity(0.1))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Improvement Suggestions")
                    .font(.appHeadline)
                Group {
                    ForEach(suggestions) { suggestion in
                        HStack(alignment: .center, spacing: 10) {
                            Circle()
                                .fill(Color("PrimaryColor"))
                                .frame(width: 5, height: 5)
                            Text(suggestion.title)
                                .font(.appBody)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 15)
        }
        .padding(.bottom, 10)
        .padding(.top, 10)
    }
    
    func genre() -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.secondary.opacity(0.1))
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Genre Classification")
                    .font(.appHeadline)
                + Text(" Pop/R&B (94% confidence)")
                    .foregroundStyle(Color("PrimaryColor"))
                    .font(.appBody)
                
                Group {
                    ForEach(0..<3) { index in
                        ResultTile(
                            icon: "volume",
                            title: "Pop/R&B",
                            description: nil,
                            point: 56
                        )
                        .padding(.bottom)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 15)
        }
        .padding(.bottom, 10)
    }
    
}

#Preview {
    AIFeedbackView()
}

struct ResultTile: View {
    
    var icon: String?
    var title: String
    var description: String?
    var point: Double
    var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack(spacing: 10) {
                    if let icon {
                        Image(icon)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Text(title)
                        .font(.appHeadline)
                        .fontWeight(.medium)
                }
                Spacer()
                Text("\(String(format: "%.0f", point))%")
                    .font(.appHeadline)
                    .fontWeight(.medium)
            }
            
            CustomLinearProgressView(
                progress: 0.3,
                foregroundColor: Color("PrimaryColor")
            )
            
            if let desc = description {
                Text(desc)
                    .font(.appBody)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
        }
    }
}
