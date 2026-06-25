import ProjectDescription

let appName: String = "Example5"
let bundleId: String = "dev.son7.ios.\(appName)"
let iOSTargetVersion: String = "16.0"
let version: String = "0.0.1"
let bundleVersion: String = "1"
let basePath: String = "Example5"
let swiftPackages: String = "SwiftPackages"


let project = Project(name: appName,
                      packages: [
                        .package(url: "https://github.com/SwiftfulThinking/SwiftfulRouting.git", .exact(.init(5, 3, 6))),
                        .package(path: "\(swiftPackages)/Exp5_NavigationRouting"),
                        .package(path: "\(swiftPackages)/Exp5_DI"),
                        .package(path: "\(swiftPackages)/Exp5_Network")
                      ],
                      settings: Settings.settings(configurations: makeConfiguration()),
                      targets: [
                        .target(name: "iOS",
                                destinations: [.iPhone],
                                product: .app,
                                bundleId: bundleId,
                                deploymentTargets: .iOS(iOSTargetVersion),
                                infoPlist: makeInfoPlist(),
                                sources: "\(basePath)/Sources/**",
                                resources: "\(basePath)/Resources/**",
                                dependencies: [
                                    .package(product: "SwiftfulRouting"),
                                    .package(product: "NavigationRouter"),
                                    .package(product: "S7DI"),
                                    .package(product: "Exp5_Network")
                                ],
                                settings: makeBaseSetting()
                                
                               )
                      ]
)

private func makeConfiguration() -> [Configuration] {
        let debug = Configuration.debug(name: "Debug", xcconfig: "Configs/Debug.xcconfig")
        let release = Configuration.debug(name: "Release", xcconfig: "Configs/Release.xcconfig")
    
    return [debug, release]
}

private func makeInfoPlist(merging other: [String : Plist.Value] = [:]) -> InfoPlist {
    var extendedPlist: [String : Plist.Value] = [:]
    extendedPlist = ["UIApplicationSceneManifest" : .dictionary(["UIApplicationSupportsMultipleScenes" : .boolean(false)]),
                     "UILaunchScreen" : .array([]),
                     "UISupportedInterfaceOrientations": .array([.string("UIInterfaceOrientationPortrait")]),
                     "CFBundleShortVersionString": .string(version),
                     "CFBundleVersion": .string(bundleVersion),
                     "CFBundleDisplayName": .string(appName)
    ]
    
    return .extendingDefault(with: extendedPlist)
}

private func makeBaseSetting() -> Settings {
    let msForWarning = 500
    let settings = SettingsDictionary().otherSwiftFlags(["-Xfrontend -warn-long-expression-type-checking=\(msForWarning)", "-Xfrontend -warn-long-function-bodies=\(msForWarning)"])
    
    return Settings.settings(base: settings,
                             configurations: [],
                             defaultSettings: .recommended)
}
