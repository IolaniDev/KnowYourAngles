//
//  PlayView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/21/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var modelData : ModelData
    //@ObservedObject var userSettings = UserSettings()
    @State var problemImageName = ""
    @State var numberCorrect = 0
    @State var i=0
    var playViewController : PlayViewController
    var currentProblemSet : [Problem] {
        modelData.allProblems.filter {
            problem in (problem.typeOfProblem=="sine")
        }
    }
    @State private var feedbackSymbol : Int
    
    init()
    {
        playViewController = PlayViewController()
        feedbackSymbol = 2
    }
    
    @ViewBuilder
    var body: some View {
        
        ZStack {
            
            BackgroundColor()
            
            VStack (alignment: .center, spacing: 60, content: {
                
                VStack (alignment: .center, spacing: 30, content: {
                    
                    Text("00:00")
                        .font(.system(size: 80))
                    
                    ZStack {
                        ProgressSymbol(name: "KYA_Star_Icon")
                            .frame(width: 500, height: 500)
                            .scaleEffect(1.0 / 4.0)
                            .frame(width: 100, height: 100)
                        Text("\(numberCorrect)")
                            .font(.system(size: 45, weight: .heavy, design: .serif))
                            .foregroundColor(Color(red: 1, green: 0, blue: 0, opacity: 1.0))
                            .offset(CGSize(width: 0, height: 5))
                    }
                })
                
                Divider()
                
                Image(currentProblemSet[i%currentProblemSet.count].id)
                    .resizable()
                    .scaledToFit()
                    .frame(idealWidth: 500, maxHeight: 300, alignment: .center)
                
                VStack {
                    
                    //ZStack to hold the writing space, clear button, and submit button
                    ZStack (alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                        
                        playViewController
                            .frame(width: 500, height: 300, alignment: .center)
                        
                        VStack(alignment: .trailing)
                        {
                            //When the Clear button is pressed...
                            Button(action: {
                                playViewController.editorViewController.editor.clear()
                            })
                            {
                                Text("Clear")
                            }
                            
                            Spacer()
                            
                            //When the user hits "Submit"
                            Button(action: {
                                //if the result is not empty, a conversion is not required (should've been done after the user finished writing), and the user is finished writing
                                var result : String = ""
                                if(!playViewController.editorViewController.editor.isEmpty(playViewController.editorViewController.editor.rootBlock!) && !playViewController.editorViewController.inputView.convertRequired && playViewController.editorViewController.editor.idle)
                                {
                                    
                                    //Get the transform to change from MyScript's mm to pixels
                                    let transform = playViewController.editorViewController.editor.renderer.viewTransform;
                                    
                                    //get the size of the screenshot we wantto take
                                    let picWidthMm = playViewController.editorViewController.editor.rootBlock!.box.width;
                                    let picHeightMm = playViewController.editorViewController.editor.rootBlock!.box.height;
                                    
                                    //apply the transform to the dimensions of the screenshot in mm to get pixels
                                    let picDimensionsMm = CGPoint(x: picWidthMm,y: picHeightMm);
                                    let picDimensions = picDimensionsMm.applying(transform);
                                    
                                    //set the screenshot size as the context
                                    UIGraphicsBeginImageContext(CGSize(width: picDimensions.x, height: picDimensions.y));
                                    
                                    //Get the position of the converted writing
                                    let picPositionMm = CGPoint(x: playViewController.editorViewController.editor.rootBlock!.box.minX,y: playViewController.editorViewController.editor.rootBlock!.box.minY);
                                    //apply the transform to the position in mm to get pixels
                                    let picPosition = picPositionMm.applying(transform);
                                    
                                    //use the contents of the mathView to draw in the context
                                    playViewController.editorViewController.view.drawHierarchy(in: CGRect(x: -picPosition.x, y: -picPosition.y, width: playViewController.editorViewController.view.bounds.size.width, height: playViewController.editorViewController.view.bounds.size.height), afterScreenUpdates: true);
                                    
                                    //get the result as an image
                                    var answerImg = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage();
                                    UIGraphicsEndImageContext();
                                    
                                    do {
                                        //get all of the "blocks" written by the user
                                        let supportedTargetStates = playViewController.editorViewController.editor.getSupportedTargetConversionState(nil)
                                        //convert the contents of the block to text?
                                        try playViewController.editorViewController.editor.convert(nil, targetState: supportedTargetStates[0].value)
                                        //get all of the supported MIME Types that we can export the result as
                                        let supportedMimeTypes = playViewController.editorViewController.editor.getSupportedExportMimeTypes(nil);
                                        
                                        //get the result as string
                                        result = try playViewController.editorViewController.editor!.export_(nil, mimeType: supportedMimeTypes[0].value);
                                        
                                        //the result string will either have an equals symbol, a simeq (or approx symbol), or will just have a value
                                        //we'll need to strip away everything but the value
                                        //we also need to make sure that there are no spaces after the value
                                        if(result.contains("="))
                                        {
                                            result = String(result[result.index(after: result.firstIndex(of: "=")!)...]);
                                        }
                                        else if(result.contains("simeq"))
                                        {
                                            result = String(result[result.index(after: result.lastIndex(of: " ")!)...]);
                                        }
                                        else if(result.contains(" "))
                                        {
                                            result = result.trimmingCharacters(in: .whitespacesAndNewlines);
                                        }
                                        print("Parsed Answer: " + result);
                                    } catch {
                                        print("Error while converting : " + error.localizedDescription)
                                    }
                                    
                                    //check if the user's answer is correct
                                    if(checkAnswer(currentProblem: currentProblemSet[i%currentProblemSet.count], submittedAnswer: result))
                                    {
                                        //TODO: Add 1 to the progress symbol
                                        numberCorrect += 1
                                        print("Number Correct \(numberCorrect)")
                                        feedbackSymbol = 0
                                    }
                                    else {
                                        feedbackSymbol = 1
                                    }
                                    
                                    /*//add images to the summary view on the finish screen
                                     summariesToSend.append(UIImage(named: problemSource.getCurrProblem().problemImageName)!);
                                     summariesToSend.append(UIImage(named: problemSource.getCurrProblem().answerImageName)!);
                                     summariesToSend.append(answerImg);
                                     summariesToSend.append(markImg);
                                     */
                                    
                                    /*// if we ran through the requested number of problems...
                                     if(Int(correctingMarksView.numRemaining.text!)! <= 0)
                                     {
                                     // segue to finish screen.
                                     performSegue(withIdentifier: "toFinishScreen", sender: self);
                                     }
                                     else
                                     {
                                     
                                     
                                     }
                                     }
                                     }*/
                                    
                                    result = ""
                                    
                                    // set up a new problem
                                    i = i + 1
                                    playViewController.editorViewController.editor.clear()
                                    //scratchPaperImageView.image = nil;
                                }
                            })
                            {
                                Text("Submit")
                            }
                        }.font(.system(size: 36, weight: .regular, design: .serif))
                        .foregroundColor(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255, opacity: 1.0))
                        .padding()
                        
                        if(feedbackSymbol==0){
                            Image("Correct")
                                .frame(width: 500, height: 300, alignment: .center)
                                .animation(.easeInOut(duration: 1))
                                .onAppear(perform: {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                                        feedbackSymbol=2
                                    })})
                        }
                        else if(feedbackSymbol == 1) {
                            Image("Wrong").transition(.opacity)
                                .frame(width: 500, height: 300, alignment: .center)
                                .animation(.easeInOut(duration: 1))
                                .onAppear(perform: {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
                                        feedbackSymbol=2
                                    })})
                        }
                        else
                        {
                            
                        }
                        
                    }.frame(width: 500, height: 300)

                }//VStack
                Spacer()
            })//end VStack
            .frame(width: 500, alignment: .center)
            .padding()
        }//end Zstack
    }//end View
    
    func checkAnswer(currentProblem: Problem, submittedAnswer: String)->Bool {
        if(currentProblem.otherCorrectAnswer.lowercased() != "")
        {
            if(currentProblem.correctAnswer.lowercased() == submittedAnswer.lowercased() || currentProblem.otherCorrectAnswer.lowercased() == submittedAnswer.lowercased())
            {
                return true
            }
            else
            {
                return false
            }
        }
        else if (currentProblem.correctAnswer.lowercased() == submittedAnswer.lowercased())
        {
            return true
        }
        else
        {
            return false
        }
    }
}//end PlayView struct

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
    }
}
