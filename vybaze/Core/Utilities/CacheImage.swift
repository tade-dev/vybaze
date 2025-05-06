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
                .frame(width: 50, height: 50)
                .cornerRadius(5)
        case .failure(_):
            Image(systemName: "questionmark.circle")
        @unknown default:
            ProgressView()
        }
    }
    
}
