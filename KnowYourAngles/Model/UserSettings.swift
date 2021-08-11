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
    
    //TODO:
    //need settings for number of problems, max number of problems, the timer, and statistics
    
    /*** Setting up the keys for User Settings*/
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
            UserDefaults.standard.set(arccotangent, forKey: "arcsecant")
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
    }
}
