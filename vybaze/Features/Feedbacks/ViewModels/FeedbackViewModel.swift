//
//  FeedbackViewModel.swift
//  vybaze
//
//  Created by BSTAR on 26/04/2025.
//

import Foundation


class FeedbackViewModel: ObservableObject {
    
    @Published var showSheet: Bool = false
    @Published var isNavigationLinkActive: Bool = false
    @Published var searchText: String = ""
    @Published var songTitle: String = ""
    @Published var artistName: String = ""
    @Published var songUrl: String = ""
    @Published var genre: String = ""
    @Published var optionalNotes: String = ""
    let genreList: [String] = [
        "Hip Hop", "Pop", "R&B", "Country", "Afrobeats", "Reggae", "Jazz"
    ]
    @Published var songUploadType: SongUploadType = .songFile
}
