//
//  AppDelegate.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/5/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import UIKit
import CoreData
//import Firebase

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var engineErrorMessage: String?
    
    /**
     * IINK Engine, lazy loaded.
     *
     * @return the iink engine.
     */
    lazy var engine: IINKEngine? = {
        // Check that the MyScript certificate is present
        if myCertificate.length == 0
        {
            self.engineErrorMessage = "Please replace the content of MyCertificate.c with the certificate you received from the developer portal"
            return nil
        }
        
        // Create the iink runtime environment
        let data = Data(bytes: myCertificate.bytes, count: myCertificate.length)
        guard let engine = IINKEngine(certificate: data) else
        {
            self.engineErrorMessage = "Invalid certificate"
            return nil
        }
        
        // Configure the iink runtime environment
        let configurationPath = Bundle.main.bundlePath.appending("/recognition-assets/conf")
        do {
            try engine.configuration.setStringArray([configurationPath], forKey:"configuration-manager.search-path") // Tells the engine where to load the recognition assets from.
        } catch {
            print("Should not happen, please check your resources assets : " + error.localizedDescription)
            return nil
        }
        
        // Set the temporary directory
        do {
            try engine.configuration.setString(NSTemporaryDirectory(), forKey: "content-package.temp-folder")
        } catch {
            print("Failed to set temporary folder: " + error.localizedDescription)
            return nil
        }
        
        //turn solver on
        do {
            try engine.configuration.setBoolean(true, forKey: "math.solver.enable");
        } catch {
            print ("Failed to turn on math solver: " + error.localizedDescription)
            return nil;
        }
        
        //let the solver modify the structure of the expression to obtain something computable
        do {
            try engine.configuration.setString("numeric", forKey:"math.solver.options");
        } catch {
            print ("Failed to set the solver to numeric: " + error.localizedDescription)
            return nil;
        }
        
        //set result of solver to round to 5 decimal places if needed
        do {
            try engine.configuration.setNumber(5, forKey:"math.solver.fractional-part-digits");
        } catch {
            print ("Failed to set the number of decimal places to round to: " + error.localizedDescription);
            return nil;
        }
        return engine
        
        
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //FirebaseApp.configure();
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //self.saveContext()
    }
}

