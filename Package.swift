// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "VIDVAuth",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "VIDVAuth",
            targets: ["VIDVAuth", "VIDVAuthDependencies"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Valify-Solutions/ios-VIDVOrchestrator-SPM.git", .exact("0.2.1")),
    ],
    targets: [
        .binaryTarget(
            name: "VIDVAuth",
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVAuth/legacy/2.4.0/VIDVAuth.zip",
            checksum: "da5b6d6bb19d0ec352699eda78211b1de68a51e19542df86ffb51ea40ec816eb"
        ),
        .target(
            name: "VIDVAuthDependencies",
            dependencies: [
                .target(name: "VIDVAuth"),
                .product(name: "VIDVOrchestrator", package: "ios-VIDVOrchestrator-SPM"),
            ]
        )
    ]
)
