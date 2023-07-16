//
//  TimerView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/19/21.
//  Updated by Erin Nagoshi on 7/15/23.
//
//  Copyright © 2023 Iolani School. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var modelData : ModelData
    @EnvironmentObject var userSettings : UserSettings
    
    //timerLabel is the label displayed for the timer. It starts as "Timer" and either can be set to a time or to "00:00" (if the user decides not to use the timer
    @State var timerLabel = "Timer"
    //timerOn is used to control when the timer should actually start counting down
    @Binding var timerOn : Bool
    //isTimerHidden controls whether the timer is visible to the user
    @Binding var isTimerHidden : Bool
    
    //variables for running the timer
    @State private var minRemaining = 0
    @State private var secRemaining = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            
            //If there are questions left to answer
            if(!modelData.finished)
            {
                //If the user is right-handed, then create the drop down menu before the hourglass
                if(!userSettings.isLeftHandMode)
                {
                    HStack(alignment: .center) {
                        //Create the drop down menu
                        Menu (timerLabel) {
                            //Group is needed to avoid the limit of 10 static views
                            Group {
                                Button(action: {timerLabel = "00:00"}) {
                                    Text("00:00")
                                }
                                
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
                            }
                            Button(action: {timerLabel = "05:00"}) {
                                Text("05:00")
                            }
                            
                        }
                        .foregroundColor(Color.black)
                        .animation(nil, value:timerOn)
                        
                        //If the user has selected a time...
                        if(timerLabel != "Timer" && timerLabel != "00:00")
                        {
                            //Draw the hourglass using timerOn to determine which version of the hourglass to show
                            Image(systemName: timerOn ? "hourglass.tophalf.fill" : "hourglass.bottomhalf.fill")
                                .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255, opacity: 1.0))
                                .onTapGesture {
                                    timerOn.toggle()
                                }
                                .padding()
                        }
                    }//end HStack
                    .frame(width: 330, alignment: .center)
                    .font(.system(size: 80))
                    .padding(.leading, 0.0)
                    .minimumScaleFactor(0.1)
                    .onChange(of: timerOn, perform: {newValue in
                        startTimerSequence()
                    })
                }
                //If the user is left-handed, draw the hourglass before the timer
                else
                {
                    HStack(alignment: .center) {
                        //If the user has selected a time...
                        if(timerLabel != "Timer" && timerLabel != "00:00")
                        {
                            //Draw the hourglass using timerOn to determine which version of the hourglass to show
                            Image(systemName: timerOn ? "hourglass.tophalf.fill" : "hourglass.bottomhalf.fill")
                                .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255, opacity: 1.0))
                                .onTapGesture {
                                    timerOn.toggle()
                                }
                                .padding()
                        }
                        
                        //Create the drop down menu
                        Menu (timerLabel) {
                            //Group is needed to avoid the limit of 10 static views
                            Group {
                                Button(action: {timerLabel = "00:00"}) {
                                    Text("00:00")
                                }
                                
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
                            }
                            Button(action: {timerLabel = "05:00"}) {
                                Text("05:00")
                            }
                        }
                        .foregroundColor(Color.black)
                        .animation(nil, value:timerOn)
                    }
                    .frame(width: 330, alignment: .center)
                    .font(.system(size: 80))
                    .padding(.leading, 0.0)
                    .minimumScaleFactor(0.1)
                    .onChange(of: timerOn, perform: {newValue in
                        startTimerSequence()
                    })
                }
            }
            //if there are no more questions to answer...
            else
            {
                //then stop the timer and remove the timer label
                Text("")
                    .font(.system(size: 80))
                    .onAppear(perform: {
                        stopTimer()
                    })
            }
        }//end ZStack
        .onReceive(timer) { time in
            guard self.isActive else { return }
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
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.isActive = true
        }
        .onAppear(perform: {
            stopTimer()
            timerOn = false
            isTimerHidden = false
        })
    }//end body
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }//end stopTimer function
    
    func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }//end startTimer function
    
    //function to control when the timer should start, stop, and/or be hidden
    func startTimerSequence () {
        //timerLabel could be "Timer" before the user starts playing or after the user has hit start if they decided not to use a timer
        if(timerLabel == "Timer" || timerLabel == "00:00")
        {
            //if the user has hit Start and decided not to use a timer, hide the timer
            if(modelData.hasStarted)
            {
                isTimerHidden = true
                timerOn = false
            }
        }
        //If the user has selected a countdown time and has either pressed start or the hour glass
        else if(timerOn && timerLabel != "00:00")
        {
            isActive = true
            modelData.hasStarted = true
            minRemaining = Int(timerLabel.components(separatedBy: ":")[0]) ?? 0
            secRemaining = Int(timerLabel.components(separatedBy: ":")[1]) ?? 0
            startTimer()
            isTimerHidden = false
        }
        //if the timer has been paused...
        else if(!timerOn && timerLabel != "00:00")
        {
            isActive = false
        }
        else
        {
            stopTimer()
            isTimerHidden = true
        }
    }//end startTimerSequence function
}//end TimerView
