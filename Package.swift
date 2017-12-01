// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PhoenixKitsuCharactersAndPeople",
  products: [
  .library(name: "PhoenixKitsuCharactersAndPeople",
   targets: ["PhoenixKitsuCharactersAndPeople"])
  ],
  dependencies: [
  .package(url: "https://github.com/JasonLighthunter/Phoenix-Kitsu-Core.git", .branch("setup"))
  ],
  targets: [
  .target(name: "PhoenixKitsuCharactersAndPeople", dependencies: [
    "PhoenixKitsuCore"
    ]),
  .testTarget(name: "PhoenixKitsuCharactersAndPeopleTests",
    dependencies: ["PhoenixKitsuCharactersAndPeople"])
  ]
  )
