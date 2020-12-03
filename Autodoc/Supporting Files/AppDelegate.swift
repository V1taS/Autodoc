//
//  AppDelegate.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private let googleApiKey = "AIzaSyAI3kF3AShPyPPdxSyn3NSqJNAc2dJse1I"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configurationForRootViewController()
        configureGoogleMapApi()
        return true
    }
}

private extension AppDelegate {
    
    private func configurationForRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
    }
    
    private func configureGoogleMapApi() {
        GMSServices.provideAPIKey(googleApiKey)
    }
}
