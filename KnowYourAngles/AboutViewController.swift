//
//  AboutViewController.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 6/23/20.
//  Copyright © 2020 Iolani School. All rights reserved.
//

import Foundation

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}

open class AboutViewController: UIViewController
{
    
    @IBOutlet weak var versionLabel: UILabel!
 
    //when the view loads...
       override open func viewDidLoad() {
           //call on the super class viewDidLoad method
           super.viewDidLoad()
        //trim extra stuff off of the appVersion name
        let versionNumber = String(UIApplication.appVersion![..<(UIApplication.appVersion!.firstIndex(of: "-")!)]);
        
        versionLabel.text = "Version: " + versionNumber;
    }
}
