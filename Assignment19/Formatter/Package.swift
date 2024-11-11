// swift-tools-version: 5.7
// Note: Swift 5.7 is the minimum tools version that supports iOS 17. Update as needed.

import PackageDescription

let package = Package(
    name: "Formatter",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Formatter",
            targets: ["Formatter"]
        ),
    ],
    targets: [
        .target(
            name: "Formatter"
        ),
    ]
)

