// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tipsy-robot-swift",
    platforms: [ 
        .macOS(.v12),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/carlynorama/TrunkLine.git", branch:"main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "tipsy-robot-swift",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name:"TrunkLine", package: "TrunkLine")
            ]),
        .testTarget(
            name: "tipsy-robot-swiftTests",
            dependencies: ["tipsy-robot-swift"]),
    ]
)
