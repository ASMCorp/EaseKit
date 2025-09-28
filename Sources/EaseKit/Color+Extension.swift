//
//  File.swift
//  EaseKit
//
//  Created by ASM Anik on 29/9/25.
//

import UIKit
import SwiftUI

extension UIColor {
    /// Initializes a UIColor object from a hex string and an optional alpha value.
    ///
    /// - Parameters:
    ///   - hexString: A string representing the color in hexadecimal format. It can be in the formats RGB (3 characters), RGB (6 characters), or ARGB (8 characters).
    ///   - alpha: A Float value representing the alpha (opacity) of the color. Defaults to 1.0.
    ///
    /// The initializer supports hex strings with or without a leading '#' and ignores invalid characters.
    /// If the hex string format is invalid, it defaults to black color.
    convenience init(hexString: String, alpha: Float = 1.0) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(alpha)*(CGFloat(a) / 255))
    }
    
    /// A computed property that returns a random UIColor.
    ///
    /// The color components (red, green, blue) are randomly generated between 0 and 1.
    /// The alpha value is always set to 1.0 (fully opaque).
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}


@available(iOS 13.0, *)
extension Color {
    /// Initializes a SwiftUI Color from a hex string and an optional alpha value.
    ///
    /// - Parameters:
    ///   - hex: A string representing the color in hexadecimal format.
    ///   - alpha: A Float value representing the alpha (opacity) of the color. Defaults to 1.0.
    ///
    /// - Returns: An optional Color initialized from the corresponding UIColor.
    /// This initializer returns nil if the underlying UIColor initialization fails.
    init?(hex: String, alpha: Float = 1.0) {
        self.init(UIColor(hexString: hex, alpha: alpha))
    }
}
