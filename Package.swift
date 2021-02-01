// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Table",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .watchOS(.v7)
  ],
  products: [
    .library(
      name: "Table",
      targets: ["Table"]
    )
  ],
  targets: [
    .target(name: "Table"),
    .testTarget(
      name: "TableTests",
      dependencies: ["Table"]
    )
  ]
)
