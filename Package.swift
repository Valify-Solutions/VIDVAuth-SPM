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
            url: "https://valify-public-sdks.s3.eu-central-1.amazonaws.com/VIDVAuth/legacy/2.4.1/VIDVAuth.zip",
            checksum: "64e27403d707edda7af74b9f8bdebd47d70ebef9074c3ef49d8a05debdce6c2b"
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
