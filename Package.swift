// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-region-service-legalities",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftRegionServiceLegalities",
            targets: ["SwiftRegionServiceLegalities"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/RandomHashTags/swift-sovereign-states.git", from: "1.3.2"),
    ],
    targets: [
        .target(
            name: "SwiftRegionServiceLegalities",
            dependencies: [
                .product(name: "SwiftSovereignStates", package: "swift-sovereign-states"),
            ],
            path: "./Sources/swift-region-service-legalities"
        ),
        .testTarget(
            name: "swift-region-service-legalitiesTests",
            dependencies: ["SwiftRegionServiceLegalities"]
        ),
    ]
)
