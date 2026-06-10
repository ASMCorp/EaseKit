# EaseKit

[![Swift](https://img.shields.io/badge/Swift-6.2-orange.svg?logo=swift)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-12.0+-blue.svg?logo=apple)](https://developer.apple.com/ios)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](LICENSE)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS-lightgrey.svg)](https://developer.apple.com)
[![Documentation](https://img.shields.io/badge/Docs-Live-blueviolet.svg)](https://asmcorp.github.io/EaseKit/)
[![Blog](https://img.shields.io/badge/Blog-Tutorials-ff69b4.svg)](https://asmcorp.github.io/EaseKit/blog/)

A lightweight Swift Package that provides convenient extensions for **UIKit** and **SwiftUI**, making iOS development easier and more efficient.

**[Documentation](https://asmcorp.github.io/EaseKit/)  |  [API Reference](https://asmcorp.github.io/EaseKit/api-reference.html)  |  [Examples](https://asmcorp.github.io/EaseKit/examples.html)  |  [Blog](https://asmcorp.github.io/EaseKit/blog/)**

---

## Features

- **Hex Color Initialization** - Create UIColor and SwiftUI Color from hex strings (#RGB, #RRGGBB, #AARRGGBB)
- **Random Colors** - Generate random UIColor instances for testing and prototyping
- **Auto Layout Helpers** - Simplify UIView constraint creation with intuitive anchor methods
- **View Centering** - Center views horizontally, vertically, or both in any view
- **View to Image** - Convert any UIView to a UIImage with a single method call
- **Resource URLs** - Type-safe URL initialization for bundle resources
- **Zero Dependencies** - Lightweight, self-contained, no external dependencies

## Installation

### Swift Package Manager (Xcode)

1. In Xcode, select **File → Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/ASMCorp/EaseKit.git`
3. Select the version you want to use
4. Click **Add Package**

### Package.swift

Add EaseKit to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/ASMCorp/EaseKit.git", from: "1.0.0")
]
```

Then add it to your target's dependencies:

```swift
.target(
    name: "YourApp",
    dependencies: ["EaseKit"]
)
```

## Quick Start

```swift
import EaseKit

// Hex colors in UIKit
let primaryColor = UIColor(hexString: "#007AFF")
let semiBlue = UIColor(hexString: "#3498DB", alpha: 0.8)
let randomColor = UIColor.random

// Hex colors in SwiftUI
struct ContentView: View {
    var body: some View {
        Text("Hello, EaseKit!")
            .foregroundColor(Color(hex: "#FF5733"))
            .background(Color(hex: "3498DB", alpha: 0.5))
    }
}

// Auto Layout helpers
myView.anchorView(
    top: parentView.topAnchor,
    leading: parentView.leadingAnchor,
    trailing: parentView.trailingAnchor,
    paddingTop: 20,
    paddingLeft: 16,
    paddingRight: 16
)

// Center views
logoView.center(in: containerView)
backgroundView.fillSuperView()
```

## Usage

### Color Extensions

#### UIColor from Hex

```swift
import EaseKit

// Create colors from hex strings
let color1 = UIColor(hexString: "#FF5733")
let color2 = UIColor(hexString: "3498DB", alpha: 0.8)
let color3 = UIColor(hexString: "F39") // 3-character hex

// Generate random colors
let randomColor = UIColor.random
```

#### SwiftUI Color from Hex

```swift
import SwiftUI
import EaseKit

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .foregroundColor(Color(hex: "#FF5733"))
            .background(Color(hex: "3498DB", alpha: 0.5))
    }
}
```

### UIView Extensions

#### Anchoring Views

```swift
import EaseKit

let myView = UIView()
parentView.addSubview(myView)

// Anchor to specific edges with padding
myView.anchorView(
    top: parentView.topAnchor,
    leading: parentView.leadingAnchor,
    trailing: parentView.trailingAnchor,
    paddingTop: 20,
    paddingLeft: 16,
    paddingRight: 16
)
```

#### Fill Superview

```swift
let backgroundView = UIView()
parentView.addSubview(backgroundView)
backgroundView.fillSuperView()
```

#### Set Dimensions

```swift
let button = UIButton()
button.setDimension(width: 200, height: 50)
```

#### Centering Views

```swift
let logoView = UIImageView()
parentView.addSubview(logoView)

// Center in any view
logoView.center(in: parentView)

// Center in immediate superview
logoView.centerInsideParent()

// Center only horizontally or vertically
logoView.centerX(inView: parentView)
logoView.centerY(inView: parentView)
```

#### Render View as Image

```swift
let myView = UIView()
// ... configure your view ...

let image = myView.asImage()
// Use the image (save, share, etc.)
```

### URL Extensions

#### Local Resource URL

```swift
import EaseKit

// Load a resource from the main bundle
if let url = URL(localResourceName: "config", extensionName: "json") {
    // Process the resource file
}
```

## Requirements

- iOS 12.0+
- Swift 6.2+
- Xcode 14.0+

## Documentation

Full documentation, API reference, and code examples are available at:
[https://asmcorp.github.io/EaseKit/](https://asmcorp.github.io/EaseKit/)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

## Author

ASM Anik ([@ASMCorp](https://github.com/ASMCorp))

## Acknowledgments

Built with love to make iOS development more enjoyable.
