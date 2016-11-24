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
    
    //possible problems using degrees
    var degreeProblems: [String] = ["Cos0", "Cos30", "Cos45", "Cos60", "Cos90", "Cos120", "Cos135", "Cos150", "Cos180", "Cos210", "Cos225", "Cos240", "Cos270", "Cos300", "Cos315", "Cos330", "Sin0", "Sin30", "Sin45", "Sin60", "Sin90", "Sin120", "Sin135", "Sin150", "Sin180", "Sin210", "Sin225", "Sin240", "Sin270", "Sin300", "Sin315", "Sin330", "tan0", "tan30", "tan45", "tan60", "tan90", "tan120", "tan135", "tan150", "tan180", "tan210", "tan225", "tan240", "tan270", "tan300", "tan315", "tan330"];
    
    //possible problems using radians
    var radianProblems: [String] = ["Cos0rads", "CosPiOver6", "CosPiOver4", "CosPiOver3", "CosPiOver2", "Cos2PiOver3", "Cos3PiOver4", "Cos5PiOver6", "CosPi", "Cos7PiOver6", "Cos5PiOver4", "Cos4PiOver3", "Cos3PiOver2", "Cos5PiOver3", "Cos7PiOver4", "Cos11PiOver6", "Sin0rads", "SinPiOver6", "SinPiOver4", "SinPiOver3", "SinPiOver2", "Sin2PiOver3", "Sin3PiOver4", "Sin5PiOver6", "SinPi", "Sin7PiOver6", "Sin5PiOver4", "Sin4PiOver3", "Sin3PiOver2", "Sin5PiOver3", "Sin7PiOver4", "Sin11PiOver6", "Tan0rads", "TanPiOver6", "TanPiOver4", "TanPiOver3", "TanPiOver2", "Tan2PiOver3", "Tan3PiOver4", "Tan5PiOver6", "TanPi", "Tan7PiOver6", "Tan5PiOver4", "Tan4PiOver3", "Tan3PiOver2", "Tan5PiOver3", "Tan7PiOver4", "Tan11PiOver6"];
    
    //possible reciprocal problems using degrees
    var reciprocalDegreeProblems: [String] = ["Csc0", "Csc30", "Csc45", "Csc60", "Csc90", "Csc120", "Csc135", "Csc150", "Csc180", "Csc210", "Csc225", "Csc240", "Csc270", "Csc300", "Csc315", "Csc330", "Sec0", "Sec30", "Sec45", "Sec60", "Sec90", "Sec120", "Sec135", "Sec150", "Sec180", "Sec210", "Sec225", "Sec240", "Sec270", "Sec300", "Sec315", "Sec330", "Cot0", "Cot30", "Cot45", "Cot60", "Cot90", "Cot120", "Cot135", "Cot150", "Cot180", "Cot210", "Cot225", "Cot240", "Cot270", "Cot300", "Cot315", "Cot330"];
    
    //possible reciprocal problems using radians
    var reciprocalRadianProblems: [String] = ["Csc0rads", "CscPiOver6", "CscPiOver4", "CscPiOver3", "CscPiOver2", "Csc2PiOver3", "Csc3PiOver4", "Csc5PiOver6", "CscPi", "Csc7PiOver6", "Csc5PiOver4", "Csc4PiOver3", "Csc3PiOver2", "Csc5PiOver3", "Csc7PiOver4", "Csc11PiOver6", "Sec0rads", "SecPiOver6", "SecPiOver4", "SecPiOver3", "SecPiOver2", "Sec2PiOver3", "Sec3PiOver4", "Sec5PiOver6", "SecPi", "Sec7PiOver6", "Sec5PiOver4", "Sec4PiOver3", "Sec3PiOver2", "Sec5PiOver3", "Sec7PiOver4", "Sec11PiOver6", "Cot0rads", "CotPiOver6", "CotPiOver4", "CotPiOver3", "CotPiOver2", "Cot2PiOver3", "Cot3PiOver4", "Cot5PiOver6", "CotPi", "Cot7PiOver6", "Cot5PiOver4", "Cot4PiOver3", "Cot3PiOver2", "Cot5PiOver3", "Cot7PiOver4", "Cot11PiOver6"];
    
    //empty array to hold the problems to choose from depending on the user's settings.
    var libraryOfProblems = [String]();
    
    //references to connect to UI components on the storyboard
    @IBOutlet weak var numCorrect: UILabel!
    @IBOutlet weak var numRemaining: UILabel!
    @IBOutlet weak var currentQuestion: UILabel!
    
    //creates a timer
    /*var timer = NSTimer();
    //time limit variables for the timer
    var numSec = 30;
    var numMin = 0;
    //boolean representing whether the user finished the desired amount of questions or ran out of time before moving to end screen.
    var isOutOfTime = false;*/
    
    //image of current problem.
    @IBOutlet weak var problemImage: UIImageView!
    //name of current problem
    var currProblem = "";
    //current problem number
    var currProblemNumber = 1;
    
    //mathView holds the view where you can write answers
    @IBOutlet var mathView: MAWMathView!
    var certificateRegistered : Bool!;
    
    @IBOutlet var correctingMarksView: CorrectingMarks!
    
    //loading the view
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
            
            //load previously saved settings (if there are any)
            let savedSettings = NSUserDefaults.standardUserDefaults()
            
            /**********LOAD NUMBER OF PROBLEMS**********/
            //if the user has previously saved settings, load the max num of problems the player wants to complete
            if (savedSettings.objectForKey("maxNumOfProblems") != nil)
            {
                totalNumOfProblems = savedSettings.valueForKey("maxNumOfProblems") as! Int;
            }
            //otherwise use the default values of 10 problems
            else
            {
                //set the default number of problems to 10
                totalNumOfProblems = 10;
                savedSettings.setValue(totalNumOfProblems, forKey: "maxNumOfProblems");
            }
            numRemaining.text = String(totalNumOfProblems);
            
            /**********LOAD PROBLEMS THAT ARE IN DEGREES**********/
            //if there are previously saved settings...
            if(savedSettings.objectForKey("degrees") != nil)
            {
                //load the degree problems (if the user wants them)
                if(savedSettings.valueForKey("degrees") as! Bool)
                {
                    libraryOfProblems.appendContentsOf(degreeProblems);
                }
            }
            //if there are no previously saved settings, by default include the problems in degrees.
            else
            {
                libraryOfProblems.appendContentsOf(degreeProblems);
            }
            
            /**********LOAD PROBLEMS THAT ARE IN RADIANS**********/
            //if there are previously saved settings...
            if(savedSettings.objectForKey("radians") != nil)
            {
                //load the radian problems (if the user wants them)
                if(savedSettings.valueForKey("radians") as! Bool)
                {
                    libraryOfProblems.appendContentsOf(radianProblems);
                }
            }
            //otherwise do not load radian problems (by default)
            
             /**********LOAD RECIPROCAL PROBLEMS**********/
            //load the reciprocal problems (if the user wants them)
            if(savedSettings.objectForKey("reciprocals") != nil)
            {
                if(savedSettings.valueForKey("reciprocals") as! Bool)
                {
                    if(savedSettings.objectForKey("degrees") != nil)
                    {
                        if(savedSettings.valueForKey("degrees") as! Bool)
                        {
                            libraryOfProblems.appendContentsOf(reciprocalDegreeProblems);
                        }
                    }
                    if(savedSettings.objectForKey("radians") != nil)
                    {
                        if(savedSettings.valueForKey("radians") as! Bool)
                        {
                            libraryOfProblems.appendContentsOf(reciprocalRadianProblems);
                        }
                    }
                }
            }
            
            //setup image of first problem
            let randomNum = Int(arc4random_uniform(UInt32(libraryOfProblems.count)));
            currProblem = libraryOfProblems[randomNum]
            problemImage.image = UIImage(named: currProblem);
            
            //currentQuestion.text = "Question \(currProblemNumber) of \(totalNumOfProblems)";
            
            //countDown.text = String(format:"%02d:%02d", numMin, numSec);
            
            /**********SETTING UP THE TIME LIMIT**********/
            //if there are previously saved settings for the timer ...
            /*if(savedSettings.objectForKey("isTimerOn") != nil)
            {
                //if the timer should be on...
                if(savedSettings.objectForKey("isTimerOn") as! Bool)
                {
                    //check if there are previously saved time limit settings
                    if (savedSettings.objectForKey("amtTimeMin") != nil && savedSettings.objectForKey("amtTimeSec") != nil)
                    {
                        numMin = savedSettings.valueForKey("amtTimeMin") as! Int;
                        numSec = savedSettings.valueForKey("amtTimeSec") as! Int;
                    }
                    //otherwise use the default value of 30 seconds and save to settings.
                    else
                    {
                        numMin = 0;
                        numSec = 30;
                        savedSettings.setValue(numMin, forKey: "amtTimeMin");
                        savedSettings.setValue(numSec, forKey: "amtTimeSec");
                    }
                    
                    timerLabel.hidden = false;
                    countDown.hidden = false;
                    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateCountDown), userInfo: nil, repeats: true);
                }
                //if the timer should be off...
                else
                {
                    timerLabel.hidden = true;
                    countDown.hidden = true;
                }
            }
            else
            {
                timerLabel.hidden = true;
                countDown.hidden = true;
            }*/
            NSLog("View Loaded with \(totalNumOfProblems)");
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateCountDown), name: "segueNow", object: nil);
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
        //increase the problem number
        currProblemNumber += 1;
        
        if(["Cos0", "Sin90", "tan45", "tan225", "Cos0rads", "SinPiOver2", "TanPiOver4", "Tan5PiOver4", "Cot45", "CotPiOver4", "Cot225", "Cot5Piover4", "Sec0", "Sec0rads", "Csc90", "CscPiOver2"].contains(currProblem))
        {
            if(mathView.resultAsText()=="1"){
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Cos90", "Cos270", "Sin0", "Sin180", "tan0", "tan180", "CosPiOver2", "Cos3PiOver2", "Sin0rads", "SinPi", "Tan0rads", "TanPi", "Cot90", "CotPiOver2", "Cot270", "Cot3PiOver2"].contains(currProblem))
        {
            if(mathView.resultAsText() == "0")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Cos60", "Cos300", "Sin30", "Sin150", "CosPiOver3", "Cos5PiOver3", "SinPiOver6", "Sin5PiOver6"].contains(currProblem))
        {
            if(mathView.resultAsText() == "[1/2]=0.5" || mathView.resultAsText() == "0.5")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Cos30", "Cos330", "Sin60", "Sin120", "CosPiOver6", "Cos11PiOver6", "SinPiOver3", "Sin2PiOver3"].contains(currProblem))
        {
            //Answer: [√[3]/2]=0.866…
            if(mathView.resultAsText() == "[√[3]/2]=0.866…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if (["Cos150", "Cos210", "Sin240", "Sin300", "Cos5PiOver6", "Cos7PiOver6", "Sin4PiOver3", "Sin5PiOver3"].contains(currProblem))
        {
            //Answer: -[√[3]/2]=-0.866… or [-√[3]/2]=-0.866… or [√[3]/-2]=-0.866…
            if(mathView.resultAsText() == "-[√[3]/2]=-0.866…" || mathView.resultAsText() == "[-√[3]/2]=-0.866…" || mathView.resultAsText() == "[√[3]/-2]=-0.866…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if (["Cos45", "Cos315", "Sin45", "Sin135", "CosPiOver4", "Cos7PiOver4", "SinPiOver4", "Sin3PiOver4"].contains(currProblem))
        {
            //Answer: [√[2]/2]=0.707…
            if(mathView.resultAsText() == "[√[2]/2]=0.707…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if (["Cos135", "Cos225", "Sin225", "Sin315", "Cos3PiOver4", "Cos5PiOver4", "Sin5PiOver4", "Sin7PiOver4"].contains(currProblem))
        {
            //Answer: -[√[2]/2]=-0.707… or [[-√[2]]/2]=-0.707… or [√[2]/-2]=-0.707…
            if(mathView.resultAsText() == "-[√[2]/2]=-0.707…" || mathView.resultAsText() == "[[-√[2]]/2]=-0.707…" || mathView.resultAsText() == "[√[2]/-2]=-0.707…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if (["Cos120", "Cos240", "Sin210", "Sin330", "Cos2PiOver3", "Cos4PiOver3", "Sin7PiOver6", "Sin11PiOver6"].contains(currProblem))
        {
            //Answer: -[1/2]=-0.5 or [-1/2]=-0.5 or [1/-2]=-0.5 or -0.5
            if(mathView.resultAsText() == "-[1/2]=-0.5" || mathView.resultAsText() == "[-1/2]=-0.5" || mathView.resultAsText() == "[1/-2]=-0.5" || mathView.resultAsText() == "-0.5")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Cos180", "Sin270", "tan135", "tan315", "CosPi", "Sin3PiOver2", "Tan3PiOver4", "Tan7PiOver4", "Cot135", "Cot3PiOver4", "Cot315", "Cot7PiOver4", "Sec180", "SecPi", "Csc270", "Csc3PiOver2"].contains(currProblem))
        {
            //Answer: -1
            if(mathView.resultAsText() == "-1")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["tan30", "tan210", "TanPiOver6", "Tan7PiOver6", "Cot60", "CotPiOver3", "Cot240", "Cot4PiOver3"].contains(currProblem))
        {
            //Answer: [√[3]/3]=0.577…
            if(mathView.resultAsText() == "[√[3]/3]=0.577…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["tan150", "tan330", "Tan5PiOver6", "Tan11PiOver6", "Cot120", "Cot2PiOver3", "Cot300", "Cot5PiOver3"].contains(currProblem))
        {
            //Answer: -[√[3]/3]=-0.577… or [-√[3]/3]=-0.577… or [√[3]/-3]=-0.577…
            if(mathView.resultAsText() == "-[√[3]/3]=-0.577…" || mathView.resultAsText() == "[-√[3]/3]=-0.577…" || mathView.resultAsText() == "[√[3]/-3]=-0.577…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["tan60", "tan240", "TanPiOver3", "Tan4PiOver3", "Cot30", "CotPiOver6", "Cot210", "Cot7PiOver6"].contains(currProblem))
        {
            //Answer:  √[3]=1.732…
            if(mathView.resultAsText() == "√[3]=1.732…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["tan120", "tan300", "Tan2PiOver3", "Tan5PiOver3", "Cot150", "Cot5PiOver6", "Cot330", "Cot11PiOver6"].contains(currProblem))
        {
            //Answer:  -√[3]=-1.732…
            if(mathView.resultAsText() == "-√[3]=-1.732…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["tan90", "tan270", "TanPiOver2", "Tan3PiOver2", "Cot0", "Cot0rads", "Cot180", "CotPi", "Sec90", "SecPiOver2", "Sec270", "Sec3PiOver2", "Csc0", "Csc0rads", "Csc180", "CscPi"].contains(currProblem))
        {
            //Answer: undefined
            if(mathView.resultAsText() == "und" || mathView.resultAsText() == "undefined")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Sec30", "SecPiOver6", "Sec330", "Sec11PiOver6", "Csc60", "CscPiOver3", "Csc120", "Csc2PiOver3"].contains(currProblem))
        {
            //Answer: [[2×√[3]]/3]=1.154…
            if(mathView.resultAsText() == "[[2×√[3]]/3]=1.154…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Sec45", "SecPiOver4", "Sec315", "Sec7PiOver4", "Csc45", "CscPiOver4", "Csc135", "Csc3PiOver4"].contains(currProblem))
        {
            //Answer: √[2]=1.414…
            if(mathView.resultAsText() == "√[2]=1.414…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Sec60", "SecPiOver3", "Sec300", "Sec5PiOver3", "Csc30", "CscPiOver6", "Csc150", "Csc5PiOver6"].contains(currProblem))
        {
            //Answer: 2
            if(mathView.resultAsText() == "2")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Sec120", "Sec2PiOver3", "Sec240", "Sec4PiOver3", "Csc210", "Csc7PiOver6", "Csc330", "Csc11PiOver6"].contains(currProblem))
        {
            //Answer: -2
            if(mathView.resultAsText() == "-2")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Sec135", "Sec3PiOver4", "Sec225", "Sec5PiOver4", "Csc225", "Csc5PiOver4", "Csc315", "Csc7PiOver4"].contains(currProblem))
        {
            //Answer: -√[2]=-1.414…
            if(mathView.resultAsText() == "-√[2]=-1.414…")
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        else if(["Sec150", "Sec5PiOver6", "Sec210", "Sec7PiOver6", "Csc240", "Csc4PiOver3", "Csc300", "Csc5PiOver3"].contains(currProblem))
        {
            //Answer: -[[2×√[3]]/3]=-1.154… or [[-2×√[3]]/3]=-1.154… or [[2×√[3]]/-3]=-1.154… or [[2×(-√[3])]/3]=-1.154…
            if(["-[[2×√[3]]/3]=-1.154…", "[[-2×√[3]]/3]=-1.154…", "[[2×√[3]]/-3]=-1.154…", "[[2×(-√[3])]/3]=-1.154…"].contains(mathView.resultAsText()))
            {
                numCorrect.text = "\(Int(numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
            }
            else{
                correctingMarksView.drawWrong();
            }
        }
        
        if(currProblemNumber>totalNumOfProblems)
        {
            //segue to finish screen.
            performSegueWithIdentifier("toFinishScreen", sender: self);
        }
        else
        {
            numRemaining.text = "\(Int(numRemaining.text!)!-1)";
            
            //set up a new problem
            let randomNum = Int(arc4random_uniform(UInt32(libraryOfProblems.count)));
            currProblem = libraryOfProblems[randomNum]
            problemImage.image = UIImage(named: currProblem);
            
            //clear the field to write your answer
            mathView.clear(false);
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFinishScreen" {
            let finishViewController = segue.destinationViewController as! FinishScreenViewController
            finishViewController.finalScore = Int(numCorrect.text!)!;
            finishViewController.totalNum = totalNumOfProblems;
            if(self.correctingMarksView.isOutOfTime)
            {
                let savedSettings = NSUserDefaults.standardUserDefaults();
                self.correctingMarksView.numMin = savedSettings.valueForKey("amtTimeMin") as! Int;
                self.correctingMarksView.numSec = savedSettings.valueForKey("amtTimeSec") as! Int;
                finishViewController.isTimerOn = savedSettings.valueForKey("isTimerOn") as! Bool;
            }
            finishViewController.finalTime = (self.correctingMarksView.numMin,self.correctingMarksView.numSec);
        }
    }
    
    func updateCountDown()
    {
        if(self.correctingMarksView.isOutOfTime)
        {
            performSegueWithIdentifier("toFinishScreen", sender: self);
        }
    }
}

