//
//  UIPlayViewController.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/23/21.
//  Updated by Erin Nagoshi on 7/15/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import UIKit

class UIPlayViewController : UIViewController {

    //initialResult is used to store the text version of the user's converted answer
    var initialResult = ""
    //answerImg is used to store a picture form of the user's converted answer
    var answerImg : UIImage = UIImage()
    
    /***** START - variables and functions for automatically changing user's writing into text and math symbols *****/
    //create timers
    var beautifyTimer = Timer();
    var statusCheckTimer = Timer();
    var timerStarted = false;
    
    //function used to check whether the handwriting timer should start or stop
    @objc func checkStatus(timer: Timer)
    {
        let editorViewController = self.children[0] as! EditorViewController
        if editorViewController.inputView.timerOn && !timerStarted
        {
            startTimer();
        }
        else if !editorViewController.inputView.timerOn && timerStarted
        {
            endTimer();
        }
    }//end checkStatus function
    
    //function to start the timer to see if any writing needs to be beautified.
    func startTimer(){
        beautifyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fireTimer(timer:)), userInfo: nil, repeats: true);
        timerStarted = true;
    }//end startTimer function
    
    //function to end the timer to see if any writing needs to be beautified.
    func endTimer(){
        beautifyTimer.invalidate();
        timerStarted = false;
    }//end endTimer function
    
    func startTimers() {
        timerStarted = false;
        //check once per second to see if a conversion is needed
        statusCheckTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkStatus(timer:)), userInfo: nil, repeats: true);
        beautifyTimer = Timer();
    }
    
    //when timer expires, if convertRequired == true, call Editor::convert() and set convertRequired = false
    @objc func fireTimer(timer: Timer) {
        let editorViewController = self.children[0] as! EditorViewController
        if (editorViewController.inputView.convertRequired && editorViewController.editor.idle)
        {
            do {
                //get all of the "blocks" written by the user
                let supportedTargetStates = editorViewController.editor.getSupportedTargetConversionState(nil)
                //convert the contents of the block to text?
                if(supportedTargetStates.count > 0) {
                    try editorViewController.editor.convert(nil, targetState: supportedTargetStates[0].value)
                }
                //get all of the supported MIME Types that we can export the result as
                let supportedMimeTypes = editorViewController.editor.getSupportedExportMimeTypes(nil);
                
                //get the result as string
                if(supportedMimeTypes.count > 0) {
                    initialResult = try editorViewController.editor!.export_(nil, mimeType: supportedMimeTypes[0].value);
                }
                
            } catch {
                print("Error while converting : " + error.localizedDescription)
            }
            editorViewController.inputView.convertRequired = false;
            endTimer();
        }
    }//end fireTimer function
    
    /***** END - variables and functions for automatically changing user's writing into text and math symbols *****/
    
    override func viewDidAppear(_ animated: Bool) {
        if self.children.count > 0
        {
            startTimers()
        }
        else
        {
            print("An Error Occurred")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        let editorViewController = self.children[0] as! EditorViewController
        editorViewController.editor.part = nil;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearButtonPressed() {
        let editorViewController = self.children[0] as! EditorViewController
        editorViewController.editor.clear()
    }
    
    func submitButtonPressed() ->String {
        let editorViewController = self.children[0] as! EditorViewController
        
        //if the result is not empty
        if(!initialResult.isEmpty && !editorViewController.inputView.convertRequired && editorViewController.editor.idle)
        {
            //Get the transform to change from MyScript's mm to pixels
            let transform = editorViewController.editor.renderer.viewTransform;
            
            //get the size of the screenshot we wantto take
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
            self.view.drawHierarchy(in: CGRect(x: -picPosition.x, y: -picPosition.y, width: self.view.bounds.size.width, height: self.view.bounds.size.height), afterScreenUpdates: true);
            
            //get the result as an image
            answerImg = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage();
            UIGraphicsEndImageContext();
            
            //the result string will either have an equals symbol, a simeq (or approx symbol), or will just have a value
            //we'll need to strip away everything but the value
            //we also need to make sure that there are no spaces after the value
            if(initialResult.contains("="))
            {
                initialResult = String(initialResult[initialResult.index(after: initialResult.firstIndex(of: "=")!)...]);
            }
            else if(initialResult.contains("simeq"))
            {
                initialResult = String(initialResult[initialResult.index(after: initialResult.lastIndex(of: " ")!)...]);
            }
            else if(initialResult.contains(" "))
            {
                initialResult = initialResult.trimmingCharacters(in: .whitespacesAndNewlines);
            }            
        }
        return initialResult
    }
}//end UIPlayViewController
