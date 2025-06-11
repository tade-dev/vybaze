//
//  VybazeSettings.swift
//  vybaze
//
//  Created by BSTAR on 10/06/2025.
//

import Foundation
import SwiftUI

class VybazeSettings: ObservableObject {
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false
}
