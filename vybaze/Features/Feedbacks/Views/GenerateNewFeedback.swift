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
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.clear)
                            .frame(minHeight: 120)
                        
                        Group {
                            if feedbackViewModel.songUploadType == .songURL {
                                songUrlView
                                    .id("songURL")
                                    .transition(.asymmetric(
                                        insertion: .scale(scale: 0.95, anchor: .center)
                                            .combined(with: .opacity)
                                            .combined(with: .move(edge: .leading)),
                                        removal: .scale(scale: 1.05, anchor: .center)
                                            .combined(with: .opacity)
                                            .combined(with: .move(edge: .trailing))
                                    ))
                                    
                            } else if feedbackViewModel.songUploadType == .songFile {
                                buildUploadSong
                                    .listRowBackground(Color.clear)
                                    .id("songFile")
                                    .transition(.asymmetric(
                                        insertion: .scale(scale: 0.9, anchor: .center)
                                            .combined(with: .opacity)
                                            .combined(with: .slide),
                                        removal: .scale(scale: 1.1, anchor: .center)
                                            .combined(with: .opacity)
                                            .combined(with: .slide)
                                    ))
                                    
                            } else if feedbackViewModel.songUploadType == .recording {
                                recordingView
                                    .id("recording")
                                    .transition(.asymmetric(
                                        insertion: .scale(scale: 0.95, anchor: .center)
                                            .combined(with: .opacity)
                                            .combined(with: .move(edge: .trailing)),
                                        removal: .scale(scale: 1.05, anchor: .center)
                                            .combined(with: .opacity)
                                            .combined(with: .move(edge: .leading))
                                    ))
                            }
                        }
                        .clipped()
                    }
                    .animation(
                        .spring(
                            response: 0.5,
                            dampingFraction: 0.75,
                            blendDuration: 0.1
                        ),
                        value: feedbackViewModel.songUploadType
                    )
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
                        item: Picker("Genre", selection: $feedbackViewModel.genre, content: {
                            ForEach(feedbackViewModel.genreList, id: \.self) { option in
                                Text(option)
                            }
                        })
                        .pickerStyle(.menu)
                        .multilineTextAlignment(.trailing)
                    )
                }
                
                Section {
                    buildUploadCoverArt
                        .listRowBackground(Color.clear)
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
    
    // MARK: - Cover Art Upload View
    var buildUploadCoverArt: some View {
        HStack(spacing: 16) {
            // Left side - Icon container
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(
                        LinearGradient(
                            colors: [
                                colorModel.primaryColor.opacity(0.08),
                                colorModel.primaryColor.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(
                        colorModel.primaryColor.opacity(0.4),
                        style: StrokeStyle(lineWidth: 1.5, dash: [5, 3])
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "photo.badge.plus")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(colorModel.primaryColor)
            }
            
            // Right side - Content
            VStack(alignment: .leading, spacing: 8) {
                Text("Upload Cover Art")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Text("Add an image for your song cover. Square format recommended (1000x1000px)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                // Supported formats
                HStack(spacing: 6) {
                    ForEach(["JPG", "PNG", "HEIC"], id: \.self) { format in
                        Text(format)
                            .font(.caption2)
                            .fontWeight(.medium)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(
                                Capsule()
                                    .fill(colorModel.primaryColor.opacity(0.1))
                            )
                            .foregroundStyle(colorModel.primaryColor)
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding(.all, 20)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.regularMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(
                            LinearGradient(
                                colors: [
                                    colorModel.primaryColor.opacity(0.15),
                                    colorModel.primaryColor.opacity(0.05)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 1
                        )
                )
        )
        .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
    }
    
    private var songUrlView: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "link")
                    .font(.title2)
                    .foregroundStyle(colorModel.primaryColor)
                    .frame(width: 24, height: 24)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Song URL")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    TextField("Enter song URL (Spotify, Apple Music, etc.)", text: $feedbackViewModel.songUrl)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.URL)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                }
            }
            .padding(.vertical, 8)
            .scaleEffect(1.0)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.3).delay(0.1)) {
                    // Add any appear animations here
                }
            }
        }
    }
    
    private var recordingView: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.1))
                    .frame(width: 180, height: 180)
                    .scaleEffect(1.0)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: true)
                
                Circle()
                    .fill(Color.red.opacity(0.2))
                    .frame(width: 140, height: 140)
                    .scaleEffect(1.0)
                    .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: true)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [Color.red, Color.red.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image(systemName: "mic.fill")
                            .font(.system(size: 32, weight: .medium))
                            .foregroundStyle(.white)
                    )
                    .shadow(color: .red.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            
            VStack(spacing: 8) {
                Text("Voice Recording")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Text("Tap to start recording your voice note")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 30)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(Color.red.opacity(0.3), lineWidth: 1.5)
                )
        )
        .scaleEffect(1.0)
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7).delay(0.1)) {
       
            }
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
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(colorModel.primaryColor.opacity(0.1))
                    .frame(width: 80, height: 80)
                
                Image(systemName: "music.note")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(colorModel.primaryColor)
            }
            
            VStack(spacing: 8) {
                Text("Upload Your Song")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)
                
                Text("Drag and drop your audio file here, or tap to browse")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
            }
            
            HStack(spacing: 12) {
                ForEach(["MP3", "WAV", "M4A"], id: \.self) { format in
                    Text(format)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(colorModel.primaryColor.opacity(0.1))
                        )
                        .foregroundStyle(colorModel.primaryColor)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
        .padding(.horizontal, 24)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(
                            LinearGradient(
                                colors: [colorModel.primaryColor.opacity(0.3), colorModel.primaryColor.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 1.5, dash: [8, 4])
                        )
                )
        )
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }

}

#Preview {
    GenerateNewFeedback()
        .environmentObject(FeedbackViewModel())
}
