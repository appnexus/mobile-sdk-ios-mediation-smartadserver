// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let sdkVersion = "9.12.1"
let baseUrl = "https://adsdk.bing.net/mobile/ios/releases"
let smartAdapterChecksum = "9de8a0bac5d31311c279bbd562bba19e4810cf77d22acc9606a9e59b66698929"

let package = Package(
    name: "ANSmartAdapter",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .smartAdapter
    ],
    dependencies: [
        .package(name: "SASDisplayKit", url: "https://github.com/smartadserver/swift-package-manager-display-sdk.git", .exact("7.24.2"))
    ],
    targets: [
        .smartAdapter
    ]
)

extension Product {
    static let smartAdapterChecksum = library(name: "ANSmartAdapter", targets: ["ANSmartAdapter"])
}

extension Target {
    static let smartAdapter = binaryTarget(
        name: "ANSmartAdapter",
        url: "\(baseUrl)/\(sdkVersion)/static/ANSmartAdapter.zip",
        checksum: smartAdapterChecksum
      )
}
