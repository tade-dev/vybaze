//
//  CacheImage.swift
//  vybaze
//
//  Created by BSTAR on 30/04/2025.
//

import Foundation
import SwiftUI

func cacheImage(
    url: String
) -> some View {
    
    return AsyncImage(url: URL(string: url)) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
        case .failure(_):
            Image(systemName: "questionmark.circle")
        @unknown default:
            ProgressView()
        }
    }
    
}
