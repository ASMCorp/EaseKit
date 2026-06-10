---
layout: post
title: "How to Use Hex Colors in SwiftUI and UIKit - Complete Guide"
description: "Learn how to use hex color codes in SwiftUI and UIKit with EaseKit. Complete guide covering UIColor hex initializers, SwiftUI Color extensions, design system colors, and best practices for iOS development."
date: 2026-06-10
---

# How to Use Hex Colors in SwiftUI and UIKit

If you're an iOS developer, you've probably needed to use hex color codes in your app. Designers typically provide colors as hex values like `#007AFF` or `#FF5733`, but Swift's standard libraries don't include built-in hex color initializers.

In this guide, we'll show you how to use hex colors in both **UIKit** and **SwiftUI** using the **EaseKit** Swift Package.

## Why Hex Colors?

Hex color codes are the standard format used by designers. They're compact, universally recognized, and easy to copy from design tools like Figma, Sketch, or Adobe XD. Instead of converting hex to RGB values manually, you can use them directly in your code.

## Installing EaseKit

First, add EaseKit to your project via Swift Package Manager:

1. In Xcode, go to **File → Add Package Dependencies...**
2. Enter: `https://github.com/ASMCorp/EaseKit.git`
3. Click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ASMCorp/EaseKit.git", from: "1.0.0")
]
```

## Hex Colors in UIKit

### Basic Usage

```swift
import EaseKit

// Standard 6-character hex
let primaryColor = UIColor(hexString: "#007AFF")
let errorColor = UIColor(hexString: "#FF3B30")

// 3-character shorthand
let red = UIColor(hexString: "#F00")  // Same as #FF0000

// With custom alpha
let semiTransparent = UIColor(hexString: "#000000", alpha: 0.5)
```

### Supported Formats

| Format | Example | Description |
|--------|---------|-------------|
| 3-char | `"#F00"` | Short RGB (each digit doubled) |
| 6-char | `"#FF0000"` | Standard 24-bit RGB |
| 8-char | `"80FF0000"` | 32-bit ARGB (first 2 chars = alpha) |

The leading `#` is optional, so `"#FF5733"` and `"FF5733"` both work.

### Building a Design System

```swift
import UIKit
import EaseKit

extension UIColor {
    // Brand colors
    static let brandPrimary = UIColor(hexString: "#007AFF")
    static let brandSecondary = UIColor(hexString: "#5856D6")
    static let brandAccent = UIColor(hexString: "#FF9500")

    // Semantic colors
    static let success = UIColor(hexString: "#34C759")
    static let warning = UIColor(hexString: "#FFCC00")
    static let error = UIColor(hexString: "#FF3B30")

    // Backgrounds
    static let bgPrimary = UIColor(hexString: "#FFFFFF")
    static let bgSecondary = UIColor(hexString: "#F2F2F7")
}
```

## Hex Colors in SwiftUI

### Basic Usage

```swift
import SwiftUI
import EaseKit

struct ContentView: View {
    var body: some View {
        Text("Hello, EaseKit!")
            .foregroundColor(Color(hex: "#007AFF"))
            .background(Color(hex: "#F2F2F7", alpha: 0.5))
    }
}
```

### Safe Optional Binding

The SwiftUI `Color(hex:)` initializer returns an optional, so you can use optional binding:

```swift
if let brandColor = Color(hex: "#007AFF") {
    Text("Brand Color")
        .foregroundColor(brandColor)
}
```

### SwiftUI Theme

```swift
import SwiftUI
import EaseKit

struct AppTheme {
    static let primary = Color(hex: "#007AFF")!
    static let background = Color(hex: "#F2F2F7")!
    static let cardBackground = Color(hex: "#FFFFFF")!
    static let textPrimary = Color(hex: "#000000")!
    static let textSecondary = Color(hex: "#8E8E93")!
}
```

## Dynamic Colors from API

One powerful use case is loading theme colors from a backend API:

```swift
struct ThemeConfig: Codable {
    let primaryColor: String
    let backgroundColor: String
}

func applyTheme(from config: ThemeConfig) {
    guard let primary = Color(hex: config.primaryColor),
          let background = Color(hex: config.backgroundColor) else {
        print("Invalid hex color in theme config")
        return
    }
    // Apply the dynamic theme
}
```

## Best Practices

1. **Use a design system** - Define all colors in one place using extensions
2. **Prefer 6-character hex** - More readable and less ambiguous than 3-character
3. **Handle optionals** - The SwiftUI initializer returns nil for invalid hex strings
4. **Document your colors** - Add comments explaining what each color is used for
5. **Test with accessibility** - Ensure sufficient contrast ratios

## Conclusion

Using hex colors in iOS development doesn't have to be complicated. With EaseKit, you can use hex color codes directly in both UIKit and SwiftUI, making your code cleaner and more maintainable.

[Get started with EaseKit today](https://asmcorp.github.io/EaseKit/getting-started.html) and simplify your iOS development workflow.

---

*Published with [EaseKit](https://asmcorp.github.io/EaseKit/) - A lightweight Swift Package for iOS development.*