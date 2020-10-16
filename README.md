![](https://neutralradiance.github.io/sources/images/table.jpg)

Customizable tables for SwiftUI.


## How to add this to my project?
Add to your current **Package.swift**, drag and drop into your project, or open Xcode and go to **File**>**Swift Packages**>**Add Package Dependency...**

Works for iOS v14 due to native `ProgressView` support and `UIImpactFeedbackGenerator` from UIKit.

### Basic Usage

```swift
import SwiftUI
import Table

Table(items) { item in
    // View goes here.
}
.tableStyle(SeratedInsetTableStyle())
.onPull(threshold: 100,
        impact: .none,
        delay: .now() + 0.5,
        isFinished: .constant(true)) {
    // Action goes here
}
```

