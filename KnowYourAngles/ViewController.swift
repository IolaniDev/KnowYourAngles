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
    
    //totalNumOfProblems is set in Settings by user for the number of problems they want to be quizzed on. (10 by default)
    var totalNumOfProblems : Int = 10;
    
    //possible problems
    var degreeProblems: [String] = ["Cos0", "Cos30", "Cos45", "Cos60", "Cos90", "Cos120", "Cos135", "Cos150", "Cos180", "Cos210", "Cos225", "Cos240", "Cos270", "Cos300", "Cos315", "Cos330", "Sin0", "Sin30", "Sin45", "Sin60", "Sin90", "Sin120", "Sin135", "Sin150", "Sin180", "Sin210", "Sin225", "Sin240", "Sin270", "Sin300", "Sin315", "Sin330", "tan0", "tan30", "tan45", "tan60", "tan90", "tan120", "tan135", "tan150", "tan180", "tan210", "tan225", "tan240", "tan270", "tan300", "tan315", "tan330"];
    
    var radianProblems = [String]();
    
    var reciprocalProblems = [String]();
    
    var libraryOfProblems = [String]();
    
    @IBOutlet weak var numCorrect: UILabel!
    @IBOutlet weak var numIncorrect: UILabel!
    @IBOutlet weak var currentQuestion: UILabel!
    
    //image of current problem.
    @IBOutlet weak var problemImage: UIImageView!
    //name of current problem
    var currProblem = "";
    //current problem number
    var currProblemNumber = 1;
    
    //mathView holds the view where you can write answers
    @IBOutlet var mathView: MAWMathView!
    var certificateRegistered : Bool!;
    
    override func viewDidLoad() {
        //Setup Writing Recognition
        super.viewDidLoad();
        
        //load settings
        let savedSettings = NSUserDefaults.standardUserDefaults()
        //load the max num of problems the player wants to complete
        if (savedSettings.objectForKey("maxNumOfProblems") != nil) {
            totalNumOfProblems = lroundf(savedSettings.valueForKey("maxNumOfProblems") as! Float);
        }
        //load the degree problems (if the user wants them)
        if(savedSettings.objectForKey("degrees") != nil)
        {
            if(savedSettings.valueForKey("degrees") as! Bool)
            {
                libraryOfProblems.appendContentsOf(degreeProblems);
            }
        }

        
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
            let randomNum = Int(arc4random_uniform(UInt32(libraryOfProblems.count)));
            currProblem = libraryOfProblems[randomNum]
            problemImage.image = UIImage(named: currProblem);
            
            currentQuestion.text = "Question \(currProblemNumber) of \(totalNumOfProblems)";

            NSLog("View Loaded with \(totalNumOfProblems)");
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
    
    @IBAction func nextButtonPressed(sender: UIButton) {
        if(currProblem == "Cos0" || currProblem == "Sin90" || currProblem == "tan45" || currProblem == "tan225")
        {
            if(mathView.resultAsText()=="1"){
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else{
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "Cos90" || currProblem == "Cos270" || currProblem == "Sin0" || currProblem == "Sin180" || currProblem == "tan0" || currProblem == "tan180")
        {
            if(mathView.resultAsText() == "0")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "Cos60" || currProblem == "Cos300" || currProblem == "Sin30" || currProblem == "Sin150")
        {
            if(mathView.resultAsText() == "[1/2]=0.5" || mathView.resultAsText() == "0.5")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "Cos30" || currProblem == "Cos330" || currProblem == "Sin60" || currProblem == "Sin120")
        {
            //Answer: [√[3]/2]=0.866…
            if(mathView.resultAsText() == "[√[3]/2]=0.866…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if (currProblem == "Cos150" || currProblem == "Cos210" || currProblem == "Sin240" || currProblem == "Sin300")
        {
            //Answer: -[√[3]/2]=-0.866… or [-√[3]/2]=-0.866… or [√[3]/-2]=-0.866…
            if(mathView.resultAsText() == "-[√[3]/2]=-0.866…" || mathView.resultAsText() == "[-√[3]/2]=-0.866…" || mathView.resultAsText() == "[√[3]/-2]=-0.866…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if (currProblem == "Cos45" || currProblem == "Cos315" || currProblem == "Sin45" || currProblem == "Sin135")
        {
            //Answer: [√[2]/2]=0.707…
            if(mathView.resultAsText() == "[√[2]/2]=0.707…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if (currProblem == "Cos135" || currProblem == "Cos225" || currProblem == "Sin225" || currProblem == "Sin315")
        {
            //Answer: -[√[2]/2]=-0.707… or [[-√[2]]/2]=-0.707… or [√[2]/-2]=-0.707…
            if(mathView.resultAsText() == "-[√[2]/2]=-0.707…" || mathView.resultAsText() == "[[-√[2]]/2]=-0.707…" || mathView.resultAsText() == "[√[2]/-2]=-0.707…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if (currProblem == "Cos120" || currProblem == "Cos240" || currProblem == "Sin210" || currProblem == "Sin330")
        {
            //Answer: -[1/2]=-0.5 or [-1/2]=-0.5 or [1/-2]=-0.5 or -0.5
            if(mathView.resultAsText() == "-[1/2]=-0.5" || mathView.resultAsText() == "[-1/2]=-0.5" || mathView.resultAsText() == "[1/-2]=-0.5" || mathView.resultAsText() == "-0.5")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "Cos180" || currProblem == "Sin270" || currProblem == "tan135" || currProblem == "tan315")
        {
            //Answer: -1
            if(mathView.resultAsText() == "-1")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "tan30" || currProblem == "tan210")
        {
            //Answer: [√[3]/3]=0.577…
            if(mathView.resultAsText() == "[√[3]/3]=0.577…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "tan150" || currProblem == "tan330")
        {
            //Answer: -[√[3]/3]=-0.577… or [-√[3]/3]=-0.577… or [√[3]/-3]=-0.577…
            if(mathView.resultAsText() == "-[√[3]/3]=-0.577…" || mathView.resultAsText() == "[-√[3]/3]=-0.577…" || mathView.resultAsText() == "[√[3]/-3]=-0.577…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "tan60" || currProblem == "tan240")
        {
            //Answer:  √[3]=1.732…
            if(mathView.resultAsText() == "√[3]=1.732…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "tan120" || currProblem == "tan300")
        {
            //Answer:  -√[3]=-1.732…
            if(mathView.resultAsText() == "-√[3]=-1.732…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        else if(currProblem == "tan90" || currProblem == "tan270")
        {
            //Answer: undefined
            if(mathView.resultAsText() == "und" || mathView.resultAsText() == "undefined")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
            }
            else
            {
                numIncorrect.text = "\(Int(numIncorrect.text!)!+1)";
            }
        }
        
        //set up a new problem
        let randomNum = Int(arc4random_uniform(UInt32(degreeProblems.count)));
        currProblem = degreeProblems[randomNum]
        problemImage.image = UIImage(named: currProblem);
        
        //clear the field to write your answer
        mathView.clear(false);
        
        //increase the problem number
        currProblemNumber++;
        
        if(currProblemNumber>totalNumOfProblems)
        {
            //segue to finish screen.
            performSegueWithIdentifier("toFinishScreen", sender: self);
        }
        else
        {
            //update the displayed problem number.
            currentQuestion.text = "Question \(currProblemNumber) of \(totalNumOfProblems)";
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFinishScreen" {
            let finishViewController = segue.destinationViewController as! FinishScreenViewController
            finishViewController.finalScore = Int(numCorrect.text!)!;
            finishViewController.totalNum = totalNumOfProblems;
        }
    }
}

