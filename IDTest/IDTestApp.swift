//
//  IDTestApp.swift
//  IDTest
//
//  Created by Gabe McGuire on 6/20/23.
//

import SwiftUI
import ProximityReader

@main
struct IDTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
           ContentView()
        }
    }
}


class AppDelegate: UIResponder, UIApplicationDelegate {

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Set minAge to 21 on the first launch.
    if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
        UserDefaults.standard.set(21, forKey: "minAge")
        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
    }
    return true
}
}
