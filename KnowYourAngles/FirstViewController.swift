//
//  FirstViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/12/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation

class FirstViewController : UIViewController{
    var defaultSettings = Settings(num: 10, isTimer: false, time: 1, isDeg: false, isRad: false, isReciprocal: false);

    /*override func viewDidLoad() {
        let svc = SettingsViewController();
        let currSettings = svc.loadSettings();
        if(currSettings != nil)
        {
            svc.settingsData = currSettings;
            NSLog("New Settings Saved.");
        }
        else
        {
            svc.settingsData = defaultSettings;
            NSLog("Default Settings Saved.");
        }
    }*/
}