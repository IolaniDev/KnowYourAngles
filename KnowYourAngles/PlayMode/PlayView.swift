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
    @EnvironmentObject var userSettings : UserSettings
    
    @State var problemImageName = ""
    @State var clearWritingSpace = false
    @State var submitAnswer = false
    @State var updateStatistics = false
    @State private var feedbackSymbol = 2
    
    @StateObject var summary = SummaryGrid()
    @State var showSummary = false
    
    @State public var lines: [Line] = []
    @State var timerOn : Bool = true
    @State var isTimerHidden : Bool = false
    @State var endButtonAlignment : Alignment = .trailing
    
    @ViewBuilder
    var body: some View {
        
        ZStack (alignment: .top){
            
            //If the user hasn't started playing or is finished playing, then display a blank colored background
            if(!modelData.hasStarted || modelData.finished)
            {
                BackgroundColor()
            }
            //Otherwise, draw the scratch paper and End button
            else
            {
                ScratchPaper(lines: self.$lines, isLeftSide: $userSettings.isLeftHandMode)
                    Button(action: {
                        modelData.finished = true
                        
                    })
                    {
                        Text("End")
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                            .frame(maxWidth: .infinity, alignment: endButtonAlignment)
                            .padding()
                    }
            }
            VStack (alignment: .center, spacing: 60, content: {
                
                Spacer()
                
                VStack (alignment: .center, spacing: 30, content: {
                    
                    if(!isTimerHidden)
                    {
                        TimerView(timerOn: $timerOn, isTimerHidden: $isTimerHidden)
                            .scaledToFit()
                    }
                    
                    ZStack {
                        ProgressSymbol(name: "KYA_Star_Icon")
                            .frame(width: 500, height: 500)
                            .scaleEffect(1.0 / 4.0)
                            .frame(width: 100, height: 100)
                        Text("\(modelData.numberOfCorrectAnswers)")
                            .font(.system(size: 45, weight: .heavy, design: .serif))
                            .foregroundColor(Color(red: 1, green: 0, blue: 0, opacity: 1.0))
                            .offset(CGSize(width: 0, height: 5))
                    }
                })
                
                //If we haven't started yet, display a Start Button (starting the timer will also "Start")
                if(!modelData.hasStarted)
                {
                    Text("Start")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                        .onTapGesture {
                            modelData.hasStarted = true
                            modelData.finished = false
                            timerOn = true
                        }
                }
                else {
                    //As long as there are questions to answer, show the current problem
                    if(!modelData.finished)
                    {
                        VStack {
                            Image(modelData.setCurrentProblem().id)
                                .resizable()
                                .scaledToFit()
                                .frame(idealWidth: 500, maxHeight: 300, alignment: .center)
                            
                            if(!userSettings.isLeftHandMode)
                            {
                                //ZStack to hold the writing space, clear button, and submit button
                                ZStack (alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                                    
                                    PlayViewController(runClearButton: $clearWritingSpace, submitAnswer: $submitAnswer, updateStatistics: $updateStatistics)
                                        .frame(width: 500, height: 300, alignment: .center)
                                        .environmentObject(summary)
                                    
                                    VStack(alignment: .trailing)
                                    {
                                        //When the Clear button is pressed...
                                        Button(action: {
                                            clearWritingSpace = true
                                        })
                                        {
                                            Text("Clear")
                                        }
                                        
                                        Spacer()
                                        
                                        //When the user hits "Submit"
                                        Button(action: {
                                            submitAnswer = true
                                            clearWritingSpace = true
                                            lines = []
                                        })
                                        {
                                            Text("Submit")
                                        }
                                    }//end VStack that holds the Clear and Submit buttons
                                    .font(.system(size: 36, weight: .regular, design: .serif))
                                    .foregroundColor(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255, opacity: 1.0))
                                    .padding()
                                    .onChange(of: clearWritingSpace, perform: { value in
                                        clearWritingSpace = false
                                    })
                                    .onChange(of: submitAnswer, perform: { value in
                                        submitAnswer = false
                                    })
                                    
                                }//end ZStack that holds the PlayViewController
                                .frame(width: 500, height: 300)
                            }
                            else
                            {
                                //ZStack to hold the writing space, clear button, and submit button
                                ZStack (alignment: Alignment(horizontal: .leading, vertical: .center)) {
                                    
                                    PlayViewController(runClearButton: $clearWritingSpace, submitAnswer: $submitAnswer, updateStatistics: $updateStatistics)
                                        .frame(width: 500, height: 300, alignment: .center)
                                        .environmentObject(summary)
                                    
                                    VStack(alignment: .leading)
                                    {
                                        //When the Clear button is pressed...
                                        Button(action: {
                                            clearWritingSpace = true
                                        })
                                        {
                                            Text("Clear")
                                        }
                                        
                                        Spacer()
                                        
                                        //When the user hits "Submit"
                                        Button(action: {
                                            submitAnswer = true
                                            clearWritingSpace = true
                                            lines = []
                                        })
                                        {
                                            Text("Submit")
                                        }
                                    }//end VStack that holds the Clear and Submit buttons
                                    .font(.system(size: 36, weight: .regular, design: .serif))
                                    .foregroundColor(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255, opacity: 1.0))
                                    .padding()
                                    .onChange(of: clearWritingSpace, perform: { value in
                                        clearWritingSpace = false
                                    })
                                    .onChange(of: submitAnswer, perform: { value in
                                        submitAnswer = false
                                    })
                                    
                                }//end ZStack that holds the PlayViewController
                                .frame(width: 500, height: 300)
                            }
                        }
                    }
                    //otherwise, display that the user is finished
                    else
                    {
                        VStack {
                            Text("Finished!")
                                .font(.system(size: 48, weight: .regular, design: .serif))
                                .foregroundColor(Color(red: 51.0/255, green: 255.0/255, blue: 247.0/255, opacity: 1.0))
                        }
                        .frame(idealWidth: 500, maxHeight: 300, alignment: .center)
                        
                        Button (action: {showSummary = true}) {
                            Text("Summary")
                        }.sheet(isPresented: $showSummary, content: {
                            SummaryGridView()
                                .animation(.easeInOut,value: showSummary)
                                .environmentObject(summary)
                                .scaledToFill()
                        })
                        .font(.system(size: 36, weight: .regular, design: .serif))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                    }
                    
                }
                Spacer()
            })//end VStack
            .frame(width: 500, alignment: .center)
            //.padding(EdgeInsets(top: , leading: 0, bottom: 0, trailing: 0))
        }//end Zstack
        .onAppear(perform: {
            endButtonAlignment = userSettings.isLeftHandMode ? .leading : .trailing
        })
        .onDisappear(perform: {
            modelData.hasStarted = false
            //update statistics
            userSettings.degreeStatsNumTotal += modelData.numberOfDegreeProblemsPresented
            userSettings.degreeStatsNumCorrect += modelData.numberOfCorrectDegreeAnswers
            userSettings.radiansStatsNumTotal += modelData.numberOfRadiansProblemsPresented
            userSettings.radiansStatsNumCorrect += modelData.numberOfCorrectRadiansAnswers
            userSettings.sineStatsNumTotal += modelData.numberOfSineProblemsPresented
            userSettings.sineStatsNumCorrect += modelData.numberOfCorrectSineAnswers
            userSettings.cosineStatsNumTotal += modelData.numberOfCosineProblemsPresented
            userSettings.cosineStatsNumCorrect += modelData.numberOfCorrectCosineAnswers
            userSettings.tangentStatsNumTotal += modelData.numberOfTangentProblemsPresented
            userSettings.tangentStatsNumCorrect += modelData.numberOfCorrectTangentAnswers
            userSettings.cosecantStatsNumTotal += modelData.numberOfCosecantProblemsPresented
            userSettings.cosecantStatsNumCorrect += modelData.numberOfCorrectCosecantAnswers
            userSettings.secantStatsNumTotal += modelData.numberOfSecantProblemsPresented
            userSettings.secantStatsNumCorrect += modelData.numberOfCorrectSecantAnswers
            userSettings.cotangentStatsNumTotal += modelData.numberOfCotangentProblemsPresented
            userSettings.cotangentStatsNumCorrect += modelData.numberOfCorrectCotangentAnswers
            userSettings.arcsineStatsNumTotal += modelData.numberOfArcsineProblemsPresented
            userSettings.arcsineStatsNumCorrect += modelData.numberOfCorrectArcsineAnswers
            userSettings.arccosineStatsNumTotal += modelData.numberOfArccosineProblemsPresented
            userSettings.arccosineStatsNumCorrect += modelData.numberOfCorrectArccosineAnswers
            userSettings.arctangentStatsNumTotal += modelData.numberOfArctangentProblemsPresented
            userSettings.arctangentStatsNumCorrect += modelData.numberOfCorrectArctangentAnswers
            userSettings.arccosecantStatsNumTotal += modelData.numberOfArccosecantProblemsPresented
            userSettings.arccosecantStatsNumCorrect += modelData.numberOfCorrectArccosecantAnswers
            userSettings.arcsecantStatsNumTotal += modelData.numberOfArcsecantProblemsPresented
            userSettings.arcsecantStatsNumCorrect += modelData.numberOfCorrectArcsecantAnswers
            userSettings.arccotangentStatsNumTotal += modelData.numberOfArccotangentProblemsPresented
            userSettings.arccotangentStatsNumCorrect += modelData.numberOfCorrectArccotangentAnswers
        })
    }//end View
}//end PlayView struct

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
            .environmentObject(UserSettings())
    }
}
