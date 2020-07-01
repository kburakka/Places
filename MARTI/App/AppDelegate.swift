//
//  AppDelegate.swift
//  MARTI
//
//  Created by burak kaya on 30/06/2020.
//  Copyright © 2020 burak kaya. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        GMSServices.provideAPIKey("AIzaSyDtWTD73OjF9TnWRsz8r8lIwzByU1qGDpc")
        GMSPlacesClient.provideAPIKey("AIzaSyDtWTD73OjF9TnWRsz8r8lIwzByU1qGDpc")

        app.router.start()
        return true
    }
}

