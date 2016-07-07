//
//  ViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/5/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import UIKit
//import CoreGraphics

class ViewController: UIViewController, MAWMathViewDelegate{
    
    //totalNumOfProblems is set in Settings by user for the number of problems they want to be quizzed on.
    
    //possible problems
    var degreeProblems: [String] = ["Cos0", "Cos30", "Cos45", "Cos60", "Cos90", "Cos120", "Cos135", "Cos150", "Cos180", "Cos210", "Cos225", "Cos240", "Cos270", "Cos300", "Cos315", "Cos330", "Sin0", "Sin30", "Sin45", "Sin60", "Sin90", "Sin120", "Sin135", "Sin150", "Sin180", "Sin210", "Sin225", "Sin240", "Sin270", "Sin300", "Sin315", "Sin330", "tan0", "tan30", "tan45", "tan60", "tan90", "tan120", "tan135", "tan150", "tan180", "tan210", "tan225", "tan240", "tan270", "tan300", "tan315", "tan330"];
    
    var radianProblems = [String]();
    
    var reciprocalProblems = [String]();
    
    //image of current problem.
    @IBOutlet weak var problemImage: UIImageView!
    
    //mathView holds the view where you can write answers
    @IBOutlet var mathView: MAWMathView!
    var certificateRegistered : Bool!;
    
    override func viewDidLoad() {
        //Setup Writing Recognition
        super.viewDidLoad();
        
        // Register MyScript certificate before anything else
        let certificate = NSData(bytes: myCertificate.bytes, length: myCertificate.length);
        
        certificateRegistered = mathView.registerCertificate(certificate);
        
        // Register as delegate to be notified of configuration, recognition, ...
        if((certificateRegistered) != nil)
        {
            mathView.delegate = self;
            _ = NSBundle.mainBundle()
            
            var bundlePath : NSString = NSBundle.mainBundle().pathForResource("resources", ofType: "bundle")!
            
            bundlePath = bundlePath.stringByAppendingPathComponent("conf"); mathView.addSearchDir(bundlePath as String)
            
            // The configuration is an asynchronous operation. Callbacks are provided to
            // monitor the beginning and end of the configuration process.
            //
            // "math" references the math bundle name in conf/math.conf file in your resources.
            // "standard" references the configuration name in math.conf
            
            mathView.configureWithBundle("math", andConfig: "standard");
            
            //setup image of first problem
            let randomNum = Int(arc4random_uniform(UInt32(degreeProblems.count)));
            problemImage.image = UIImage(named: degreeProblems[randomNum]);
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        if(!(certificateRegistered))
        {
            let alertController = UIAlertController(title: "Invalid certificate", message: "Please use a valid certificate", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
            
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func mathViewDidEndCongfiguration(mathView: MAWMathView)
    {
        NSLog("Math Widget configured");
    }
    
    func didFailConfigurationWithError(error: NSError, mathView: MAWMathView)
    {
        NSLog("Unable to configure the Math Widget: %@", error);
    }
    
    func mathViewDidEndRecognition(mathView: MAWMathView)
    {
        NSLog("Math Widget recognition: %@", mathView.resultAsText());
    }
    
    func mathViewDidEndWriting(mathView: MAWMathView ){
        NSLog("Math Widget End Writing: %@", mathView.resultAsText());
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

