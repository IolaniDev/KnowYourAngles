//
//  FinishScreenViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/8/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation

public class FinishScreenViewController: UIViewController{
    
    var finalScore : Int = 0;
    var totalNum : Int = 0;
    var finalTime = (0,0);
    var isTimerOn = false;
    
    @IBOutlet weak var finishScore: UILabel!
    @IBOutlet weak var finishTime: UILabel!
    
    override public func viewDidLoad() {
        finishScore.text = "Score: \(finalScore) out of \(totalNum)";
        if (isTimerOn)
        {
            //output the time used to answer the questions
            finishTime.text = String(format: "Time: %02d:%02d", finalTime.0, finalTime.1);
        }
        else
        {
            finishTime.text = "";
        }
    }
}
