// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "QuranKit",
	platforms: [.iOS(.v14), .watchOS(.v6), .macOS(.v10_15)],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "QuranKit",
			targets: ["QuranKit"]
		),
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),
//			.package(
//				name: "GRDB",
//				url: "https://github.com/groue/GRDB.swift",
//				.exact("5.7.4-sqlcipher")
//			)
		.package(path: "~/Desktop/Frameworks/MILocalStore"),
    .package(path: "~/Desktop/Frameworks/MINetworkKit")
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(
			name: "QuranKit",
			dependencies: [.product(name: "MILocalStore", package: "MILocalStore"),
                     .product(name: "MINetworkKit", package: "MINetworkKit")]
		),
		.testTarget(
			name: "QuranKitTests",
			dependencies: ["QuranKit"]
		),
	]
)
