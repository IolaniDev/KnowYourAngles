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
    
    //leftHandSwitch controls whether the app is in left-hand mode or not
    @IBOutlet weak var leftHandSwitch: UISwitch!
    
    //degreesSwitch controls whether the problems displayed are in degrees
    //NOTE: Either degrees or radians must be selected. It is not possible to display problems without degrees and without radians.
    @IBOutlet weak var degreesSwitch: UISwitch!
    //radiansSwitch controls whether the problems displayed are in radians
    @IBOutlet weak var radiansSwitch: UISwitch!
    
    //quadrantalsSwitch controls whether the problems displayed are on the axes (x and y)
    //NOTE: at least one of the quadrants or the quadrantals option must be selected
    @IBOutlet weak var quadrantalsSwitch: UISwitch!
    //quad1Switch controls whether the problems displayed are from Quadrant I
    @IBOutlet weak var quad1Switch: UISwitch!
    //quad2Switch controls whether the problems displayed are from Quadrant II
    @IBOutlet weak var quad2Switch: UISwitch!
    //quad3Switch controls whether the problems displayed are from Quadrant III
    @IBOutlet weak var quad3Switch: UISwitch!
    //quad4Switch controls whether the problems displayed are from Quadrant IV
    @IBOutlet weak var quad4Switch: UISwitch!
    
    //trig function switches controls whether the problems displayed use each trig function (sine, cosine, tangent, cosecant, secant, and tangent)
    @IBOutlet weak var sineSwitch: UISwitch!
    @IBOutlet weak var cosineSwitch: UISwitch!
    @IBOutlet weak var tangentSwitch: UISwitch!
    @IBOutlet weak var cosecantSwitch: UISwitch!
    @IBOutlet weak var secantSwitch: UISwitch!
    @IBOutlet weak var cotangentSwitch: UISwitch!
    
    //inverse trig function switches controls whether the problems displayed use each inverse trig function
    @IBOutlet weak var arcsineSwitch: UISwitch!
    @IBOutlet weak var arccosineSwitch: UISwitch!
    @IBOutlet weak var arctangentSwitch: UISwitch!
    @IBOutlet weak var arccosecantSwitch: UISwitch!
    @IBOutlet weak var arcsecantSwitch: UISwitch!
    @IBOutlet weak var arccotangentSwitch: UISwitch!
    
    //grab the previously saved settings (if any)
    let defaultSettings = UserDefaults.standard
    
    //when the view loads...
    override open func viewDidLoad() {
        //call on the super class viewDidLoad method
        super.viewDidLoad()
        
        /**********SETTINGS FOR RIGHT-HAND VS LEFT-HAND MODE**********/
        //check if there are previously saved settings for right-hand vs. left-hand mode
        if (defaultSettings.object(forKey: "isLeftHandMode") != nil) {
            leftHandSwitch.setOn(defaultSettings.value(forKey: "isLeftHandMode") as! Bool, animated: true);
        }
        //if there are no previously saved settings, then by default use right-hand mode
        else
        {
            leftHandSwitch.setOn(false, animated: true);
            defaultSettings.setValue(leftHandSwitch.isOn, forKey: "isLeftHandMode");
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
        
        /**********SETTINGS FOR PROBLEMS USING SINE **********/
        //check if there are previously saved settings for sine
        if (defaultSettings.object(forKey: "sine") != nil)
        {
            sineSwitch.setOn(defaultSettings.value(forKey: "sine") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include sine problems
        else
        {
            sineSwitch.setOn(true, animated: true);
            defaultSettings.setValue(sineSwitch.isOn, forKey: "sine");
        }
        
        /**********SETTINGS FOR PROBLEMS USING COSINE **********/
        //check if there are previously saved settings for cosine
        if (defaultSettings.object(forKey: "cosine") != nil)
        {
            cosineSwitch.setOn(defaultSettings.value(forKey: "cosine") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include cosine problems
        else
        {
            cosineSwitch.setOn(true, animated: true);
            defaultSettings.setValue(cosineSwitch.isOn, forKey: "cosine");
        }
        
        /**********SETTINGS FOR PROBLEMS USING TANGENT **********/
        //check if there are previously saved settings for tangent
        if (defaultSettings.object(forKey: "tangent") != nil)
        {
            tangentSwitch.setOn(defaultSettings.value(forKey: "tangent") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include tangent problems
        else
        {
            tangentSwitch.setOn(true, animated: true);
            defaultSettings.setValue(tangentSwitch.isOn, forKey: "tangent");
        }
        
        /**********SETTINGS FOR PROBLEMS USING COSECANT **********/
        //check if there are previously saved settings for cosecant
        if (defaultSettings.object(forKey: "cosecant") != nil)
        {
            cosecantSwitch.setOn(defaultSettings.value(forKey: "cosecant") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, do not include cosecant problems
        else
        {
            cosecantSwitch.setOn(false, animated: true);
            defaultSettings.setValue(cosecantSwitch.isOn, forKey: "cosecant");
        }
        
        /**********SETTINGS FOR PROBLEMS USING SECANT **********/
        //check if there are previously saved settings for secant
        if (defaultSettings.object(forKey: "secant") != nil)
        {
            secantSwitch.setOn(defaultSettings.value(forKey: "secant") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, do not include secant problems
        else
        {
            secantSwitch.setOn(false, animated: true);
            defaultSettings.setValue(secantSwitch.isOn, forKey: "secant");
        }
        
        /**********SETTINGS FOR PROBLEMS USING COTANGENT **********/
        //check if there are previously saved settings for cotangent
        if (defaultSettings.object(forKey: "cotangent") != nil)
        {
            cotangentSwitch.setOn(defaultSettings.value(forKey: "cotangent") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, do not include cotangent problems
        else
        {
            cotangentSwitch.setOn(false, animated: true);
            defaultSettings.setValue(cotangentSwitch.isOn, forKey: "cotangent");
        }
        
        /**********SETTINGS FOR PROBLEMS USING ARCSINE **********/
        //check if there are previously saved settings for arcsine
        if (defaultSettings.object(forKey: "arcsine") != nil)
        {
            arcsineSwitch.setOn(defaultSettings.value(forKey: "arcsine") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include sine problems
        else
        {
            arcsineSwitch.setOn(true, animated: true);
            defaultSettings.setValue(arcsineSwitch.isOn, forKey: "arcsine");
        }
        
        /**********SETTINGS FOR PROBLEMS USING ARCCOSINE **********/
        //check if there are previously saved settings for arccosine
        if (defaultSettings.object(forKey: "arccosine") != nil)
        {
            arccosineSwitch.setOn(defaultSettings.value(forKey: "arccosine") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include arccosine problems
        else
        {
            arccosineSwitch.setOn(true, animated: true);
            defaultSettings.setValue(arccosineSwitch.isOn, forKey: "arccosine");
        }
        
        /**********SETTINGS FOR PROBLEMS USING ARCTANGENT **********/
        //check if there are previously saved settings for arctangent
        if (defaultSettings.object(forKey: "arctangent") != nil)
        {
            arctangentSwitch.setOn(defaultSettings.value(forKey: "arctangent") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include arctangent problems
        else
        {
            arctangentSwitch.setOn(true, animated: true);
            defaultSettings.setValue(arctangentSwitch.isOn, forKey: "arctangent");
        }
        
        /**********SETTINGS FOR PROBLEMS USING ARCCOSECANT **********/
        //check if there are previously saved settings for arccosecant
        if (defaultSettings.object(forKey: "arccosecant") != nil)
        {
            arccosecantSwitch.setOn(defaultSettings.value(forKey: "arccosecant") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include arccosecant problems
        else
        {
            arccosecantSwitch.setOn(true, animated: true);
            defaultSettings.setValue(arccosecantSwitch.isOn, forKey: "arccosecant");
        }
        
        /**********SETTINGS FOR PROBLEMS USING ARCSECANT **********/
        //check if there are previously saved settings for arcsecant
        if (defaultSettings.object(forKey: "arcsecant") != nil)
        {
            arcsecantSwitch.setOn(defaultSettings.value(forKey: "arcsecant") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include arcsecant problems
        else
        {
            arcsecantSwitch.setOn(true, animated: true);
            defaultSettings.setValue(arcsecantSwitch.isOn, forKey: "arcsecant");
        }
        
        /**********SETTINGS FOR PROBLEMS USING ARCCOTANGENT **********/
        //check if there are previously saved settings for arccotangent
        if (defaultSettings.object(forKey: "arccotangent") != nil)
        {
            arccotangentSwitch.setOn(defaultSettings.value(forKey: "arccotangent") as! Bool, animated: true);
        }
            //if there are no previously saved settings, then, by default, include arccotangent problems
        else
        {
            arccotangentSwitch.setOn(true, animated: true);
            defaultSettings.setValue(arccotangentSwitch.isOn, forKey: "arccotangent");
        }
    }

    //when the user moves out of the Settings scene, calculate the total number of problems the user will be able to choose from for quiz mode
    override open func viewWillDisappear(_ animated: Bool) {
        var total = 0;
        if(defaultSettings.value(forKey: "quadrantals") as! Bool)
        {
            total += 4;
        }
        if(defaultSettings.value(forKey: "quadI") as! Bool)
        {
            total += 3;
        }
        if(defaultSettings.value(forKey: "quadII") as! Bool)
        {
            total += 3;
        }
        if(defaultSettings.value(forKey: "quadIII") as! Bool)
        {
            total += 3;
        }
        if(defaultSettings.value(forKey: "quadIV") as! Bool)
        {
            total += 3;
        }
        if(defaultSettings.value(forKey: "radians") as! Bool && defaultSettings.value(forKey: "degrees") as! Bool)
        {
            total *= 2;
        }
        var multiplier = 0;
        if(defaultSettings.value(forKey: "sine") as! Bool)
        {
            multiplier += 1;
        }
        if(defaultSettings.value(forKey: "cosine") as! Bool)
        {
            multiplier += 1;
        }
        if(defaultSettings.value(forKey: "tangent") as! Bool)
        {
            multiplier += 1;
        }
        if(defaultSettings.value(forKey: "cosecant") as! Bool)
        {
            multiplier += 1;
        }
        if(defaultSettings.value(forKey: "secant") as! Bool)
        {
            multiplier += 1;
        }
        if(defaultSettings.value(forKey: "cotangent") as! Bool)
        {
            multiplier += 1;
        }
        total *= multiplier;

        if(defaultSettings.value(forKey: "arcsine") as! Bool)
        {
            if(defaultSettings.value(forKey: "quadrantals") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadI") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadIV") as! Bool)
            {
                total += 3;
            }
        }
        if(defaultSettings.value(forKey: "arccosine") as! Bool)
        {
            if(defaultSettings.value(forKey: "quadrantals") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadI") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadII") as! Bool)
            {
                total += 3;
            }
        }
        if(defaultSettings.value(forKey: "arctangent") as! Bool)
        {
            if(defaultSettings.value(forKey: "quadrantals") as! Bool)
            {
                total += 1;
            }
            if(defaultSettings.value(forKey: "quadI") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadIV") as! Bool)
            {
                total += 3;
            }
        }
        if(defaultSettings.value(forKey: "arccosecant") as! Bool)
        {
            if(defaultSettings.value(forKey: "quadrantals") as! Bool)
            {
                total += 2;
            }
            if(defaultSettings.value(forKey: "quadI") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadIV") as! Bool)
            {
                total += 3;
            }
        }
        if(defaultSettings.value(forKey: "arcsecant") as! Bool)
        {
            if(defaultSettings.value(forKey: "quadrantals") as! Bool)
            {
                total += 2;
            }
            if(defaultSettings.value(forKey: "quadI") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadII") as! Bool)
            {
                total += 3;
            }
        }
        if(defaultSettings.value(forKey: "arccotangent") as! Bool)
        {
            if(defaultSettings.value(forKey: "quadrantals") as! Bool)
            {
                total += 1;
            }
            if(defaultSettings.value(forKey: "quadI") as! Bool)
            {
                total += 3;
            }
            if(defaultSettings.value(forKey: "quadII") as! Bool)
            {
                total += 3;
            }
        }
        defaultSettings.setValue(total, forKey: "maxNumOfProblems");
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
    
    @IBAction func trigFunctionSwitchChanged(_ sender: UISwitch) {
        //if none of the trig functions are on, turn on the sine switch
        if(!sineSwitch.isOn && !cosineSwitch.isOn && !tangentSwitch.isOn && !cosecantSwitch.isOn && !secantSwitch.isOn && !cotangentSwitch.isOn && !arcsineSwitch.isOn && !arccosineSwitch.isOn && !arctangentSwitch.isOn && !arccosecantSwitch.isOn && !arcsecantSwitch.isOn && !arccotangentSwitch.isOn)
        {
            sineSwitch.setOn(true, animated: true);
            defaultSettings.setValue(sineSwitch.isOn, forKey: "sine");
        }
        //save the state of the quad1Switch to default settings
        //defaultSettings.setValue(sender.isOn, forKey: "quadIV");
        var keyName = ""
        switch(sender.tag)
        {
        case 0:
            keyName = "sine";
        case 1:
            keyName = "cosine";
        case 2:
            keyName = "tangent";
        case 3:
            keyName = "cosecant";
        case 4:
            keyName = "secant";
        case 5:
            keyName = "cotangent";
        case 6:
            keyName = "arcsine";
        case 7:
            keyName = "arccosine";
        case 8:
            keyName = "arctangent";
        case 9:
            keyName = "arccosecant";
        case 10:
            keyName = "arcsecant";
        case 11:
            keyName = "arccotangent";
        case 12:
            keyName = "isLeftHandMode";
        default: break
        }
        defaultSettings.setValue(sender.isOn, forKey: keyName);
    }
    
    
}
