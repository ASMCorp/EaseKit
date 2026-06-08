---
layout: page
title: "EaseKit Code Examples - iOS Swift Auto Layout & Hex Color Samples"
description: "Practical code examples showing how to use EaseKit Swift Package for Auto Layout, hex colors in SwiftUI, UIView extensions, and more. Before/without vs with EaseKit comparisons."
---

# EaseKit Code Examples

Real-world code examples showing how to use the **EaseKit Swift Package** in iOS projects. Each example includes a "before EaseKit" and "with EaseKit" comparison so you can see exactly how much boilerplate code you'll save.

---

## Auto Layout Examples

### Example 1: Simple Card Layout

A common pattern: a card view with padding inside a scrollable container.

**Without EaseKit:**

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

**With EaseKit:**

```swift
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

---

### Example 2: Centering a Loading Spinner

**Without EaseKit:**

```swift
let spinner = UIActivityIndicatorView(style: .large)
view.addSubview(spinner)

spinner.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
])
```

**With EaseKit:**

```swift
let spinner = UIActivityIndicatorView(style: .large)
view.addSubview(spinner)
spinner.centerInsideParent()
```

---

### Example 3: Profile Header Layout

A typical user profile header with avatar, name, and bio centered vertically.

**Without EaseKit:**

```swift
let avatarImageView = UIImageView(image: UIImage(named: "avatar"))
avatarImageView.contentMode = .scaleAspectFill
avatarImageView.layer.cornerRadius = 40
avatarImageView.clipsToBounds = true

let nameLabel = UILabel()
nameLabel.text = "Jane Doe"
nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)

let bioLabel = UILabel()
bioLabel.text = "iOS Developer | Swift enthusiast"
bioLabel.textColor = .secondaryLabel

view.addSubview(avatarImageView)
view.addSubview(nameLabel)
view.addSubview(bioLabel)

avatarImageView.translatesAutoresizingMaskIntoConstraints = false
nameLabel.translatesAutoresizingMaskIntoConstraints = false
bioLabel.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
    avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
    avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    avatarImageView.widthAnchor.constraint(equalToConstant: 80),
    avatarImageView.heightAnchor.constraint(equalToConstant: 80),
    
    nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    
    bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
    bioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
])
```

**With EaseKit:**

```swift
let avatarImageView = UIImageView(image: UIImage(named: "avatar"))
avatarImageView.contentMode = .scaleAspectFill
avatarImageView.layer.cornerRadius = 40
avatarImageView.clipsToBounds = true

let nameLabel = UILabel()
nameLabel.text = "Jane Doe"
nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)

let bioLabel = UILabel()
bioLabel.text = "iOS Developer | Swift enthusiast"
bioLabel.textColor = .secondaryLabel

view.addSubview(avatarImageView)
view.addSubview(nameLabel)
view.addSubview(bioLabel)

avatarImageView.anchorView(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
avatarImageView.centerX(inView: view)
avatarImageView.setDimension(width: 80, height: 80)

nameLabel.anchorView(top: avatarImageView.bottomAnchor, paddingTop: 16)
nameLabel.centerX(inView: view)

bioLabel.anchorView(top: nameLabel.bottomAnchor, paddingTop: 8)
bioLabel.centerX(inView: view)
```

---

## Hex Color Examples

### Example 4: Design System Colors

Define your app's design system colors using hex strings instead of RGB values.

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
    
    // Neutral palette
    static let bgPrimary = UIColor(hexString: "#FFFFFF")
    static let bgSecondary = UIColor(hexString: "#F2F2F7")
    static let textPrimary = UIColor(hexString: "#000000")
    static let textSecondary = UIColor(hexString: "#8E8E93")
}

// Use throughout your app
view.backgroundColor = .bgSecondary
titleLabel.textColor = .textPrimary
actionButton.backgroundColor = .brandPrimary
```

---

### Example 5: SwiftUI Color Theme

Use hex colors in SwiftUI for consistent theming.

```swift
import SwiftUI
import EaseKit

struct AppTheme {
    static let primary = Color(hex: "#007AFF")!
    static let background = Color(hex: "#F2F2F7")!
    static let cardBackground = Color(hex: "#FFFFFF")!
    static let textPrimary = Color(hex: "#000000")!
    static let textSecondary = Color(hex: "#8E8E93")!
    static let accent = Color(hex: "#FF9500")!
}

struct ThemedButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(AppTheme.primary)
                .cornerRadius(10)
        }
    }
}
```

---

### Example 6: Dynamic Color from API

Parse hex colors received from a backend API for dynamic theming.

```swift
struct ThemeConfig: Codable {
    let primaryColor: String
    let secondaryColor: String
    let backgroundColor: String
}

func applyTheme(from config: ThemeConfig) {
    guard let primary = Color(hex: config.primaryColor),
          let secondary = Color(hex: config.secondaryColor),
          let background = Color(hex: config.backgroundColor) else {
        print("Invalid hex color in theme config")
        return
    }
    
    // Apply the dynamic theme
    window?.tintColor = UIColor(hexString: config.primaryColor)
}
```

---

## UIView to Image Examples

### Example 7: Generate a Shareable Card

Create a visual card and convert it to an image for sharing.

```swift
func createShareCard(title: String, subtitle: String) -> UIImage {
    let card = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 200))
    card.backgroundColor = UIColor(hexString: "#1a1a2e")
    card.layer.cornerRadius = 16
    
    let titleLabel = UILabel()
    titleLabel.text = title
    titleLabel.textColor = .white
    titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
    
    let subtitleLabel = UILabel()
    subtitleLabel.text = subtitle
    subtitleLabel.textColor = UIColor(hexString: "#8E8E93")
    subtitleLabel.font = .systemFont(ofSize: 16)
    
    card.addSubview(titleLabel)
    card.addSubview(subtitleLabel)
    
    // Layout with EaseKit
    titleLabel.anchorView(top: card.topAnchor, leading: card.leadingAnchor, paddingTop: 24, paddingLeft: 20)
    subtitleLabel.anchorView(top: titleLabel.bottomAnchor, leading: card.leadingAnchor, paddingTop: 8, paddingLeft: 20)
    
    return card.asImage()
}

// Share the generated image
@IBAction func shareTapped() {
    let image = createShareCard(title: "My App", subtitle: "Built with EaseKit")
    let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    present(activityVC, animated: true)
}
```

---

### Example 8: Table View Cell Snapshot

Create snapshots of table view cells for animations or transitions.

```swift
func animateCell(at indexPath: IndexPath, in tableView: UITableView) {
    guard let cell = tableView.cellForRow(at: indexPath) else { return }
    
    // Capture cell as image
    let cellImage = cell.asImage()
    
    let imageView = UIImageView(image: cellImage)
    imageView.frame = cell.frame
    tableView.addSubview(imageView)
    
    // Animate the snapshot
    UIView.animate(withDuration: 0.5, animations: {
        imageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        imageView.alpha = 0
    }) { _ in
        imageView.removeFromSuperview()
    }
}
```

---

## Resource Loading Examples

### Example 9: Load JSON Config from Bundle

```swift
import EaseKit

struct AppConfig: Codable {
    let apiBaseURL: String
    let appName: String
    let maxRetries: Int
}

func loadConfig() -> AppConfig? {
    guard let url = URL(localResourceName: "app-config", extensionName: "json"),
          let data = try? Data(contentsOf: url),
          let config = try? JSONDecoder().decode(AppConfig.self, from: data) else {
        print("Failed to load config")
        return nil
    }
    return config
}
```

---

## Complete ViewController Example

A complete view controller using multiple EaseKit features together.

```swift
import UIKit
import EaseKit

class LoginViewController: UIView {
    let logoView = UIImageView()
    let titleLabel = UILabel()
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        // Background
        view.backgroundColor = UIColor(hexString: "#F2F2F7")
        
        // Logo
        logoView.image = UIImage(systemName: "lock.shield.fill")
        logoView.tintColor = UIColor(hexString: "#007AFF")
        view.addSubview(logoView)
        logoView.anchorView(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 60)
        logoView.centerX(inView: view)
        logoView.setDimension(width: 80, height: 80)
        
        // Title
        titleLabel.text = "Welcome Back"
        titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = UIColor(hexString: "#1C1C1E")
        view.addSubview(titleLabel)
        titleLabel.anchorView(top: logoView.bottomAnchor, paddingTop: 32)
        titleLabel.centerX(inView: view)
        
        // Email field
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.autocapitalizationType = .none
        emailField.keyboardType = .emailAddress
        view.addSubview(emailField)
        emailField.anchorView(
            top: titleLabel.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            paddingTop: 40, paddingLeft: 32, paddingRight: 32
        )
        emailField.setDimension(height: 48)
        
        // Password field
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        view.addSubview(passwordField)
        passwordField.anchorView(
            top: emailField.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            paddingTop: 12, paddingLeft: 32, paddingRight: 32
        )
        passwordField.setDimension(height: 48)
        
        // Login button
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(hexString: "#007AFF")
        loginButton.layer.cornerRadius = 12
        view.addSubview(loginButton)
        loginButton.anchorView(
            top: passwordField.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            paddingTop: 24, paddingLeft: 32, paddingRight: 32
        )
        loginButton.setDimension(height: 50)
    }
}
```

---

## See Also

- [Getting Started Guide]({{ site.baseurl }}/getting-started.html) - Installation and first steps
- [API Reference]({{ site.baseurl }}/api-reference.html) - Complete method documentation
- [GitHub Repository](https://github.com/ASMCorp/EaseKit) - Source code and issues
