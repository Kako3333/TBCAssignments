// swift-tools-version: 5.7
// Note: Swift 5.7 is the minimum tools version that supports iOS 17. Update as needed.
import PackageDescription

let package = Package(
    name: "MainApp",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MainApp",
            targets: ["MainApp"]
        ),
    ],
    dependencies: [
        .package(path: "../Networking"),
        .package(path: "../Formatter")
    ],
    targets: [
        .target(
            name: "MainApp",
            dependencies: [
                "Networking",
                "Formatter"  
            ]
        ),
    ]
)
