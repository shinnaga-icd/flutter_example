//
//  ContentView.swift
//  pigeon
//
//  Created by 長崎 晋士 on 2023/03/10.
//

import SwiftUI
import Flutter

struct ContentView: View {
    // Flutter dependencies are passed in an EnvironmentObject.
    @EnvironmentObject var flutterDependencies: FlutterDependencies

    // Button is created to call the showFlutter function when pressed.
    var body: some View {
        Button("Show Flutter!") {
            showFlutter()
            
        }
    }
    
    func showFlutter() {
        let api: FlutterParamApi!
        api = FlutterParamApi.init(binaryMessenger: flutterDependencies.flutterEngine.binaryMessenger)
        
        let paramColor = ParamColor(a: 10, r: 230, g: 0, b: 60)
        
        var base64String: String = ""
        if let image = UIImage(named: "usa") {
            if let imageData = image.pngData() {
                base64String = imageData.base64EncodedString()
            }
        }
        
        api.setParams(param: Param(str: "success!!", num: 100, color: paramColor, image: base64String), completion: {})

        // Get the RootViewController.
        guard
            let windowScene = UIApplication.shared.connectedScenes
                .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
            let window = windowScene.windows.first(where: \.isKeyWindow),
            let rootViewController = window.rootViewController
        else { return }

        // Create the FlutterViewController.
        let flutterViewController = FlutterViewController(
            engine: flutterDependencies.flutterEngine,
            nibName: nil,
            bundle: nil)
        flutterViewController.modalPresentationStyle = .overCurrentContext
        flutterViewController.isViewOpaque = false
        
        rootViewController.present(flutterViewController, animated: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
