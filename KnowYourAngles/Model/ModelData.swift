//
//  ModelData.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/27/21.
//  Updated by Erin Nagoshi on 7/14/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//ModelData holds information regarding the set of problems
final class ModelData : ObservableObject {
    //array of Problems loaded from a json file
    @Published var allProblems : [Problem] = (load("ProblemData.json") as [Problem]).shuffled()
    
    //set the current problem to a dummy
    var currentProblem : Problem = Problem()
    //index indicates which problem is currently being displayed from the allProblems array
    var index = 0
    //finished indicates whether all of the problems selected have been answered
    @Published var finished = false
    //hasStarted indicates whether the user has been presented any problems yet - used in PlayView
    @Published var hasStarted = false
    
    /* variables for Statistics Collection*/
    var numberOfCorrectAnswers = 0
    var numberOfDegreeProblemsPresented = 0
    var numberOfCorrectDegreeAnswers = 0
    var numberOfRadiansProblemsPresented = 0
    var numberOfCorrectRadiansAnswers = 0
    var numberOfSineProblemsPresented = 0
    var numberOfCorrectSineAnswers = 0
    var numberOfCosineProblemsPresented = 0
    var numberOfCorrectCosineAnswers = 0
    var numberOfTangentProblemsPresented = 0
    var numberOfCorrectTangentAnswers = 0
    var numberOfCosecantProblemsPresented = 0
    var numberOfCorrectCosecantAnswers = 0
    var numberOfSecantProblemsPresented = 0
    var numberOfCorrectSecantAnswers = 0
    var numberOfCotangentProblemsPresented = 0
    var numberOfCorrectCotangentAnswers = 0
    var numberOfArcsineProblemsPresented = 0
    var numberOfCorrectArcsineAnswers = 0
    var numberOfArccosineProblemsPresented = 0
    var numberOfCorrectArccosineAnswers = 0
    var numberOfArctangentProblemsPresented = 0
    var numberOfCorrectArctangentAnswers = 0
    var numberOfArccosecantProblemsPresented = 0
    var numberOfCorrectArccosecantAnswers = 0
    var numberOfArcsecantProblemsPresented = 0
    var numberOfCorrectArcsecantAnswers = 0
    var numberOfArccotangentProblemsPresented = 0
    var numberOfCorrectArccotangentAnswers = 0
    
    //reload all Problems from the json file and reset other variables
    func resetLoadedProblems() {
        allProblems = (load("ProblemData.json") as [Problem]).shuffled()
        index = 0
        finished = false
        numberOfCorrectAnswers = 0
        numberOfDegreeProblemsPresented = 0
        numberOfCorrectDegreeAnswers = 0
        numberOfRadiansProblemsPresented = 0
        numberOfCorrectRadiansAnswers = 0
        numberOfSineProblemsPresented = 0
        numberOfCorrectSineAnswers = 0
        numberOfCosineProblemsPresented = 0
        numberOfCorrectCosineAnswers = 0
        numberOfTangentProblemsPresented = 0
        numberOfCorrectTangentAnswers = 0
        numberOfCosecantProblemsPresented = 0
        numberOfCorrectCosecantAnswers = 0
        numberOfSecantProblemsPresented = 0
        numberOfCorrectSecantAnswers = 0
        numberOfCotangentProblemsPresented = 0
        numberOfCorrectCotangentAnswers = 0
        numberOfArcsineProblemsPresented = 0
        numberOfCorrectArcsineAnswers = 0
        numberOfArccosineProblemsPresented = 0
        numberOfCorrectArccosineAnswers = 0
        numberOfArctangentProblemsPresented = 0
        numberOfCorrectArctangentAnswers = 0
        numberOfArccosecantProblemsPresented = 0
        numberOfCorrectArccosecantAnswers = 0
        numberOfArcsecantProblemsPresented = 0
        numberOfCorrectArcsecantAnswers = 0
        numberOfArccotangentProblemsPresented = 0
        numberOfCorrectArccotangentAnswers = 0
    }
    
    //set the current problem, unless the user has answered all of the problems
    func setCurrentProblem() -> Problem {
        if(!finished)
        {
            currentProblem = allProblems[index]
        }
        return currentProblem
    }
    
    //get the next problem in the array or indicate the user is finished
    func getNextProblem(){
        index = index + 1
        if(index < allProblems.count)
        {
            currentProblem = allProblems[index]
        }
        else
        {
            currentProblem = Problem()
        }
    }
    
    //check the user's answer for correctness
    func checkAnswer(submittedAnswer: String)->Bool {
        if(currentProblem.otherCorrectAnswer.lowercased() != "")
        {
            if(currentProblem.correctAnswer.lowercased() == submittedAnswer.lowercased() || currentProblem.otherCorrectAnswer.lowercased() == submittedAnswer.lowercased())
            {
                numberOfCorrectAnswers += 1
                return true
            }
            else
            {
                return false
            }
        }
        else if (currentProblem.correctAnswer.lowercased() == submittedAnswer.lowercased())
        {
            numberOfCorrectAnswers += 1
            return true
        }
        else
        {
            return false
        }
    }
}

//function for loading Problems from a json file
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
