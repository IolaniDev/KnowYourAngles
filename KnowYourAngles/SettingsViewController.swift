//
//  SettingsViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/6/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import UIKit

public class SettingsViewController: UIViewController{
    
    //label for the problemSlider to display how many problems the user wants to complete
    @IBOutlet weak var totalNumOfProblems: UILabel!
    //reference to a slider used to choose the number of problems the user wants to complete
    @IBOutlet weak var problemSlider: UISlider!
    
    //timerSwitch controls whether a time limit is set on how long the user has to complete the desired number of problems
    @IBOutlet weak var timerSwitch: UISwitch!
    //timerLabel displays the time limit currently set (can be 30 seconds, 1 min, 2 min, 3 min, or 4 min)
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
    
    //when the view loads...
    override public func viewDidLoad() {
        //call on the super class viewDidLoad method
        super.viewDidLoad()
        
        //grab the previously saved settings (if any)
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        
        /**********SETTINGS FOR MAX NUM OF PROBLEMS**********/
        //if there are previously saved settings for the number of problems, use them
        if (defaultSettings.objectForKey("maxNumOfProblems") != nil) {
            problemSlider.value = defaultSettings.valueForKey("maxNumOfProblems") as! Float;
        }
        //if there are no pre-existing settings, then...
        else
        {
            //set the default number of problems to 10
            problemSlider.value = 10;
            defaultSettings.setValue(problemSlider.value, forKey: "maxNumOfProblems");
        }
        
        //set the text on the settings page
        totalNumOfProblems.text = "Number of Problems: \(lroundf(problemSlider.value))";
        
        /**********SETTINGS FOR TIMER**********/
        //if there are previously saved timer settings, then use them
        if(defaultSettings.objectForKey("isTimerOn") != nil)
        {
            timerSwitch.setOn(defaultSettings.objectForKey("isTimerOn") as! Bool, animated: true);
            timerSlider.hidden = !timerSwitch.on;
        }
        //if there are no pre-existing settings, then set default values.
        else
        {
            timerSwitch.setOn(false, animated: true);
            timerSlider.hidden = true;
            defaultSettings.setValue(timerSwitch.on, forKey: "isTimerOn");
        }
        
        //if there are already settings for the amount of time allowed, then use them
        if(defaultSettings.objectForKey("amtTimeMin") != nil && defaultSettings.objectForKey("amtTimeSec") != nil)
        {
            //get the minutes & seconds stored in settings and convert to a slider value
            let minutes = defaultSettings.objectForKey("amtTimeMin") as! Float;
            let seconds = defaultSettings.objectForKey("amtTimeSec") as! Float;
            timerSlider.value = (minutes) + (seconds/60);
            
            if(minutes == 0)
            {
                timerLabel.text = "Timer: \(seconds) seconds";
            }
            else
            {
                timerLabel.text = "Timer: \(minutes) minutes \(seconds) seconds";
            }
        }
        //if there are no pre-existing settings for amount of time allowed, then set default values
        else
        {
            timerLabel.text = "Timer: 30 seconds";
            timerSlider.value = 0.5;
            defaultSettings.setValue(0, forKey: "amtTimeMin");
            defaultSettings.setValue(0.5, forKey: "amtTimeSec");
        }
        
        
        /**********SETTINGS FOR PROBLEMS USING DEGREES**********/
        if (defaultSettings.objectForKey("degrees") != nil) {
            degreesSwitch.setOn(defaultSettings.valueForKey("degrees") as! Bool, animated: true);
        }
        else
        {
            degreesSwitch.setOn(true, animated: true);
            defaultSettings.setValue(degreesSwitch.on, forKey: "degrees");
        }
        
        
        if (defaultSettings.objectForKey("radians") != nil) {
            radiansSwitch.setOn(defaultSettings.valueForKey("radians") as! Bool, animated: true);
        }
        else
        {
            radiansSwitch.setOn(false, animated: true);
            defaultSettings.setValue(radiansSwitch.on, forKey: "radians");
        }

        if(defaultSettings.objectForKey("reciprocals") != nil)
        {
            reciprocalsSwitch.setOn(defaultSettings.valueForKey("reciprocals") as! Bool, animated: true);
        }
        else
        {
            reciprocalsSwitch.setOn(false, animated: true);
            defaultSettings.setValue(reciprocalsSwitch.on, forKey: "reciprocals");
        }
        
        //timerSlider.hidden = false;
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        totalNumOfProblems.text = "Number of Problems: \(lroundf(sender.value))";
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        defaultSettings.setValue(sender.value, forKey: "maxNumOfProblems");
    }
    
    @IBAction func timerSwitchChanged(sender: UISwitch) {
        if(sender.on){
            timerSlider.hidden = false;
        }
        else
        {
            timerSlider.hidden = true;
        }
        let defaultSettings = NSUserDefaults.standardUserDefaults();
        defaultSettings.setValue(sender.on, forKey: "isTimerOn");
    }
    
    //function is called when the timerSlider is changed
    @IBAction func timerSliderChanged(sender: UISlider) {
        
        //get the value from the slider and round it to the nearest half
        let newValue = Double(lroundf(((sender.value - 0.25)/0.5)))*0.5;
        
        //from the newValue, extract the number of minutes and number of seconds for the time limit.
        let minutes = newValue - (newValue % 1);
        let seconds = 60 * (newValue % 1);
        
        if(minutes == 0)
        {
            timerLabel.text = "Timer: \(seconds) seconds";
        }
        else
        {
            timerLabel.text = "Timer: \(minutes) minutes \(seconds) seconds";
        }
        
        //create a reference to the current settings
        let defaultSettings = NSUserDefaults.standardUserDefaults();
        //set new values for the time limit in the settings
        defaultSettings.setValue(minutes, forKey: "amtTimeMin");
        defaultSettings.setValue(seconds, forKey: "amtTimeSec");
    }
    
    @IBAction func radiansSwitchChanged(sender: UISwitch) {
            let defaultSettings = NSUserDefaults.standardUserDefaults();
            if(!sender.on && !degreesSwitch.on)
            {
                degreesSwitch.setOn(true, animated: true);
                defaultSettings.setValue(degreesSwitch.on, forKey: "degrees");
            }
            defaultSettings.setValue(sender.on, forKey: "radians");
    }
    //if the state of the degrees switch changes...
    @IBAction func degreesSwitchChanged(sender: UISwitch) {
        //set the saved settings appropriately.
        let defaultSettings = NSUserDefaults.standardUserDefaults();
        if(!sender.on && !radiansSwitch.on)
        {
            radiansSwitch.setOn(true, animated: true);
            defaultSettings.setValue(radiansSwitch.on, forKey: "radians");
        }
        defaultSettings.setValue(sender.on, forKey: "degrees");
        
    }
    
    @IBAction func reciprocalsSwitchChanged(sender: UISwitch) {
        let defaultSettings = NSUserDefaults.standardUserDefaults();
        defaultSettings.setValue(sender.on, forKey: "reciprocals");
    }
}