//
//  Enums+UploadTypes.swift
//  vybaze
//
//  Created by BSTAR on 20/05/2025.
//

import Foundation
import SwiftUI

extension SongUploadType {
  var title: String {
    switch self {
      case .songURL:   return "Song Link"
      case .songFile:  return "Song File"
      case .voiceMemo: return "Voice Memo"
    }
  }
}
