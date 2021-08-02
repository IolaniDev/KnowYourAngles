//
//  ProblemSet.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/2/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import Foundation

struct ProblemSet
{
    var setOfProblems : [Problem]
    
    mutating func getRandomProblem() -> Problem {
        return setOfProblems.remove(at: Int(arc4random_uniform(UInt32(setOfProblems.count))))
    }
    
    func checkAnswer() -> Bool {
        return true
    }
}
