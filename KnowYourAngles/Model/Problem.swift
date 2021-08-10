//
//  Problem.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 6/25/18.
//  Copyright © 2018 Iolani School. All rights reserved.
//

import Foundation

struct Problem : Hashable, Codable, Identifiable{
    //id is the name of the problem's image
    var id : String;
    var correctAnswer : String;
    var answerImageName : String;
    var otherCorrectAnswer : String;
    var otherAnswerImageName : String;
    var typeOfProblem : String;
    var unitsOfAngle : angleUnits;
    var problemQuadrant : quadrant;
    
    enum angleUnits : String, CaseIterable, Codable{
        case radians = "radians"
        case degrees = "degrees"
        case radiansAndDegrees = "radiansAndDegrees"
    }
    
    enum quadrant : String, CaseIterable, Codable{
        case I = "I"
        case II = "II"
        case III = "III"
        case IV = "IV"
        case quadrantal = "quadrantal"
    }
    
    init()
    {
        self.id = ""
        self.correctAnswer = ""
        self.answerImageName = ""
        self.otherCorrectAnswer = ""
        self.otherAnswerImageName = ""
        self.typeOfProblem = ""
        self.unitsOfAngle = angleUnits.radians
        self.problemQuadrant = quadrant.quadrantal
    }
    
    init(id : String, correctAnswer : String, answerImageName : String, otherCorrectAnswer : String, otherAnswerImageName : String, typeOfProblem:String, unitsOfAngle:angleUnits, problemQuadrant:quadrant) {
        self.id = id
        self.correctAnswer = correctAnswer
        self.answerImageName = answerImageName
        self.otherCorrectAnswer = otherCorrectAnswer
        self.otherAnswerImageName = otherAnswerImageName
        self.typeOfProblem = typeOfProblem
        self.unitsOfAngle = unitsOfAngle
        self.problemQuadrant = problemQuadrant
    }
    /*init(problemImageName : String, correctAnswer : String, answerImageName : String, typeOfProblem : String, unitsOfAngle : angleUnits, problemQuadrant : quadrant) {
        self.problemImageName = problemImageName;
        self.correctAnswer = correctAnswer;
        self.answerImageName = answerImageName;
        self.typeOfProblem = typeOfProblem;
        self.unitsOfAngle = unitsOfAngle;
        self.problemQuadrant = problemQuadrant
    }*/
}

/*class InverseProblem : Problem{
    //for inverse problems, the variable correctAnswer will be measured in radians and otherCorrectAnswer will be measured in degrees
    let otherCorrectAnswer : String;
    let otherAnswerImageName : String;
    
    init(problemImageName: String, correctAnswer: String, answerImageName : String, otherCorrectAnswer : String, otherAnswerImageName : String, typeOfProblem: String, unitsOfAngle: angleUnits, problemQuadrant: quadrant) {
        self.otherCorrectAnswer = otherCorrectAnswer;
        self.otherAnswerImageName = otherAnswerImageName;
        super.init(problemImageName: problemImageName, correctAnswer: correctAnswer, answerImageName: answerImageName, typeOfProblem: typeOfProblem, unitsOfAngle: unitsOfAngle, problemQuadrant: problemQuadrant);
    }
}*/
