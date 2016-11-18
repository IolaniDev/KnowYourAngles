//
//  CorrectingMarks.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 11/16/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import UIKit

class CorrectingMarks: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.*/
    
    @IBOutlet weak var workArea: MAWMathView!
    
    /*override func drawRect(rect: CGRect) {
        
    }*/
    
    func drawWrong(){
        let image = UIImage(named: "Wrong")!;
        
        let imgView = UIImageView(image: image)
        imgView.frame.origin.x = workArea.frame.origin.x + (workArea.frame.width/2) - imgView.frame.width/2;
        imgView.frame.origin.y = workArea.frame.origin.y + (workArea.frame.height/2) - imgView.frame.height/2;
        self.addSubview(imgView);
        self.bringSubviewToFront(imgView);
        
        UIView.animateWithDuration(0.5, animations: {
            imgView.alpha = 0
        })
        NSLog("\(self.subviews.count)");
    }
    
    func drawRight(){
        let image = UIImage(named: "Correct")!;
        
        let imgView = UIImageView(image: image)
        imgView.frame.origin.x = workArea.frame.origin.x + (workArea.frame.width/2) - imgView.frame.width/2;
        imgView.frame.origin.y = workArea.frame.origin.y + (workArea.frame.height/2) - imgView.frame.height/2;
        self.addSubview(imgView);
        self.bringSubviewToFront(imgView);
        
        UIView.animateWithDuration(0.5, animations: {
            imgView.alpha = 0
        })
         NSLog("\(self.subviews.count)");
    }
}
