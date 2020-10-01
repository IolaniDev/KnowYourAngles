//
//  MainView.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 11/16/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    // label for number of remaining problems to be asked
    @IBOutlet weak var numRemaining: UILabel!
    // label for number of correctly answered questions
    @IBOutlet weak var numCorrect: UILabel!
    // image of current problem.
    @IBOutlet weak var problemImage: UIImageView!
    
    // label that displays digital countdown
    @IBOutlet weak var countdownTimer: UILabel!
    
    //creates a timer
    var timer = Timer();
    
    //time limit variables for the timer
    var maxSec : Float = 30.0;
    var maxMin : Float = 0.0;
    var numSec = 30;
    var numMin = 0;
    
    //boolean representing whether the countdown clock should be visible or not
    var isClockVisibile = false;
    
    //boolean representing whether the user finished the desired amount of questions or ran out of time before moving to end screen.
    var isOutOfTime = false;
    
    @IBOutlet weak var problemAndAnswerStackView: UIStackView!
    // reference the mathview for positioning of the correct and incorrect marks
    @IBOutlet weak var workArea: InputView!
    // imageview to hold the red x (meaning incorrect)
    let wrongImageView = UIImageView(image: UIImage(named: "Wrong")!);
    // imageview to hold the green check (meaning correct)
    let correctImageView = UIImageView(image: UIImage(named: "Correct")!);

    //another initialize
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder);
        
        //load previously saved settings (if there are any)
        let savedSettings = UserDefaults.standard
        
        /**********SETTING UP THE TIME LIMIT**********/
        //if there are previously saved settings for the timer ...
        if(savedSettings.object(forKey: "isTimerOn") != nil)
        {
            //if the timer should be on...
            if(savedSettings.object(forKey: "isTimerOn") as! Bool)
            {
                //check if there are previously saved time limit settings
                if (savedSettings.object(forKey: "amtTimeMin") != nil && savedSettings.object(forKey: "amtTimeSec") != nil)
                {
                    numMin = savedSettings.value(forKey: "amtTimeMin") as! Int;
                    numSec = savedSettings.value(forKey: "amtTimeSec") as! Int;
                }
                //otherwise use the default value of 30 seconds and save to settings.
                else
                {
                    numMin = 0;
                    numSec = 30;
                    savedSettings.setValue(numMin, forKey: "amtTimeMin");
                    savedSettings.setValue(numSec, forKey: "amtTimeSec");
                }
                maxMin = Float(numMin);
                maxSec = Float(numSec);
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCountDown), userInfo: nil, repeats: true);
                isClockVisibile = true;
            }
            else
            {
                savedSettings.setValue(0, forKey: "amtTimeMin");
                savedSettings.setValue(0, forKey: "amtTimeSec");
                isClockVisibile = false;
            }
        }
        else
        {
            savedSettings.setValue(false, forKey: "isTimerOn");
            savedSettings.setValue(0, forKey: "amtTimeMin");
            savedSettings.setValue(0, forKey: "amtTimeSec");
            isClockVisibile = false;
        }
    }
    
    @objc func updateCountDown()
    { 
        //decrease the timer by one second
        numSec -= 1;
        //if we've reached the end of a minute, subtract a minute and reset seconds to 59.
        if(numSec == -1 && numMin > 0)
        {
            numMin -= 1;
            numSec = 59;
        }
        //if we're in the final 10 seconds, change the color of the text to red
        if(numMin == 0 && numSec <= 10)
        {
            countdownTimer.textColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 1);
        }
        else
        {
            countdownTimer.textColor = UIColor.init(red: 40/255, green: 204/255, blue: 198/255, alpha: 1);
        }
        countdownTimer.text = String(format:"%02d:%02d", numMin, numSec);
        if(numMin == 0 && numSec == 0)
        {
            //segue to finish screen.
            isOutOfTime = true;
            let segueNow = "segueNow";
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: segueNow), object: self);
        }
        setNeedsDisplay();
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.*/
    /*override func draw(_ rect: CGRect)
    {
        //if the timer should be on...
        if(isClockVisibile)
        {
            countdownTimer.isHidden = false;
            if(numMin == 0 && numSec <= 10)
            {
                countdownTimer.textColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 1);
            }
            else
            {
                countdownTimer.textColor = UIColor.init(red: 40/255, green: 204/255, blue: 198/255, alpha: 1);
            }
            countdownTimer.text = String(format:"%02d:%02d", numMin, numSec);
        }
        else{
            countdownTimer.isHidden = true;
        }
    }*/
    
    // function called when user answers incorrectly
    func drawWrong(){
        // sets the position of the red x
        wrongImageView.center.x = self.convert(workArea.frame, from: problemAndAnswerStackView).midX;
        wrongImageView.center.y = self.convert(workArea.frame, from: problemAndAnswerStackView).midY;
        
        // add red x to the screen
        self.addSubview(wrongImageView);
        
        // make sure the red x is in front
        self.bringSubviewToFront(wrongImageView);
    
        // animate the red x fading away
        self.wrongImageView.alpha = 255;
        UIView.animate(withDuration: 0.5, animations: {
            self.wrongImageView.alpha = 0
        })
    }
    
    // function called when user answers correctly
    func drawRight(){
        // sets the position of the green check
        correctImageView.center.x = self.convert(workArea.frame, from: problemAndAnswerStackView).midX;
        correctImageView.center.y = self.convert(workArea.frame, from: problemAndAnswerStackView).midY;
        
        // add the green check to the screen
        self.addSubview(correctImageView);
        self.bringSubviewToFront(correctImageView);
        
        // animate the green check fading away
        self.correctImageView.alpha = 255;
        UIView.animate(withDuration: 0.5, animations: {
            self.correctImageView.alpha = 0
        })
    }
}
