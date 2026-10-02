// swift-tools-version: 6.4

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "MyLibrary",
  platforms: [.macOS(.v14)],
  products: [
    .library(
      name: "MyLibrary",
      targets: ["MyLibrary"]
    ),
    .library(
      name: "MyLibraryMacroSupport",
      targets: ["MyLibraryMacroSupport"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax", from: "604.0.0")
  ],
  targets: [
    .target(
      name: "MyLibrary",
      dependencies: [
        "MyLibraryMacros"
      ]
    ),
    .macro(
      name: "MyLibraryMacros",
      dependencies: [
        "MyLibraryMacroSupport",
        .product(name: "SwiftSyntax", package: "swift-syntax"),
      ]
    ),
    .target(
      name: "MyLibraryMacroSupport",
      dependencies: [
        .product(name: "SwiftSyntax", package: "swift-syntax")
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)
