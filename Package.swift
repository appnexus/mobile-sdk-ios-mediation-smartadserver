// swift-tools-version: 6.0

import PackageDescription

let sdkVersion = "9.14.1-beta"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"

let smartAdapterChecksum = """
7f7aad3a06238d3879452a5ee58871b32ca8288892bc51c9874bfb9ab2ff05c3
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
