---
layout: post
title: "Simplify iOS Auto Layout with UIView Extensions - Complete Guide"
description: "Learn how to simplify iOS Auto Layout with EaseKit UIView extensions. Complete guide covering anchorView, fillSuperView, center, setDimension methods with practical code examples for UIKit."
date: 2026-06-10
categories: [ios, swift, autolayout, tutorial]
---

# Simplify iOS Auto Layout with UIView Extensions

Auto Layout is essential for building adaptive iOS interfaces, but the standard API requires a lot of boilerplate code. Every constraint needs `translatesAutoresizingMaskIntoConstraints = false`, anchor references, and `NSLayoutConstraint.activate()`.

In this guide, we'll show you how to simplify Auto Layout using **EaseKit** UIView extensions.

## The Problem with Standard Auto Layout

Here's what typical Auto Layout code looks like:

```swift
let cardView = UIView()
cardView.backgroundColor = .white
cardView.layer.cornerRadius = 12
scrollView.addSubview(cardView)

cardView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
    cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
    cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
    cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
])
```

That's 12 lines just to pin a view with padding!

## Installing EaseKit

Add EaseKit via Swift Package Manager:

1. Xcode → **File → Add Package Dependencies...**
2. Enter: `https://github.com/ASMCorp/EaseKit.git`
3. Click **Add Package**

## The EaseKit Way

With EaseKit, the same layout becomes:

```swift
import EaseKit

let cardView = UIView()
cardView.backgroundColor = .white
cardView.layer.cornerRadius = 12
scrollView.addSubview(cardView)

cardView.anchorView(
    top: scrollView.topAnchor,
    leading: scrollView.leadingAnchor,
    trailing: scrollView.trailingAnchor,
    paddingTop: 16, paddingLeft: 20, paddingRight: 20
)
```

5 lines instead of 12. And `translatesAutoresizingMaskIntoConstraints = false` is handled automatically.

## Available Methods

### anchorView

The primary method for creating constraints. Pin any combination of edges with padding:

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

### fillSuperView

Fill the entire superview - perfect for background views:

```swift
backgroundView.fillSuperView()
overlay.fillSuperView()
```

### center

Center a view within any other view:

```swift
spinner.center(in: view)
badge.center(in: avatarImageView)
```

### centerInsideParent

Center within the immediate superview:

```swift
label.centerInsideParent()
```

### centerX / centerY

Center on a single axis:

```swift
title.centerX(inView: headerView)
icon.centerY(inView: cell.contentView)
```

### setDimension

Set fixed width and/or height:

```swift
button.setDimension(width: 200, height: 50)
separator.setDimension(height: 1)
sidebar.setDimension(width: 80)
```

## Real-World Example: Profile Header

```swift
import UIKit
import EaseKit

class ProfileViewController: UIViewController {
    let avatarView = UIImageView()
    let nameLabel = UILabel()
    let bioLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        view.addSubview(avatarView)
        view.addSubview(nameLabel)
        view.addSubview(bioLabel)

        avatarView.anchorView(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        avatarView.centerX(inView: view)
        avatarView.setDimension(width: 80, height: 80)

        nameLabel.anchorView(top: avatarView.bottomAnchor, paddingTop: 16)
        nameLabel.centerX(inView: view)

        bioLabel.anchorView(top: nameLabel.bottomAnchor, paddingTop: 8)
        bioLabel.centerX(inView: view)
    }
}
```

## Conclusion

EaseKit eliminates Auto Layout boilerplate, making your code cleaner, more readable, and easier to maintain. [Get started with EaseKit](https://asmcorp.github.io/EaseKit/getting-started.html) today.

---

*Published with [EaseKit](https://asmcorp.github.io/EaseKit/) - A lightweight Swift Package for iOS development.*