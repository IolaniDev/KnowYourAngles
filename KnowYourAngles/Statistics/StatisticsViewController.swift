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
    
    //grab the previously saved settings (if any)
    let defaultSettings = UserDefaults.standard
    
    override func viewDidLoad() {
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
    }
    
    @IBAction func resetStats(_ sender: UIButton)
    {
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
        
        defaultSettings.setValue(0, forKey: "tangentStatsNumCorrect");
        defaultSettings.setValue(0, forKey: "tangentStatsNumTotal");
        tangentPercentage.text = "0%";
    }
}
