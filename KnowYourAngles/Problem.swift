//
//  Problem.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 6/25/18.
//  Copyright © 2018 Iolani School. All rights reserved.
//

import Foundation

class Problem{
    let imageName : String;
    let correctAnswer : String;
    let typeOfProblem : String;
    let unitsOfAngle : angleUnits;
    let problemQuadrant : quadrant;
    
    enum angleUnits{
        case radians
        case degrees
    }
    
    enum quadrant{
        case I
        case II
        case III
        case IV
    }
    
    init(imageName : String, correctAnswer : String, typeOfProblem : String, unitsOfAngle : angleUnits, problemQuadrant : quadrant) {
        self.imageName = imageName;
        self.correctAnswer = correctAnswer;
        self.typeOfProblem = typeOfProblem;
        self.unitsOfAngle = unitsOfAngle;
        self.problemQuadrant = problemQuadrant
    }
}
