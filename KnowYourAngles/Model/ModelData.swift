//
//  ModelData.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/27/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class ModelData : ObservableObject {
    //array of Problems loaded from a json file
    @Published var allProblems : [Problem] = (load("ProblemData.json") as [Problem]).shuffled()
    
    //set the current problem to a dummy
    var currentProblem : Problem = Problem()
    //index indicates which problem is currently being displayed from the allProblems array
    var index = 0
    //finished indicates whether all of the problems selected have been answered
    @Published var finished = false
    var numberOfCorrectAnswers = 0
    
    //reload all Problems from the json file and reset other variables
    func resetLoadedProblems() {
        allProblems = (load("ProblemData.json") as [Problem]).shuffled()
        index = 0
        finished = false
        numberOfCorrectAnswers = 0
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
    func getNextProblem() {
        index = index + 1
        if(index < allProblems.count)
        {
            currentProblem = allProblems[index]
        }
        else
        {
            finished = true
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
