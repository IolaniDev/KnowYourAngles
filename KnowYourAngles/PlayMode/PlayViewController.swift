//
//  PlayViewController.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/23/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI
import UIKit

struct PlayViewController: UIViewControllerRepresentable {
    
    @EnvironmentObject var playViewDelegate : AppDelegate
    @EnvironmentObject var modelData : ModelData
    @EnvironmentObject var summary : SummaryGrid
    //@EnvironmentObject var userSettings : UserSettings
    typealias UIViewControllerType = UIPlayViewController
    var editorViewController = EditorViewController()
    @Binding var runClearButton : Bool
    @Binding var submitAnswer : Bool
    @Binding var updateStatistics : Bool
    
    func makeUIViewController(context: Context) -> UIPlayViewController {
        let playViewController = UIPlayViewController()
        
        playViewController.addChild(editorViewController)
        playViewController.view.addSubview(editorViewController.view)
        editorViewController.view.frame = playViewController.view.bounds
        editorViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        editorViewController.didMove(toParent: playViewController)
        
        if (playViewDelegate.engine == nil)
        {
            let alert = UIAlertController(title: "Certificate error",
                                          message: playViewDelegate.engineErrorMessage,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: {(action: UIAlertAction) -> Void in
                                            exit(1)
                                          }))
            playViewController.present(alert, animated: true, completion: nil)
        }
        editorViewController.engine = playViewDelegate.engine
        
        editorViewController.inputMode = .forcePen  // We want the Pen mode for this GetStarted sample code. It lets the user use either its mouse or fingers to draw.
        // If you have got an iPad Pro with an Apple Pencil, please set this value to InputModeAuto for a better experience.
        
        func createPackage(packageName: String) throws -> IINKContentPackage? {
            // Create a new content package with name
            var resultPackage: IINKContentPackage?
            let fullPath = FileManager.default.pathForFile(inDocumentDirectory: packageName) + ".iink"
            if let engine = playViewDelegate.engine {
                resultPackage = try engine.createPackage(fullPath.decomposedStringWithCanonicalMapping)
                
                // Add a blank page type Math
                if let part = try resultPackage?.createPart("Math") /* Options are : "Diagram", "Drawing", "Math", "Text Document", "Text" */ {
                    playViewController.title = "Type: " + part.type
                }
            }
            return resultPackage
        }
        
        do {
            if let package = try createPackage(packageName: "New") {
                try editorViewController.editor.part = package.getPartAt(0)
            }
        } catch {
            print("Error while creating package : " + error.localizedDescription)
        }
        
        return playViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPlayViewController, context: Context) {
        //print("updateUIViewController: ")
        if(submitAnswer)
        {
            //add the current problem to the summary
            summary.summaryElements.append(Image(modelData.currentProblem.id))
            
            //add the correct answer to the summary
            summary.summaryElements.append(Image(modelData.currentProblem.answerImageName))
                                        
            let feedbackImageView : UIImageView
            if(modelData.checkAnswer(submittedAnswer: uiViewController.submitButtonPressed()))
            {
                // imageview to hold the green check (meaning correct)
                feedbackImageView = UIImageView(image: UIImage(named: "Correct"))
                updateStatistics(isCorrect: true)
            }
            else
            {
                //imageview to hold the red x (meaning incorrect)
                feedbackImageView = UIImageView(image: UIImage(named: "Wrong"))
                updateStatistics(isCorrect: false)
            }
            //add the user's answer to the summary
            summary.summaryElements.append(Image(uiImage: uiViewController.answerImg))
            
            //add the feedback image to the summary
            summary.summaryElements.append(Image(uiImage: feedbackImageView.image!))
            
            // sets the position of the feedback image
            feedbackImageView.center.x = uiViewController.view.frame.midX;
            feedbackImageView.center.y = uiViewController.view.frame.midY;
            
            // add the feedback image to the screen
            uiViewController.view.addSubview(feedbackImageView);
            uiViewController.view.bringSubviewToFront(feedbackImageView);
            
            // animate the feedback image fading away
            feedbackImageView.alpha = 255;
            UIView.animate(withDuration: 0.5, animations: {
                feedbackImageView.alpha = 0
            })
            
            //set up the next problem
            modelData.getNextProblem()
        }
        if(runClearButton)
        {
            uiViewController.clearButtonPressed()
        }
    }
    
    func updateStatistics(isCorrect: Bool)
    {
        //Based on the units of the angles, update the totals
        if(modelData.currentProblem.unitsOfAngle == Problem.angleUnits.degrees)
        {
            modelData.numberOfCorrectDegreeAnswers += isCorrect ? 1: 0
            modelData.numberOfDegreeProblemsPresented += 1
        }
        else if(modelData.currentProblem.unitsOfAngle == Problem.angleUnits.radians)
        {
            modelData.numberOfCorrectRadiansAnswers += isCorrect ? 1: 0
            modelData.numberOfRadiansProblemsPresented += 1
        }
        else if(modelData.currentProblem.unitsOfAngle == Problem.angleUnits.radiansAndDegrees)
        {
            //update stats on inverse trig problems
            if(modelData.currentProblem.typeOfProblem == "arcsine")
            {
                modelData.numberOfCorrectArcsineAnswers += isCorrect ? 1: 0
                modelData.numberOfArcsineProblemsPresented += 1
            }
            else if(modelData.currentProblem.typeOfProblem == "arccosine")
            {
                modelData.numberOfCorrectArccosineAnswers += isCorrect ? 1: 0
                modelData.numberOfArccosineProblemsPresented += 1
            }
            else if(modelData.currentProblem.typeOfProblem == "arctangent")
            {
                modelData.numberOfCorrectArctangentAnswers += isCorrect ? 1: 0
                modelData.numberOfArctangentProblemsPresented += 1
            }
            else if(modelData.currentProblem.typeOfProblem == "arccosecant")
            {
                modelData.numberOfCorrectArccosecantAnswers += isCorrect ? 1: 0
                modelData.numberOfArccosecantProblemsPresented += 1
            }
            else if(modelData.currentProblem.typeOfProblem == "arcsecant")
            {
                modelData.numberOfCorrectArcsecantAnswers += isCorrect ? 1: 0
                modelData.numberOfArcsecantProblemsPresented += 1
            }
            else if(modelData.currentProblem.typeOfProblem == "arccotangent")
            {
                modelData.numberOfCorrectArccotangentAnswers += isCorrect ? 1: 0
                modelData.numberOfArccotangentProblemsPresented += 1
            }
        }
        
        //based on trig function, update the totals
        if(modelData.currentProblem.typeOfProblem == "sine")
        {
            modelData.numberOfCorrectSineAnswers += isCorrect ? 1: 0
            modelData.numberOfSineProblemsPresented += 1
        }
        else if(modelData.currentProblem.typeOfProblem == "cosine")
        {
            modelData.numberOfCorrectCosineAnswers += isCorrect ? 1: 0
            modelData.numberOfCosineProblemsPresented += 1
        }
        else if(modelData.currentProblem.typeOfProblem == "tangent")
        {
            modelData.numberOfCorrectTangentAnswers += isCorrect ? 1: 0
            modelData.numberOfTangentProblemsPresented += 1
        }
        else if(modelData.currentProblem.typeOfProblem == "cosecant")
        {
            modelData.numberOfCorrectCosecantAnswers += isCorrect ? 1: 0
            modelData.numberOfCosecantProblemsPresented += 1
        }
        else if(modelData.currentProblem.typeOfProblem == "secant")
        {
            modelData.numberOfCorrectSecantAnswers += isCorrect ? 1: 0
            modelData.numberOfSecantProblemsPresented += 1
        }
        else if(modelData.currentProblem.typeOfProblem == "cotangent")
        {
            modelData.numberOfCorrectCotangentAnswers += isCorrect ? 1: 0
            modelData.numberOfCotangentProblemsPresented += 1
        }
    }
}
