// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-AdMob-iOS-Adapter",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ADGAdMobAdapter",
            type: .static,
            targets: ["ADGAdMobAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/ADG-iOS-SDK.git",
            from: "2.30.2"
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "12.5.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ADGAdMobAdapterTarget",
            dependencies: [
                .target(name: "ADGAdMobAdapter"),
                .product(name: "ADG", package: "ADG-iOS-SDK"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "ADGAdMobAdapterTarget"
        ),
        .binaryTarget(
            name: "ADGAdMobAdapter",
            url: "https://github.com/AdGeneration/ADG-iOS-Adapters/releases/download/admob%2F12.8.0/ADGAdMob.xcframework.zip",
            checksum: "286f1c4c1bc7e87de06ffc7bf93312a41727df41d7cf0bcce934f8a3a4c1a1dd"
        ),
    ]
)
