//
//  pigeonApp.swift
//  pigeon
//
//  Created by 長崎 晋士 on 2023/03/10.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant

class FlutterDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "my engine")
    init() {
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
    }
}

@main
struct pigeonApp: App {
    @StateObject var flutterDependencies = FlutterDependencies()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(flutterDependencies)
        }
    }
}
