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
    
    //quadrantalsSwitch controls whether the problems displayed are on the axes (x and y)
    @IBOutlet weak var quadrantalsSwitch: UISwitch!
    //quad1Switch controls whether the problems displayed are from Quadrant I
    @IBOutlet weak var quad1Switch: UISwitch!
    //quad2Switch controls whether the problems displayed are from Quadrant II
    @IBOutlet weak var quad2Switch: UISwitch!
    //quad3Switch controls whether the problems displayed are from Quadrant III
    @IBOutlet weak var quad3Switch: UISwitch!
    //quad4Switch controls whether the problems displayed are from Quadrant IV
    @IBOutlet weak var quad4Switch: UISwitch!
    
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
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANTALS**********/
        //check if there are previously saved settings for including problems from quadrantals
        if (defaultSettings.object(forKey: "quadrantals") != nil)
        {
            quadrantalsSwitch.setOn(defaultSettings.value(forKey: "quadrantals") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include problems from quadrantals
        else
        {
            quadrantalsSwitch.setOn(true, animated: true);
            defaultSettings.setValue(quadrantalsSwitch.isOn, forKey: "quadrantals");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT I**********/
        //check if there are previously saved settings for including problems from Quadrant I
        if (defaultSettings.object(forKey: "quadI") != nil)
        {
            quad1Switch.setOn(defaultSettings.value(forKey: "quadI") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include problems from Quadrant I
        else
        {
            quad1Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad1Switch.isOn, forKey: "quadI");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT II**********/
        //check if there are previously saved settings for including problems from Quadrant II
        if (defaultSettings.object(forKey: "quadII") != nil)
        {
            quad2Switch.setOn(defaultSettings.value(forKey: "quadII") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include problems from Quadrant II
        else
        {
            quad2Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad2Switch.isOn, forKey: "quadII");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT III**********/
        //check if there are previously saved settings for including problems from Quadrant III
        if (defaultSettings.object(forKey: "quadIII") != nil)
        {
            quad3Switch.setOn(defaultSettings.value(forKey: "quadIII") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include problems from Quadrant III
        else
        {
            quad3Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad3Switch.isOn, forKey: "quadIII");
        }
        
        /**********SETTINGS FOR PROBLEMS FROM QUADRANT IV**********/
        //check if there are previously saved settings for including problems from Quadrant IV
        if (defaultSettings.object(forKey: "quadIV") != nil)
        {
            quad4Switch.setOn(defaultSettings.value(forKey: "quadIV") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include problems from Quadrant IV
        else
        {
            quad4Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad4Switch.isOn, forKey: "quadIV");
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
    
    @IBAction func quadrantalsSwitchChanged(_ sender: UISwitch) {
        //make sure that at least one of the Quadrant Switches is turned on if turning off Quadrantals
        if(!sender.isOn && !quad1Switch.isOn && !quad2Switch.isOn && !quad3Switch.isOn && !quad4Switch.isOn)
        {
            quad1Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad1Switch.isOn, forKey: "quadI");
        }
        //save the state of the quadrantals switch to default settings
        defaultSettings.setValue(sender.isOn, forKey: "quadrantals");
    }
    
    @IBAction func quad1SwitchChanged(_ sender: UISwitch) {
        //make sure that at least one of the Quadrant Switches is turned on if turning off QI
        if(!sender.isOn && !quadrantalsSwitch.isOn && !quad2Switch.isOn && !quad3Switch.isOn && !quad4Switch.isOn)
        {
            quad2Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad2Switch.isOn, forKey: "quadII");
        }
        //save the state of the quad1Switch to default settings
        defaultSettings.setValue(sender.isOn, forKey: "quadI");
    }
    
    @IBAction func quad2SwitchChanged(_ sender: UISwitch) {
        //make sure that at least one of the Quadrant Switches is turned on if turning off QII
        if(!sender.isOn && !quadrantalsSwitch.isOn && !quad1Switch.isOn && !quad3Switch.isOn && !quad4Switch.isOn)
        {
            quad3Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad3Switch.isOn, forKey: "quadIII");
        }
        //save the state of the quad1Switch to default settings
        defaultSettings.setValue(sender.isOn, forKey: "quadII");
    }
    
    @IBAction func quad3SwitchChanged(_ sender: UISwitch) {
        //make sure that at least one of the Quadrant Switches is turned on if turning off QIII
        if(!sender.isOn && !quadrantalsSwitch.isOn && !quad1Switch.isOn && !quad2Switch.isOn && !quad4Switch.isOn)
        {
            quad4Switch.setOn(true, animated: true);
            defaultSettings.setValue(quad4Switch.isOn, forKey: "quadIV");
        }
        //save the state of the quad1Switch to default settings
        defaultSettings.setValue(sender.isOn, forKey: "quadIII");
    }
    
    @IBAction func quad4SwitchChanged(_ sender: UISwitch) {
        //make sure that at least one of the Quadrant Switches is turned on if turning off QIV
        if(!sender.isOn && !quadrantalsSwitch.isOn && !quad1Switch.isOn && !quad2Switch.isOn && !quad3Switch.isOn)
        {
            quadrantalsSwitch.setOn(true, animated: true);
            defaultSettings.setValue(quadrantalsSwitch.isOn, forKey: "quadrantals");
        }
        //save the state of the quad1Switch to default settings
        defaultSettings.setValue(sender.isOn, forKey: "quadIV");
    }
    
    
    //update settings if the state of the reciprocals switch is changed.
    @IBAction func reciprocalsSwitchChanged(_ sender: UISwitch) {
        defaultSettings.setValue(sender.isOn, forKey: "reciprocals");
    }
}
