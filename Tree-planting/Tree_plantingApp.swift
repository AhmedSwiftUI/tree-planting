//
//  Tree_plantingApp.swift
//  Tree-planting
//
//  Created by Ahmed Alharbi on 22/09/1442 AH.
//

import SwiftUI
import GoogleMaps

let APIKey = "AIzaSyDzm1UZF7h2YqWkjBN2Bh078b28XyvEnjw"

class AppDelegate: NSObject, UIApplicationDelegate    {
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         return true
     }
 }

@main
struct Tree_plantingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
