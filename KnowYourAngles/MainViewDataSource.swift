//
//  MainViewDataSource.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/10/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation

class MainViewDataSource : NSObject{
    //possible problems using degrees
    private var degreeProblems: [String] = ["Cos0", "Cos30", "Cos45", "Cos60", "Cos90", "Cos120", "Cos135", "Cos150", "Cos180", "Cos210", "Cos225", "Cos240", "Cos270", "Cos300", "Cos315", "Cos330", "Sin0", "Sin30", "Sin45", "Sin60", "Sin90", "Sin120", "Sin135", "Sin150", "Sin180", "Sin210", "Sin225", "Sin240", "Sin270", "Sin300", "Sin315", "Sin330", "tan0", "tan30", "tan45", "tan60", "tan90", "tan120", "tan135", "tan150", "tan180", "tan210", "tan225", "tan240", "tan270", "tan300", "tan315", "tan330"];
    
    //possible problems using radians
    private var radianProblems: [String] = ["Cos0rads", "CosPiOver6", "CosPiOver4", "CosPiOver3", "CosPiOver2", "Cos2PiOver3", "Cos3PiOver4", "Cos5PiOver6", "CosPi", "Cos7PiOver6", "Cos5PiOver4", "Cos4PiOver3", "Cos3PiOver2", "Cos5PiOver3", "Cos7PiOver4", "Cos11PiOver6", "Sin0rads", "SinPiOver6", "SinPiOver4", "SinPiOver3", "SinPiOver2", "Sin2PiOver3", "Sin3PiOver4", "Sin5PiOver6", "SinPi", "Sin7PiOver6", "Sin5PiOver4", "Sin4PiOver3", "Sin3PiOver2", "Sin5PiOver3", "Sin7PiOver4", "Sin11PiOver6", "Tan0rads", "TanPiOver6", "TanPiOver4", "TanPiOver3", "TanPiOver2", "Tan2PiOver3", "Tan3PiOver4", "Tan5PiOver6", "TanPi", "Tan7PiOver6", "Tan5PiOver4", "Tan4PiOver3", "Tan3PiOver2", "Tan5PiOver3", "Tan7PiOver4", "Tan11PiOver6"];
    
    //possible reciprocal problems using degrees
    private var reciprocalDegreeProblems: [String] = ["Csc0", "Csc30", "Csc45", "Csc60", "Csc90", "Csc120", "Csc135", "Csc150", "Csc180", "Csc210", "Csc225", "Csc240", "Csc270", "Csc300", "Csc315", "Csc330", "Sec0", "Sec30", "Sec45", "Sec60", "Sec90", "Sec120", "Sec135", "Sec150", "Sec180", "Sec210", "Sec225", "Sec240", "Sec270", "Sec300", "Sec315", "Sec330", "Cot0", "Cot30", "Cot45", "Cot60", "Cot90", "Cot120", "Cot135", "Cot150", "Cot180", "Cot210", "Cot225", "Cot240", "Cot270", "Cot300", "Cot315", "Cot330"];
    
    //possible reciprocal problems using radians
    private var reciprocalRadianProblems: [String] = ["Csc0rads", "CscPiOver6", "CscPiOver4", "CscPiOver3", "CscPiOver2", "Csc2PiOver3", "Csc3PiOver4", "Csc5PiOver6", "CscPi", "Csc7PiOver6", "Csc5PiOver4", "Csc4PiOver3", "Csc3PiOver2", "Csc5PiOver3", "Csc7PiOver4", "Csc11PiOver6", "Sec0rads", "SecPiOver6", "SecPiOver4", "SecPiOver3", "SecPiOver2", "Sec2PiOver3", "Sec3PiOver4", "Sec5PiOver6", "SecPi", "Sec7PiOver6", "Sec5PiOver4", "Sec4PiOver3", "Sec3PiOver2", "Sec5PiOver3", "Sec7PiOver4", "Sec11PiOver6", "Cot0rads", "CotPiOver6", "CotPiOver4", "CotPiOver3", "CotPiOver2", "Cot2PiOver3", "Cot3PiOver4", "Cot5PiOver6", "CotPi", "Cot7PiOver6", "Cot5PiOver4", "Cot4PiOver3", "Cot3PiOver2", "Cot5PiOver3", "Cot7PiOver4", "Cot11PiOver6"];
    
    //empty array to hold the problems to choose from depending on the user's settings.
    private var libraryOfProblems : [String];
    
    //String to hold the name of the current problem
    private var currProblem : String;
    
    override init()
    {
        libraryOfProblems = [];
        currProblem = "";
    }
    
    func loadDegreeProblems(){
        libraryOfProblems.appendContentsOf(degreeProblems);
    }
    
    func loadRadianProblems(){
        libraryOfProblems.appendContentsOf(radianProblems);
    }
    
    func loadReciprocalDegreeProblems(){
        libraryOfProblems.appendContentsOf(reciprocalDegreeProblems);
    }
    
    func loadReciprocalRadianProblems(){
        libraryOfProblems.appendContentsOf(reciprocalRadianProblems);
    }
    
    func getRandomProblem() -> String {
        if(libraryOfProblems.count>0)
        {
            let randomNum = Int(arc4random_uniform(UInt32(libraryOfProblems.count)));
            currProblem = libraryOfProblems.removeAtIndex(randomNum);
            return currProblem;
        }
        else
        {
            return "";
        }
    }
    
    func isCorrect(answer : String) -> Bool {
        //16 possibilities
        if(["Cos0", "Sin90", "tan45", "tan225", "Cos0rads", "SinPiOver2", "TanPiOver4", "Tan5PiOver4", "Cot45", "CotPiOver4", "Cot225", "Cot5Piover4", "Sec0", "Sec0rads", "Csc90", "CscPiOver2"].contains(currProblem))
        {
            if(answer=="1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //16 possibilities
        else if(["Cos90", "Cos270", "Sin0", "Sin180", "tan0", "tan180", "CosPiOver2", "Cos3PiOver2", "Sin0rads", "SinPi", "Tan0rads", "TanPi", "Cot90", "CotPiOver2", "Cot270", "Cot3PiOver2"].contains(currProblem))
        {
            if(answer == "0")
            {
                return true;
            }
            else{
                return false;
            }
        }
        //16 possibilities
        else if(["Cos180", "Sin270", "tan135", "tan315", "CosPi", "Sin3PiOver2", "Tan3PiOver4", "Tan7PiOver4", "Cot135", "Cot3PiOver4", "Cot315", "Cot7PiOver4", "Sec180", "SecPi", "Csc270", "Csc3PiOver2"].contains(currProblem))
        {
            //Answer: -1
            if(answer == "-1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        //16 possibilities
        else if(["tan90", "tan270", "TanPiOver2", "Tan3PiOver2", "Cot0", "Cot0rads", "Cot180", "CotPi", "Sec90", "SecPiOver2", "Sec270", "Sec3PiOver2", "Csc0", "Csc0rads", "Csc180", "CscPi"].contains(currProblem))
        {
            //Answer: undefined
            if(answer == "u" || answer == "undefined")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Cos60", "Cos300", "Sin30", "Sin150", "CosPiOver3", "Cos5PiOver3", "SinPiOver6", "Sin5PiOver6"].contains(currProblem))
        {
            if(answer == "[1/2]" || answer == "0.5")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Cos30", "Cos330", "Sin60", "Sin120", "CosPiOver6", "Cos11PiOver6", "SinPiOver3", "Sin2PiOver3"].contains(currProblem))
        {
            //Answer: [√[3]/2]=0.866…
            if(answer == "[√[3]/2]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if (["Cos150", "Cos210", "Sin240", "Sin300", "Cos5PiOver6", "Cos7PiOver6", "Sin4PiOver3", "Sin5PiOver3"].contains(currProblem))
        {
            //Answer: -[√[3]/2]=-0.866… or [-√[3]/2]=-0.866… or [√[3]/-2]=-0.866…
            if(answer == "-[√[3]/2]" || answer == "[-√[3]/2]" || answer == "[√[3]/-2]=")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if (["Cos45", "Cos315", "Sin45", "Sin135", "CosPiOver4", "Cos7PiOver4", "SinPiOver4", "Sin3PiOver4"].contains(currProblem))
        {
            //Answer: [√[2]/2]=0.707…
            if(answer == "[√[2]/2]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if (["Cos135", "Cos225", "Sin225", "Sin315", "Cos3PiOver4", "Cos5PiOver4", "Sin5PiOver4", "Sin7PiOver4"].contains(currProblem))
        {
            //Answer: -[√[2]/2]=-0.707… or [[-√[2]]/2]=-0.707… or [√[2]/-2]=-0.707…
            if(answer == "-[√[2]/2]" || answer == "[[-√[2]]/2]" || answer == "[√[2]/-2]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if (["Cos120", "Cos240", "Sin210", "Sin330", "Cos2PiOver3", "Cos4PiOver3", "Sin7PiOver6", "Sin11PiOver6"].contains(currProblem))
        {
            //Answer: -[1/2]=-0.5 or [-1/2]=-0.5 or [1/-2]=-0.5 or -0.5
            if(answer == "-[1/2]" || answer == "[-1/2]" || answer == "[1/-2]" || answer == "-0.5")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        
            //8 possibilities
        else if(["tan30", "tan210", "TanPiOver6", "Tan7PiOver6", "Cot60", "CotPiOver3", "Cot240", "Cot4PiOver3"].contains(currProblem))
        {
            //Answer: [√[3]/3]=0.577…
            if(answer == "[√[3]/3]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["tan150", "tan330", "Tan5PiOver6", "Tan11PiOver6", "Cot120", "Cot2PiOver3", "Cot300", "Cot5PiOver3"].contains(currProblem))
        {
            //Answer: -[√[3]/3]=-0.577… or [-√[3]/3]=-0.577… or [√[3]/-3]=-0.577…
            if(answer == "-[√[3]/3]" || answer == "[-√[3]/3]" || answer == "[√[3]/-3]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["tan60", "tan240", "TanPiOver3", "Tan4PiOver3", "Cot30", "CotPiOver6", "Cot210", "Cot7PiOver6"].contains(currProblem))
        {
            //Answer:  √[3]=1.732…
            if(answer == "√[3]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["tan120", "tan300", "Tan2PiOver3", "Tan5PiOver3", "Cot150", "Cot5PiOver6", "Cot330", "Cot11PiOver6"].contains(currProblem))
        {
            //Answer:  -√[3]=-1.732…
            if(answer == "-√[3]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        
            //8 possibilities
        else if(["Sec30", "SecPiOver6", "Sec330", "Sec11PiOver6", "Csc60", "CscPiOver3", "Csc120", "Csc2PiOver3"].contains(currProblem))
        {
            //Answer: [[2×√[3]]/3]=1.154…
            if(answer == "[[2×√[3]]/3]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Sec45", "SecPiOver4", "Sec315", "Sec7PiOver4", "Csc45", "CscPiOver4", "Csc135", "Csc3PiOver4"].contains(currProblem))
        {
            //Answer: √[2]=1.414…
            if(answer == "√[2]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Sec60", "SecPiOver3", "Sec300", "Sec5PiOver3", "Csc30", "CscPiOver6", "Csc150", "Csc5PiOver6"].contains(currProblem))
        {
            //Answer: 2
            if(answer == "2")
            {
                return false;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Sec120", "Sec2PiOver3", "Sec240", "Sec4PiOver3", "Csc210", "Csc7PiOver6", "Csc330", "Csc11PiOver6"].contains(currProblem))
        {
            //Answer: -2
            if(answer == "-2")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Sec135", "Sec3PiOver4", "Sec225", "Sec5PiOver4", "Csc225", "Csc5PiOver4", "Csc315", "Csc7PiOver4"].contains(currProblem))
        {
            //Answer: -√[2]=-1.414…
            if(answer == "-√[2]")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //8 possibilities
        else if(["Sec150", "Sec5PiOver6", "Sec210", "Sec7PiOver6", "Csc240", "Csc4PiOver3", "Csc300", "Csc5PiOver3"].contains(currProblem))
        {
            //Answer: -[[2×√[3]]/3]=-1.154… or [[-2×√[3]]/3]=-1.154… or [[2×√[3]]/-3]=-1.154… or [[2×(-√[3])]/3]=-1.154…
            if(["-[[2×√[3]]/3]", "[[-2×√[3]]/3]", "[[2×√[3]]/-3]", "[[2×(-√[3])]/3]"].contains(answer))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
            //if the program goes in here...that means some problem was displayed that's not in the library...i.e. trouble!
        else{
            return false;
        }
    }
}