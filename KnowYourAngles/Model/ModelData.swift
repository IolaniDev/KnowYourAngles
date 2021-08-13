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
    @Published var allProblems : [Problem] = (load("ProblemData.json") as [Problem]).shuffled()
    @ObservedObject var userSettings = UserSettings()
    
    var categories: [String: [Problem]] {
        Dictionary(
            grouping: allProblems,
            by: { $0.typeOfProblem}
        )
    }
    
    var angleTypes : [String: [Problem]] {
        Dictionary(
            grouping: allProblems,
            by: { $0.unitsOfAngle.rawValue }
        )
    }
    
    var quadrants : [String : [Problem]] {
        Dictionary(
            grouping: allProblems,
            by: { $0.problemQuadrant.rawValue }
        )
    }
    
    func compileProblems() -> [Problem]{
        //if the user doesn't want radians, filter out the radian problems
        if (!userSettings.radians)
        {
            allProblems = allProblems.filter {
                problem in (problem.unitsOfAngle != .radians)
            }
        }
        
        //if the user doesn't want degrees, filter out the degree problems
        if (!userSettings.degrees)
        {
            allProblems = allProblems.filter {
                problem in (problem.unitsOfAngle != .degrees)
            }
        }
        
        if(!userSettings.quadrantals)
        {
            allProblems = allProblems.filter {
                problem in (problem.problemQuadrant != .quadrantal)
            }
        }
        
        if(!userSettings.quadI)
        {
            allProblems = allProblems.filter {
                problem in (problem.problemQuadrant != .I)
            }
        }
        
        if(!userSettings.quadII)
        {
            allProblems = allProblems.filter {
                problem in (problem.problemQuadrant != .II)
            }
        }
        
        if(!userSettings.quadIII)
        {
            allProblems = allProblems.filter {
                problem in (problem.problemQuadrant != .III)
            }
        }
        
        if(!userSettings.quadIV)
        {
            allProblems = allProblems.filter {
                problem in (problem.problemQuadrant != .IV)
            }
        }
        
        if(!userSettings.sine)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "sine")}
        }
        
        if(!userSettings.cosine)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "cosine")}
        }
        
        if(!userSettings.tangent)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "tangent")}
        }
        
        if(!userSettings.cosecant)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "cosecant")}
        }
        
        if(!userSettings.secant)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "secant")}
        }
        
        if(!userSettings.cotangent)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "cotangent")}
        }
        
        if(!userSettings.arcsine)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "arcsine")}
        }
        
        if(!userSettings.arccosine)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "arccosine")}
        }
        
        if(!userSettings.arctangent)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "arctangent")}
        }
        
        if(!userSettings.arccosecant)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "arccosecant")}
        }
        
        if(!userSettings.arcsecant)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "arcsecant")}
        }
        
        if(!userSettings.arccotangent)
        {
            allProblems = allProblems.filter {
                problem in (problem.typeOfProblem != "arccotangent")}
        }
        
        return allProblems
    }
    
    func resetLoadedProblems() {
        allProblems = (load("ProblemData.json") as [Problem]).shuffled()
    }
}

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
