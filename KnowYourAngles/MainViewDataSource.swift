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
    //fileprivate var degreeProblems: [String] = ["Cos0", "Cos30", "Cos45", "Cos60", "Cos90", "Cos120", "Cos135", "Cos150", "Cos180", "Cos210", "Cos225", "Cos240", "Cos270", "Cos300", "Cos315", "Cos330", "Sin0", "Sin30", "Sin45", "Sin60", "Sin90", "Sin120", "Sin135", "Sin150", "Sin180", "Sin210", "Sin225", "Sin240", "Sin270", "Sin300", "Sin315", "Sin330", "tan0", "tan30", "tan45", "tan60", "tan90", "tan120", "tan135", "tan150", "tan180", "tan210", "tan225", "tan240", "tan270", "tan300", "tan315", "tan330"];
    
    //possible problems using radians
    //fileprivate var radianProblems: [String] = ["Cos0rads", "CosPiOver6", "CosPiOver4", "CosPiOver3", "CosPiOver2", "Cos2PiOver3", "Cos3PiOver4", "Cos5PiOver6", "CosPi", "Cos7PiOver6", "Cos5PiOver4", "Cos4PiOver3", "Cos3PiOver2", "Cos5PiOver3", "Cos7PiOver4", "Cos11PiOver6", "Sin0rads", "SinPiOver6", "SinPiOver4", "SinPiOver3", "SinPiOver2", "Sin2PiOver3", "Sin3PiOver4", "Sin5PiOver6", "SinPi", "Sin7PiOver6", "Sin5PiOver4", "Sin4PiOver3", "Sin3PiOver2", "Sin5PiOver3", "Sin7PiOver4", "Sin11PiOver6", "Tan0rads", "TanPiOver6", "TanPiOver4", "TanPiOver3", "TanPiOver2", "Tan2PiOver3", "Tan3PiOver4", "Tan5PiOver6", "TanPi", "Tan7PiOver6", "Tan5PiOver4", "Tan4PiOver3", "Tan3PiOver2", "Tan5PiOver3", "Tan7PiOver4", "Tan11PiOver6"];
    
    //possible reciprocal problems using degrees
    //fileprivate var reciprocalDegreeProblems: [String] = ["Csc0", "Csc30", "Csc45", "Csc60", "Csc90", "Csc120", "Csc135", "Csc150", "Csc180", "Csc210", "Csc225", "Csc240", "Csc270", "Csc300", "Csc315", "Csc330", "Sec0", "Sec30", "Sec45", "Sec60", "Sec90", "Sec120", "Sec135", "Sec150", "Sec180", "Sec210", "Sec225", "Sec240", "Sec270", "Sec300", "Sec315", "Sec330", "Cot0", "Cot30", "Cot45", "Cot60", "Cot90", "Cot120", "Cot135", "Cot150", "Cot180", "Cot210", "Cot225", "Cot240", "Cot270", "Cot300", "Cot315", "Cot330"];
    
    //possible reciprocal problems using radians
    //fileprivate var reciprocalRadianProblems: [String] = ["Csc0rads", "CscPiOver6", "CscPiOver4", "CscPiOver3", "CscPiOver2", "Csc2PiOver3", "Csc3PiOver4", "Csc5PiOver6", "CscPi", "Csc7PiOver6", "Csc5PiOver4", "Csc4PiOver3", "Csc3PiOver2", "Csc5PiOver3", "Csc7PiOver4", "Csc11PiOver6", "Sec0rads", "SecPiOver6", "SecPiOver4", "SecPiOver3", "SecPiOver2", "Sec2PiOver3", "Sec3PiOver4", "Sec5PiOver6", "SecPi", "Sec7PiOver6", "Sec5PiOver4", "Sec4PiOver3", "Sec3PiOver2", "Sec5PiOver3", "Sec7PiOver4", "Sec11PiOver6", "Cot0rads", "CotPiOver6", "CotPiOver4", "CotPiOver3", "CotPiOver2", "Cot2PiOver3", "Cot3PiOver4", "Cot5PiOver6", "CotPi", "Cot7PiOver6", "Cot5PiOver4", "Cot4PiOver3", "Cot3PiOver2", "Cot5PiOver3", "Cot7PiOver4", "Cot11PiOver6"];
    
    //empty array to hold the problems to choose from depending on the user's settings.
    fileprivate var libraryOfProblems : [Problem];
    
    //String to hold the name of the current problem
    fileprivate var currProblem : Problem?;
    
    override init()
    {
        libraryOfProblems = [];
        currProblem = nil;
    }
    
    /********** Functions for Loading Sine (Degree) Problems **********/
    func loadSineDegreeQuadrantalProblems(){
        let sinDegQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Sin0", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sin90", correctAnswer: "1", answerImageName: "One", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sin180", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sin270", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: sinDegQuadrantals);
    }
    
    func loadSineDegreeQuadIProblems(){
        let sinDegQI : [Problem] = [
            Problem.init(problemImageName: "Sin30", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Sin45", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Sin60", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: sinDegQI);
    }
    
    func loadSineDegreeQuadIIProblems(){
        let sinDegQII : [Problem] = [
            Problem.init(problemImageName: "Sin120", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sin135", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sin150", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: sinDegQII);
    }
    
    func loadSineDegreeQuadIIIProblems(){
        let sinDegQIII : [Problem] = [
            Problem.init(problemImageName: "Sin210", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sin225", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sin240", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: sinDegQIII);
    }
    
    func loadSineDegreeQuadIVProblems(){
        let sinDegQIV : [Problem] = [
            Problem.init(problemImageName: "Sin300", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sin315", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sin330", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: sinDegQIV);
    }
    
    /********** Functions for Loading Sine (Radians) Problems **********/
    func loadSineRadiansQuadrantalProblems (){
        let sinRadsQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Sin0rads", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "SinPiOver2", correctAnswer: "1", answerImageName: "One", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "SinPi", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sin3PiOver2", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: sinRadsQuadrantals);
    }
    
    func loadSineRadiansQuadIProblems(){
        let sinRadsQI : [Problem] = [
            Problem.init(problemImageName: "SinPiOver6", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "SinPiOver4", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "SinPiOver3", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: sinRadsQI);
    }
    
    func loadSineRadiansQuadIIProblems(){
        let sinRadsQII : [Problem] = [
            Problem.init(problemImageName: "Sin2PiOver3", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sin3PiOver4", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sin5PiOver6", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: sinRadsQII);
    }
    
    func loadSineRadiansQuadIIIProblems(){
        let sinRadsQIII : [Problem] = [
            Problem.init(problemImageName: "Sin7PiOver6", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sin5PiOver4", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sin4PiOver3", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: sinRadsQIII);
    }
    
    func loadSineRadiansQuadIVProblems(){
        let sinRadsQIV : [Problem] = [
            Problem.init(problemImageName: "Sin5PiOver3", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sin7PiOver4", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sin11PiOver6", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "sine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: sinRadsQIV);
    }
    
    /********** Functions for Loading Cosine (Degree) Problems **********/
    func loadCosineDegreeQuadrantalProblems (){
        let cosDegQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Cos0", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cos90", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cos180", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cos270", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: cosDegQuadrantals);
    }
    
    func loadCosineDegreeQuadIProblems(){
        let cosDegQI : [Problem] = [
            Problem.init(problemImageName: "Cos30", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Cos45", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Cos60", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: cosDegQI);
    }
    
    func loadCosineDegreeQuadIIProblems(){
        let cosDegQII : [Problem] = [
            Problem.init(problemImageName: "Cos120", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cos135", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cos150", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: cosDegQII);
    }
    
    func loadCosineDegreeQuadIIIProblems(){
        let cosDegQIII : [Problem] = [
            Problem.init(problemImageName: "Cos210", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cos225", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cos240", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: cosDegQIII);
    }
    
    func loadCosineDegreeQuadIVProblems(){
        let cosDegQIV : [Problem] = [
            Problem.init(problemImageName: "Cos300", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cos315", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cos330", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: cosDegQIV);
    }
    
    /********** Functions for Loading Cosine (Radians) Problems **********/
    func loadCosineRadiansQuadrantalProblems (){
        let cosRadsQudrantals : [Problem] = [
            Problem.init(problemImageName: "Cos0rads", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "CosPiOver2", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "CosPi", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cos3PiOver2", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: cosRadsQudrantals);
    }
    
    func loadCosineRadiansQuadIProblems(){
        let cosRadsQI : [Problem] = [
            Problem.init(problemImageName: "CosPiOver6", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "CosPiOver4", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "CosPiOver3", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: cosRadsQI);
    }
    
    func loadCosineRadiansQuadIIProblems(){
        let cosRadsQII : [Problem] = [
            Problem.init(problemImageName: "Cos2PiOver3", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cos3PiOver4", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cos5PiOver6", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: cosRadsQII);
    }
    
    func loadCosineRadiansQuadIIIProblems(){
        let cosRadsQIII : [Problem] = [
            Problem.init(problemImageName: "Cos7PiOver6", correctAnswer: "-0.866…", answerImageName: "NegativeRoot3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cos5PiOver4", correctAnswer: "-0.707…", answerImageName: "NegativeRoot2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cos4PiOver3", correctAnswer: "-0.5", answerImageName: "Negative1Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: cosRadsQIII);
    }
    
    func loadCosineRadiansQuadIVProblems(){
        let cosRadsQIV : [Problem] = [
            Problem.init(problemImageName: "Cos5PiOver3", correctAnswer: "0.5", answerImageName: "OneOverTwo", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cos7PiOver4", correctAnswer: "0.707…", answerImageName: "Root2Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cos11PiOver6", correctAnswer: "0.866…", answerImageName: "Root3Over2", typeOfProblem: "cosine", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: cosRadsQIV);
    }
    
    /********** Functions for Loading Tangent (Degree) Problems **********/
    func loadTangentDegreeQuadrantalProblems (){
        let tanDegQuadrantals : [Problem] = [
            Problem.init(problemImageName: "tan0", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "tan90", correctAnswer: "u", answerImageName: "U", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "tan180", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "tan360", correctAnswer: "u", answerImageName: "U", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: tanDegQuadrantals);
    }
    
    func loadTangentDegreeQuadIProblems(){
        let tanDegQI : [Problem] = [
            Problem.init(problemImageName: "tan30", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "tan45", correctAnswer: "1", answerImageName: "One", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "tan60", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: tanDegQI);
    }
    
    func loadTangentDegreeQuadIIProblems(){
        let tanDegQII : [Problem] = [
            Problem.init(problemImageName: "tan120", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "tan135", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "tan150", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: tanDegQII);
    }
    
    func loadTangentDegreeQuadIIIProblems(){
        let tanDegQIII : [Problem] = [
            Problem.init(problemImageName: "tan210", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "tan225", correctAnswer: "1", answerImageName: "One", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "tan240", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: tanDegQIII);
    }
    
    func loadTangentDegreeQuadIVProblems(){
        let tanDegQIV : [Problem] = [
            Problem.init(problemImageName: "tan300", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "tan315", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "tan330", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: tanDegQIV);
    }
    
    /********** Functions for Loading Tangent (Radians) Problems **********/
    func loadTangentRadiansQuadrantalProblems (){
        let tanRadsQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Tan0rads", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "TanPiOver2", correctAnswer: "u", answerImageName: "U", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "TanPi", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Tan3PiOver2", correctAnswer: "u", answerImageName: "U", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: tanRadsQuadrantals);
    }
    
    func loadTangentRadiansQuadIProblems(){
        let tanRadsQI : [Problem] = [
            Problem.init(problemImageName: "TanPiOver6", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "TanPiOver4", correctAnswer: "1", answerImageName: "One", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "TanPiOver3", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: tanRadsQI);
    }
    
    func loadTangentRadiansQuadIIProblems(){
        let tanRadsQII : [Problem] = [
            Problem.init(problemImageName: "Tan2PiOver3", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Tan3PiOver4", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Tan5PiOver6", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: tanRadsQII);
    }
    
    func loadTangentRadiansQuadIIIProblems(){
        let tanRadsQIII : [Problem] = [
            Problem.init(problemImageName: "Tan7PiOver6", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Tan5PiOver4", correctAnswer: "1", answerImageName: "One", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Tan4PiOver3", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: tanRadsQIII);
    }
    
    func loadTangentRadiansQuadIVProblems(){
        let tanRadsQIV : [Problem] = [
            Problem.init(problemImageName: "Tan5PiOver3", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Tan7PiOver4", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Tan11PiOver6", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "tangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: tanRadsQIV);
    }
    
    /********** Functions for Loading Cosecant (Degree) Problems **********/
    func loadCosecantDegreeQuadrantalProblems (){
        let cscDegQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Csc0", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Csc90", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Csc180", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Csc270", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: cscDegQuadrantals);
    }
    
    func loadCosecantDegreeQuadIProblems(){
        let cscDegQI : [Problem] = [
            Problem.init(problemImageName: "Csc30", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Csc45", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Csc60", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
        ];
        libraryOfProblems.append(contentsOf: cscDegQI);
    }
    
    func loadCosecantDegreeQuadIIProblems(){
        let cscDegQII : [Problem] = [
            Problem.init(problemImageName: "Csc120", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Csc135", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Csc150", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: cscDegQII);
    }
    
    func loadCosecantDegreeQuadIIIProblems(){
        let cscDegQIII : [Problem] = [
            Problem.init(problemImageName: "Csc210", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Csc225", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Csc240", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: cscDegQIII);
    }
    
    func loadCosecantDegreeQuadIVProblems(){
        let cscDegQIV : [Problem] = [
            Problem.init(problemImageName: "Csc300", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Csc315", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Csc330", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: cscDegQIV);
    }
    
    /********** Functions for Loading Cosecant (Radians) Problems **********/
    func loadCosecantRadiansQuadrantalProblems (){
        let cscRadsQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Csc0rads", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "CscPiOver2", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "CscPi", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Csc3PiOver2", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: cscRadsQuadrantals);
    }
    
    func loadCosecantRadiansQuadIProblems(){
        let cscRadsQI : [Problem] = [
            Problem.init(problemImageName: "CscPiOver6", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "CscPiOver4", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "CscPiOver3", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            ];
        libraryOfProblems.append(contentsOf: cscRadsQI);
    }
    
    func loadCosecantRadiansQuadIIProblems(){
        let cscRadsQII : [Problem] = [
            Problem.init(problemImageName: "Csc2PiOver3", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Csc3PiOver4", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Csc5PiOver6", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: cscRadsQII);
    }
    
    func loadCosecantRadiansQuadIIIProblems(){
        let cscRadsQIII : [Problem] = [
            Problem.init(problemImageName: "Csc7PiOver6", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Csc5PiOver4", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Csc4PiOver3", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: cscRadsQIII);
    }
    
    func loadCosecantRadiansQuadIVProblems(){
        let cscRadsQIV : [Problem] = [
            Problem.init(problemImageName: "Csc5PiOver3", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Csc7PiOver4", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Csc11PiOver6", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "cosecant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: cscRadsQIV);
    }
    
    /********** Functions for Loading Secant (Degree) Problems **********/
    func loadSecantDegreeQuadrantalProblems (){
        let secDegQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Sec0", correctAnswer: "1", answerImageName: "One", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sec90", correctAnswer: "u", answerImageName: "U", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sec180", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sec270", correctAnswer: "u", answerImageName: "U", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: secDegQuadrantals);
    }
    
    func loadSecantDegreeQuadIProblems(){
        let secDegQI : [Problem] = [
            Problem.init(problemImageName: "Sec30", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Sec45", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Sec60", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: secDegQI);
    }
    
    func loadSecantDegreeQuadIIProblems(){
        let secDegQII : [Problem] = [
            Problem.init(problemImageName: "Sec120", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sec135", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sec150", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: secDegQII);
    }
    
    func loadSecantDegreeQuadIIIProblems(){
        let secDegQIII : [Problem] = [
            Problem.init(problemImageName: "Sec210", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sec225", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sec240", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: secDegQIII);
    }
    
    func loadSecantDegreeQuadIVProblems(){
        let secDegQIV : [Problem] = [
            Problem.init(problemImageName: "Sec300", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sec315", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sec330", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: secDegQIV);
    }
    /********** Functions for Loading Secant (Radians) Problems **********/
    func loadSecantRadiansQuadrantalProblems (){
        let secRadsQuadrantals : [Problem] = [
            Problem.init(problemImageName: "Sec0rads", correctAnswer: "1", answerImageName: "One", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "SecPiOver2", correctAnswer: "u", answerImageName: "U", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "SecPi", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Sec3PiOver2", correctAnswer: "u", answerImageName: "U", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: secRadsQuadrantals);
    }
    
    func loadSecantRadiansQuadIProblems(){
        let secRadsQI : [Problem] = [
            Problem.init(problemImageName: "SecPiOver6", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "SecPiOver4", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "SecPiOver3", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: secRadsQI);
    }
    
    func loadSecantRadiansQuadIIProblems(){
        let secRadsQII : [Problem] = [
            Problem.init(problemImageName: "Sec2PiOver3", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sec3PiOver4", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Sec5PiOver6", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: secRadsQII);
    }
    
    func loadSecantRadiansQuadIIIProblems(){
        let secRadsQIII : [Problem] = [
            Problem.init(problemImageName: "Sec7PiOver6", correctAnswer: "-1.154…", answerImageName: "Negative2Root3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sec5PiOver4", correctAnswer: "-1.414…", answerImageName: "NegativeRoot2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Sec4PiOver3", correctAnswer: "-2", answerImageName: "Negative2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: secRadsQIII);
    }
    
    func loadSecantRadiansQuadIVProblems(){
        let secRadsQIV : [Problem] = [
            Problem.init(problemImageName: "Sec5PiOver3", correctAnswer: "2", answerImageName: "Two", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sec7PiOver4", correctAnswer: "1.414…", answerImageName: "Root2", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Sec11PiOver6", correctAnswer: "1.154…", answerImageName: "TwoRoot3Over3", typeOfProblem: "secant", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: secRadsQIV);
    }
    
    /********** Functions for Loading Cotangent (Degree) Problems **********/
    func loadCotangentDegreeQuadrantalProblems (){
        let cotDegQuandrantals : [Problem] = [
            Problem.init(problemImageName: "Cot0", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cot90", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cot180", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cot270", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: cotDegQuandrantals);
    }
    
    func loadCotangentDegreeQuadIProblems(){
        let cotDegQI : [Problem] = [
            Problem.init(problemImageName: "Cot30", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Cot45", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "Cot60", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: cotDegQI);
    }
    
    func loadCotangentDegreeQuadIIProblems(){
        let cotDegQII : [Problem] = [
            Problem.init(problemImageName: "Cot120", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cot135", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cot150", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: cotDegQII);
    }
    
    func loadCotangentDegreeQuadIIIProblems(){
        let cotDegQIII : [Problem] = [
            Problem.init(problemImageName: "Cot210", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cot225", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cot240", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: cotDegQIII);
    }
    
    func loadCotangentDegreeQuadIVProblems(){
        let cotDegQIV : [Problem] = [
            Problem.init(problemImageName: "Cot300", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cot315", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cot330", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.degrees, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: cotDegQIV);
    }
    
    /********** Functions for Loading Cotangent (Radians) Problems **********/
    func loadCotangentRadiansQuadrantalProblems (){
        let cotRadsQuandrantals : [Problem] = [
            Problem.init(problemImageName: "Cot0rads", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "CotPiOver2", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "CotPi", correctAnswer: "u", answerImageName: "U", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal),
            Problem.init(problemImageName: "Cot3PiOver2", correctAnswer: "0", answerImageName: "Zero", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.quadrantal)
        ];
        libraryOfProblems.append(contentsOf: cotRadsQuandrantals);
    }
    
    func loadCotangentRadiansQuadIProblems(){
        let cotRadsQI : [Problem] = [
            Problem.init(problemImageName: "CotPiOver6", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "CotPiOver4", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I),
            Problem.init(problemImageName: "CotPiOver3", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.I)
        ];
        libraryOfProblems.append(contentsOf: cotRadsQI);
    }
    
    func loadCotangentRadiansQuadIIProblems(){
        let cotRadsQII : [Problem] = [
            Problem.init(problemImageName: "Cot2PiOver3", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cot3PiOver4", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II),
            Problem.init(problemImageName: "Cot5PiOver6", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.II)
        ];
        libraryOfProblems.append(contentsOf: cotRadsQII);
    }
    
    func loadCotangentRadiansQuadIIIProblems(){
        let cotRadsQIII : [Problem] = [
            Problem.init(problemImageName: "Cot7PiOver6", correctAnswer: "1.732…", answerImageName: "Root3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cot5PiOver4", correctAnswer: "1", answerImageName: "One", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III),
            Problem.init(problemImageName: "Cot4PiOver3", correctAnswer: "0.577…", answerImageName: "Root3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.III)
        ];
        libraryOfProblems.append(contentsOf: cotRadsQIII);
    }
    
    func loadCotangentRadiansQuadIVProblems(){
        let cotRadsQIV : [Problem] = [
            Problem.init(problemImageName: "Cot5PiOver3", correctAnswer: "-0.577…", answerImageName: "NegativeRoot3Over3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cot7PiOver4", correctAnswer: "-1", answerImageName: "Negative1", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV),
            Problem.init(problemImageName: "Cot11PiOver6", correctAnswer: "-1.732…", answerImageName: "NegativeRoot3", typeOfProblem: "cotangent", unitsOfAngle: Problem.angleUnits.radians, problemQuadrant: Problem.quadrant.IV)
        ];
        libraryOfProblems.append(contentsOf: cotRadsQIV);
    }
    
    func getRandomProblem() -> Problem {
        if(libraryOfProblems.count>0)
        {
            let randomNum = Int(arc4random_uniform(UInt32(libraryOfProblems.count)));
            currProblem = libraryOfProblems.remove(at: randomNum);
        }
        return currProblem!;
    }
    
    func isCorrect(_ answer : String) -> Bool {
        if(currProblem?.correctAnswer == answer)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    func getCurrProblem() -> Problem
    {
        return currProblem!;
    }
}
