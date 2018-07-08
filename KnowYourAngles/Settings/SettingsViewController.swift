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
    
    //degreesSwitch controls whether the problems displayed are in degrees
    //NOTE: Either degrees or radians must be selected. It is not possible to display problems without degrees and without radians.
    @IBOutlet weak var degreesSwitch: UISwitch!
    //radiansSwitch controls whether the problems displayed are in radians
    @IBOutlet weak var radiansSwitch: UISwitch!
    
    //reciprocalsSwitch controls whether to include the reciprocal functions (sec, csc, cot) in the problem set.
    //@IBOutlet weak var reciprocalsSwitch: UISwitch!
    
    //grab the previously saved settings (if any)
    let defaultSettings = UserDefaults.standard
    
    //when the view loads...
    override open func viewDidLoad() {
        //call on the super class viewDidLoad method
        super.viewDidLoad()
        
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
        /*if(defaultSettings.object(forKey: "reciprocals") != nil)
        {
            reciprocalsSwitch.setOn(defaultSettings.value(forKey: "reciprocals") as! Bool, animated: true);
        }
            //otherwise, by default, don't include problems with reciprocals.
        else
        {
            reciprocalsSwitch.setOn(false, animated: true);
            defaultSettings.setValue(reciprocalsSwitch.isOn, forKey: "reciprocals");
        }*/
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
