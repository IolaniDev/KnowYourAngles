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
    
    @State private var isEditing = false
    @State private var minRemaining = 0
    @State private var secRemaining = 0
    
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerOn = false
    @State private var wakeUp = Date()
    @State var timerLabel = "Timer"
    
    @ViewBuilder
    var body: some View {
        /*let timeFormatter = DateIntervalFormatter()
         timeFormatter.timeStyle = .*/
        ZStack {
            
            BackgroundColor()
            
            VStack (alignment: .center, spacing: 60, content: {
                
                VStack (alignment: .center, spacing: 30, content: {
                    
                    if(!modelData.finished)
                    {
                        HStack(alignment: .center) {
                            Menu (timerLabel) {
                                Button(action: {timerLabel = "00:30"}) {
                                    Text("00:30")
                                }
                                
                                Button(action: {timerLabel = "01:00"}) {
                                    Text("01:00")
                                }
                                
                                Button(action: {timerLabel = "01:30"}) {
                                    Text("01:30")
                                }
                                
                                Button(action: {timerLabel = "02:00"}) {
                                    Text("02:00")
                                }
                                
                                Button(action: {timerLabel = "02:30"}) {
                                    Text("02:30")
                                }
                                
                                Button(action: {timerLabel = "03:00"}) {
                                    Text("03:00")
                                }
                                
                                Button(action: {timerLabel = "03:30"}) {
                                    Text("03:30")
                                }
                                
                                Button(action: {timerLabel = "04:00"}) {
                                    Text("04:00")
                                }
                                
                                Button(action: {timerLabel = "04:30"}) {
                                    Text("04:30")
                                }
                                
                                Button(action: {timerLabel = "05:00"}) {
                                    Text("05:00")
                                }
                            }
                            .foregroundColor(Color.black)
                            
                            //Spacer()
                            
                            Image(systemName: timerOn ? "hourglass.tophalf.fill" : "hourglass.bottomhalf.fill")
                                .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255, opacity: 1.0))
                                .onTapGesture {
                                    if(timerLabel != "Timer")
                                    {
                                        timerOn.toggle()
                                        if(timerOn)
                                        {
                                            minRemaining = Int(timerLabel.components(separatedBy: ":")[0]) ?? 0
                                            secRemaining = Int(timerLabel.components(separatedBy: ":")[1]) ?? 0
                                            startTimer()
                                        }
                                        else
                                        {
                                            stopTimer()
                                        }
                                    }
                                }
                        }
                        .font(.system(size: 80))
                        .padding(.leading, 0.0)
                    }
                    else
                    {
                        Text("00:00")
                            .font(.system(size: 80))
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
                
                Divider()
                
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
                            .animation(.easeInOut)
                            .environmentObject(summary)
                            .scaledToFill()
                    })
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                }
                
                Spacer()
            })//end VStack
            .frame(width: 500, alignment: .center)
            .padding()
        }//end Zstack
        .onReceive(timer) { time in
            //decrease the timer by one second
            secRemaining -= 1
            //if we've reached the end of a minute, subtract a minute and reset seconds to 59.
            if(secRemaining == -1 && minRemaining > 0)
            {
                minRemaining -= 1;
                secRemaining = 59;
            }
            if(secRemaining < 10)
            {
                timerLabel = "0" + String(minRemaining) + ":0" + String(secRemaining)
            }
            else
            {
                timerLabel = "0" + String(minRemaining) + ":" + String(secRemaining)
            }
            if(secRemaining <= 0 && minRemaining <= 0)
            {
                stopTimer()
                timerOn = false
                modelData.finished = true
            }
        }
        .onAppear(perform: {
            stopTimer()
        })
    }//end View
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
}//end PlayView struct

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
    }
}
