//
//  ProfileViewModel.swift
//  vybaze
//
//  Created by BSTAR on 11/06/2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var firstname: String = ""
    @Published var lastname: String = ""
    @Published var gender: String = "Not Set"
    @Published var artistName: String = ""
    @Published var email: String = ""
    @Published var bio: String = ""
    @Published var isEditing = false
    var genderOptions: [String] = ["Not Set", "Male", "Female", "Other"]
}
