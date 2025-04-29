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
            ScrollView {
                VStack(alignment: .leading, content: {
                    
                    FeedbackResultW(
                        imageUrl: imageUrl,
                        progress: 0.86,
                        colorModel: colorModel
                    )
                    
                    VStack(alignment: .leading) {
                        Text("Here is what we think about your track!")
                            .padding(.top, 10)
                            .font(.mediumFont(size: 18))
                        Text("Our AI analyzed your music across multiple dimensions")
                            .font(.mediumFont(size: 16))
                    }
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .padding(.bottom, 20)
                    
                    ResultTile(
                        icon:"microphone",
                        title: "Vocals",
                        description: "Vocals are strong, but need better mixing in high frequencies.",
                        point: 7.9
                    )
                    
                    ResultTile(
                        icon:"slider.horizontal.3",
                        title: "Production Quality",
                        description: "Polished and professional sounds.",
                        point: 10
                    )

                    ResultTile(
                        icon:"music.note",
                        title: "Melody / Composition",
                        description: "Melody is catchy, but could be further developed.",
                        point: 7.3
                    )

                    ResultTile(
                        icon:"waveform",
                        title: "Mix & Master",
                        description: "Mix is decent; try enhancing bass and treble.",
                        point: 7.9
                    )
                    
                    ResultTile(
                        icon:"chart.line.uptrend.xyaxis",
                        title: "Commercial Appeal",
                        description: "Track has good potential for mainstream success.",
                        point: 8.3
                    )
                    
                    AppBtn(text: "Generate New Feedback") {
                        
                    }
                    .padding(.top, 20)

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
        }
    }
}

#Preview {
    AIFeedbackView()
}

struct ResultTile: View {
    
    var icon: String
    var title: String
    var description: String
    var point: Double
    var colorModel: ColorModel = ColorModel()
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(colorModel.primaryColor)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundStyle(.white)
                }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.appHeadline)
                        .fontWeight(.medium)
                    Spacer()
                    Text(String(format: "%.1f", point))
                        .font(.appHeadline)
                        .fontWeight(.medium) + Text(" /10").foregroundStyle(.gray).font(.appBody)
                }
                Text(description)
                    .font(.appBody)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
            }
            
        }
    }
}
