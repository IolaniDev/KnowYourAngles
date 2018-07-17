//
//  Problem.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 6/25/18.
//  Copyright © 2018 Iolani School. All rights reserved.
//

import Foundation

class Problem{
    let problemImageName : String;
    let correctAnswer : String;
    let answerImageName : String;
    let typeOfProblem : String;
    let unitsOfAngle : angleUnits;
    let problemQuadrant : quadrant;
    
    enum angleUnits{
        case radians
        case degrees
        case radiansAndDegrees
    }
    
    enum quadrant{
        case I
        case II
        case III
        case IV
        case quadrantal
    }
    
    init(problemImageName : String, correctAnswer : String, answerImageName : String, typeOfProblem : String, unitsOfAngle : angleUnits, problemQuadrant : quadrant) {
        self.problemImageName = problemImageName;
        self.correctAnswer = correctAnswer;
        self.answerImageName = answerImageName;
        self.typeOfProblem = typeOfProblem;
        self.unitsOfAngle = unitsOfAngle;
        self.problemQuadrant = problemQuadrant
    }
}

class InverseProblem : Problem{
    //for inverse problems, the variable correctAnswer will be measured in radians and otherCorrectAnswer will be measured in degrees
    let otherCorrectAnswer : String;
    let otherAnswerImageName : String;
    
    init(problemImageName: String, correctAnswer: String, answerImageName : String, otherCorrectAnswer : String, otherAnswerImageName : String, typeOfProblem: String, unitsOfAngle: angleUnits, problemQuadrant: quadrant) {
        self.otherCorrectAnswer = otherCorrectAnswer;
        self.otherAnswerImageName = otherAnswerImageName;
        super.init(problemImageName: problemImageName, correctAnswer: correctAnswer, answerImageName: answerImageName, typeOfProblem: typeOfProblem, unitsOfAngle: unitsOfAngle, problemQuadrant: problemQuadrant);
    }
}
