//
//  Tree_plantingApp.swift
//  Tree-planting
//
//  Created by Ahmed Alharbi on 22/09/1442 AH.
//

import SwiftUI
import GoogleMaps
import Firebase
import GoogleSignIn

let APIKey = "AIzaSyDzm1UZF7h2YqWkjBN2Bh078b28XyvEnjw"


// من هنا نجلب الAPI لGoogle Maps
class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate    {
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
        
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                return
            }
            // User is signed in
        }
    }
    
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()

        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
         GMSServices.provideAPIKey(APIKey)
         return true
     }
 }




// هنا نهيئ الDelegate الخاص فينا للبنية الاساسية عن طريق UIApplicationDelegateAdaptor
@main
struct Tree_plantingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
