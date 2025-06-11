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
            
        NavigationView(content: {
            Form {
                
                Section {
                    pickerView
                        .listRowBackground(Color.clear)
                }
                
                Section {
                    Group(content: {
                        if feedbackViewModel.songUploadType == .songURL {
                            Rectangle()
                                .frame(width: 200, height: 200)
                        } else if feedbackViewModel.songUploadType == .songFile {
                            buildUploadSong
                        } else if feedbackViewModel.songUploadType == .recording {
                            Rectangle()
                                .fill(.red)
                                .frame(width: 200, height: 200)
                        }
                    })
                    .animation(.spring(.bouncy), value: feedbackViewModel.songUploadType)
                    .listRowBackground(Color.clear)
                    
                }
                
                Section {
                    sectionItem(
                        label: "Song Title",
                        item: TextField(
                            "Enter Song Title",
                            text: $feedbackViewModel.songTitle
                        ).multilineTextAlignment(.trailing)
                            .foregroundStyle(.blue)
                    )
                    sectionItem(
                        label: "Artist Name",
                        item: TextField(
                            "Enter Artist Name",
                            text: $feedbackViewModel.artistName
                        ).multilineTextAlignment(.trailing)
                            .foregroundStyle(.blue)
                    )
                    sectionItem(
                        item: Picker("Genre" ,selection: $feedbackViewModel.genre, content: {
                            ForEach(feedbackViewModel.genreList, id: \.self) { option in
                                Text(option)
                            }
                        })
                        .pickerStyle(.menu)
                        .multilineTextAlignment(.trailing)
                    )
                }
            }
            .navigationBarItems(
                trailing: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                .accentColor(colorModel.primaryColor)
            )
            .navigationTitle("Upload Song")
        })
    }
    
    func sectionItem(
        label: String? = nil,
        item: any View
    ) -> some View {
        HStack {
            if let label {
                Text(label)
            }
            Spacer()
            AnyView(item)
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
    }
    
    var buildUploadSong: some View {
        VStack {
            Image(systemName: "square.and.arrow.up")
                .font(.largeTitle)
                .foregroundStyle(colorModel.primaryColor)
                .padding(.bottom, 3)
            
            Text("Upload a file")
                .foregroundStyle(.text)
                .font(.appHeadline)
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 30)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.2))
                .stroke(.gray, style: StrokeStyle(
                    lineWidth: 1
                ))
        )
    }

}

#Preview {
    GenerateNewFeedback()
        .environmentObject(FeedbackViewModel())
}
