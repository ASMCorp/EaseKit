# EaseKit

A lightweight Swift Package that provides convenient extensions for UIKit and SwiftUI, making iOS development easier and more efficient.

## Features

### Color Extensions
- **Hex Color Initialization**: Create colors from hex strings with optional alpha values
- **Random Colors**: Generate random colors for testing and prototyping
- **SwiftUI Support**: Use hex colors seamlessly in SwiftUI views

### UIView Extensions
- **Auto Layout Helpers**: Simplify constraint creation with intuitive methods
- **View Anchoring**: Easily anchor views to edges with customizable padding
- **Centering Utilities**: Center views horizontally, vertically, or both
- **Image Rendering**: Convert any UIView to a UIImage

## Installation

### Swift Package Manager

Add EaseKit to your project using Swift Package Manager:

1. In Xcode, select **File → Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/ASMCorp/EaseKit.git`
3. Select the version you want to use
4. Click **Add Package**

Alternatively, add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/ASMCorp/EaseKit.git", from: "1.0.0")
]
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

## Requirements

- iOS 10.0+
- Swift 6.2+
- Xcode 14.0+

## License

This project is licensed under the Apache 2.0 - see the LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

ASM Anik

## Acknowledgments

Built with ❤️ to make iOS development more enjoyable.
