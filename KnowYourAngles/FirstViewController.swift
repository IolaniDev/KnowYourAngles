//
//  FirstViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/12/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData

class FirstViewController : UIViewController{

    //grab the previously saved settings (if any)
    let defaultSettings = NSUserDefaults.standardUserDefaults()
    
    //when the view loads...
    override func viewDidLoad() {
        //call on the super class viewDidLoad method
        super.viewDidLoad()
        
        //Since this is the first screen that loads in the app, set up initial settings (or use previously saved ones)
        /**********SETTINGS FOR MAX NUM OF PROBLEMS**********/
        //if there are no previously saved settings for the number of problems...then set defaults
        if (defaultSettings.objectForKey("maxNumOfProblems") == nil)
        {
            //set the default number of problems to 10
            defaultSettings.setValue(10, forKey: "maxNumOfProblems");
        }
        
        /**********SETTINGS FOR TIMER**********/
        //if there are no previously saved settings for whether the timer is on or off...then set defaults
        if(defaultSettings.objectForKey("isTimerOn") == nil)
        {
            defaultSettings.setValue(false, forKey: "isTimerOn");
        }
        
        //if there are no pre-existing settings for the amount of time allowed, then set defaults
        if(defaultSettings.objectForKey("amtTimeMin") == nil || defaultSettings.objectForKey("amtTimeSec") == nil)
        {
            // if the timer is on, then set the timer to 30 seconds
            if(defaultSettings.objectForKey("isTimerOn") as! Bool)
            {
                defaultSettings.setValue(0, forKey: "amtTimeMin");
                defaultSettings.setValue(30, forKey: "amtTimeSec");
            }
            // if the timer is off, then set the timer to 0
            else{
                defaultSettings.setValue(0, forKey: "amtTimeMin");
                defaultSettings.setValue(0, forKey: "amtTimeSec");
            }
        }
        
        /**********SETTINGS FOR PROBLEMS USING DEGREES**********/
        //check if there are no previously saved settings for including the problems with degrees.
        if (defaultSettings.objectForKey("degrees") == nil)
        {
            defaultSettings.setValue(true, forKey: "degrees");
        }
        
        /**********SETTINGS FOR PROBLEMS USING RADIANS**********/
        //check if there are no previously saved settings for including problems with radians
        if (defaultSettings.objectForKey("radians") == nil)
        {
            defaultSettings.setValue(false, forKey: "radians");
        }
        
        /**********SETTINGS FOR PROBLEMS USING RECIPROCALS**********/
        //if there are no previously saved settings for including reciprocal trig facts, then don't include them
        if(defaultSettings.objectForKey("reciprocals") == nil)
        {
            defaultSettings.setValue(false, forKey: "reciprocals");
        }
        
    }
}