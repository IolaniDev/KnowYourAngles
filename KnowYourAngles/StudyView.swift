//
//  StudyView.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 8/1/18.
//  Copyright © 2018 Iolani School. All rights reserved.
//

import Foundation

class StudyView : UIView {
    
    // label for number of correctly answered questions
    @IBOutlet weak var numCorrect: UILabel!
    // label for number of incorrectly answered questions
    @IBOutlet weak var numIncorrect: UILabel!
    // image of current problem.
    @IBOutlet weak var problemImage: UIImageView!
    @IBOutlet weak var problemAndAnswerStackView: UIStackView!
    
    // imageview to hold the red x (meaning incorrect)
    let wrongImageView = UIImageView(image: UIImage(named: "Wrong")!);
    // imageview to hold the green check (meaning correct)
    let correctImageView = UIImageView(image: UIImage(named: "Correct")!);
    // reference the mathview for positioning of the correct and incorrect marks
    @IBOutlet weak var workArea: MAWMathView!
   
    // function called when user answers incorrectly
    func drawWrong(){
        // sets the position of the red x
        wrongImageView.center.x = self.convert(workArea.frame, from: problemAndAnswerStackView).midX;
        wrongImageView.center.y = self.convert(workArea.frame, from: problemAndAnswerStackView).midY;
        
        // add red x to the screen
        self.addSubview(wrongImageView);
        
        // make sure the red x is in front
        self.bringSubview(toFront: wrongImageView);
        
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
        self.bringSubview(toFront: correctImageView);
        
        // animate the green check fading away
        self.correctImageView.alpha = 255;
        UIView.animate(withDuration: 0.5, animations: {
            self.correctImageView.alpha = 0
        })
    }
}
