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
    
    override func drawRect(rect: CGRect) {
        let image = UIImage(named: "Wrong")!;
        let drawPoint = CGPointMake(100, 100)
        image.drawAtPoint(drawPoint)
    }
}
