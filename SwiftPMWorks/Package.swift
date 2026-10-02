// swift-tools-version: 6.4

import PackageDescription

let package = Package(
  name: "SwiftPMWorks",
  platforms: [.macOS(.v14)],
  products: [
    .library(
      name: "SwiftPMWorks",
      targets: ["SwiftPMWorks"]
    )
  ],
  dependencies: [
    .package(path: "../MyLibrary")
  ],
  targets: [
    .target(
      name: "SwiftPMWorks",
      dependencies: [
        .product(name: "MyLibrary", package: "MyLibrary")
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)
