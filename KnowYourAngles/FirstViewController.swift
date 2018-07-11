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
    let defaultSettings = UserDefaults.standard
    
    //when the view loads...
    override func viewDidLoad() {
        //call on the super class viewDidLoad method
        super.viewDidLoad()
        
        //Since this is the first screen that loads in the app, set up initial settings (or use previously saved ones)
        /**********SETTINGS FOR NUM OF PROBLEMS**********/
        if (defaultSettings.object(forKey: "numOfProblems") == nil)
        {
            //set the number of problems to 10
            defaultSettings.setValue(10, forKey: "numOfProblems");
        }
        
        /**********SETTINGS FOR MAX NUM OF PROBLEMS**********/
        //if there are no previously saved settings for the number of problems...then set defaults
        if (defaultSettings.object(forKey: "maxNumOfProblems") == nil)
        {
            //set the default maximum number of problems to 48 which would be the number of problems if the user includes sin, cos, tan for all degrees on the unit circle.
            defaultSettings.setValue(48, forKey: "maxNumOfProblems");
        }
        
        /**********SETTINGS FOR TIMER**********/
        //if there are no previously saved settings for whether the timer is on or off...then set defaults
        if(defaultSettings.object(forKey: "isTimerOn") == nil)
        {
            defaultSettings.setValue(false, forKey: "isTimerOn");
        }
        
        //if there are no pre-existing settings for the amount of time allowed, then set defaults
        if(defaultSettings.object(forKey: "amtTimeMin") == nil || defaultSettings.object(forKey: "amtTimeSec") == nil)
        {
            // if the timer is on, then set the timer to 30 seconds
            if(defaultSettings.object(forKey: "isTimerOn") as! Bool)
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
        if (defaultSettings.object(forKey: "degrees") == nil)
        {
            defaultSettings.setValue(true, forKey: "degrees");
        }
        
        /**********SETTINGS FOR PROBLEMS USING RADIANS**********/
        //check if there are no previously saved settings for including problems with radians
        if (defaultSettings.object(forKey: "radians") == nil)
        {
            defaultSettings.setValue(false, forKey: "radians");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANTALS**********/
        //check if there are no previously saved settings for including problems with quadrantals
        if (defaultSettings.object(forKey: "quadrantals") == nil)
        {
            defaultSettings.setValue(true, forKey: "quadrantals");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT I**********/
        //check if there are no previously saved settings for including problems with Quadrant I
        if (defaultSettings.object(forKey: "quadI") == nil)
        {
            defaultSettings.setValue(true, forKey: "quadI");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT II**********/
        //check if there are no previously saved settings for including problems with Quadrant II
        if (defaultSettings.object(forKey: "quadII") == nil)
        {
            defaultSettings.setValue(true, forKey: "quadII");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT III**********/
        //check if there are no previously saved settings for including problems with Quadrant III
        if (defaultSettings.object(forKey: "quadIII") == nil)
        {
            defaultSettings.setValue(true, forKey: "quadIII");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT IV**********/
        //check if there are no previously saved settings for including problems with Quadrant IV
        if (defaultSettings.object(forKey: "quadIV") == nil)
        {
            defaultSettings.setValue(true, forKey: "quadIV");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM SINE**********/
        //check if there are no previously saved settings for including sine problems
        if (defaultSettings.object(forKey: "sine") == nil)
        {
            defaultSettings.setValue(true, forKey: "sine");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM COSINE**********/
        //check if there are no previously saved settings for including cosine problems
        if (defaultSettings.object(forKey: "cosine") == nil)
        {
            defaultSettings.setValue(true, forKey: "cosine");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM TANGENT**********/
        //check if there are no previously saved settings for including tangent problems
        if (defaultSettings.object(forKey: "tangent") == nil)
        {
            defaultSettings.setValue(true, forKey: "tangent");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM COSECANT**********/
        //check if there are no previously saved settings for including cosecant problems
        if (defaultSettings.object(forKey: "cosecant") == nil)
        {
            defaultSettings.setValue(false, forKey: "cosecant");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM SECANT**********/
        //check if there are no previously saved settings for including secant problems
        if (defaultSettings.object(forKey: "secant") == nil)
        {
            defaultSettings.setValue(false, forKey: "secant");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM COTANGENT**********/
        //check if there are no previously saved settings for including cotangent problems
        if (defaultSettings.object(forKey: "cotangent") == nil)
        {
            defaultSettings.setValue(false, forKey: "cotangent");
        }
        
    }
}
