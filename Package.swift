// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-AdMob-iOS-Adapter",
    platforms: [
        .iOS(.v15)
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
            "2.30.2"..<"7.0.0"
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "13.12.0"
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
            url: "https://github.com/AdGeneration/ADG-AdMob-iOS-Adapter/releases/download/13.12.0/ADGAdMob.xcframework.zip",
            checksum: "947f86f9a0b47ff23e9c9a01d84e598884131e1ec32e9da916d01f8767b043cf"
        ),
    ]
)
