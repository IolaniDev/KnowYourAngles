//
//  ModelData.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/27/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import Foundation
import Combine

final class ModelData : ObservableObject {
    @Published var allProblems : [Problem] = load("ProblemData.json")
    
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
