---
layout: page
title: "EaseKit API Reference - UIKit & SwiftUI Extension Methods"
description: "Complete API reference for EaseKit Swift Package. UIView Auto Layout extensions, UIColor hex string initializer, SwiftUI Color extensions, URL resource helpers. All methods documented with parameters and code examples."
---

# EaseKit API Reference

Complete documentation for all extensions and helpers in the **EaseKit Swift Package**. This reference covers every public method available for UIColor, SwiftUI Color, UIView, and URL extensions.

---

## Table of Contents

- [UIColor Extensions](#uicolor-extensions)
  - [init(hexString:alpha:)](#inithexstringalpha)
  - [static var random](#static-var-random)
- [SwiftUI Color Extensions](#swiftui-color-extensions)
  - [init?(hex:alpha:)](#inithexalpha)
- [UIView Extensions](#uiview-extensions)
  - [anchorView](#anchorView)
  - [setDimension](#setdimensionwidthheight)
  - [fillSuperView](#fillsuperview)
  - [center(in:)](#centerin)
  - [centerInsideParent](#centerinsideparent)
  - [centerX(inView:)](#centerxinview)
  - [centerY(inView:)](#centeryinview)
  - [asImage()](#asimage)
- [URL Extensions](#url-extensions)
  - [init?(localResourceName:extensionName:bundle:)](#initlocalresourcenameextensionnamebundle)

---

## UIColor Extensions

EaseKit extends `UIColor` with convenient hex string initialization and random color generation. These extensions work with both UIKit-based projects.

### init(hexString:alpha:)

Creates a `UIColor` from a hexadecimal color string.

```swift
convenience init(hexString: String, alpha: Float = 1.0)
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hexString` | `String` | Required | Hex color string. Supports `#RGB`, `#RRGGBB`, `#AARRGGBB` formats. Leading `#` is optional. |
| `alpha` | `Float` | `1.0` | Opacity value from 0.0 (transparent) to 1.0 (opaque). Only applies to 3 and 6 character hex strings. |

**Supported Formats:**

| Format | Example | Description |
|--------|---------|-------------|
| 3-char | `"F00"` or `"#F00"` | Short RGB (each digit is doubled: `F` becomes `FF`) |
| 6-char | `"#FF0000"` | Standard 24-bit RGB |
| 8-char | `"80FF0000"` | 32-bit ARGB (first 2 chars are alpha) |

**Returns:** A `UIColor` instance. Returns black (`#000000`) if the hex string is invalid.

**Example:**

```swift
import EaseKit

// Standard 6-character hex
let red = UIColor(hexString: "#FF0000")
let blue = UIColor(hexString: "#0000FF")

// 3-character shorthand
let green = UIColor(hexString: "#0F0")

// With custom alpha (semi-transparent)
let semiRed = UIColor(hexString: "#FF0000", alpha: 0.5)

// 8-character ARGB format
let argbColor = UIColor(hexString: "80FF0000")  // 50% alpha red

// Without # prefix
let purple = UIColor(hexString: "#9B59B6")
```

---

### static var random

Generates a random `UIColor` with random red, green, and blue components.

```swift
static var random: UIColor
```

**Parameters:** None

**Returns:** A `UIColor` with random RGB values (alpha is always 1.0).

**Example:**

```swift
import EaseKit

let randomBg = UIColor.random
view.backgroundColor = randomBG

// Generate a series of random colors for testing
let colors = (0..<5).map { _ in UIColor.random }
```

---

## SwiftUI Color Extensions

EaseKit extends SwiftUI's `Color` with a hex string initializer, matching the UIColor extension for consistent API across UIKit and SwiftUI.

### init?(hex:alpha:)

Creates a SwiftUI `Color` from a hexadecimal color string.

```swift
@available(iOS 13.0, *)
init?(hex: String, alpha: Float = 1.0)
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `hex` | `String` | Required | Hex color string. Same formats as `UIColor(hexString:)` |
| `alpha` | `Float` | `1.0` | Opacity override (0.0 to 1.0) |

**Returns:** An optional `Color`. Returns `nil` if the hex string is invalid.

**Example:**

```swift
import SwiftUI
import EaseKit

struct ContentView: View {
    var body: some View {
        VStack {
            // Basic hex color
            Text("Red Text")
                .foregroundColor(Color(hex: "#FF0000"))

            // With alpha
            Text("Semi-transparent Blue")
                .foregroundColor(Color(hex: "#0000FF", alpha: 0.5))

            // Background with hex color
            Rectangle()
                .fill(Color(hex: "#34C759"))
                .frame(height: 100)

            // Optional binding for safety
            if let brandColor = Color(hex: "#007AFF") {
                Text("Brand Color")
                    .foregroundColor(brandColor)
            }
        }
    }
}
```

---

## UIView Extensions

EaseKit provides a comprehensive set of `UIView` extensions that eliminate boilerplate Auto Layout code. These helpers work with any `UIView` subclass (`UILabel`, `UIButton`, `UIImageView`, `UIStackView`, etc.).

> **Important:** All layout methods automatically set `translatesAutoresizingMaskIntoConstraints = false` for you.

### anchorView

Pins the view's edges to specified anchors with optional padding. This is the primary method for creating Auto Layout constraints.

```swift
func anchorView(
    top: NSLayoutYAxisAnchor? = nil,
    leading: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    trailing: NSLayoutXAxisAnchor? = nil,
    paddingTop: CGFloat = 0,
    paddingLeft: CGFloat = 0,
    paddingBottom: CGFloat = 0,
    paddingRight: CGFloat = 0
)
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `top` | `NSLayoutYAxisAnchor?` | `nil` | Anchors the view's top edge |
| `leading` | `NSLayoutXAxisAnchor?` | `nil` | Anchors the view's leading edge |
| `bottom` | `NSLayoutYAxisAnchor?` | `nil` | Anchors the view's bottom edge |
| `trailing` | `NSLayoutXAxisAnchor?` | `nil` | Anchors the view's trailing edge |
| `paddingTop` | `CGFloat` | `0` | Padding from the top anchor |
| `paddingLeft` | `CGFloat` | `0` | Padding from the leading anchor |
| `paddingBottom` | `CGFloat` | `0` | Padding from the bottom anchor |
| `paddingRight` | `CGFloat` | `0` | Padding from the trailing edge |

**Example:**

```swift
import UIKit
import EaseKit

let cardView = UIView()
cardView.backgroundColor = .white
cardView.layer.cornerRadius = 12
parentView.addSubview(cardView)

// Pin to all edges with padding (like CSS padding)
cardView.anchorView(
    top: parentView.safeAreaLayoutGuide.topAnchor,
    leading: parentView.leadingAnchor,
    bottom: parentView.bottomAnchor,
    trailing: parentView.trailingAnchor,
    paddingTop: 16,
    paddingLeft: 20,
    paddingBottom: 16,
    paddingRight: 20
)

// Pin only top, leading, trailing (like a header)
let header = UIView()
parentView.addSubview(header)
header.anchorView(
    top: parentView.topAnchor,
    leading: parentView.leadingAnchor,
    trailing: parentView.trailingAnchor,
    paddingTop: 8
)
```

---

### setDimension(width:height:)

Sets fixed width and/or height constraints on the view.

```swift
func setDimension(width: CGFloat? = nil, height: CGFloat? = nil)
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `width` | `CGFloat?` | `nil` | Fixed width constraint. If nil, no width constraint is set. |
| `height` | `CGFloat?` | `nil` | Fixed height constraint. If nil, no height constraint is set. |

**Example:**

```swift
// Fixed size button
let button = UIButton(type: .system)
button.setDimension(width: 200, height: 50)

// Fixed height only (width is flexible)
let separator = UIView()
separator.setDimension(height: 1)

// Fixed width only (height is flexible)
let sidebar = UIView()
sidebar.setDimension(width: 80)
```

---

### fillSuperView()

Anchors the view to fill its entire superview. Convenient for background views and full-screen overlays.

```swift
func fillSuperView()
```

**Parameters:** None

**Returns:** Nothing. Sets constraints to match all four edges of the superview.

**Note:** The view must already have a superview. If `superview` is `nil`, nothing happens.

**Example:**

```swift
// Full-screen background
let backgroundImage = UIImageView(image: UIImage(named: "bg"))
container.addSubview(backgroundImage)
backgroundImage.fillSuperView()

// Overlay view
let overlay = UIView()
overlay.backgroundColor = UIColor.black.withAlphaComponent(0.5)
container.addSubview(overlay)
overlay.fillSuperView()
```

---

### center(in:)

Centers the view horizontally and vertically within any given view.

```swift
func center(in view: UIView)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `view` | `UIView` | Yes | The view to center within. Does not need to be the direct superview. |

**Example:**

```swift
// Center in a sibling view
let badge = UIView()
container.addSubview(badge)
badge.setDimension(width: 10, height: 10)
badge.center(in: avatarImageView)

// Center in root view
let spinner = UIActivityIndicatorView(style: .large)
view.addSubview(spinner)
spinner.center(in: view)
spinner.startAnimating()
```

---

### centerInsideParent()

Centers the view within its immediate superview. A convenience wrapper around `center(in:)` with the superview.

```swift
func centerInsideParent()
```

**Parameters:** None

**Note:** Prints an error and does nothing if the view has no superview.

**Example:**

```swift
let label = UILabel()
label.text = "Loading..."
container.addSubview(label)
label.centerInsideParent()
```

---

### centerX(inView:)

Centers the view horizontally within the specified view.

```swift
func centerX(inView view: UIView)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `view` | `UIView` | Yes | The view to center horizontally within. |

**Example:**

```swift
let title = UILabel()
title.text = "Welcome"
headerView.addSubview(title)
title.centerX(inView: headerView)
```

---

### centerY(inView:)

Centers the view vertically within the specified view.

```swift
func centerY(inView view: UIView)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `view` | `UIView` | Yes | The view to center vertically within. |

**Example:**

```swift
let icon = UIImageView(image: UIImage(systemName: "star"))
cell.contentView.addSubview(icon)
icon.centerY(inView: cell.contentView)
```

---

### asImage()

Renders the view into a `UIImage`. Useful for snapshots, sharing, and image processing.

```swift
func asImage() -> UIImage
```

**Parameters:** None

**Returns:** A `UIImage` representation of the view's current visual state.

**Example:**

```swift
// Generate a thumbnail from a view
let cardView = CardView()
cardView.title = "Hello"
cardView.backgroundColor = .systemBlue

let thumbnail = cardView.asImage()
// Use the image: save to disk, share, upload, etc.

// Share a view's content
@IBAction func shareButtonTapped() {
    let card = createCardView()
    let image = card.asImage()
    let activityVC = UIActivityViewController(
        activityItems: [image],
        applicationActivities: nil
    )
    present(activityVC, animated: true)
}
```

---

## URL Extensions

EaseKit extends `URL` with a convenient initializer for accessing bundle resources.

### init?(localResourceName:extensionName:bundle:)

Creates a `URL` pointing to a resource file in the specified bundle.

```swift
init?(
    localResourceName: String,
    extensionName: String? = nil,
    bundle: Bundle = Bundle.main
)
```

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `localResourceName` | `String` | Required | Name of the resource file without extension. |
| `extensionName` | `String?` | `nil` | File extension (e.g., `"json"`, `"txt"`). Pass `nil` if no extension. |
| `bundle` | `Bundle` | `Bundle.main` | The bundle to search. Use `Bundle.module` for Swift Package resources. |

**Returns:** An optional `URL`. Returns `nil` if the resource is not found.

**Example:**

```swift
import EaseKit

// Load a JSON config from the main bundle
if let configURL = URL(localResourceName: "config", extensionName: "json") {
    let data = try Data(contentsOf: configURL)
    let config = try JSONDecoder().decode(Config.self, from: data)
}

// Load a resource from a Swift Package
if let sampleURL = URL(localResourceName: "Sample", extensionName: "json", bundle: Bundle.module) {
    // Process the resource
}

// Load a text file
if let readmeURL = URL(localResourceName: "README", extensionName: "txt") {
    let content = try String(contentsOf: readmeURL)
}
```

---

## See Also

- [Getting Started Guide]({{ site.baseurl }}/getting-started.html) - Installation and first steps
- [Code Examples]({{ site.baseurl }}/examples.html) - Real-world usage patterns
- [GitHub Repository](https://github.com/ASMCorp/EaseKit) - Source code and issues
