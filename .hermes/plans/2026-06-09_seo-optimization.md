# EaseKit SEO Optimization Plan

> **For Hermes:** Use subagent-driven-development skill to implement this plan task-by-task.

**Goal:** Make EaseKit rank on Google for relevant iOS/Swift SPM keywords by creating a documentation website with GitHub Pages, improving on-page SEO, and adding structured content.

**Architecture:** Create a GitHub Pages site (docs/ folder on main branch) with a clean, content-rich documentation site. The site will target long-tail keywords around iOS Swift Package Manager, UIKit extensions, SwiftUI helpers, and hex color initialization. We'll also optimize the GitHub repo itself (topics, description, README).

**Tech Stack:** GitHub Pages (Jekyll), HTML/CSS, GitHub Actions (optional), Markdown

---

## Current State Analysis

- Repo: ASMCorp/EaseKit (https://github.com/ASMCorp/EaseKit)
- Description: "A SPM consisting simple collection of helpers and extensions for UIKit and SwiftUI."
- Stars: 1, Forks: 0
- Topics: none set
- No GitHub Pages enabled
- No website/homepage URL
- README is basic (installation + usage, ~150 lines)
- 3 source files: Color+Extension, UIView+Extension, NetworkRelated
- No docs/ folder, no website content

## Target Keywords (SEO)

Primary:
- "ios swift package extensions"
- "uikit extensions swift"
- "swiftui hex color"
- "swift package manager ios"
- "ios autolayout helper"

Long-tail:
- "swift uiview extension autolayout"
- "swiftui color from hex string"
- "ios swiftui helper library"
- "swift package uikit swiftui extensions"
- "uicolor hex string swift"

---

## Task 1: Create GitHub Pages Branch and Enable Pages

**Objective:** Set up GitHub Pages on the repo using the docs/ folder approach.

**Files:**
- Create: `docs/` directory structure
- Modify: repo settings (via gh CLI)

**Step 1: Create the branch**

```bash
cd /Users/asaduzzaman.anik/Documents/GitHub/EaseKit
git checkout -b feature/seo-docs-site
```

**Step 2: Create docs directory with Jekyll config**

Create `docs/_config.yml`:
```yaml
title: EaseKit
description: A lightweight Swift Package with convenient extensions for UIKit and SwiftUI
baseurl: "/EaseKit"
url: "https://asmcorp.github.io"
theme: minima
plugins:
  - jekyll-seo-tag
  - jekyll-sitemap
  - jekyll-feed

# SEO defaults
defaults:
  - scope:
      path: ""
    values:
      image: "/EaseKit/assets/og-image.png"

# Social
twitter:
  username: ASMCorp
github:
  username: ASMCorp

# Navigation
header_pages:
  - getting-started.md
  - api-reference.md
  - examples.md
```

**Step 3: Commit and push**

```bash
git add docs/
git commit -m "feat: add GitHub Pages Jekyll config for docs site"
git push origin feature/seo-docs-site
```

**Step 4: Enable GitHub Pages via gh CLI**

```bash
gh api repos/ASMCorp/EaseKit/pages --method POST --source '{"source":{"branch":"main","path":"/docs"}}' 2>&1 || echo "May need to enable via web UI first"
```

Expected: Pages enabled on main branch, /docs path. If gh API fails, we'll merge to main first then enable.

---

## Task 2: Create SEO-Optimized Landing Page (index.html)

**Objective:** Build the main landing page with proper SEO meta tags, structured content, and keyword-rich sections.

**Files:**
- Create: `docs/index.html`

**Content requirements:**
- Proper `<title>` tag with primary keywords
- Meta description (155 chars max) with keywords
- Open Graph tags for social sharing
- Structured data (JSON-LD) for SoftwareSourceCode
- Hero section with clear value proposition
- Feature sections targeting each keyword cluster
- Installation instructions (copy-paste ready)
- Code examples with syntax highlighting
- FAQ section (targets "People Also Ask")
- Footer with links

**Step 1: Write the landing page**

Create `docs/index.html` with:
- Title: "EaseKit - iOS Swift Package for UIKit & SwiftUI Extensions"
- Meta description: "EaseKit is a free Swift Package Manager library for iOS. Simplify Auto Layout with UIView extensions, create colors from hex strings in SwiftUI, and speed up iOS development."
- JSON-LD structured data for SoftwareApplication / SoftwareSourceCode
- Sections: Hero, Features (Color Extensions, UIView Extensions, Network Helpers), Installation, Usage Examples, FAQ, CTA
- Each section uses target keywords naturally in headings (H1, H2, H3)

**Step 2: Commit**

```bash
git add docs/index.html
git commit -m "feat: add SEO-optimized landing page for EaseKit docs site"
```

---

## Task 3: Create Getting Started Page

**Objective:** Create a getting-started page targeting "how to install swift package" keywords.

**Files:**
- Create: `docs/getting-started.md`

**Content:**
- Step-by-step SPM installation guide
- Xcode instructions with screenshots descriptions
- Package.swift code
- Import and basic usage
- Troubleshooting section
- Target keywords: "install swift package manager ios", "add spm to xcode project"

**Step 1: Write the page**

```markdown
---
layout: page
title: Getting Started with EaseKit
description: Learn how to install EaseKit Swift Package Manager library in your iOS project. Step-by-step guide for Xcode and Package.swift.
---

# Getting Started with EaseKit

EaseKit is a Swift Package Manager (SPM) library that provides convenient extensions for UIKit and SwiftUI...

## Installation

### Using Xcode

1. Open your Xcode project
2. Select **File → Add Package Dependencies...**
3. Enter: `https://github.com/ASMCorp/EaseKit.git`
4. Click **Add Package**

### Using Package.swift

Add EaseKit to your package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/ASMCorp/EaseKit.git", from: "1.0.0")
]
```

## Requirements

- iOS 12.0+
- Swift 6.2+
- Xcode 14.0+

## Quick Start

```swift
import EaseKit

// Create a color from hex
let myColor = UIColor(hexString: "#FF5733")

// Anchor a view
myView.anchorView(top: parent.topAnchor, leading: parent.leadingAnchor)
```
```

**Step 2: Commit**

```bash
git add docs/getting-started.md
git commit -m "feat: add getting started page with installation guide"
```

---

## Task 4: Create API Reference Page

**Objective:** Create a comprehensive API reference targeting "swift uiview extension", "swiftui hex color" keywords.

**Files:**
- Create: `docs/api-reference.md`

**Content:**
- Full API documentation for all 3 extensions
- Color+Extension API (hex init, random, SwiftUI Color)
- UIView+Extension API (anchorView, fillSuperView, center, setDimension, asImage)
- NetworkRelated API (URL localResourceName)
- Each method with signature, parameters, return type, code example
- Target keywords in headings and descriptions

**Step 1: Write the API reference**

```markdown
---
layout: page
title: EaseKit API Reference - UIKit & SwiftUI Extensions
description: Complete API reference for EaseKit Swift Package. UIView Auto Layout extensions, UIColor hex string initializer, SwiftUI Color extensions, and more.
---

# EaseKit API Reference

Complete documentation for all extensions and helpers in EaseKit.

## UIColor Extensions

### Initialize UIColor from Hex String

Create UIColor instances from hexadecimal color strings...

```swift
convenience init(hexString: String, alpha: Float = 1.0)
```

**Parameters:**
- `hexString`: Hex color string (3, 6, or 8 characters, with or without #)
- `alpha`: Opacity value (0.0 to 1.0), defaults to 1.0

**Example:**
```swift
let red = UIColor(hexString: "#FF0000")
let semiBlue = UIColor(hexString: "0000FF", alpha: 0.5)
let shortGreen = UIColor(hexString: "0F0")
```

### Generate Random Colors

```swift
static var random: UIColor
```

[... full API docs for all methods ...]
```

**Step 2: Commit**

```bash
git add docs/api-reference.md
git commit -m "feat: add comprehensive API reference page"
```

---

## Task 5: Create Examples Page

**Objective:** Create practical examples page targeting "swift autolayout example", "swiftui hex color example" keywords.

**Files:**
- Create: `docs/examples.md`

**Content:**
- Real-world usage examples
- Auto Layout with EaseKit
- Color theming with hex strings
- SwiftUI integration examples
- Before/without vs after/with EaseKit comparisons

**Step 1: Write examples page**

```markdown
---
layout: page
title: EaseKit Examples - iOS Swift Code Samples
description: Practical code examples showing how to use EaseKit Swift Package for Auto Layout, hex colors in SwiftUI, and UIView extensions in iOS apps.
---

# EaseKit Code Examples

## Auto Layout Made Simple

### Without EaseKit
```swift
myView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    myView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 20),
    myView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16),
    myView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16)
])
```

### With EaseKit
```swift
myView.anchorView(
    top: parent.topAnchor,
    leading: parent.leadingAnchor,
    trailing: parent.trailingAnchor,
    paddingTop: 20,
    paddingLeft: 16,
    paddingRight: 16
)
```

[... more examples ...]
```

**Step 2: Commit**

```bash
git add docs/examples.md
git commit -m "feat: add practical code examples page"
```

---

## Task 6: Create Custom CSS for Better Styling

**Objective:** Add custom styles to make the docs site look professional and improve engagement metrics.

**Files:**
- Create: `docs/assets/css/style.scss`

**Content:**
- Import minima theme
- Custom color scheme matching EaseKit branding
- Better code block styling
- Responsive layout improvements
- Fast-loading, no external dependencies

**Step 1: Create stylesheet**

```scss
---
---

@import "minima";

// EaseKit brand colors
$easekit-primary: #007AFF;
$easekit-dark: #1a1a2e;
$easekit-accent: #34C759;

.site-header {
    background: linear-gradient(135deg, $easekit-dark, $easekit-primary);
    border-top: 5px solid $easekit-accent;
}

.hero-section {
    text-align: center;
    padding: 3rem 1rem;
    background: $easekit-dark;
    color: white;
    border-radius: 8px;
    margin-bottom: 2rem;
}

.hero-section h1 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.code-example {
    background: #f5f5f5;
    border-left: 4px solid $easekit-primary;
    padding: 1rem;
    margin: 1rem 0;
    border-radius: 0 4px 4px 0;
}

.feature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 1.5rem;
    margin: 2rem 0;
}

.feature-card {
    padding: 1.5rem;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    transition: transform 0.2s;
}

.feature-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}
```

**Step 2: Commit**

```bash
git add docs/assets/css/style.scss
git commit -m "feat: add custom CSS styling for docs site"
```

---

## Task 7: Create robots.txt and Sitemap Configuration

**Objective:** Ensure search engines can properly crawl and index the site.

**Files:**
- Create: `docs/robots.txt`
- Modify: `docs/_config.yml` (already has jekyll-sitemap plugin)

**Step 1: Create robots.txt**

```
User-agent: *
Allow: /

Sitemap: https://asmcorp.github.io/EaseKit/sitemap.xml
```

**Step 2: Commit**

```bash
git add docs/robots.txt
git commit -m "feat: add robots.txt for search engine crawling"
```

---

## Task 8: Optimize GitHub Repository SEO

**Objective:** Optimize the GitHub repo itself for search (both GitHub search and Google).

**Files:**
- Modify: `README.md`
- Update: repo settings via gh CLI

**Step 1: Update repo description and topics**

```bash
gh repo edit ASMCorp/EaseKit \
  --description "EaseKit - Free Swift Package for iOS. UIKit Auto Layout extensions, SwiftUI hex color helpers, UIView utilities. SPM library for faster iOS development." \
  --add-topic "ios" \
  --add-topic "swift" \
  --add-topic "swift-package-manager" \
  --add-topic "uikit" \
  --add-topic "swiftui" \
  --add-topic "ios-development" \
  --add-topic "autolayout" \
  --add-topic "extensions" \
  --add-topic "spm" \
  --add-topic "cocoapods-alternative" \
  --homepage "https://asmcorp.github.io/EaseKit"
```

**Step 2: Enhance README.md**

Update README with:
- Badges (Swift version, platform, license, SPM compatible)
- Better keyword-rich description at the top
- Table of contents
- More detailed feature list
- Comparison section (with/without EaseKit)
- Link to documentation site
- Contributing section

**Step 3: Commit**

```bash
git add README.md
git commit -m "mdd: optimize README with badges, keywords, and docs link"
```

---

## Task 9: Create Open Graph Image

**Objective:** Create an OG image for social sharing (improves click-through from social/Twitter).

**Files:**
- Create: `docs/assets/og-image.png`

**Step 1: Generate a simple OG image**

Use Python/Pillow to generate a 1200x630 image with:
- EaseKit logo/text
- Tagline: "Swift Package for UIKit & SwiftUI Extensions"
- iOS/Swift branding colors

```python
from PIL import Image, ImageDraw, ImageFont
import os

img = Image.new('RGB', (1200, 630), color=(26, 26, 46))
draw = ImageDraw.Draw(img)

# Draw accent bar
draw.rectangle([0, 0, 1200, 10], fill=(52, 199, 89))

# Title
draw.text((100, 200), "EaseKit", fill='white')
draw.text((100, 280), "Swift Package for", fill=(200, 200, 200))
draw.text((100, 340), "UIKit & SwiftUI Extensions", fill=(200, 200, 200))

# Features
draw.text((100, 450), "Hex Colors  |  Auto Layout  |  UIView Helpers", fill=(0, 122, 255))

img.save('/Users/asaduzzaman.anik/Documents/GitHub/EaseKit/docs/assets/og-image.png')
```

**Step 2: Commit**

```bash
git add docs/assets/og-image.png
git commit -m "feat: add Open Graph image for social sharing"
```

---

## Task 10: Merge to Main and Enable GitHub Pages

**Objective:** Merge the feature branch to main and enable GitHub Pages.

**Step 1: Create PR and merge**

```bash
cd /Users/asaduzzaman.anik/Documents/GitHub/EaseKit
git checkout main
git merge feature/seo-docs-site
git push origin main
```

**Step 2: Enable GitHub Pages**

```bash
gh api repos/ASMCorp/EaseKit/pages --method POST --field source='{"branch":"main","path":"/docs"}' 2>&1
```

If the above doesn't work via API:
```bash
gh repo edit ASMCorp/EaseKit --enable-pages --pages-source '{"branch":"main","path":"/docs"}' 2>&1 || echo "Enable via web: https://github.com/ASMCorp/EaseKit/settings/pages"
```

**Step 3: Verify**

```bash
gh api repos/ASMCorp/EaseKit/pages 2>&1
```

Expected: Pages enabled, URL shown as https://asmcorp.github.io/EaseKit/

---

## Task 11: Submit Sitemap to Google

**Objective:** Submit the sitemap to Google Search Console for indexing.

**Step 1: Verify site is live**

```bash
curl -sI https://asmcorp.github.io/EaseKit/sitemap.xml | head -5
```

**Step 2: Provide instructions for Google Search Console**

Since Google Search Console requires manual verification, provide the user with:
1. URL to submit: https://asmcorp.github.io/EaseKit/sitemap.xml
2. Steps to verify ownership via DNS or HTML file
3. Request indexing for key pages

---

## Verification Checklist

After all tasks:
- [ ] GitHub Pages site live at https://asmcorp.github.io/EaseKit/
- [ ] Landing page has proper title, meta description, OG tags
- [ ] JSON-LD structured data present
- [ ] All 4 content pages created (index, getting-started, api-reference, examples)
- [ ] robots.txt allows crawling
- [itemap.xml generated by jekyll-sitemap
- [ ] GitHub repo has 10 relevant topics
- [ ] Repo description is keyword-rich
- [ ] README has badges and links to docs site
- [ ] OG image displays correctly on social share
- [ ] Custom CSS makes site look professional
- [ ] All internal pages link to each other
- [ ] Code examples are copy-pasteable

## Risks & Notes

- GitHub Pages can take 5-10 minutes to go live after enabling
- Google indexing takes days to weeks; this plan sets up the infrastructure
- Jekyll minima theme is built-in, no extra dependencies needed
- The docs/ folder approach means everything stays in one branch (main)
- No external hosting costs; GitHub Pages is free
- For faster Google indexing, share the site URL on social media and dev forums
