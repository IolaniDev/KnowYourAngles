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
    
    //var settingsData : Settings!;
    //var defaultSettings = Settings(num: 10, isTimer: false, time: 1, isDeg: false, isRad: false, isReciprocal: false);
    
    @IBOutlet weak var totalNumOfProblems: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var problemSlider: UISlider!
    @IBOutlet weak var degreesSwitch: UISwitch!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultSettings = NSUserDefaults.standardUserDefaults()
        
        if (defaultSettings.objectForKey("maxNumOfProblems") != nil) {
            problemSlider.value = defaultSettings.valueForKey("maxNumOfProblems") as! Float;
        }
        if (defaultSettings.objectForKey("degrees") != nil) {
            degreesSwitch.on = defaultSettings.valueForKey("degrees") as! Bool;
        }

        totalNumOfProblems.text = "Number of Problems: \(lroundf(problemSlider.value))";
        timerSlider.hidden = false;
        timerLabel.text = "Timer: 30 seconds";
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
      
        if(sender.value<1)
        {
            timerLabel.text = "Timer: 30 seconds";
        }
        else
        {
            let newValue = lroundf(((sender.value - 0.25)/0.5)*0.5)
            timerLabel.text = "Timer: \(newValue) minutes";
        }
    }
    
    //if the state of the degrees switch changes...
    @IBAction func degreesSwitchChanged(sender: UISwitch) {
        //set the saved settings appropriately.
        let defaultSettings = NSUserDefaults.standardUserDefaults();
        defaultSettings.setValue(sender.on, forKey: "degrees");
        
    }
}