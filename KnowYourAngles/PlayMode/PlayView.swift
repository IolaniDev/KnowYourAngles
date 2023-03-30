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
    @State var problemImageName = ""
    @State var clearWritingSpace = false
    @State var submitAnswer = false
    @State private var feedbackSymbol = 2
    
    @StateObject var summary = SummaryGrid()
    @State var showSummary = false
    
    @State public var lines: [Line] = []
    
    @ViewBuilder
    var body: some View {
        
        ZStack {
            
            if(!modelData.hasStarted)
            {
                BackgroundColor()
            }
            else
            {
                ScratchPaper(lines: self.$lines)
            }
            VStack (alignment: .center, spacing: 60, content: {
                
                Spacer()
                
                VStack (alignment: .center, spacing: 30, content: {
                    
                    TimerView()
                        .scaledToFit()
                    
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
                
                //Divider()
                
                //If we haven't started yet, display a Start Button (starting the timer will also "Start")
                if(!modelData.hasStarted)
                {
                    Text("Start")
                        .font(.system(size: 80))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                        .onTapGesture {
                            modelData.hasStarted = true
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
                            
                            //ZStack to hold the writing space, clear button, and submit button
                            ZStack (alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                                
                                PlayViewController(runClearButton: $clearWritingSpace, submitAnswer: $submitAnswer)
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
        .onDisappear(perform: {
            modelData.hasStarted = false
        })
    }//end View
}//end PlayView struct

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
    }
}
