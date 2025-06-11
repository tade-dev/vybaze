//
//  EditProfileView.swift
//  vybaze
//
//  Created by BSTAR on 29/04/2025.
//

import SwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var profileVM: ProfileViewModel
    @State var showProfilePictureSheet: Bool = false
    
    func getActionSheet() -> ActionSheet {
        ActionSheet(
            title: Text("Upload Profile Picture"),
            buttons: [
                .default(Text("Camera")),
                .default(Text("Gallery")),
                .cancel()
            ]
        )
    }
    
    var body: some View {
        VStack(content: {
            
            Form(content: {
                
                Section {
                    
                    HStack {
                        Spacer()
                        CircularAsyncImage(
                            url: "https://picsum.photos/200",
                            size: 100
                        )
                        .overlay(
                            alignment: .bottomTrailing) {
                                
                                Button {
                                    showProfilePictureSheet.toggle()
                                } label: {
                                    Circle()
                                        .fill(Color.primaryColor)
                                        .frame(width: 30, height: 30)
                                        .overlay {
                                            Image(systemName: "pencil")
                                                .foregroundStyle(.white)
                                        }
                                }
                                .actionSheet(isPresented: $showProfilePictureSheet) {
                                    getActionSheet()
                                }
                                   
                            }
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                        
                }
                
                Section {
                    HStack {
                        Text("First Name")
                        Spacer()
                        if profileVM.isEditing {
                            TextField("Enter Firstname", text: $profileVM.firstname)
                                .foregroundStyle(.blue)
                                .multilineTextAlignment(.trailing)
                        } else {
                            Text(profileVM.firstname)
                        }
                    }
                    HStack {
                        Text("Last Name")
                        Spacer()
                        if profileVM.isEditing {
                            TextField("Enter Lastname", text: $profileVM.lastname)
                                .foregroundStyle(.blue)
                                .multilineTextAlignment(.trailing)
                        } else {
                            Text(profileVM.lastname)
                        }
                    }
                    HStack {
                        Text("Artist Name")
                        Spacer()
                        if profileVM.isEditing {
                            TextField("Enter Artistname", text: $profileVM.artistName)
                                .foregroundStyle(.blue)
                                .multilineTextAlignment(.trailing)
                        } else {
                            Text(profileVM.artistName)
                        }
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("akintadeseun816@gmail.com")
                    }
                    .disabled(true)
                    HStack {
                        Group {
                            if !profileVM.isEditing {
                                Text("Gender")
                                Spacer()
                            }
                        }
                        if profileVM.isEditing {
                            Picker("Gender", selection: $profileVM.gender) {
                                ForEach(profileVM.genderOptions, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                            }
                            .pickerStyle(.navigationLink)
                        } else {
                            Text(profileVM.gender)
                        }
                    }
                }
                
                
            })
            
        })
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(
                placement: .topBarTrailing) {
                    Button {
                        withAnimation(.easeInOut) {
                            profileVM.isEditing.toggle()
                        }
                    } label: {
                        if profileVM.isEditing {
                            Image(systemName: "checkmark")
                                .font(.headline)
                                .bold()
                        } else {
                            Text("Edit")
                        }
                        
                    }

                }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(ProfileViewModel())
}
