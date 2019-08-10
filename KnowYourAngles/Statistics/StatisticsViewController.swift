//
//  StatisticsViewController.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 7/16/18.
//  Copyright © 2018 Iolani School. All rights reserved.
//

import Foundation

class StatisticsViewController : UIViewController {
    
    //connections to each label in the Statistics Scene
    @IBOutlet weak var radianPercentage: UILabel!
    @IBOutlet weak var degreePercentage: UILabel!
    @IBOutlet weak var radianAndDegreePercentage: UILabel!
    @IBOutlet weak var sinePercentage: UILabel!
    @IBOutlet weak var cosinePercentage: UILabel!
    @IBOutlet weak var tangentPercentage: UILabel!
    @IBOutlet weak var cosecantPercentage: UILabel!
    @IBOutlet weak var secantPercentage: UILabel!
    @IBOutlet weak var cotangentPercentage: UILabel!
    @IBOutlet weak var arcsinePercentage: UILabel!
    @IBOutlet weak var arccosinePercentage: UILabel!
    @IBOutlet weak var arctangentPercentage: UILabel!
    @IBOutlet weak var arccosecantPercentage: UILabel!
    @IBOutlet weak var arcsecantPercentage: UILabel!
    @IBOutlet weak var arccotangentPercentage: UILabel!
    
    //grab the previously saved settings (if any)
    let defaultSettings = UserDefaults.standard
    
    override func viewDidLoad() {
        //if there is data recorded for problems measured in radians, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "radianStatsNumTotal") as! Int != 0)
        {
            radianPercentage.text = String((defaultSettings.value(forKey: "radianStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "radianStatsNumTotal") as! Float) * 100) + "%";
        }
        //otherwise set the percentage to zero
        else
        {
            radianPercentage.text = "0%";
        }
        
        //if there is data recorded for problems measured in degrees, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "degreeStatsNumTotal") as! Int != 0)
        {
            degreePercentage.text = String((defaultSettings.value(forKey: "degreeStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "degreeStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            degreePercentage.text = "0%";
        }
        
        //if there is data recorded for problems measured in radians and degrees, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "radianAndDegreeStatsNumTotal") as! Int != 0)
        {
            radianAndDegreePercentage.text = String((defaultSettings.value(forKey: "radianAndDegreeStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "radianAndDegreeStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            radianAndDegreePercentage.text = "0%";
        }
        
        //if there is data recorded for sine problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "sineStatsNumTotal") as! Int != 0)
        {
            sinePercentage.text = String((defaultSettings.value(forKey: "sineStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "sineStatsNumTotal") as! Float) * 100) + "%";
        }
        //otherwise set the percentage to zero
        else
        {
            sinePercentage.text = "0%";
        }
        
        //if there is data recorded for cosine problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "cosineStatsNumTotal") as! Int != 0)
        {
            cosinePercentage.text = String((defaultSettings.value(forKey: "cosineStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "cosineStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            cosinePercentage.text = "0%";
        }
        
        //if there is data recorded for tangent problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "tangentStatsNumTotal") as! Int != 0)
        {
            tangentPercentage.text = String((defaultSettings.value(forKey: "tangentStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "tangentStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            tangentPercentage.text = "0%";
        }
        
        //if there is data recorded for cosecant problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "cosecantStatsNumTotal") as! Int != 0)
        {
            cosecantPercentage.text = String((defaultSettings.value(forKey: "cosecantStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "cosecantStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            cosecantPercentage.text = "0%";
        }
        
        //if there is data recorded for secant problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "secantStatsNumTotal") as! Int != 0)
        {
            secantPercentage.text = String((defaultSettings.value(forKey: "secantStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "secantStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            secantPercentage.text = "0%";
        }
        
        //if there is data recorded for cotangent problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "cotangentStatsNumTotal") as! Int != 0)
        {
            cotangentPercentage.text = String((defaultSettings.value(forKey: "cotangentStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "cotangentStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            cotangentPercentage.text = "0%";
        }
        
        //if there is data recorded for arcsine problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "arcsineStatsNumTotal") as! Int != 0)
        {
            arcsinePercentage.text = String((defaultSettings.value(forKey: "arcsineStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "arcsineStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            arcsinePercentage.text = "0%";
        }
        
        //if there is data recorded for arccosine problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "arccosineStatsNumTotal") as! Int != 0)
        {
            arccosinePercentage.text = String((defaultSettings.value(forKey: "arccosineStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "arccosineStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            arccosinePercentage.text = "0%";
        }
        
        //if there is data recorded for arctangent problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "arctangentStatsNumTotal") as! Int != 0)
        {
            arctangentPercentage.text = String((defaultSettings.value(forKey: "arctangentStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "arctangentStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            arctangentPercentage.text = "0%";
        }
        
        //if there is data recorded for arccosecant problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "arccosecantStatsNumTotal") as! Int != 0)
        {
            arccosecantPercentage.text = String((defaultSettings.value(forKey: "arccosecantStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "arccosecantStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            arccosecantPercentage.text = "0%";
        }
        
        //if there is data recorded for arcsecant problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "arcsecantStatsNumTotal") as! Int != 0)
        {
            arcsecantPercentage.text = String((defaultSettings.value(forKey: "arcsecantStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "arcsecantStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            arcsecantPercentage.text = "0%";
        }
        
        //if there is data recorded for arccotangent problems, then use it to calculate a percentage
        if(defaultSettings.value(forKey: "arccotangentStatsNumTotal") as! Int != 0)
        {
            arccotangentPercentage.text = String((defaultSettings.value(forKey: "arccotangentStatsNumCorrect") as! Float) / (defaultSettings.value(forKey: "arccotangentStatsNumTotal") as! Float) * 100) + "%";
        }
            //otherwise set the percentage to zero
        else
        {
            arccotangentPercentage.text = "0%";
        }
    }
    
    @IBAction func resetStats(_ sender: UIButton)
    {
        defaultSettings.setValue(0, forKey: "radianStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "radianStatsNumTotal");
        radianPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "degreeStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "degreeStatsNumTotal");
        degreePercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "radianAndDegreeStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "radianAndDegreeStatsNumTotal");
        radianAndDegreePercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "sineStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "sineStatsNumTotal");
        sinePercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "cosineStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "cosineStatsNumTotal");
        cosinePercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "tangentStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "tangentStatsNumTotal");
        tangentPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "cosecantStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "cosecantStatsNumTotal");
        cosecantPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "secantStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "secantStatsNumTotal");
        secantPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "cotangentStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "cotangentStatsNumTotal");
        cotangentPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "arcsineStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "arcsineStatsNumTotal");
        arcsinePercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "arccosineStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "arccosineStatsNumTotal");
        arccosinePercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "arctangentStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "arctangentStatsNumTotal");
        arctangentPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "arccosecantStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "arccosecantStatsNumTotal");
        arccosecantPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "arcsecantStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "arcsecantStatsNumTotal");
        arcsecantPercentage.text = "0%";
        
        defaultSettings.setValue(0, forKey: "arccotangentStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "arccotangentStatsNumTotal");
        arccotangentPercentage.text = "0%";
    }
}
