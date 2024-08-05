// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Kanvas",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Kanvas",
            targets: ["Kanvas"]),
    ],
    dependencies: [
        .package(url: "https://github.com/TimOliver/TOCropViewController.git", from: "2.7.3")
    ],
    targets: [
        .target(
            name: "Kanvas",
            dependencies: [.product(name: "CropViewController", package: "TOCropViewController")],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
