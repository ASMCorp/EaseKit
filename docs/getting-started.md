---
layout: page
title: Getting Started with EaseKit - iOS Swift Package Installation Guide
description: Learn how to install EaseKit Swift Package Manager library in your iOS project. Step-by-step guide for Xcode and Package.swift. Supports iOS 12+, Swift 6.2+.
---

# Getting Started with EaseKit

EaseKit is a **Swift Package Manager (SPM) library** that provides convenient extensions for UIKit and SwiftUI. This guide will walk you through installing EaseKit in your iOS project and writing your first lines of code with it.

## Requirements

Before installing EaseKit, make sure your project meets these requirements:

- **iOS 12.0** or later
- **Swift 6.2** or later
- **Xcode 14.0** or later

## Installation

### Option 1: Install via Xcode (Recommended)

The easiest way to add EaseKit to your project is through Xcode's built-in Swift Package Manager integration:

1. Open your Xcode project (`.xcodeproj` or `.xcworkspace`)
2. In the menu bar, select **File → Add Package Dependencies...**
3. In the search bar at the top right, paste the repository URL:
   ```
   https://github.com/ASMCorp/EaseKit.git
   ```
4. Click **Add Package**
5. Choose the version rule you prefer:
   - **Up to Next Major Version** (recommended): `1.0.0` < `2.0.0`
   - **Exact Version**: `1.0.0`
   - **Branch**: `main`
6. Click **Add Package** again to confirm
7. Select the target(s) you want EaseKit added to
8. Click **Finish**

Xcode will download and link EaseKit automatically. You should see it in the Package Dependencies section of your project settings.

### Option 2: Install via Package.swift

If you're working with a Swift Package or prefer manual dependency management, add EaseKit to your `Package.swift` file:

```swift
// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "YourProject",
    platforms: [
        .iOS(.v12)
    ],
    dependencies: [
        .package(url: "https://github.com/ASMCorp/EaseKit.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: ["EaseKit"]
        )
    ]
)
```

Then run:

```bash
swift package resolve
```

### Option 3: Install in a SwiftUI App Project

For SwiftUI-based iOS apps created with Xcode:

1. Open your project in Xcode
2. Click on your project in the Project Navigator
3. Select your project under **PROJECT** (not TARGETS)
4. Go to the **Package Dependencies** tab
5. Click the **+** button
6. Enter `https://github.com/ASMCorp/EaseKit.git`
7. Click **Add Package**
8. Select your app target when prompted

## Importing EaseKit

Once installed, import EaseKit in any Swift file where you want to use it:

```swift
import EaseKit
```

That's it! You're ready to use all of EaseKit's extensions.

## Your First Code with EaseKit

### Example 1: Hex Colors in UIKit

```swift
import UIKit
import EaseKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set background color from hex
        view.backgroundColor = UIColor(hexString: "#F2F2F7")

        // Create a label with a hex text color
        let titleLabel = UILabel()
        titleLabel.text = "Hello, EaseKit!"
        titleLabel.textColor = UIColor(hexString: "#007AFF")
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)

        view.addSubview(titleLabel)
        titleLabel.centerInsideParent()
    }
}
```

### Example 2: Hex Colors in SwiftUI

```swift
import SwiftUI
import EaseKit

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, EaseKit!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "#007AFF"))

            Text("SwiftUI + EaseKit")
                .foregroundColor(Color(hex: "#34C759"))

            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#FF9500", alpha: 0.3))
                .frame(height: 100)
        }
        .padding()
        .background(Color(hex: "#F2F2F7"))
    }
}
```

### Example 3: Auto Layout with UIView Extensions

```swift
import UIKit
import EaseKit

class ProfileViewController: UIViewController {
    let avatarView = UIImageView()
    let nameLabel = UILabel()
    let bioLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
    }

    func setupViews() {
        // Configure views
        avatarView.image = UIImage(systemName: "person.circle.fill")
        avatarView.tintColor = UIColor(hexString: "#007AFF")
        nameLabel.text = "John Doe"
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        bioLabel.text = "iOS Developer"
        bioLabel.textColor = .gray

        // Add to view hierarchy
        view.addSubview(avatarView)
        view.addSubview(nameLabel)
        view.addSubview(bioLabel)

        // Layout with EaseKit extensions
        avatarView.anchorView(
            top: view.safeAreaLayoutGuide.topAnchor,
            paddingTop: 30
        )
        avatarView.centerX(inView: view)
        avatarView.setDimension(width: 100, height: 100)

        nameLabel.anchorView(
            top: avatarView.bottomAnchor,
            paddingTop: 16
        )
        nameLabel.centerX(inView: view)

        bioLabel.anchorView(
            top: nameLabel.bottomAnchor,
            paddingTop: 8
        )
        bioLabel.centerX(inView: view)
    }
}
```

## Troubleshooting

### "No such module 'EaseKit'"

If Xcode can't find the EaseKit module:

1. Make sure you added EaseKit to your **target's** dependencies, not just the project
2. Try **File → Packages → Resolve Package Versions**
3. Try **File → Packages → Update to Latest Package Versions**
4. Clean the build folder: **Product → Clean Build Folder** (Cmd+Shift+K)
5. Quit and reopen Xcode

### Package resolution fails

If Swift Package Manager can't resolve EaseKit:

1. Check your internet connection
2. Verify the URL is correct: `https://github.com/ASMCorp/EaseKit.git`
3. Make sure your `Package.swift` specifies a valid version range
4. Try clearing the SPM cache:
   ```bash
   rm -rf ~/Library/Caches/org.swift.swiftpm
   ```

### Extensions not available

If EaseKit's extensions don't show up:

1. Make sure you have `import EaseKit` at the top of your file
2. Check that your deployment target is iOS 12.0 or later
3. Verify EaseKit appears in your target's **Frameworks, Libraries, and Embedded Content** section

## Next Steps

- Read the [API Reference]({{ site.baseurl }}/api-reference.html) for complete documentation
- Browse [Code Examples]({{ site.baseurl }}/examples.html) for real-world usage patterns
- Star the project on [GitHub](https://github.com/ASMCorp/EaseKit) if you find it useful!
