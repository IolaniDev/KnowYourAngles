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

class ViewController: UIViewController, MAWMathViewDelegate{
    
    //reference to data related to the problems displayed
    var problemSource = MainViewDataSource.init();
    
    //reference to array of summary data to send to Finish Screen
    var summariesToSend : [UIImage] = [];
    //image representing the user's answer
    var answerImg : UIImage = UIImage();
    var markImg : UIImage = UIImage();
    
    // mathView holds the view where you can write answers
    @IBOutlet var mathView: MAWMathView!
    var certificateRegistered : Bool!;
    
    //reference to the View that controls displaying the problems, number correct, number remaining, etc.
    @IBOutlet var correctingMarksView: MainView!
    
    //reference to the constraints on the clear answer button
    @IBOutlet weak var clearAnswerButtonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var clearAnswerButtonTrailingConstraint: NSLayoutConstraint!
    
    //reference to the constraints on the submit button
    @IBOutlet weak var submitButtonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitButtonTrailingConstraint: NSLayoutConstraint!
    
    //reference to constraints on the Clear Work button
    @IBOutlet weak var clearWorkButtonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var clearWorkButtonTrailingConstraint: NSLayoutConstraint!
    
    // load previously saved settings (if there are any)
    let savedSettings = UserDefaults.standard
    
    // for scratch paper component
    @IBOutlet weak var scratchPaperImageView: UIImageView!
    var lastPoint = CGPoint.zero;
    var brushWidth: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    @IBAction func clearScratchPaper(_ sender: UIButton) {
        scratchPaperImageView.image = nil;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    // loading the view
    override func viewDidLoad() {
        //Setup Writing Recognition
        super.viewDidLoad();
        
        // Register MyScript certificate before anything else
        let certificate = Data(bytes: myCertificate.bytes, count: myCertificate.length);
        
        certificateRegistered = mathView.registerCertificate(certificate);
        
        // Register as delegate to be notified of configuration, recognition, ...
        if((certificateRegistered) != nil)
        {
            mathView.delegate = self;
            _ = Bundle.main
            
            var bundlePath : NSString = Bundle.main.path(forResource: "resources", ofType: "bundle")! as NSString
            
            bundlePath = bundlePath.appendingPathComponent("conf") as NSString; mathView.addSearchDir(bundlePath as String)
            
            // The configuration is an asynchronous operation. Callbacks are provided to
            // monitor the beginning and end of the configuration process.
            //
            // "math" references the math bundle name in conf/math.conf file in your resources.
            // "standard" references the configuration name in math.conf
            
            mathView.configure(withBundle: "math", andConfig: "standard");
            mathView.beautificationOption = MAWBeautifyOption.fontify;
            
            /**********SET RIGHT OR LEFT HAND**********/
            //if the user has previously saved settings for left vs. right-hand mode, use their settings
            if (savedSettings.object(forKey: "isLeftHandMode") != nil)
            {
                if(savedSettings.value(forKey: "isLeftHandMode") as! Bool)
                {
                    //activate the trailing constraint
                    clearAnswerButtonTrailingConstraint.isActive = true;
                    submitButtonTrailingConstraint.isActive = true;
                    clearWorkButtonTrailingConstraint.isActive = true;
                    
                    //deactivate the leading constraint
                    clearAnswerButtonLeadingConstraint.isActive = false
                    submitButtonLeadingConstraint.isActive = false;
                    clearWorkButtonLeadingConstraint.isActive = false;
                }
                else
                {
                    //deactivate the trailing constraint
                    clearAnswerButtonTrailingConstraint.isActive = false;
                    submitButtonTrailingConstraint.isActive = false;
                    clearWorkButtonTrailingConstraint.isActive = false;
                    
                    //activate the leading constraint
                    clearAnswerButtonLeadingConstraint.isActive = true;
                    submitButtonLeadingConstraint.isActive = true;
                    clearWorkButtonLeadingConstraint.isActive = true;
                }
            }
                //if the user does not have saved settings for left vs. right-hand mode, default to right-hand mode
            else
            {
                //deactivate the trailing constraint
                clearAnswerButtonTrailingConstraint.isActive = false;
                submitButtonTrailingConstraint.isActive = false;
                clearWorkButtonTrailingConstraint.isActive = false;
                
                //activate the leading constraint
                clearAnswerButtonLeadingConstraint.isActive = true;
                submitButtonLeadingConstraint.isActive = true;
                clearWorkButtonLeadingConstraint.isActive = true;
            }
            
            /**********LOAD NUMBER OF PROBLEMS**********/
            
            // totalNumOfProblems is set in Settings by user for the number of problems they want to be quizzed on. (10 by default)
            var totalNumOfProblems : Int;
            
            // if the user has previously saved settings, load the num of problems the player wants to complete
            if (savedSettings.object(forKey: "numOfProblems") != nil)
            {
                totalNumOfProblems = savedSettings.value(forKey: "numOfProblems") as! Int;
            }
            // otherwise use the default values of 10 problems
            else
            {
                // set the default number of problems to 10
                totalNumOfProblems = 10;
                savedSettings.setValue(totalNumOfProblems, forKey: "numOfProblems");
            }
            // setup the number of remaining problems label
            correctingMarksView.numRemaining.text = String(totalNumOfProblems);
            
            // setup the number of correctly answered questions label
            correctingMarksView.numCorrect.text = "0";
            
            /**********LOAD SINE PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "sine") != nil)
            {
                //check if the user wants sine problems
                if(savedSettings.value(forKey: "sine") as! Bool)
                {
                    //check if the user wants quadrantals
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            //load sine quadrantal problems in radians
                            problemSource.loadSineRadiansQuadrantalProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            //load sine quadrantal problems in degrees
                            problemSource.loadSineDegreeQuadrantalProblems();
                        }
                    }
                    //check if the user wants quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            //load sine problems from Quadrant I in radians
                            problemSource.loadSineRadiansQuadIProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            //load sine problems from Quadrant I in degrees
                            problemSource.loadSineDegreeQuadIProblems();
                        }
                    }
                    //check if the user wants quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            //load sine problems from Quadrant II in radians
                            problemSource.loadSineRadiansQuadIIProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            //load sine problems from Quadrant II in degrees
                            problemSource.loadSineDegreeQuadIIProblems();
                        }
                    }
                    //check if the user wants quadrant III
                    if(savedSettings.value(forKey: "quadIII") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            //load sine problems from Quadrant III in radians
                            problemSource.loadSineRadiansQuadIIIProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            //load sine problems from Quadrant III in degrees
                            problemSource.loadSineDegreeQuadIIIProblems();
                        }
                    }
                    //check if the user wants quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            //load sine problems from Quadrant IV in radians
                            problemSource.loadSineRadiansQuadIVProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            //load sine problems from Quadrant IV in degrees
                            problemSource.loadSineDegreeQuadIVProblems();
                        }
                    }
                }
            }
            // if there are no previously saved settings, by default include the sine problems in degrees from quadrantals and all quadrants
            else
            {
                problemSource.loadSineDegreeQuadrantalProblems();
                problemSource.loadSineDegreeQuadIProblems();
                problemSource.loadSineDegreeQuadIIProblems();
                problemSource.loadSineDegreeQuadIIIProblems();
                problemSource.loadSineDegreeQuadIVProblems();
            }
            
            /**********LOAD COSINE PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "cosine") != nil)
            {
                //check if the user wants cosine problems...
                if(savedSettings.value(forKey: "cosine") as! Bool)
                {
                    //check if the user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosineRadiansQuadrantalProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosineDegreeQuadrantalProblems();
                        }
                    }
                    //check if the user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosineRadiansQuadIProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosineDegreeQuadIProblems();
                        }
                    }
                    //check if the user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosineRadiansQuadIIProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosineDegreeQuadIIProblems();
                        }
                    }
                    //check if the user wants problems from Quadrant III
                    if(savedSettings.value(forKey: "quadIII") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosineRadiansQuadIIIProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosineDegreeQuadIIIProblems();
                        }
                    }
                    //check if the user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        //check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosineRadiansQuadIVProblems();
                        }
                        //check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosineDegreeQuadIVProblems();
                        }
                    }
                }
            }
            // if there are no previously saved settings, by default, include the cosine problems in degrees from quadrantals and all quadrants
            else
            {
                problemSource.loadCosineDegreeQuadrantalProblems();
                problemSource.loadCosineDegreeQuadIProblems();
                problemSource.loadCosineDegreeQuadIIProblems();
                problemSource.loadCosineDegreeQuadIIIProblems();
                problemSource.loadCosineDegreeQuadIVProblems();
            }
            
            /**********LOAD TANGENT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "tangent") != nil)
            {
                // check if the user wants tangent problems
                if(savedSettings.value(forKey: "tangent") as! Bool)
                {
                    // check if the user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadTangentRadiansQuadrantalProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadTangentDegreeQuadrantalProblems();
                        }
                    }
                    // check if the user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadTangentRadiansQuadIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadTangentDegreeQuadIProblems();
                        }
                    }
                    // check if the user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadTangentRadiansQuadIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadTangentDegreeQuadIIProblems();
                        }
                    }
                    // check if the user wants problems from Quadrant III
                    if(savedSettings.value(forKey: "quadIII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadTangentRadiansQuadIIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadTangentDegreeQuadIIIProblems();
                        }
                    }
                    // check if the user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadTangentRadiansQuadIVProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadTangentDegreeQuadIVProblems();
                        }
                    }
                }
            }
            // if there are no previously saved settings, by default, include the tanget problems in degrees from quadrantals and all quadrants
            else
            {
                problemSource.loadTangentDegreeQuadrantalProblems();
                problemSource.loadTangentDegreeQuadIProblems();
                problemSource.loadTangentDegreeQuadIIProblems();
                problemSource.loadTangentDegreeQuadIIIProblems();
                problemSource.loadTangentDegreeQuadIVProblems();
            }
            
            /**********LOAD COSECANT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "cosecant") != nil)
            {
                // check if user wants cosecant problems
                if(savedSettings.value(forKey: "cosecant") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosecantRadiansQuadrantalProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosecantDegreeQuadrantalProblems();
                        }
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosecantRadiansQuadIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosecantDegreeQuadIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosecantRadiansQuadIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosecantDegreeQuadIIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant III
                    if(savedSettings.value(forKey: "quadIII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosecantRadiansQuadIIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosecantDegreeQuadIIIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCosecantRadiansQuadIVProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCosecantDegreeQuadIVProblems();
                        }
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load cosecant problems
            
            /**********LOAD SECANT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "secant") != nil)
            {
                // check if the user wants secant problems
                if(savedSettings.value(forKey: "secant") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadSecantRadiansQuadrantalProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadSecantDegreeQuadrantalProblems();
                        }
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadSecantRadiansQuadIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadSecantDegreeQuadIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadSecantRadiansQuadIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadSecantDegreeQuadIIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant III
                    if(savedSettings.value(forKey: "quadIII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadSecantRadiansQuadIIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadSecantDegreeQuadIIIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadSecantRadiansQuadIVProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadSecantDegreeQuadIVProblems();
                        }
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load secant problems
            
            /**********LOAD COTANGENT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "cotangent") != nil)
            {
                // check if the user wants cotangent problems
                if(savedSettings.value(forKey: "cotangent") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCotangentRadiansQuadrantalProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCotangentDegreeQuadrantalProblems();
                        }
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCotangentRadiansQuadIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCotangentDegreeQuadIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCotangentRadiansQuadIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCotangentDegreeQuadIIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant III
                    if(savedSettings.value(forKey: "quadIII") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCotangentRadiansQuadIIIProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCotangentDegreeQuadIIIProblems();
                        }
                    }
                    // check if user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        // check if the user wants radians
                        if(savedSettings.value(forKey: "radians") as! Bool)
                        {
                            problemSource.loadCotangentRadiansQuadIVProblems();
                        }
                        // check if the user wants degrees
                        if(savedSettings.value(forKey: "degrees") as! Bool)
                        {
                            problemSource.loadCotangentDegreeQuadIVProblems();
                        }
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load cotangent problems
            
            /**********LOAD ARCSINE PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "arcsine") != nil)
            {
                // check if the user wants arcsine problems
                if(savedSettings.value(forKey: "arcsine") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        problemSource.loadArcsineQuadrantalProblems();
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        problemSource.loadArcsineQuadIProblems();
                    }
                    // check if user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        problemSource.loadArcsineQuadIVProblems();
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load arcsine problems
            
            /**********LOAD ARCCOSINE PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "arccosine") != nil)
            {
                // check if the user wants arccosine problems
                if(savedSettings.value(forKey: "arccosine") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        problemSource.loadArccosineQuadrantalProblems();
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        problemSource.loadArccosineQuadIProblems();
                    }
                    // check if user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        problemSource.loadArccosineQuadIIProblems();
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load arccosine problems
            
            /**********LOAD ARCTANGENT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "arctangent") != nil)
            {
                // check if the user wants arctangent problems
                if(savedSettings.value(forKey: "arctangent") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        problemSource.loadArctangentQuadrantalProblems();
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        problemSource.loadArctangentQuadIProblems();
                    }
                    // check if user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        problemSource.loadArctangentQuadIVProblems();
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load arctangent problems
            
            /**********LOAD ARCCOSECANT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "arccosecant") != nil)
            {
                // check if the user wants arccosecant problems
                if(savedSettings.value(forKey: "arccosecant") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        problemSource.loadArccosecantQuadrantalProblems();
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        problemSource.loadArccosecantQuadIProblems();
                    }
                    // check if user wants problems from Quadrant IV
                    if(savedSettings.value(forKey: "quadIV") as! Bool)
                    {
                        problemSource.loadArccosecantQuadIVProblems();
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load arccosecant problems
            
            /**********LOAD ARCSECANT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "arcsecant") != nil)
            {
                // check if the user wants arcsecant problems
                if(savedSettings.value(forKey: "arcsecant") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        problemSource.loadArcsecantQuadrantalProblems();
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        problemSource.loadArcsecantQuadIProblems();
                    }
                    // check if user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        problemSource.loadArcsecantQuadIIProblems();
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load arcsecant problems
            
            /**********LOAD ARCCOTANGENT PROBLEMS**********/
            // if there are previously saved settings...
            if(savedSettings.object(forKey: "arccotangent") != nil)
            {
                // check if the user wants arccotangent problems
                if(savedSettings.value(forKey: "arccotangent") as! Bool)
                {
                    // check if user wants quadrantal problems
                    if(savedSettings.value(forKey: "quadrantals") as! Bool)
                    {
                        problemSource.loadArccotangentQuadrantalProblems();
                    }
                    // check if user wants problems from Quadrant I
                    if(savedSettings.value(forKey: "quadI") as! Bool)
                    {
                        problemSource.loadArccotangentQuadIProblems();
                    }
                    // check if user wants problems from Quadrant II
                    if(savedSettings.value(forKey: "quadII") as! Bool)
                    {
                        problemSource.loadArccotangentQuadIIProblems();
                    }
                }
            }
            // if there are no previously saved settings then, by default, do not load arccotangent problems
            
            // setup image of first problem
            correctingMarksView.problemImage.image = UIImage(named: problemSource.getRandomProblem().problemImageName);
            
            //problemImg = correctingMarksView.problemImage.image!;
            
            // add an observer for when the timer runs out.
            NotificationCenter.default.addObserver(self, selector: #selector(updateCountDown), name: NSNotification.Name(rawValue: "segueNow"), object: nil);
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        if(!(certificateRegistered))
        {
            let alertController = UIAlertController(title: "Invalid certificate", message: "Please use a valid certificate", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
            
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc(mathViewDidEndConfiguration:) func mathViewDidEndConfiguration(_ mathView: MAWMathView)
    {
        NSLog("Math Widget configured");
    }
    
    func didFailConfigurationWithError(_ error: NSError, mathView: MAWMathView)
    {
        NSLog("Unable to configure the Math Widget: %@", error);
    }
    
    func mathViewDidEndRecognition(_ mathView: MAWMathView)
    {
        NSLog("Math Widget recognition: %@", mathView.resultAsText());
    }
    
    func mathViewDidEndWriting(_ mathView: MAWMathView ){
        NSLog("Math Widget End Writing: %@", mathView.resultAsText());
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        // check if answer written is correct
        mathView.solve();
        var result = mathView.resultAsText();
        
        if(!(result?.isEmpty)!)
        {
            correctingMarksView.numRemaining.text = "\(Int(correctingMarksView.numRemaining.text!)!-1)";
        
            //correctAnswerImg = UIImage(named: problemSource.getCurrProblem().answerImageName)!;
            answerImg = mathView.resultAsImage();
            if(result?.contains("="))!
            {
                /*if(result?.contains("…"))!
                {
                    result = result?.substring(with: result!.index(after: (result?.index(of: "=")!)!)..<(result?.index(of: "…")!)!)
                }*/
                //else
                //{
                    result = result?.substring(from: result!.index(after: (result?.index(of: "=")!)!));
                //}
            }
            NSLog("Math Result: %@", result!);
            if(problemSource.isCorrect(result!))
            {
                correctingMarksView.numCorrect.text = "\(Int(correctingMarksView.numCorrect.text!)!+1)";
                correctingMarksView.drawRight();
                markImg = UIImage(named: "Correct")!;
                updateStatistics(isCorrect: true);
            }
            else
            {
                correctingMarksView.drawWrong();
                markImg = UIImage(named: "Wrong")!;
                updateStatistics(isCorrect: false);
            }
        
            //add images to the summary view on the finish screen
            summariesToSend.append(UIImage(named: problemSource.getCurrProblem().problemImageName)!);
            summariesToSend.append(UIImage(named: problemSource.getCurrProblem().answerImageName)!);
            summariesToSend.append(answerImg);
            summariesToSend.append(markImg);
            
            // if we ran through the requested number of problems...
            if(Int(correctingMarksView.numRemaining.text!)! <= 0)
            {
                // segue to finish screen.
                performSegue(withIdentifier: "toFinishScreen", sender: self);
            }
            else
            {
                // set up a new problem
                correctingMarksView.problemImage.image = UIImage(named: problemSource.getRandomProblem().problemImageName);

                // clear the field to write your answer
                mathView.clear(false);
                scratchPaperImageView.image = nil;
            }
        }
    }
    
    // function to prepare data to send to the finish screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinishScreen" {
            let finishViewController = segue.destination as! FinishScreenViewController
            finishViewController.finalScore = Int(correctingMarksView.numCorrect.text!)!;
            finishViewController.totalNum = savedSettings.value(forKey: "numOfProblems") as! Int;
            
            let totalSec = 60*self.correctingMarksView.numMin+self.correctingMarksView.numSec;
            let maxTotal = (savedSettings.value(forKey: "amtTimeMin") as! Int) * 60 + (savedSettings.value(forKey: "amtTimeSec") as! Int);
            let diff = maxTotal - totalSec;
            finishViewController.isTimerOn = savedSettings.value(forKey: "isTimerOn") as! Bool;
            finishViewController.finalTime = (diff / 60 , diff % 60);
            finishViewController.summaryData = summariesToSend;
        }
    }
    
    // function to detect when the timer has run out
    @objc func updateCountDown()
    {
        if(self.correctingMarksView.isOutOfTime)
        {
            performSegue(withIdentifier: "toFinishScreen", sender: self);
        }
    }
    
    // function to clear the writing space where the user writes their answer
    @IBAction func clearMathView(_ sender: UIButton) {
        mathView.clear(false);
    }
    
    /**********FUNCTIONS FOR SCRATCH PAPER**********/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLineFrom(_ fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        scratchPaperImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // 2
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        // 3
        context?.setLineCap(CGLineCap.round);
        context?.setLineWidth(brushWidth);
        context?.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1.0);
        context?.setBlendMode(CGBlendMode.normal);
        
        // 4
        context?.strokePath()
        
        // 5
        scratchPaperImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        scratchPaperImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 6
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
            // 7
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            // draw a single point
            drawLineFrom(lastPoint, toPoint: lastPoint)
        }
    }
    
    func updateStatistics(isCorrect : Bool)
    {
        if(isCorrect)
        {
            let newValue:Int = savedSettings.value(forKey: problemSource.getCurrProblem().typeOfProblem + "StatsNumCorrect") as! Int + 1;
            savedSettings.setValue(newValue, forKey: problemSource.getCurrProblem().typeOfProblem + "StatsNumCorrect");
        }
        savedSettings.setValue(savedSettings.value(forKey: problemSource.getCurrProblem().typeOfProblem + "StatsNumTotal") as! Int + 1, forKey: problemSource.getCurrProblem().typeOfProblem + "StatsNumTotal");
        if(problemSource.getCurrProblem().unitsOfAngle == Problem.angleUnits.radians)
        {
            savedSettings.setValue(savedSettings.value(forKey: "radianStatsNumCorrect") as! Int + 1, forKey: "radianStatsNumCorrect");
            savedSettings.setValue(savedSettings.value(forKey: "radianStatsNumTotal") as! Int + 1, forKey: "radianStatsNumTotal");
        }
        if(problemSource.getCurrProblem().unitsOfAngle == Problem.angleUnits.degrees)
        {
            savedSettings.setValue(savedSettings.value(forKey: "degreeStatsNumCorrect") as! Int + 1, forKey: "degreeStatsNumCorrect");
            savedSettings.setValue(savedSettings.value(forKey: "degreeStatsNumTotal") as! Int + 1, forKey: "degreeStatsNumTotal");
        }
        savedSettings.setValue(savedSettings.value(forKey: "radianAndDegreeStatsNumCorrect") as! Int + 1, forKey: "radianAndDegreeStatsNumCorrect");
        savedSettings.setValue(savedSettings.value(forKey: "radianAndDegreeStatsNumTotal") as! Int + 1, forKey: "radianAndDegreeStatsNumTotal");
    }
}

