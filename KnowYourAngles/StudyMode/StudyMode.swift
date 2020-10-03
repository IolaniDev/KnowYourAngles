//
//  StudyMode.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 8/1/18.
//  Copyright © 2018 Iolani School. All rights reserved.
//

import UIKit
//import Firebase

class StudyMode : UIViewController{
    
    /*** START - Variables for overall setup ***/
    // load previously saved settings (if there are any)
    let savedSettings = UserDefaults.standard
    
    //reference to the View that controls displaying the problems, number correct, number remaining, etc.
    @IBOutlet var studyView: StudyView!
    
    // mathView holds the view where you can write answers
    @IBOutlet var mathView: InputView!
    
    //the EditorViewController manages ink input
    weak var editorViewController: EditorViewController!
    
    //reference to data related to the problems displayed
    var problemSource = MainViewDataSource.init();
    
    //reference to the Summary View to display immediate feedback for the user
    @IBOutlet weak var immediateFeedback: UICollectionView!
    //reference to array of summary data to provide the user with immediate feedback
    var summaryData : [UIImage] = [];
    // empty image object to hold the image of the answer
    var answerImg : UIImage = UIImage();
    // empty image object to hold the image of the red x or green checkmark
    var markImg : UIImage = UIImage();
    
    var mainController : SummaryCollectionViewController?;
    
    //result is used to store the text version of the user's converted answer
    var result = "";
    /*** END - Variables for overall setup ***/
    
    /*** START - Variables for the constraints on the clear answer, submit, and clear work buttons for shifting between right-hand and left-hand modes ***/
    //reference to the right-hand mode constraints on the clear answer button
    @IBOutlet weak var rightHandClearAnswerLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightHandClearAnswerTrailingConstraint: NSLayoutConstraint!
    
    //reference to the left-hand mode constraints on the clear answer button
    @IBOutlet weak var leftHandClearAnswerLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftHandClearAnswerTrailingConstraint: NSLayoutConstraint!
    
    //reference to the right-hand mode constraints on the submit button
    @IBOutlet weak var rightHandSubmitLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightHandSubmitTrailingConstraint: NSLayoutConstraint!
    
    //reference to the left-hand mode constraints on the submit button
    @IBOutlet weak var leftHandSubmitLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftHandSubmitTrailingConstraint: NSLayoutConstraint!
    
    //reference to the right-hand mode constraints on the clear work button
    @IBOutlet weak var rightHandClearWorkLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightHandClearWorkTrailingConstraint: NSLayoutConstraint!
    
    //reference to the left-hand mode constraints on the clear work button
    @IBOutlet weak var leftHandClearWorkLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftHandClearWorkTrailingConstraint: NSLayoutConstraint!
    
    /*** End - Variables for the constraints on the clear answer, submit, and clear work buttons for shifting between right-hand and left-hand modes ***/
    
    //variable to track of number of handwriting conversions
    var NumberOfConversions = 0;
    
    /***** START - for scratch paper component *****/
    @IBOutlet weak var scratchPaperImageView: UIImageView!
    var lastPoint = CGPoint.zero;
    var brushWidth: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    var swiped = false
    @IBAction func clearScratchPaper(_ sender: UIButton) {
        scratchPaperImageView.image = nil;
    }
    
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
    /***** END - for scratch paper component *****/
    
    /***** START - variables and functions for automatically changing user's writing into text and math symbols *****/
    //create a timer
    var beautifyTimer = Timer();
    var statusCheckTimer = Timer();
    var timerStarted = false;
    
    @objc func checkStatus(timer: Timer)
    {
        if editorViewController.inputView.timerOn && !timerStarted
        {
            startTimer();
        }
        else if !editorViewController.inputView.timerOn && timerStarted
        {
            endTimer();
        }
    }
    
    func startTimer(){
        beautifyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fireTimer(timer:)), userInfo: nil, repeats: true);
        timerStarted = true;
    }
    
    func endTimer(){
        beautifyTimer.invalidate();
        timerStarted = false;
    }
    
    //when timer expires, if convertRequired == true, call Editor::convert() and set convertRequired = false
    @objc func fireTimer(timer: Timer) {
        if (editorViewController.inputView.convertRequired && editorViewController.editor.idle)
        {
            do {
                //get all of the "blocks" written by the user
                let supportedTargetStates = editorViewController.editor.getSupportedTargetConversionState(nil)
                //convert the contents of the block to text?
                try editorViewController.editor.convert(nil, targetState: supportedTargetStates[0].value)
                //get all of the supported MIME Types that we can export the result as
                let supportedMimeTypes = editorViewController.editor.getSupportedExportMimeTypes(nil);
                
                //get the result as string
                result = try editorViewController.editor!.export_(nil, mimeType: supportedMimeTypes[0].value);
                
                //add 1 to the total number of conversions that have been done so far
                NumberOfConversions += 1;
                
                NSLog("StudyModeNumberOfConversions: \(NumberOfConversions)");
                
            } catch {
                print("Error while converting : " + error.localizedDescription)
            }
            editorViewController.inputView.convertRequired = false;
            endTimer();
            //NSLog("Result: " + result);
        }
    }
    /***** END - variables and functions for automatically changing user's writing into text and math symbols *****/
    
    // loading the view
    override func viewDidLoad() {
        //Setup Writing Recognition
        super.viewDidLoad();
        
        /**********SET RIGHT OR LEFT HAND**********/
        //if the user has previously saved settings for left vs. right-hand mode, use their settings
        if (savedSettings.object(forKey: "isLeftHandMode") != nil)
        {
            if(savedSettings.value(forKey: "isLeftHandMode") as! Bool)
            {
                //if in left-handed mode...
                //deactivate the constraints for right-hand mode
                rightHandClearAnswerLeadingConstraint.isActive = false;
                rightHandClearAnswerTrailingConstraint.isActive = false;
                rightHandSubmitLeadingConstraint.isActive = false;
                rightHandSubmitTrailingConstraint.isActive = false;
                rightHandClearWorkLeadingConstraint.isActive = false;
                rightHandClearWorkTrailingConstraint.isActive = false;
                
                //activate the constraints for left-hand mode
                leftHandClearAnswerLeadingConstraint.isActive = true;
                leftHandClearAnswerTrailingConstraint.isActive = true;
                leftHandSubmitLeadingConstraint.isActive = true;
                leftHandSubmitTrailingConstraint.isActive = true;
                leftHandClearWorkLeadingConstraint.isActive = true;
                leftHandClearWorkTrailingConstraint.isActive = true;
            }
            else
            {
                //if in right-handed mode...
                //deactivate the constraints for left-hand mode
                leftHandClearAnswerLeadingConstraint.isActive = false;
                leftHandClearAnswerTrailingConstraint.isActive = false;
                leftHandSubmitLeadingConstraint.isActive = false;
                leftHandSubmitTrailingConstraint.isActive = false;
                leftHandClearWorkLeadingConstraint.isActive = false;
                leftHandClearWorkTrailingConstraint.isActive = false;
                
                //activate the constraints for right-hand mode
                rightHandClearAnswerLeadingConstraint.isActive = true;
                rightHandClearAnswerTrailingConstraint.isActive = true;
                rightHandSubmitLeadingConstraint.isActive = true;
                rightHandSubmitTrailingConstraint.isActive = true;
                rightHandClearWorkLeadingConstraint.isActive = true;
                rightHandClearWorkTrailingConstraint.isActive = true;
            }
        }
            //if the user does not have saved settings for left vs. right-hand mode, default to right-hand mode
        else
        {
            //if in right-handed mode...
            //deactivate the constraints for left-hand mode
            leftHandClearAnswerLeadingConstraint.isActive = false;
            leftHandClearAnswerTrailingConstraint.isActive = false;
            leftHandSubmitLeadingConstraint.isActive = false;
            leftHandSubmitTrailingConstraint.isActive = false;
            leftHandClearWorkLeadingConstraint.isActive = false;
            leftHandClearWorkTrailingConstraint.isActive = false;
            
            //activate the constraints for right-hand mode
            rightHandClearAnswerLeadingConstraint.isActive = true;
            rightHandClearAnswerTrailingConstraint.isActive = true;
            rightHandSubmitLeadingConstraint.isActive = true;
            rightHandSubmitTrailingConstraint.isActive = true;
            rightHandClearWorkLeadingConstraint.isActive = true;
            rightHandClearWorkTrailingConstraint.isActive = true;
        }
        
        //setup the number of correctly answered questions label
        studyView.numCorrect.text = "0";
        
        //setup the number of incorrectly answered questions label
        studyView.numIncorrect.text = "0";
        
        problemSource = MainViewDataSource.init();
        
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
        studyView.problemImage.image = UIImage(named: (problemSource.pickRandomProblem().problemImageName));
        
        //setup the immediate feedback
        mainController = SummaryCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.addChild(mainController!);
        
        mainController?.summaryData = self.summaryData;
        
        immediateFeedback.dataSource = mainController;
        immediateFeedback.delegate = mainController;
        
        /***** START - FOR IINK SDK 1.3: *****/
        editorViewController = (children.first as! EditorViewController)
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            if (appDelegate.engine == nil)
            {
                let alert = UIAlertController(title: "Certificate error",
                                              message: appDelegate.engineErrorMessage,
                                              preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK",
                                              style: UIAlertAction.Style.default,
                                              handler: {(action: UIAlertAction) -> Void in
                                                exit(1)
                }))
                self.present(alert, animated: true, completion: nil)
                return
            }
            editorViewController.engine = appDelegate.engine
        }
        
        editorViewController.inputMode = .forcePen  // We want the Pen mode for this GetStarted sample code. It lets the user use either its mouse or fingers to draw.
        // If you have got an iPad Pro with an Apple Pencil, please set this value to InputModeAuto for a better experience.
        
        do {
            if let package = try createPackage(packageName: "New") {
                try editorViewController.editor.part = package.getPartAt(0)
            }
        } catch {
            print("Error while creating package : " + error.localizedDescription)
        }
        /***** END - FOR IINK SDK 1.3: *****/
        
        timerStarted = false;
        //check once per second to see if a conversion is needed
        statusCheckTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkStatus(timer:)), userInfo: nil, repeats: true);
        beautifyTimer = Timer();
    }
    
    func createPackage(packageName: String) throws -> IINKContentPackage? {
        // Create a new content package with name
        var resultPackage: IINKContentPackage?
        let fullPath = FileManager.default.pathForFile(inDocumentDirectory: packageName) + ".iink"
        if let engine = (UIApplication.shared.delegate as? AppDelegate)?.engine {
            resultPackage = try engine.createPackage(fullPath.decomposedStringWithCanonicalMapping)
            
            // Add a blank page type Text Document
            if let part = try resultPackage?.createPart("Math") /* Options are : "Diagram", "Drawing", "Math", "Text Document", "Text" */ {
                self.title = "Type: " + part.type
            }
        }
        return resultPackage
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        editorViewController.editor.part = nil;
        //start a trace to measure number of times handwriting is converted and to determine how long users study for
        //let trace = Performance.startTrace(name: "StudyModeHandWritingConversion");
        //trace?.setValue(Int64(NumberOfConversions), forMetric: "StudyModeNumberOfConversions")
        //trace?.stop();
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //When the user hits "Submit"
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        //get the result
        //NSLog("Result: " + result);
        
        if(!result.isEmpty && !editorViewController.inputView.convertRequired && editorViewController.editor.idle)
        {
            //Get the transform to change from MyScript's mm to pixels
            let transform = editorViewController.editor.renderer.viewTransform;
            
            //get the size of the screenshot we want to take
            let picWidthMm = editorViewController.editor.rootBlock!.box.width;
            let picHeightMm = editorViewController.editor.rootBlock!.box.height;
            
            //apply the transform to the dimensions of the screenshot in mm to get pixels
            let picDimensionsMm = CGPoint(x: picWidthMm,y: picHeightMm);
            let picDimensions = picDimensionsMm.applying(transform);
            
            //set the screenshot size as the context
            UIGraphicsBeginImageContext(CGSize(width: picDimensions.x, height: picDimensions.y));
            
            //Get the position of the converted writing
            let picPositionMm = CGPoint(x: editorViewController.editor.rootBlock!.box.minX,y: editorViewController.editor.rootBlock!.box.minY);
            
            //apply the transform to the position in mm to get pixels
            let picPosition = picPositionMm.applying(transform);
            
            //use the contents of the mathView to draw in the context
            mathView.drawHierarchy(in: CGRect(x: -picPosition.x, y: -picPosition.y, width: mathView.bounds.size.width, height: mathView.bounds.size.height), afterScreenUpdates: true);
            
            //get the result as an image
            answerImg = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage();
            UIGraphicsEndImageContext();
            
            //the result string will either have an equals symbol, a simeq (or approx symbol), or will just have a value
            //we'll need to strip away everything but the value
            //we also need to make sure that there are no spaces after the value
            if(result.contains("="))
            {
                result = String(result[result.index(after: result.firstIndex(of: "=")!)...]);
            }
            else if(result.contains("simeq"))
            {
                result = String(result[result.index(after: result.lastIndex(of: " ")!)...]);
            }
            else if(result.contains(" "))
            {
                result = result.trimmingCharacters(in: .whitespacesAndNewlines);
            }
            //NSLog("Parsed Answer: %@", result);
            
            //check if the user's answer is correct
            if(problemSource.isCorrect(result))
            {
                studyView.numCorrect.text = "\(Int(studyView.numCorrect.text!)!+1)";
                studyView.drawRight();
                markImg = UIImage(named: "Correct")!;
                updateStatistics(isCorrect: true);
            }
            else
            {
                studyView.numIncorrect.text = "\(Int(studyView.numIncorrect.text!)!+1)";
                studyView.drawWrong();
                markImg = UIImage(named: "Wrong")!;
                updateStatistics(isCorrect: false);
            }
        
            //add images to the summary view on the finish screen
            summaryData.append(UIImage(named: (problemSource.getCurrProblem().problemImageName))!);
            summaryData.append(UIImage(named: (problemSource.getCurrProblem().answerImageName))!);
            summaryData.append(answerImg);
            summaryData.append(markImg);
            mainController?.summaryData = self.summaryData;
            immediateFeedback.reloadData();
            
            //scroll down so the latest problem and answer are shown
            immediateFeedback.scrollToItem(at: IndexPath.init(item: immediateFeedback.numberOfItems(inSection: 0)-1, section: 0), at: UICollectionView.ScrollPosition.bottom, animated: true);
            
            // set up a new problem
            studyView.problemImage.image = UIImage(named: (problemSource.pickRandomProblem().problemImageName));
            
            // clear the field to write your answer
            editorViewController.editor.clear();
            scratchPaperImageView.image = nil;
            
            result = "";
        }
    }
    
    @IBAction func clearMathView(_ sender: UIButton) {
        editorViewController.editor.clear();
    }
    
    func updateStatistics(isCorrect : Bool)
    {
        if(isCorrect)
        {
            let newValue:Int = savedSettings.value(forKey: (problemSource.getCurrProblem().typeOfProblem) + "StatsNumCorrect") as! Int + 1;
            savedSettings.setValue(newValue, forKey: (problemSource.getCurrProblem().typeOfProblem) + "StatsNumCorrect");
        }
        savedSettings.setValue(savedSettings.value(forKey: (problemSource.getCurrProblem().typeOfProblem) + "StatsNumTotal") as! Int + 1, forKey: (problemSource.getCurrProblem().typeOfProblem) + "StatsNumTotal");
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
