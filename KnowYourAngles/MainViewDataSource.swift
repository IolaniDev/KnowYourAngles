//
//  MainViewDataSource.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/10/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation

class MainViewDataSource : NSObject{
    
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
    
    /********** Functions for Loading Inverse Sine Problems **********/
    func loadArcsineQuadrantalProblems (){
        let arcsineQuadrantals : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArcsinNegative1", correctAnswer: "-1.570…", answerImageName: "NegativePiOver2", otherCorrectAnswer: "-90", otherAnswerImageName: "Negative90deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal),
            InverseProblem.init(problemImageName: "Arcsin0", correctAnswer: "0", answerImageName: "0rads", otherCorrectAnswer: "0", otherAnswerImageName: "0deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal),
            InverseProblem.init(problemImageName: "Arcsin1", correctAnswer: "1.570…", answerImageName: "PiOver2", otherCorrectAnswer: "90", otherAnswerImageName: "90deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal)
        ]
        libraryOfProblems.append(contentsOf: arcsineQuadrantals);
    }
    
    func loadArcsineQuadIProblems (){
        let arcsineQI : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arcsin1Over2", correctAnswer: "0.523…", answerImageName: "PiOver6", otherCorrectAnswer: "30", otherAnswerImageName: "30deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArcsinRoot2Over2", correctAnswer: "0.785…", answerImageName: "PiOver4", otherCorrectAnswer: "45", otherAnswerImageName: "45deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArcsinRoot3Over2", correctAnswer: "1.047…", answerImageName: "PiOver3", otherCorrectAnswer: "60", otherAnswerImageName: "60deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I)
        ]
        libraryOfProblems.append(contentsOf: arcsineQI);
    }
    
    func loadArcsineQuadIVProblems (){
        let arcsineQIV : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArcsinNegativeRoot3Over2", correctAnswer: "-1.047…", answerImageName: "NegativePiOver3", otherCorrectAnswer: "-60", otherAnswerImageName: "Negative60deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV),
            InverseProblem.init(problemImageName: "ArcsinNegativeRoot2Over2", correctAnswer: "-0.785…", answerImageName: "NegativePiOver4", otherCorrectAnswer: "-45", otherAnswerImageName: "Negative45deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV),
            InverseProblem.init(problemImageName: "ArcsinNegative1Over2", correctAnswer: "-0.523…", answerImageName: "NegativePiOver6", otherCorrectAnswer: "-30", otherAnswerImageName: "Negative30deg", typeOfProblem: "arcsine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV)
        ]
        libraryOfProblems.append(contentsOf: arcsineQIV);
    }
    
    /********** Functions for Loading Inverse Cosine Problems **********/
    func loadArccosineQuadrantalProblems (){
        let arccosineQuadrantals : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArccosNegative1", correctAnswer: "3.141…", answerImageName: "Pi", otherCorrectAnswer: "180", otherAnswerImageName: "180deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal),
            InverseProblem.init(problemImageName: "Arccos0", correctAnswer: "1.570…", answerImageName: "PiOver2", otherCorrectAnswer: "90", otherAnswerImageName: "90deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal),
            InverseProblem.init(problemImageName: "Arccos1", correctAnswer: "0", answerImageName: "0rads", otherCorrectAnswer: "0", otherAnswerImageName: "0deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal)
        ]
        libraryOfProblems.append(contentsOf: arccosineQuadrantals);
    }
    
    func loadArccosineQuadIProblems (){
        let arccosineQI : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arccos1Over2", correctAnswer: "1.047…", answerImageName: "PiOver3", otherCorrectAnswer: "60", otherAnswerImageName: "60deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArccosRoot2Over2", correctAnswer: "0.785…", answerImageName: "PiOver4", otherCorrectAnswer: "45", otherAnswerImageName: "45deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArccosRoot3Over2", correctAnswer: "0.523…", answerImageName: "PiOver6", otherCorrectAnswer: "30", otherAnswerImageName: "30deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I)
        ]
        libraryOfProblems.append(contentsOf: arccosineQI);
    }
    
    func loadArccosineQuadIIProblems (){
        let arccosineQII : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArccosNegativeRoot3Over2", correctAnswer: "2.617…", answerImageName: "FivePiOver6", otherCorrectAnswer: "150", otherAnswerImageName: "150deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II),
            InverseProblem.init(problemImageName: "ArccosNegativeRoot2Over2", correctAnswer: "2.356…", answerImageName: "ThreePiOver4", otherCorrectAnswer: "135", otherAnswerImageName: "135deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II),
            InverseProblem.init(problemImageName: "ArccosNegative1Over2", correctAnswer: "2.094…", answerImageName: "TwoPiOver3", otherCorrectAnswer: "120", otherAnswerImageName: "120deg", typeOfProblem: "arccosine", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II)
        ]
        libraryOfProblems.append(contentsOf: arccosineQII);
    }
    
    /********** Functions for Loading Inverse Tangent Problems **********/
    func loadArctangentQuadrantalProblems (){
        let arctangentQuadrantals : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arctan0", correctAnswer: "0", answerImageName: "0rads", otherCorrectAnswer: "0", otherAnswerImageName: "0deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal)
        ]
        libraryOfProblems.append(contentsOf: arctangentQuadrantals);
    }
    
    func loadArctangentQuadIProblems (){
        let arctangentQuadI : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArctanRoot3Over3", correctAnswer: "0.523…", answerImageName: "PiOver6", otherCorrectAnswer: "30", otherAnswerImageName: "30deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "Arctan1", correctAnswer: "0.785…", answerImageName: "PiOver4", otherCorrectAnswer: "45", otherAnswerImageName: "45deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArctanRoot3", correctAnswer: "1.047…", answerImageName: "PiOver3", otherCorrectAnswer: "60", otherAnswerImageName: "60deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I)
        ]
        libraryOfProblems.append(contentsOf: arctangentQuadI);
    }
    
    func loadArctangentQuadIVProblems (){
        let arctangentQuadIV : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArctanNegativeRoot3Over3", correctAnswer: "-0.523…", answerImageName: "NegativePiOver6", otherCorrectAnswer: "-30", otherAnswerImageName: "Negative30deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV),
            InverseProblem.init(problemImageName: "ArctanNegative1", correctAnswer: "-0.785…", answerImageName: "NegativePiOver4", otherCorrectAnswer: "-45", otherAnswerImageName: "Negative45deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV),
            InverseProblem.init(problemImageName: "ArctanNegativeRoot3", correctAnswer: "-1.047…", answerImageName: "NegativePiOver3", otherCorrectAnswer: "-60", otherAnswerImageName: "Negative60deg", typeOfProblem: "arctangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV)
        ]
        libraryOfProblems.append(contentsOf: arctangentQuadIV);
    }
    
    /********** Functions for Loading Inverse Cosecant Problems **********/
    func loadArccosecantQuadrantalProblems (){
        let arccosecantQuadrantals : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArccscNegative1", correctAnswer: "-1.570…", answerImageName: "NegativePiOver2", otherCorrectAnswer: "-90", otherAnswerImageName: "Negative90", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal),
            InverseProblem.init(problemImageName: "Arccsc1", correctAnswer: "1.570…", answerImageName: "PiOver2", otherCorrectAnswer: "90", otherAnswerImageName: "90deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal)
        ]
        libraryOfProblems.append(contentsOf: arccosecantQuadrantals);
    }
    
    func loadArccosecantQuadIProblems (){
        let arccosecantQuadI : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arccsc2", correctAnswer: "0.523…", answerImageName: "PiOver6", otherCorrectAnswer: "30", otherAnswerImageName: "30deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArccscRoot2", correctAnswer: "0.785…", answerImageName: "PiOver4", otherCorrectAnswer: "45", otherAnswerImageName: "45deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "Arccsc2Root3Over3", correctAnswer: "1.047…", answerImageName: "PiOver3", otherCorrectAnswer: "60", otherAnswerImageName: "60deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I)
        ]
        libraryOfProblems.append(contentsOf: arccosecantQuadI);
    }
    
    func loadArccosecantQuadIVProblems (){
        let arccosecantQuadIV : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArccscNegative2", correctAnswer: "-0.523…", answerImageName: "NegativePiOver6", otherCorrectAnswer: "-30", otherAnswerImageName: "Negative30deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV),
            InverseProblem.init(problemImageName: "ArccscNegativeRoot2", correctAnswer: "-0.785…", answerImageName: "NegativePiOver4", otherCorrectAnswer: "-45", otherAnswerImageName: "Negative45deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV),
            InverseProblem.init(problemImageName: "ArccscNegative2Root3Over3", correctAnswer: "-1.047…", answerImageName: "NegativePiOver3", otherCorrectAnswer: "-60", otherAnswerImageName: "Negative60deg", typeOfProblem: "arccosecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.IV)
        ]
        libraryOfProblems.append(contentsOf: arccosecantQuadIV);
    }
    
    /********** Functions for Loading Inverse Secant Problems **********/
    func loadArcsecantQuadrantalProblems (){
        let arcsecQuadrantals : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arcsec1", correctAnswer: "0", answerImageName: "0rads", otherCorrectAnswer: "0", otherAnswerImageName: "0deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal),
            InverseProblem.init(problemImageName: "ArcsecNegative1", correctAnswer: "3.141…", answerImageName: "Pi", otherCorrectAnswer: "180", otherAnswerImageName: "180deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal)
        ]
        libraryOfProblems.append(contentsOf: arcsecQuadrantals);
    }
    
    func loadArcsecantQuadIProblems (){
        let arcsecQuadI : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arcsec2Root3Over3", correctAnswer: "0.523…", answerImageName: "PiOver6", otherCorrectAnswer: "30", otherAnswerImageName: "30deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArcsecRoot2", correctAnswer: "0.785…", answerImageName: "PiOver4", otherCorrectAnswer: "45", otherAnswerImageName: "45deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "Arcsec2", correctAnswer: "1.047…", answerImageName: "PiOver3", otherCorrectAnswer: "60", otherAnswerImageName: "60deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I)
        ]
        libraryOfProblems.append(contentsOf: arcsecQuadI);
    }
    
    func loadArcsecantQuadIIProblems (){
        let arcsecQuadII : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArcsecNegative2", correctAnswer: "2.094…", answerImageName: "TwoPiOver3", otherCorrectAnswer: "120", otherAnswerImageName: "120deg", typeOfProblem: "Arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II),
            InverseProblem.init(problemImageName: "ArcsecNegativeRoot2", correctAnswer: "2.356…", answerImageName: "ThreePiOver4", otherCorrectAnswer: "135", otherAnswerImageName: "135deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II),
            //5 pi over 6
            InverseProblem.init(problemImageName: "ArcsecNegative2Root3Over3", correctAnswer: "2.617…", answerImageName: "FivePiOver6", otherCorrectAnswer: "150", otherAnswerImageName: "150deg", typeOfProblem: "arcsecant", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II)
        ]
        libraryOfProblems.append(contentsOf: arcsecQuadII);
    }
    
    /********** Functions for Loading Inverse Cotangent Problems **********/
    func loadArccotangentQuadrantalProblems (){
        let arccotQuadrantals : [InverseProblem] = [
            InverseProblem.init(problemImageName: "Arccot0", correctAnswer: "1.570…", answerImageName: "PiOver2", otherCorrectAnswer: "90", otherAnswerImageName: "90deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.quadrantal)
        ]
        libraryOfProblems.append(contentsOf: arccotQuadrantals);
    }
    
    func loadArccotangentQuadIProblems (){
        let arccotQuadI : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArccotRoot3", correctAnswer: "0.523…", answerImageName: "PiOver6", otherCorrectAnswer: "30", otherAnswerImageName: "30deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "Arccot1", correctAnswer: "0.785…", answerImageName: "PiOver4", otherCorrectAnswer: "45", otherAnswerImageName: "45deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I),
            InverseProblem.init(problemImageName: "ArccotRoot3Over3", correctAnswer: "1.047…", answerImageName: "PiOver3", otherCorrectAnswer: "60", otherAnswerImageName: "60deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.I)
        ]
        libraryOfProblems.append(contentsOf: arccotQuadI);
    }
    
    func loadArccotangentQuadIIProblems (){
        let arccotQuadII : [InverseProblem] = [
            InverseProblem.init(problemImageName: "ArccotNegativeRoot3Over3", correctAnswer: "2.094…", answerImageName: "TwoPiOver3", otherCorrectAnswer: "120", otherAnswerImageName: "120deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II),
            InverseProblem.init(problemImageName: "ArccotNegative1", correctAnswer: "2.356…", answerImageName: "ThreePiOver4", otherCorrectAnswer: "135", otherAnswerImageName: "135deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II),
            InverseProblem.init(problemImageName: "ArccotNegativeRoot3", correctAnswer: "2.617…", answerImageName: "FivePiOver6", otherCorrectAnswer: "150", otherAnswerImageName: "150deg", typeOfProblem: "arccotangent", unitsOfAngle: Problem.angleUnits.radiansAndDegrees, problemQuadrant: Problem.quadrant.II)
        ]
        libraryOfProblems.append(contentsOf: arccotQuadII);
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
