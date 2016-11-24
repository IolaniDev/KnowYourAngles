//
//  CorrectingMarks.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 11/16/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import UIKit

class CorrectingMarks: UIView {

    @IBOutlet weak var countdownTimer: UILabel!
    
    let segueNow = "segueNow";
    
    //creates a timer
    var timer = NSTimer();
    //time limit variables for the timer
    var numSec = 30;
    var numMin = 0;
    //boolean representing whether the user finished the desired amount of questions or ran out of time before moving to end screen.
    var isOutOfTime = false;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        //load previously saved settings (if there are any)
        let savedSettings = NSUserDefaults.standardUserDefaults()
        
        //draw the /**********SETTING UP THE TIME LIMIT**********/
        //if there are previously saved settings for the timer ...
        if(savedSettings.objectForKey("isTimerOn") != nil)
        {
            //if the timer should be on...
            if(savedSettings.objectForKey("isTimerOn") as! Bool)
            {
                //check if there are previously saved time limit settings
                if (savedSettings.objectForKey("amtTimeMin") != nil && savedSettings.objectForKey("amtTimeSec") != nil)
                {
                    numMin = savedSettings.valueForKey("amtTimeMin") as! Int;
                    numSec = savedSettings.valueForKey("amtTimeSec") as! Int;
                }
                    //otherwise use the default value of 30 seconds and save to settings.
                else
                {
                    numMin = 0;
                    numSec = 30;
                    savedSettings.setValue(numMin, forKey: "amtTimeMin");
                    savedSettings.setValue(numSec, forKey: "amtTimeSec");
                }
                timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.updateCountDown), userInfo: nil, repeats: true);
                
            }
        }
        
    }
    
    func updateCountDown()
    {
        numSec -= 1;
        if(numSec == -1 && numMin > 0)
        {
            numMin -= 1;
            numSec = 59;
        }
        countdownTimer.text = String(format:"%02d:%02d", numMin, numSec);
        if(numMin == 0 && numSec == 0)
        {
            //segue to finish screen.
            isOutOfTime = true;
            NSNotificationCenter.defaultCenter().addObserver(self, selector: nil, name: "segueNow", object: nil);
            NSNotificationCenter.defaultCenter().postNotificationName(segueNow, object: self);
        }
        setNeedsDisplay();
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.*/
    override func drawRect(rect: CGRect) {
        //load previously saved settings (if there are any)
        let savedSettings = NSUserDefaults.standardUserDefaults()
        
        //draw the /**********SETTING UP THE TIME LIMIT**********/
        //if there are previously saved settings for the timer ...
        if(savedSettings.objectForKey("isTimerOn") != nil)
        {
            //if the timer should be on...
            if(savedSettings.objectForKey("isTimerOn") as! Bool)
            {
                countdownTimer.hidden = false;
            }    //if the timer should be off...
            else
            {
                countdownTimer.hidden = true;
            }
        }
        else
        {
            countdownTimer.hidden = true;
        }
        
        let timerRect = CGRectMake(workArea.frame.origin.x+workArea.frame.width/2-100,workArea.frame.origin.y-600,200,200);
        
        countdownTimer.textColor = UIColor.blackColor();
        countdownTimer.text = String(format:"%02d:%02d", numMin, numSec);
        
        //draw the background of the timer
        var path = UIBezierPath(arcCenter: CGPoint(x:timerRect.origin.x+100, y:timerRect.origin.y+100), radius: 50, startAngle: 0, endAngle: 2*CGFloat(M_PI), clockwise: true)
        path.lineWidth = 100;
        UIColor.init(red: 40/255, green: 204/255, blue: 198/255, alpha: 1).setStroke();
        path.stroke();
        
        let totalSec = Float(60*numMin+numSec);
        let maxMin = savedSettings.valueForKey("amtTimeMin") as! Float;
        let maxSec = savedSettings.valueForKey("amtTimeSec") as! Float;
        let maxTotal = maxMin * 60 + maxSec;
        
        let fraction : CGFloat = CGFloat.init((maxTotal - totalSec) / maxTotal);
        NSLog("\(fraction)");
        
        path = UIBezierPath(arcCenter: CGPoint(x:timerRect.origin.x+100, y:timerRect.origin.y+100), radius: 50, startAngle: -1*CGFloat(M_PI)/2, endAngle: -1*CGFloat(M_PI)/2+fraction*2*CGFloat(M_PI),clockwise: true)
        path.lineWidth = 100;
        UIColor.grayColor().setStroke();
        
        path.stroke();
    }
    
    // reference the mathview for positioning of the correct and incorrect marks
    @IBOutlet weak var workArea: MAWMathView!
    //imageview to hold the red x (meaning incorrect)
    let wrongImageView = UIImageView(image: UIImage(named: "Wrong")!);
    // imageview to hold the green check (meaning correct)
    let correctImageView = UIImageView(image: UIImage(named: "Correct")!);
    
    // function called when user answers incorrectly
    func drawWrong(){
        //sets the position of the red x
        wrongImageView.frame.origin.x = workArea.frame.origin.x + (workArea.frame.width/2) - wrongImageView.frame.width/2;
        wrongImageView.frame.origin.y = workArea.frame.origin.y + (workArea.frame.height/2) - wrongImageView.frame.height/2;
        // add red x to the screen
        self.addSubview(wrongImageView);
        // make sure the red x is in front
        self.bringSubviewToFront(wrongImageView);
    
        //animate the red x fading away
        self.wrongImageView.alpha = 255;
        UIView.animateWithDuration(0.5, animations: {
            self.wrongImageView.alpha = 0
        })
    }
    
    // function called when user answers correctly
    func drawRight(){
        // sets the position of the green check
        correctImageView.frame.origin.x = workArea.frame.origin.x + (workArea.frame.width/2) - correctImageView.frame.width/2;
        correctImageView.frame.origin.y = workArea.frame.origin.y + (workArea.frame.height/2) - correctImageView.frame.height/2;
        // add the green check to the screen
        self.addSubview(correctImageView);
        self.bringSubviewToFront(correctImageView);
        
        // animate the green check fading away
        self.correctImageView.alpha = 255;
        UIView.animateWithDuration(0.5, animations: {
            self.correctImageView.alpha = 0
        })
    }
}
