// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Driver",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "Driver",
            type: .dynamic,
            targets: ["Driver"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/migueldeicaza/SwiftGodot", branch: "0.39.0")
    ],
    targets: [
        .target(
            name: "Driver",
            dependencies: [
                "SwiftGodot",
            ],
            swiftSettings: [.unsafeFlags(["-suppress-warnings"])]
        ),
        .testTarget(
            name: "DriverTests",
            dependencies: ["Driver"]
        ),
    ]
)
