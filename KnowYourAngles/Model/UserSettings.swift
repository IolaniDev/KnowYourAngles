//
//  UserSettings.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/9/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    /*** Setting up the keys for User Settings */
    @Published var isLeftHandMode: Bool {
        didSet {
            UserDefaults.standard.set(isLeftHandMode, forKey: "isLeftHandMode")
        }
    }
    
    @Published var degrees: Bool {
        didSet {
            UserDefaults.standard.set(degrees, forKey: "degrees")
        }
    }
    
    @Published var radians: Bool {
        didSet {
            UserDefaults.standard.set(radians, forKey: "radians")
        }
    }
    
    @Published var quadrantals: Bool {
        didSet {
            UserDefaults.standard.set(quadrantals, forKey: "quadrantals")
        }
    }
    
    @Published var quadI: Bool {
        didSet {
            UserDefaults.standard.set(quadI, forKey: "quadI")
        }
    }
    
    @Published var quadII: Bool {
        didSet {
            UserDefaults.standard.set(quadII, forKey: "quadII")
        }
    }
    
    @Published var quadIII: Bool {
        didSet {
            UserDefaults.standard.set(quadIII, forKey: "quadIII")
        }
    }
    
    @Published var quadIV: Bool {
        didSet {
            UserDefaults.standard.set(quadIV, forKey: "quadIV")
        }
    }
    
    @Published var sine: Bool {
        didSet {
            UserDefaults.standard.set(sine, forKey: "sine")
        }
    }
    
    @Published var cosine: Bool {
        didSet {
            UserDefaults.standard.set(cosine, forKey: "cosine")
        }
    }
    
    @Published var tangent: Bool {
        didSet {
            UserDefaults.standard.set(tangent, forKey: "tangent")
        }
    }
    
    @Published var cosecant: Bool {
        didSet {
            UserDefaults.standard.set(cosecant, forKey: "cosecant")
        }
    }
    
    @Published var secant: Bool {
        didSet {
            UserDefaults.standard.set(secant, forKey: "secant")
        }
    }
    
    @Published var cotangent: Bool {
        didSet {
            UserDefaults.standard.set(cotangent, forKey: "cotangent")
        }
    }
    
    @Published var arcsine: Bool {
        didSet {
            UserDefaults.standard.set(arcsine, forKey: "arcsine")
        }
    }
    
    @Published var arccosine: Bool {
        didSet {
            UserDefaults.standard.set(arccosine, forKey: "arccosine")
        }
    }
    
    @Published var arctangent: Bool {
        didSet {
            UserDefaults.standard.set(arctangent, forKey: "arctangent")
        }
    }
    
    @Published var arccosecant: Bool {
        didSet {
            UserDefaults.standard.set(arccosecant, forKey: "arccosecant")
        }
    }
    
    @Published var arcsecant: Bool {
        didSet {
            UserDefaults.standard.set(arcsecant, forKey: "arcsecant")
        }
    }
    
    @Published var arccotangent: Bool {
        didSet {
            UserDefaults.standard.set(arccotangent, forKey: "arccotangent")
        }
    }
    
    /* Keys for Statistics */
    @Published var degreeStatsNumTotal: Int {
        didSet {
            UserDefaults.standard.set(degreeStatsNumTotal, forKey: "degreeStatsNumTotal")
        }
    }
    
    @Published var degreeStatsNumCorrect: Int {
        didSet {
            UserDefaults.standard.set(degreeStatsNumCorrect, forKey: "degreeStatsNumCorrect")
        }
    }
    
    @Published var radiansStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(radiansStatsNumTotal, forKey: "radiansStatsNumTotal")
        }
    }
    
    @Published var radiansStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(radiansStatsNumCorrect, forKey: "radiansStatsNumCorrect")
        }
    }
    
    @Published var sineStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(sineStatsNumTotal, forKey: "sineStatsNumTotal")
        }
    }
    
    @Published var sineStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(sineStatsNumCorrect, forKey: "sineStatsNumCorrect")
        }
    }
    
    @Published var cosineStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(cosineStatsNumTotal, forKey: "cosineStatsNumTotal")
        }
    }
    
    @Published var cosineStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(cosineStatsNumCorrect, forKey: "cosineStatsNumCorrect")
        }
    }
    
    @Published var tangentStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(tangentStatsNumTotal, forKey: "tangentStatsNumTotal")
        }
    }
    
    @Published var tangentStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(tangentStatsNumCorrect, forKey: "tangentStatsNumCorrect")
        }
    }

    @Published var cosecantStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(cosecantStatsNumTotal, forKey: "cosecantStatsNumTotal")
        }
    }
    
    @Published var cosecantStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(cosecantStatsNumCorrect, forKey: "cosecantStatsNumCorrect")
        }
    }
    
    @Published var secantStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(secantStatsNumTotal, forKey: "secantStatsNumTotal")
        }
    }
    
    @Published var secantStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(secantStatsNumCorrect, forKey: "secantStatsNumCorrect")
        }
    }
    
    @Published var cotangentStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(cotangentStatsNumTotal, forKey: "cotangentStatsNumTotal")
        }
    }
    
    @Published var cotangentStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(cotangentStatsNumCorrect, forKey: "cotangentStatsNumCorrect")
        }
    }
    
    @Published var arcsineStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(arcsineStatsNumTotal, forKey: "arcsineStatsNumTotal")
        }
    }
    
    @Published var arcsineStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(arcsineStatsNumCorrect, forKey: "arcsineStatsNumCorrect")
        }
    }
    
    @Published var arccosineStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(arccosineStatsNumTotal, forKey: "arccosineStatsNumTotal")
        }
    }
    
    @Published var arccosineStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(arccosineStatsNumCorrect, forKey: "arccosineStatsNumCorrect")
        }
    }
    
    @Published var arctangentStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(arctangentStatsNumTotal, forKey: "arctangentStatsNumTotal")
        }
    }
    
    @Published var arctangentStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(arctangentStatsNumCorrect, forKey: "arctangentStatsNumCorrect")
        }
    }
    
    @Published var arccosecantStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(arccosecantStatsNumTotal, forKey: "arccosecantStatsNumTotal")
        }
    }
    
    @Published var arccosecantStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(arccosecantStatsNumCorrect, forKey: "arccosecantStatsNumCorrect")
        }
    }
    
    @Published var arcsecantStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(arcsecantStatsNumTotal, forKey: "arcsecantStatsNumTotal")
        }
    }
    
    @Published var arcsecantStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(arcsecantStatsNumCorrect, forKey: "arcsecantStatsNumCorrect")
        }
    }
    
    @Published var arccotangentStatsNumTotal : Int {
        didSet {
            UserDefaults.standard.set(arccotangentStatsNumTotal, forKey: "arccotangentStatsNumTotal")
        }
    }
    
    @Published var arccotangentStatsNumCorrect : Int {
        didSet {
            UserDefaults.standard.set(arccotangentStatsNumCorrect, forKey: "arccotangentStatsNumCorrect")
        }
    }
    
    init() {
        //Use the previously saved settings for right-hand vs. left-hand. If there aren't any, then by default use Right-Hand Mode.
        self.isLeftHandMode = UserDefaults.standard.object(forKey: "isLeftHandMode") as? Bool ?? false
        
        //Use the previously saved settings for including the problems with degrees. If there aren't any, then by default use the problems with degrees.
        self.degrees = UserDefaults.standard.object(forKey: "degrees") as? Bool ?? true
        
        //Use the previously saved settings for including the problems with radians. If there aren't any, then by default do not use the problems with radians.
        self.radians = UserDefaults.standard.object(forKey: "radians") as? Bool ?? false
        
        //Use the previously saved settings for including the problems from quadrantals. If there aren't any, then by default use the problems from quadrantals.
        self.quadrantals = UserDefaults.standard.object(forKey: "quadrantals") as? Bool ?? true
        
        //Use the previously saved settings for including the problems from Quadrant I. If there aren't any, then by default use the problems from Quadrant I.
        self.quadI = UserDefaults.standard.object(forKey: "quadI") as? Bool ?? true
        
        //Use the previously saved settings for including the problems from Quadrant II. If there aren't any, then by default use the problems from Quadrant II.
        self.quadII = UserDefaults.standard.object(forKey: "quadII") as? Bool ?? true
        
        //Use the previously saved settings for including the problems from Quadrant III. If there aren't any, then by default use the problems from Quadrant III.
        self.quadIII = UserDefaults.standard.object(forKey: "quadIII") as? Bool ?? true
        
        //Use the previously saved settings for including the problems from Quadrant IV. If there aren't any, then by default use the problems from Quadrant IV.
        self.quadIV = UserDefaults.standard.object(forKey: "quadIV") as? Bool ?? true
        
        //Use the previously saved settings for including sine problems. If there aren't any, then by default use the sine problems.
        self.sine = UserDefaults.standard.object(forKey: "sine") as? Bool ?? true
        
        //Use the previously saved settings for including cosine problems. If there aren't any, then by default use the cosine problems.
        self.cosine = UserDefaults.standard.object(forKey: "cosine") as? Bool ?? true
        
        //Use the previously saved settings for including tangent problems. If there aren't any, then by default use the tangent problems.
        self.tangent = UserDefaults.standard.object(forKey: "tangent") as? Bool ?? true
        
        //Use the previously saved settings for including cosecant problems. If there aren't any, then by default do not use cosecant problems.
        self.cosecant = UserDefaults.standard.object(forKey: "cosecant") as? Bool ?? false
        
        //Use the previously saved settings for including secant problems. If there aren't any, then by default do not use secant problems.
        self.secant = UserDefaults.standard.object(forKey: "secant") as? Bool ?? false
        
        //Use the previously saved settings for including cotangent problems. If there aren't any, then by default do not use cotangent problems.
        self.cotangent = UserDefaults.standard.object(forKey: "cotangent") as? Bool ?? false
        
        //Use the previously saved settings for including arcsine problems. If there aren't any, then by default do not use arcsine problems.
        self.arcsine = UserDefaults.standard.object(forKey: "arcsine") as? Bool ?? false
        
        //Use the previously saved settings for including arccosine problems. If there aren't any, then by default do not use arccosine problems.
        self.arccosine = UserDefaults.standard.object(forKey: "arccosine") as? Bool ?? false
        
        //Use the previously saved settings for including arctangent problems. If there aren't any, then by default do not use arctangent problems.
        self.arctangent = UserDefaults.standard.object(forKey: "arctangent") as? Bool ?? false
        
        //Use the previously saved settings for including arccosecant problems. If there aren't any, then by default do not use arccosecant problems.
        self.arccosecant = UserDefaults.standard.object(forKey: "arccosecant") as? Bool ?? false
        
        //Use the previously saved settings for including arcsecant problems. If there aren't any, then by default do not use arcsecant problems.
        self.arcsecant = UserDefaults.standard.object(forKey: "arcsecant") as? Bool ?? false
        
        //Use the previously saved settings for including arccotangent problems. If there aren't any, then by default do not use arccotangent problems.
        self.arccotangent = UserDefaults.standard.object(forKey: "arccotangent") as? Bool ?? false
        
        //Use the previously saved settings for total number of problems involving degrees. If there aren't any, then by default use 0.
        self.degreeStatsNumTotal = UserDefaults.standard.object(forKey: "degreeStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving degrees that are answered correctly. If there aren't any, then by default use 0.
        self.degreeStatsNumCorrect = UserDefaults.standard.object(forKey: "degreeStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving radians. If there aren't any, then by default use 0.
        self.radiansStatsNumTotal = UserDefaults.standard.object(forKey: "radiansStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving radians that are answered correctly. If there aren't any, then by default use 0.
        self.radiansStatsNumCorrect = UserDefaults.standard.object(forKey: "radiansStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving sine. If there aren't any, then by default use 0.
        self.sineStatsNumTotal = UserDefaults.standard.object(forKey: "sineStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving sine that are answered correctly. If there aren't any, then by default use 0.
        self.sineStatsNumCorrect = UserDefaults.standard.object(forKey: "sineStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving cosine. If there aren't any, then by default use 0.
        self.cosineStatsNumTotal = UserDefaults.standard.object(forKey: "cosineStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving cosine that are answered correctly. If there aren't any, then by default use 0.
        self.cosineStatsNumCorrect = UserDefaults.standard.object(forKey: "cosineStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving tangent. If there aren't any, then by default use 0.
        self.tangentStatsNumTotal = UserDefaults.standard.object(forKey: "tangentStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving tangent that are answered correctly. If there aren't any, then by default use 0.
        self.tangentStatsNumCorrect = UserDefaults.standard.object(forKey: "tangentStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving cosecant. If there aren't any, then by default use 0.
        self.cosecantStatsNumTotal = UserDefaults.standard.object(forKey: "cosecantStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving cosecant that are answered correctly. If there aren't any, then by default use 0.
        self.cosecantStatsNumCorrect = UserDefaults.standard.object(forKey: "cosecantStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving secant. If there aren't any, then by default use 0.
        self.secantStatsNumTotal = UserDefaults.standard.object(forKey: "secantStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving secant that are answered correctly. If there aren't any, then by default use 0.
        self.secantStatsNumCorrect = UserDefaults.standard.object(forKey: "secantStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving cotangent. If there aren't any, then by default use 0.
        self.cotangentStatsNumTotal = UserDefaults.standard.object(forKey: "cotangentStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving cotangent that are answered correctly. If there aren't any, then by default use 0.
        self.cotangentStatsNumCorrect = UserDefaults.standard.object(forKey: "cotangentStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arcsine. If there aren't any, then by default use 0.
        self.arcsineStatsNumTotal = UserDefaults.standard.object(forKey: "arcsineStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving sine that are answered correctly. If there aren't any, then by default use 0.
        self.arcsineStatsNumCorrect = UserDefaults.standard.object(forKey: "arcsineStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arccosine. If there aren't any, then by default use 0.
        self.arccosineStatsNumTotal = UserDefaults.standard.object(forKey: "arccosineStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arccosine that are answered correctly. If there aren't any, then by default use 0.
        self.arccosineStatsNumCorrect = UserDefaults.standard.object(forKey: "arccosineStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arctangent. If there aren't any, then by default use 0.
        self.arctangentStatsNumTotal = UserDefaults.standard.object(forKey: "arctangentStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arctangent that are answered correctly. If there aren't any, then by default use 0.
        self.arctangentStatsNumCorrect = UserDefaults.standard.object(forKey: "arctangentStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arccosecant. If there aren't any, then by default use 0.
        self.arccosecantStatsNumTotal = UserDefaults.standard.object(forKey: "arccosecantStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arccosecant that are answered correctly. If there aren't any, then by default use 0.
        self.arccosecantStatsNumCorrect = UserDefaults.standard.object(forKey: "arccosecantStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arcsecant. If there aren't any, then by default use 0.
        self.arcsecantStatsNumTotal = UserDefaults.standard.object(forKey: "arcsecantStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arcsecant that are answered correctly. If there aren't any, then by default use 0.
        self.arcsecantStatsNumCorrect = UserDefaults.standard.object(forKey: "arcsecantStatsNumCorrect") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arccotangent. If there aren't any, then by default use 0.
        self.arccotangentStatsNumTotal = UserDefaults.standard.object(forKey: "arccotangentStatsNumTotal") as? Int ?? 0
        
        //Use the previously saved settings for total number of problems involving arccotangent that are answered correctly. If there aren't any, then by default use 0.
        self.arccotangentStatsNumCorrect = UserDefaults.standard.object(forKey: "arccotangentStatsNumCorrect") as? Int ?? 0
    }
}
