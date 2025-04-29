//
//  Extensions.swift
//  vybaze
//
//  Created by BSTAR on 29/04/2025.
//

import Foundation
import SwiftUICore

extension Font {
    
    static func regularFont(size: CGFloat) -> Font {
        .custom("Satoshi-Regular", size: size)
    }
    
    static func mediumFont(size: CGFloat) -> Font {
        .custom("Satoshi-Medium", size: size)
    }
    
    static func boldFont(size: CGFloat) -> Font {
        .custom("Satoshi-Bold", size: size)
    }
    
    static var appTitle: Font {
        .custom("Satoshi-Bold", size: 28)
    }

    static var appBody: Font {
        .custom("Satoshi-Regular", size: 16)
    }

    static var appHeadline: Font {
        .custom("Satoshi-Medium", size: 20)
    }
    
}
