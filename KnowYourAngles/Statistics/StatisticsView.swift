//
//  StatisticsView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/19/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var userSettings : UserSettings
    @State var resetButtonAlignment : Alignment = .trailing
    
    var body: some View {
        ZStack {
            BackgroundColor()
            
            VStack {
                
                //title and description
                VStack {
                    
                    Text("User Statistics")
                        .font(.system(size: 80, weight: .heavy, design: .serif))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                    
                    Text("percent correct of problems involving...")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()
                
                //first row - includes degrees and radians
                VStack {
                    HStack {
                        Text("degrees")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("radians")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text(userSettings.degreeStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.degreeStatsNumCorrect*100)/Float(userSettings.degreeStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.radiansStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.radiansStatsNumCorrect*100)/Float(userSettings.radiansStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()
                
                //second row - includes sin, cos, tan
                VStack {
                    HStack {
                        Text("sin")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("cos")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("tan")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text(userSettings.sineStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.sineStatsNumCorrect*100)/Float(userSettings.sineStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.cosineStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.cosineStatsNumCorrect*100)/Float(userSettings.cosineStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.tangentStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.tangentStatsNumCorrect*100)/Float(userSettings.tangentStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()
                
                //third row - includes csc, sec, cotan
                VStack {
                    HStack {
                        Text("csc")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("sec")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("cotan")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text(userSettings.cosecantStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.cosecantStatsNumCorrect*100)/Float(userSettings.cosecantStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.secantStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.secantStatsNumCorrect*100)/Float(userSettings.secantStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.cotangentStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.cotangentStatsNumCorrect*100)/Float(userSettings.cotangentStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()
                
                //fourth row - includes arcsin, arccos, arctan
                VStack {
                    HStack {
                        Text("arcsin")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("arccos")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("arctan")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text(userSettings.arcsineStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.arcsineStatsNumCorrect*100)/Float(userSettings.arcsineStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.arccosineStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.arccosineStatsNumCorrect*100)/Float(userSettings.arccosineStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.arctangentStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.arctangentStatsNumCorrect*100)/Float(userSettings.arctangentStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()

                //fifth row - includes arccosecant, arcsecant, arccotangent
                VStack {
                    HStack {
                        Text("arccsc")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("arcsec")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("arccotan")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text(userSettings.arccosecantStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.arccosecantStatsNumCorrect*100)/Float(userSettings.arccosecantStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.arcsecantStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.arcsecantStatsNumCorrect*100)/Float(userSettings.arcsecantStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text(userSettings.arccotangentStatsNumTotal != 0 ? String(format: "%.2f",Float(userSettings.arccotangentStatsNumCorrect*100)/Float(userSettings.arccotangentStatsNumTotal)) + "%": "0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                Spacer()
                
                //When the user hits "reset"
                Button(action: {
                    userSettings.degreeStatsNumTotal = 0
                    userSettings.degreeStatsNumCorrect = 0
                    userSettings.radiansStatsNumTotal = 0
                    userSettings.radiansStatsNumCorrect = 0
                    userSettings.sineStatsNumTotal = 0
                    userSettings.sineStatsNumCorrect = 0
                    userSettings.cosineStatsNumTotal = 0
                    userSettings.cosineStatsNumCorrect = 0
                    userSettings.tangentStatsNumTotal = 0
                    userSettings.tangentStatsNumCorrect = 0
                    userSettings.cosecantStatsNumTotal = 0
                    userSettings.cosecantStatsNumCorrect = 0
                    userSettings.secantStatsNumTotal = 0
                    userSettings.secantStatsNumCorrect = 0
                    userSettings.cotangentStatsNumTotal = 0
                    userSettings.cotangentStatsNumCorrect = 0
                    userSettings.arcsineStatsNumTotal = 0
                    userSettings.arcsineStatsNumCorrect = 0
                    userSettings.arccosineStatsNumTotal = 0
                    userSettings.arccosineStatsNumCorrect = 0
                    userSettings.arctangentStatsNumTotal = 0
                    userSettings.arctangentStatsNumCorrect = 0
                    userSettings.arccosecantStatsNumTotal = 0
                    userSettings.arccosecantStatsNumCorrect = 0
                    userSettings.arcsecantStatsNumTotal = 0
                    userSettings.arcsecantStatsNumCorrect = 0
                    userSettings.arccotangentStatsNumTotal = 0
                    userSettings.arccotangentStatsNumCorrect = 0
                })
                {
                    Text("reset")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                        .frame(maxWidth: .infinity, alignment: resetButtonAlignment)
                        .padding()
                }
            }
            .padding(.top, 100)
        }
        .onAppear(perform: {
            resetButtonAlignment = userSettings.isLeftHandMode ? .leading : .trailing
        })
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView().environmentObject(UserSettings())
    }
}
