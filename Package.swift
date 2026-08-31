// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.0"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let smartAdapterChecksum = """
9ecb202a8f3cd60561ff0fe405d82b3ef79bd77f93f6ab4030f19e056825b992
"""

let package = Package(
    name: "ANSmartAdapter",

    defaultLocalization: "en",

    platforms: [
        .iOS(.v15)
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
            exact: "9.14.0" //Version(stringLiteral: sdkVersion)
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
