// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CometChatSwiftUIKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "CometChatSwiftUIKit",
            targets: ["CometChatSwiftUIKit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/cometchat/chat-sdk-ios.git",
            exact: "4.0.55"
        )

    ],
    targets: [
        .target(
            name: "CometChatSwiftUIKit",
            dependencies: [
                .product(name: "CometChatSDK", package: "chat-sdk-ios")
            ],
            path: "Sources"
        ),

        .testTarget(
            name: "CometChatSwiftUIKitTests",
            dependencies: ["CometChatSwiftUIKit"]
        ),
    ]
)

