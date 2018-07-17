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
        //check if there are no previously saved settings for the statistics involving degrees
        if (defaultSettings.object(forKey: "degreeStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "degreeStatsNumCorrect");
        }
        if (defaultSettings.object(forKey: "degreeStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "degreeStatsNumTotal");
        }
        
        /**********SETTINGS FOR PROBLEMS USING RADIANS**********/
        //check if there are no previously saved settings for including problems with radians
        if (defaultSettings.object(forKey: "radians") == nil)
        {
            defaultSettings.setValue(false, forKey: "radians");
        }
        //check if there are no previously saved settings for the statistics involving radians
        if (defaultSettings.object(forKey: "radianStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "radianStatsNumCorrect");
        }
        if (defaultSettings.object(forKey: "radianStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "radianStatsNumTotal");
        }
        
        //check if there are no previously saved settings for the statistics involving radians and degrees
        if (defaultSettings.object(forKey: "radianAndDegreeStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "radianAndDegreeStatsNumCorrect");
        }
        if (defaultSettings.object(forKey: "radianAndDegreeStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "radianAndDegreeStatsNumTotal");
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
        
        /**********SETTINGS FOR PROBLEMS FROM ARCSINE**********/
        //check if there are no previously saved settings for including arcsine problems
        if (defaultSettings.object(forKey: "arcsine") == nil)
        {
            defaultSettings.setValue(false, forKey: "arcsine");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM ARCCOSINE**********/
        //check if there are no previously saved settings for including arccosine problems
        if (defaultSettings.object(forKey: "arccosine") == nil)
        {
            defaultSettings.setValue(false, forKey: "arccosine");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM ARCTANGENT**********/
        //check if there are no previously saved settings for including arctangent problems
        if (defaultSettings.object(forKey: "arctangent") == nil)
        {
            defaultSettings.setValue(false, forKey: "arctangent");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM ARCCOSECANT**********/
        //check if there are no previously saved settings for including arccosecant problems
        if (defaultSettings.object(forKey: "arccosecant") == nil)
        {
            defaultSettings.setValue(false, forKey: "arccosecant");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM ARCSECANT**********/
        //check if there are no previously saved settings for including arcsecant problems
        if (defaultSettings.object(forKey: "arcsecant") == nil)
        {
            defaultSettings.setValue(false, forKey: "arcsecant");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM ARCCOTANGENT**********/
        //check if there are no previously saved settings for including arccotangent problems
        if (defaultSettings.object(forKey: "arccotangent") == nil)
        {
            defaultSettings.setValue(false, forKey: "arccotangent");
        }
        
        /**********STATISTICS FOR SINE PROBLEMS**********/
        if(defaultSettings.object(forKey: "sineStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "sineStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "sineStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "sineStatsNumTotal");
        }
        
        /**********STATISTICS FOR COSINE PROBLEMS**********/
        if(defaultSettings.object(forKey: "cosineStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "cosineStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "cosineStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "cosineStatsNumTotal");
        }
        
        /**********STATISTICS FOR TANGENT PROBLEMS**********/
        if(defaultSettings.object(forKey: "tangentStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "tangentStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "tangentStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "tangentStatsNumTotal");
        }
        
        /**********STATISTICS FOR COSECANT PROBLEMS**********/
        if(defaultSettings.object(forKey: "cosecantStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "cosecantStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "cosecantStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "cosecantStatsNumTotal");
        }
        
        /**********STATISTICS FOR SECANT PROBLEMS**********/
        if(defaultSettings.object(forKey: "secantStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "secantStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "secantStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "secantStatsNumTotal");
        }
        
        /**********STATISTICS FOR COTANGENT PROBLEMS**********/
        if(defaultSettings.object(forKey: "cotangentStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "cotangentStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "cotangentStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "cotangentStatsNumTotal");
        }
        
        /**********STATISTICS FOR ARCSINE PROBLEMS**********/
        if(defaultSettings.object(forKey: "arcsineStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "arcsineStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "arcsineStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "arcsineStatsNumTotal");
        }
        
        /**********STATISTICS FOR ARCCOSINE PROBLEMS**********/
        if(defaultSettings.object(forKey: "arccosineStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "arccosineStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "arccosineStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "arccosineStatsNumTotal");
        }
        
        /**********STATISTICS FOR ARCTANGENT PROBLEMS**********/
        if(defaultSettings.object(forKey: "arctangentStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "arctangentStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "arctangentStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "arctangentStatsNumTotal");
        }
        
        /**********STATISTICS FOR ARCCOSECANT PROBLEMS**********/
        if(defaultSettings.object(forKey: "arccosecantStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "arccosecantStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "arccosecantStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "arccosecantStatsNumTotal");
        }
        
        /**********STATISTICS FOR ARCSECANT PROBLEMS**********/
        if(defaultSettings.object(forKey: "arcsecantStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "arcsecantStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "arcsecantStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "arcsecantStatsNumTotal");
        }
        
        /**********STATISTICS FOR ARCCOTANGENT PROBLEMS**********/
        if(defaultSettings.object(forKey: "arccotangentStatsNumCorrect") == nil)
        {
            defaultSettings.setValue(0, forKey: "arccotangentStatsNumCorrect");
        }
        if(defaultSettings.object(forKey: "arccotangentStatsNumTotal") == nil)
        {
            defaultSettings.setValue(0, forKey: "arccotangentStatsNumTotal");
        }
    }
}
