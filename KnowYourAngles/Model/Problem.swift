//
//  Problem.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 6/25/18.
//  Updated by Erin Nagoshi on 7/14/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import Foundation

//Definition of a "Problem"
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
}
