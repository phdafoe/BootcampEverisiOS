/*
Copyright, everisSL
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import UIKit

class CustomFont {
    
    static func listFonts() {
        
        for family in UIFont.familyNames {

            let fontFamilyName: String = family as String
            print("* Family: \(fontFamilyName)")
                    
            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
                print("- Name: \(fontName as String)")
            }
        }
    }
}

// Ejemplo de uso: MainFont.boldItalic.font(size: SizeFont.medium)

struct MainFont {
    
    static let black: String = "PublicSans-Black"
    static let blackItalic: String = "PublicSans-BlackItalic"
    static let bold: String = "PublicSans-Bold"
    static let boldItalic: String = "PublicSans-BoldItalic"
    static let extraBold: String = "PublicSans-ExtraBold"
    static let extraBoldItalic: String = "PublicSans-ExtraBoldItalic"
    static let extraLight: String = "PublicSans-ExtraLight"
    static let extraLightItalic: String = "PublicSans-ExtraLightItalic"
    static let italic: String = "PublicSans-Italic"
    static let light: String = "PublicSans-Light"
    static let lightItalic: String = "PublicSans-LightItalic"
    static let medium: String = "PublicSans-Medium"
    static let mediumItalic: String = "PublicSans-MediumItalic"
    static let regular: String = "PublicSans-Regular"
    static let semibold: String = "PublicSans-SemiBold"
    static let semiboldItalic: String = "PublicSans-SemiBoldItalic"
    static let thin: String = "PublicSans-Thin"
    static let thinItalic: String = "PublicSans-ThinItalic"
}

struct SizeFont {
    
    static let ultraSmall: CGFloat = 11
    static let extraSmall: CGFloat = 16
    static let small: CGFloat = 18
    static let medium: CGFloat = 22
    static let large: CGFloat = 24
    static let extraLarge: CGFloat = 28
    static let ultraLarge: CGFloat = 32
}

extension String {
    
    func font(size: CGFloat) -> UIFont {
        
        guard let font = UIFont(name: self, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        
        let metrics = UIFontMetrics(forTextStyle: .body)
        let scaledFont = metrics.scaledFont(for: font)
        
        return scaledFont
    }
}

extension UIFont {
    
    func makeDynamic() -> UIFont {
        
        let metrics = UIFontMetrics(forTextStyle: .body)
        let scaledFont = metrics.scaledFont(for: self)
        return scaledFont
    }
}
