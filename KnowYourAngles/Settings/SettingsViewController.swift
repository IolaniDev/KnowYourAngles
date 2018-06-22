//
//  SettingsViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/6/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import UIKit

open class SettingsViewController: UIViewController{
    
    //label for the problemSlider to display how many problems the user wants to complete
    @IBOutlet weak var totalNumOfProblems: UILabel!
    //reference to a slider used to choose the number of problems the user wants to complete
    @IBOutlet weak var problemSlider: UISlider!
    
    //timerSwitch controls whether a time limit is set on how long the user has to complete the desired number of problems
    @IBOutlet weak var timerSwitch: UISwitch!
    //timerLabel displays the time limit currently set (can be 30 seconds, 1 min, 1 min 30 sec, 2 min, 2 min 30 seconds, or 3 min)
    @IBOutlet weak var timerLabel: UILabel!
    //timerSlider lets the user change the time limit
    @IBOutlet weak var timerSlider: UISlider!
    
    //degreesSwitch controls whether the problems displayed are in degrees
    //NOTE: Either degrees or radians must be selected. It is not possible to display problems without degrees and without radians.
    @IBOutlet weak var degreesSwitch: UISwitch!
    //radiansSwitch controls whether the problems displayed are in radians
    @IBOutlet weak var radiansSwitch: UISwitch!
    
    //reciprocalsSwitch controls whether to include the reciprocal functions (sec, csc, cot) in the problem set.
    @IBOutlet weak var reciprocalsSwitch: UISwitch!
    
    //grab the previously saved settings (if any)
    let defaultSettings = UserDefaults.standard
    
    //when the view loads...
    override open func viewDidLoad() {
        //call on the super class viewDidLoad method
        super.viewDidLoad()
        
        /**********SETTINGS FOR MAX NUM OF PROBLEMS**********/
        //if there are previously saved settings for the number of problems, use them
        if (defaultSettings.object(forKey: "maxNumOfProblems") != nil) {
            problemSlider.value = defaultSettings.value(forKey: "maxNumOfProblems") as! Float;
        }
            //if there are no pre-existing settings, then...
        else
        {
            //set the default number of problems to 10
            problemSlider.value = 10;
            defaultSettings.setValue(problemSlider.value, forKey: "maxNumOfProblems");
        }
        
        // set the text on the settings page
        totalNumOfProblems.text = "Number of Problems: \(lroundf(problemSlider.value))";
        
        /**********SETTINGS FOR TIMER**********/
        // if there are previously saved settings for whether the timer is on or off, then use them
        if(defaultSettings.object(forKey: "isTimerOn") != nil)
        {
            timerSwitch.setOn(defaultSettings.object(forKey: "isTimerOn") as! Bool, animated: true);
            timerSlider.isHidden = !timerSwitch.isOn;
            timerLabel.isHidden = !timerSwitch.isOn;
        }
        // if there are no pre-existing settings, then set default value to off.
        else
        {
            timerSwitch.setOn(false, animated: true);
            timerSlider.isHidden = true;
            timerLabel.isHidden = true;
            defaultSettings.setValue(timerSwitch.isOn, forKey: "isTimerOn");
        }
        
        // if there are already settings for the amount of time allowed, then use them
        if(defaultSettings.object(forKey: "amtTimeMin") != nil && defaultSettings.object(forKey: "amtTimeSec") != nil)
        {
            // get the minutes & seconds stored in settings and convert to a slider value
            let minutes = defaultSettings.object(forKey: "amtTimeMin") as! Float;
            let seconds = defaultSettings.object(forKey: "amtTimeSec") as! Float;
            timerSlider.value = (minutes) + (seconds/60);
            
            // change the timer label
            if(minutes == 0)
            {
                timerLabel.text = "\(Int(seconds)) seconds";
            }
            else if(seconds == 0)
            {
                timerLabel.text = "\(Int(minutes)) minutes";
            }
            else
            {
                timerLabel.text = "\(Int(minutes)) minutes \(Int(seconds)) seconds";
            }
        }
        // if there are no pre-existing settings for amount of time allowed, then set default values
        else
        {
            // if the timer is on, set to 30 seconds
            if(defaultSettings.object(forKey: "isTimerOn") as! Bool)
            {
                timerLabel.text = "30 seconds";
                timerSlider.value = 0.5;
                defaultSettings.setValue(0, forKey: "amtTimeMin");
                defaultSettings.setValue(30, forKey: "amtTimeSec");
            }
            // if the timer is off, set timer to 0
            else{
                defaultSettings.setValue(0, forKey: "amtTimeMin");
                defaultSettings.setValue(0, forKey: "amtTimeSec");
            }
        }
        
        
        /**********SETTINGS FOR PROBLEMS USING DEGREES**********/
        //check if there are previously saved settings for including the problems with degrees.
        if (defaultSettings.object(forKey: "degrees") != nil) {
            degreesSwitch.setOn(defaultSettings.value(forKey: "degrees") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then by default use the problems with degrees
        else
        {
            degreesSwitch.setOn(true, animated: true);
            defaultSettings.setValue(degreesSwitch.isOn, forKey: "degrees");
        }
        
        /**********SETTINGS FOR PROBLEMS USING RADIANS**********/
        //check if there are previously saved settings for including problems with radians
        if (defaultSettings.object(forKey: "radians") != nil) {
            radiansSwitch.setOn(defaultSettings.value(forKey: "radians") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, do not include problems with radians.
        else
        {
            radiansSwitch.setOn(false, animated: true);
            defaultSettings.setValue(radiansSwitch.isOn, forKey: "radians");
        }
        
        /**********SETTINGS FOR PROBLEMS USING RECIPROCALS**********/
        //if there are previously saved settings for including reciprocal trig facts, then use them
        if(defaultSettings.object(forKey: "reciprocals") != nil)
        {
            reciprocalsSwitch.setOn(defaultSettings.value(forKey: "reciprocals") as! Bool, animated: true);
        }
            //otherwise, by default, don't include problems with reciprocals.
        else
        {
            reciprocalsSwitch.setOn(false, animated: true);
            defaultSettings.setValue(reciprocalsSwitch.isOn, forKey: "reciprocals");
        }
    }
    
    //sliderChanged is called when the slider is moved to change the number of problems
    @IBAction func sliderChanged(_ sender: UISlider) {
        totalNumOfProblems.text = "Number of Problems: \(lroundf(sender.value))";
        
        //save the number of problems in settings
        defaultSettings.setValue(lroundf(sender.value), forKey: "maxNumOfProblems");
    }
    
    //timerSwitchChanged is called when the user turns on or off the timer.
    @IBAction func timerSwitchChanged(_ sender: UISwitch) {
        //get the previously set minutes and seconds
        let minutes = defaultSettings.object(forKey: "amtTimeMin") as! Int;
        let seconds = defaultSettings.object(forKey: "amtTimeSec") as! Int;
        //if the timer gets turned on...
        if(sender.isOn)
        {
            //show the timer slider and timer label
            timerSlider.isHidden = false;
            timerLabel.isHidden = false;
            //if there was no previously saved time, change the time to 30 seconds
            if(minutes == 0 && seconds == 0)
            {
                timerLabel.text = "30 seconds";
                defaultSettings.setValue(30, forKey: "amtTimeSec");
            }
            else if(minutes == 0)
            {
                timerLabel.text = "\(seconds) seconds";
            }
            else if(seconds == 0)
            {
                timerLabel.text = "\(minutes) minutes";
            }
            else
            {
                timerLabel.text = "\(minutes) minutes \(seconds) seconds";
            }
        }
        // if the timer gets turned off
        else
        {
            //hide the slider and label
            timerSlider.isHidden = true;
            timerLabel.isHidden = true;
            //change the text
            timerLabel.text = "Timer: Off";
        }
        
        //save the state of the timer switch in settings
        defaultSettings.setValue(sender.isOn, forKey: "isTimerOn");
    }
    
    //function is called when the timerSlider is changed
    @IBAction func timerSliderChanged(_ sender: UISlider) {
        
        //get the value from the slider and round it to the nearest half
        let newValue = Double(lroundf(((sender.value - 0.25)/0.5)))*0.5;
        
        //from the newValue, extract the number of minutes and number of seconds for the time limit.
        let minutes = newValue - (newValue.truncatingRemainder(dividingBy: 1));
        let seconds = 60 * (newValue.truncatingRemainder(dividingBy: 1));
        
        if(minutes == 0)
        {
            timerLabel.text = "\(Int(seconds)) seconds";
        }
        else if(seconds == 0)
        {
            timerLabel.text = "\(Int(minutes)) minutes";
        }
        else
        {
            timerLabel.text = "\(Int(minutes)) minutes \(Int(seconds)) seconds";
        }

        //set new values for the time limit in the settings
        defaultSettings.setValue(minutes, forKey: "amtTimeMin");
        defaultSettings.setValue(seconds, forKey: "amtTimeSec");
    }
    
    //function is called when the user changes whether to include radian problems or not
    @IBAction func radiansSwitchChanged(_ sender: UISwitch) {
        //make sure the degree switch is turned on if turning off radians.
        if(!sender.isOn && !degreesSwitch.isOn)
        {
            degreesSwitch.setOn(true, animated: true);
            defaultSettings.setValue(degreesSwitch.isOn, forKey: "degrees");
        }
        defaultSettings.setValue(sender.isOn, forKey: "radians");
    }
    
    //if the state of the degrees switch changes...
    @IBAction func degreesSwitchChanged(_ sender: UISwitch) {
        //make sure the radians switch is on if turning off degrees.
        if(!sender.isOn && !radiansSwitch.isOn)
        {
            radiansSwitch.setOn(true, animated: true);
            defaultSettings.setValue(radiansSwitch.isOn, forKey: "radians");
        }
        defaultSettings.setValue(sender.isOn, forKey: "degrees");
        
    }
    
    //update settings if the state of the reciprocals switch is changed.
    @IBAction func reciprocalsSwitchChanged(_ sender: UISwitch) {
        defaultSettings.setValue(sender.isOn, forKey: "reciprocals");
    }
}