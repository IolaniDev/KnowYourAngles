//
//  UIPlayViewController.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/23/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import UIKit
import SwiftUI

class UIPlayViewController : UIViewController {
    
    @EnvironmentObject var playViewDelegate : AppDelegate
    //result is used to store the text version of the user's converted answer
    //@objc dynamic var initialResult = "";
    //var editorViewController = EditorViewController()
    var initialResult = ""
    
    /***** START - variables and functions for automatically changing user's writing into text and math symbols *****/
    //create a timer
    var beautifyTimer = Timer();
    var statusCheckTimer = Timer();
    var timerStarted = false;
    
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
        let editorViewController = self.children[0] as! EditorViewController
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
                initialResult = try editorViewController.editor!.export_(nil, mimeType: supportedMimeTypes[0].value);
                
                //add 1 to the total number of conversions that have been done so far
                //NumberOfConversions += 1;
                //NSLog("QuizModeNumberOfConversions: \(NumberOfConversions)");
            } catch {
                print("Error while converting : " + error.localizedDescription)
            }
            editorViewController.inputView.convertRequired = false;
            endTimer();
            //NSLog("Result: " + result);
        }
    }
    /***** END - variables and functions for automatically changing user's writing into text and math symbols *****/
    override func viewDidLoad() {
        //Setup Writing Recognition
        super.viewDidLoad();
        
        if self.children.count > 0
        {
            timerStarted = false;
            //check once per second to see if a conversion is needed
            statusCheckTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkStatus(timer:)), userInfo: nil, repeats: true);
            beautifyTimer = Timer();
            print("Timer Started")
        }
        else
        {
            print("An Error Occurred")
        }
    }
}
