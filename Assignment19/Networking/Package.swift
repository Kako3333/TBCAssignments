// swift-tools-version: 5.7
// Note: Swift 5.7 is the minimum tools version that supports iOS 17. Update as needed.
import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
    ],
    targets: [
        .target(
            name: "Networking"
        ),
    ]
)
