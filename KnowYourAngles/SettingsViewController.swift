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
    
    @IBOutlet weak var totalNumOfProblems: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var problemSlider: UISlider!
    @IBOutlet weak var degreesSwitch: UISwitch!
    @IBOutlet weak var radiansSwitch: UISwitch!
    @IBOutlet weak var reciprocalsSwitch: UISwitch!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        
        //if there are previously saved settings, use them
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
        
        //timer settings
        //if there are already settings for the amount of time allowed, then use them
        if(defaultSettings.objectForKey("amtTime") != nil)
        {
            timerSlider.value = defaultSettings.objectForKey("amtTime") as! Float;
            if(timerSlider.value<1)
            {
                timerLabel.text = "Timer: 30 seconds";
            }
            else
            {
                let newValue = lroundf(((timerSlider.value - 0.25)/0.5)*0.5)
                timerLabel.text = "Timer: \(newValue) minutes";
            }

        }
        else
        {
            timerLabel.text = "Timer: 30 seconds";
            timerSlider.value = 0.5;
            defaultSettings.setValue(timerSlider.value, forKey: "amtTime");
        }
        
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
        
        timerSlider.hidden = false;
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
    }
    
    @IBAction func timerSliderChanged(sender: UISlider) {
        let defaultSettings = NSUserDefaults.standardUserDefaults();
        if(sender.value<1)
        {
            timerLabel.text = "Timer: 30 seconds";
        }
        else
        {
            let newValue = lroundf(((sender.value - 0.25)/0.5)*0.5)
            timerLabel.text = "Timer: \(newValue) minutes";
        }
        defaultSettings.setValue(sender.value, forKey: "amtTime");
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