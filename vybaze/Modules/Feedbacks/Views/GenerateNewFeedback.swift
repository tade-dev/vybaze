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
            
            VStack(spacing: 16) {
                
                pickerView
                
                Form {
                    
                    TextField("Song Title", text: $feedbackViewModel.songTitle)
                    TextField("Artist Name", text: $feedbackViewModel.artistName)
                    Picker("Genre", selection: $feedbackViewModel.genre) {
                        ForEach(feedbackViewModel.genreList, id: \.self) { genre in
                            Text(genre)
                                .tag(genre)
                        }
                    }
                    .foregroundStyle(.secondaryText)
                    
                }
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
    
    var pickerView: some View {
        Picker(
            selection: $feedbackViewModel.songUploadType) {
                
                ForEach(SongUploadType.allCases, id: \.self) { item in
                    Text(item.title)
                }
                
            } label: {
                
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
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
