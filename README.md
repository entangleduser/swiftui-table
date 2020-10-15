# Table

Customizable tables for SwiftUI.

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

