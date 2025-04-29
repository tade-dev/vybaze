//
//  GenerateNewFeedback.swift
//  vybaze
//
//  Created by BSTAR on 20/04/2025.
//

import SwiftUI

struct GenerateNewFeedback: View {
    
    var colorModel: ColorModel = ColorModel()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var feedbackViewModel: FeedbackViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Lets hear your latest track!")
                        .font(.appHeadline)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                    
                    buildUploadSong
                    
                    TextField("Song title", text: $feedbackViewModel.songTitle)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                        .padding(.bottom, 10)
                        .padding(.top, 20)
                    
                    TextField("Artist name", text: $feedbackViewModel.artistName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
                        .padding(.bottom, 10)
                    
                    PickerTextField(selected: $feedbackViewModel.genre, options: feedbackViewModel.genreList, label: "Select genre")
                        .padding(.bottom, 30)
                    
                    AppBtn(text: "Generate Feedback") {
                        
                    }
                    
                    Text("You have 1 free feedback left")
                        .foregroundStyle(.gray)
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom)
                    
//                    TextEditor(text: $optionalNotes)
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))
//                        .padding(.bottom, 10)
                    
                }
                .padding(.horizontal, 20)
            }
            .navigationBarItems(
                trailing: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .accentColor(colorModel.primaryColor)
            )
            .navigationTitle("Upload Song")
        }
    }
    
    var buildUploadSong: some View {
        VStack {
            Image(systemName: "music.note")
                .font(.largeTitle)
                .foregroundStyle(colorModel.primaryColor)
                .padding(.bottom, 5)
            
            Text("Copy and paste an audio file here, or")
                .foregroundStyle(.black)
                .font(.appHeadline)
                .dynamicTypeSize(.small)
                .lineLimit(1)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity)
            
            Text("Browse Files")
                .foregroundStyle(.white)
                .font(.appBody)
                .bold()
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    Capsule()
                        .fill(colorModel.primaryColor)
                )
                .padding(.top, 3)
        }
        .padding(.all, 30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, style: StrokeStyle(
                    lineWidth: 1,
                    dash: [4],
                ))
        )
    }
}

#Preview {
    GenerateNewFeedback()
        .environmentObject(FeedbackViewModel())
}
