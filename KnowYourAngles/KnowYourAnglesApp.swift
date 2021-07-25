//
//  KnowYourAnglesApp.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/18/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

@main
//@main identifies the app's entry point (i.e. first scene)

struct KnowYourAnglesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(appDelegate)
        }
    }
    
}
