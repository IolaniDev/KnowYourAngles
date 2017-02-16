//
//  ViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/5/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//
//  Scratch Paper Components are based on the tutorial
//  How To Make A Simple Drawing App with UIKit and Swift by Jean-Pierre Distler
//  https://www.raywenderlich.com/87899/make-simple-drawing-app-uikit-swift

import UIKit
// import CoreGraphics


class ViewController: UIViewController, MAWMathViewDelegate{
    
    //reference to data related to the problems displayed
    var problemSource = MainViewDataSource.init();
    
    //reference to array of summary data to send to Finish Screen
    //var summariesToSend : [(UIImage, UIImage, UIImage, UIImage)] = []
    var summariesToSend : [UIImage] = [];
    var problemImg : UIImage = UIImage();
    var correctAnswerImg : UIImage = UIImage();
    var answerImg : UIImage = UIImage();
    var markImg : UIImage = UIImage();
    
    // mathView holds the view where you can write answers
    @IBOutlet var mathView: MAWMathView!
    var certificateRegistered : Bool!;
    
    //reference to the View that controls displaying the problems, number correct, number remaining, etc.
    @IBOutlet var correctingMarksView: MainView!
    
    // load previously saved settings (if there are any)
    let savedSettings = NSUserDefaults.standardUserDefaults()
    
    // for scratch paper component
    @IBOutlet weak var scratchPaperImageView: UIImageView!
    var lastPoint = CGPoint.zero;
    var brushWidth: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    @IBAction func clearScratchPaper(sender: UIButton) {
        scratchPaperImageView.image = nil;
    }
    // loading the view
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
            mathView.beautificationOption = MAWBeautifyOption.Fontify;
            
            /**********LOAD NUMBER OF PROBLEMS**********/
            
            // totalNumOfProblems is set in Settings by user for the number of problems they want to be quizzed on. (10 by default)
            var totalNumOfProblems : Int;
            
            // if the user has previously saved settings, load the max num of problems the player wants to complete
            if (savedSettings.objectForKey("maxNumOfProblems") != nil)
            {
                totalNumOfProblems = savedSettings.valueForKey("maxNumOfProblems") as! Int;
            }
            // otherwise use the default values of 10 problems
            else
            {
                // set the default number of problems to 10
                totalNumOfProblems = 10;
                savedSettings.setValue(totalNumOfProblems, forKey: "maxNumOfProblems");
            }
            // setup the number of remaining problems label
            correctingMarksView.numRemaining.text = String(totalNumOfProblems);
            
            // setup the number of correctly answered questions label
            correctingMarksView.numCorrect.text = "0";
            
            /**********LOAD PROBLEMS THAT ARE IN DEGREES**********/
            // if there are previously saved settings...
            if(savedSettings.objectForKey("degrees") != nil)
            {
                // load the degree problems (if the user wants them)
                if(savedSettings.valueForKey("degrees") as! Bool)
                {
                    problemSource.loadDegreeProblems();
                }
                // otherwise don't load them
            }
            // if there are no previously saved settings, by default include the problems in degrees.
            else
            {
                problemSource.loadDegreeProblems();
            }
            
            /**********LOAD PROBLEMS THAT ARE IN RADIANS**********/
            // if there are previously saved settings...
            if(savedSettings.objectForKey("radians") != nil)
            {
                // load the radian problems (if the user wants them)
                if(savedSettings.valueForKey("radians") as! Bool)
                {
                    problemSource.loadRadianProblems();
                }
            }
            // otherwise do not load radian problems (by default)
            
             /**********LOAD RECIPROCAL PROBLEMS**********/
            // load the reciprocal problems (if the user wants them)
            if(savedSettings.objectForKey("reciprocals") != nil)
            {
                if(savedSettings.valueForKey("reciprocals") as! Bool)
                {
                    if(savedSettings.objectForKey("degrees") != nil)
                    {
                        if(savedSettings.valueForKey("degrees") as! Bool)
                        {
                            problemSource.loadReciprocalDegreeProblems()
                        }
                    }
                    if(savedSettings.objectForKey("radians") != nil)
                    {
                        if(savedSettings.valueForKey("radians") as! Bool)
                        {
                            problemSource.loadReciprocalRadianProblems()
                        }
                    }
                }
            }
            
            // setup image of first problem
            correctingMarksView.problemImage.image = UIImage(named: problemSource.getRandomProblem());
            
            /*summariesToSend.append(UIImage(named: "problem")!)
            summariesToSend.append(UIImage(named: "correctAnswer")!)
            summariesToSend.append(UIImage(named: "yourAnswer")!)
            summariesToSend.append(UIImage(named: "rightOrWrong")!)*/
            
            problemImg = correctingMarksView.problemImage.image!;
            
            // add an observer for when the timer runs out.
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
        // check if answer written is correct
        mathView.solve();
        var result = mathView.resultAsText();
        
        if(!result.isEmpty)
        {
            correctingMarksView.numRemaining.text = "\(Int(correctingMarksView.numRemaining.text!)!-1)";
        
            correctAnswerImg = UIImage(named: problemSource.getCurrProblemAnswerName())!;
            answerImg = mathView.resultAsImage();
            if(result.characters.contains("="))
            {
                if(result.characters.contains("…"))
                {
                    result = result.substringWithRange(result.characters.indexOf("=")!.successor()..<result.characters.indexOf("…")!)
                }
                else
                {
                    result = result.substringFromIndex(result.characters.indexOf("=")!.successor());
                }
            }
            NSLog("Math Result: %@", result);
            if(problemSource.isCorrect(result))
            {
                correctingMarksView.numCorrect.text = "\(Int(correctingMarksView.numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
                markImg = UIImage(named: "Correct")!;
            }
            else
            {
                correctingMarksView.drawWrong();
                markImg = UIImage(named: "Wrong")!;
            }
        
            summariesToSend.append(problemImg);
            summariesToSend.append(correctAnswerImg);
            summariesToSend.append(answerImg);
            summariesToSend.append(markImg);
            
            // if we ran through the requested number of problems...
            if(Int(correctingMarksView.numRemaining.text!) <= 0)
            {
                // segue to finish screen.
                performSegueWithIdentifier("toFinishScreen", sender: self);
            }
            else
            {
                // set up a new problem
                correctingMarksView.problemImage.image = UIImage(named: problemSource.getRandomProblem());
                problemImg = correctingMarksView.problemImage.image!;
                // clear the field to write your answer
                mathView.clear(false);
                scratchPaperImageView.image = nil;
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toFinishScreen" {
            let finishViewController = segue.destinationViewController as! FinishScreenViewController
            finishViewController.finalScore = Int(correctingMarksView.numCorrect.text!)!;
            finishViewController.totalNum = savedSettings.valueForKey("maxNumOfProblems") as! Int;
            
            let totalSec = 60*self.correctingMarksView.numMin+self.correctingMarksView.numSec;
            let maxTotal = (savedSettings.valueForKey("amtTimeMin") as! Int) * 60 + (savedSettings.valueForKey("amtTimeSec") as! Int);
            let diff = maxTotal - totalSec;
            finishViewController.isTimerOn = savedSettings.valueForKey("isTimerOn") as! Bool;
            finishViewController.finalTime = (diff / 60 , diff % 60);
            finishViewController.summaryData = summariesToSend;
        }
    }
    
    func updateCountDown()
    {
        if(self.correctingMarksView.isOutOfTime)
        {
            performSegueWithIdentifier("toFinishScreen", sender: self);
        }
    }
    
    @IBAction func clearMathView(sender: UIButton) {
        mathView.clear(false);
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.locationInView(self.view)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        scratchPaperImageView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // 2
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        // 3
        CGContextSetLineCap(context, CGLineCap.Round);
        CGContextSetLineWidth(context, brushWidth);
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
        CGContextSetBlendMode(context, CGBlendMode.Normal);
        
        // 4
        CGContextStrokePath(context)
        
        // 5
        scratchPaperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        scratchPaperImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 6
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.locationInView(view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if !swiped {
            // draw a single point
            drawLineFrom(lastPoint, toPoint: lastPoint)
        }
    }
}

