// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.12.1"
let sdkVersion = "9.12.2"
let smartAdapterChecksum = """
9de8a0bac5d31311c279bbd562bba19e4810cf77d22acc9606a9e59b66698929
38a1ced922a88e76c86706e067d7b5dae1e67c2e1a63053218bf7587864997c2
let package = Package(
    name: "ANSmartAdapter",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v12)
    ],

    products: [
        .library(
            name: "ANSmartAdapter",
            targets: [
                "ANSmartAdapter",
                "ANSmartAdapterDependencies"
            ]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/smartadserver/swift-package-manager-display-sdk.git",
            exact: "7.24.2"
        ),
        
        .package(
            url: "https://github.com/appnexus/mobile-sdk-ios-spm.git",
            exact: "9.12.0" //Version(stringLiteral: sdkVersion)
        )
    ],

    targets: [
        .binaryTarget(
            name: "ANSmartAdapter",
            url: "\(baseUrl)/\(sdkVersion)/static/ANSmartAdapter.zip",
            checksum: smartAdapterChecksum
        ),

        .target(
            name: "ANSmartAdapterDependencies",
            dependencies: [
                .product(
                    name: "SASDisplayKit",
                    package: "swift-package-manager-display-sdk"
                ),
                
                .product(
                    name: "AppNexusSDK",
                    package: "mobile-sdk-ios-spm"
                )
            ]
        )
    ]
)
