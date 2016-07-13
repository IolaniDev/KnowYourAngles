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
    
    var NumOfProblems : Int = 10;
    
    var settingsData : Settings!;
    
    @IBOutlet weak var totalNumOfProblems: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    
    override public func viewDidLoad() {
        settingsData = Settings(num: 10, isTimer: false, time: 1, isDeg: false, isRad: false, isReciprocal: false)!;
        totalNumOfProblems.text = "Number of Problems: \(NumOfProblems)";
        timerSlider.hidden = false;
        timerLabel.text = "Timer: 30 seconds";
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        totalNumOfProblems.text = "Number of Problems: \(lroundf(sender.value))";
        NumOfProblems = lroundf(sender.value);
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
    
    func saveSettings(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(settingsData, toFile: Settings.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func loadSettings() -> Settings? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Settings.ArchiveURL.path!) as? Settings;
    }
}