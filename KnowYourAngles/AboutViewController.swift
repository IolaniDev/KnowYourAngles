////
////  AboutViewController.swift
////  KnowYourAngles
////
////  Created by iPad App Dev on 6/23/20.
////  Copyright © 2020 Iolani School. All rights reserved.
////
//
//import Foundation
//
//extension UIApplication {
//    static var appVersion: String? {
//        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
//    }
//}
//
//open class AboutViewController: UIViewController
//{
//
//    @IBOutlet weak var versionLabel: UILabel!
//
//    //when the view loads...
//       override open func viewDidLoad() {
//           //call on the super class viewDidLoad method
//           super.viewDidLoad()
//        //get the version number or set the string to 0.0.0 if there's some kind of error.
//        let versionNumber:String = UIApplication.appVersion ?? "0.0.0";
//
//        versionLabel.text = "Version: " + versionNumber;
//    }
//}
