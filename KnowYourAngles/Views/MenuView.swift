//
//  MenuView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/18/21.
//  Updated by Erin Nagoshi on 7/14/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//
/*
 * SettingsView is presented as a side menu that slides in. Adapted from
 * https://programmingwithswift.com/create-side-menu-with-swiftui/
 */

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menuViewDelegate : AppDelegate
    @EnvironmentObject var modelData : ModelData
    @EnvironmentObject var userSettings : UserSettings
    
    //Bool variables that represent whether the given view is being shown
    @State private var showAboutView = false
    @State private var showPlayView = false
    @State private var showSettingsView = false
    
    @State private var sideMenuEdgeAlignment : Edge = .leading
    
    var body: some View {
        NavigationView {
            ZStack {
                //First, lay down the background color
                BackgroundColor()
                
                //Over the background color, put the name of the App across the top
                VStack {
                    Text("Know Your Angles")
                        .font(.system(size: 80, weight: .heavy, design: .serif))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                    //For the first row of options in the Menu, include a play button and settings button
                    HStack{
                        //Use the Play Button Image for the button that will take us to the PlayView
                        NavigationLink(destination: PlayView()
                            .environmentObject(modelData)
                            .onAppear {
                                compileProblems()
                            })
                        {
                            Image("KYA_Start_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        //Clicking on the settings icon will toggle the showSettingsView to either be visible or not.
                        Button(action: {
                            self.openMenu()
                        })
                        {
                            Image("KYA_Settings_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }//end HStack - first row of menu buttons
                    .frame(width: 800, alignment: .center)
                    
                    //Second row of menu buttons include statistics and  app info
                    HStack {
                        //Statistics Icon opens the Statistics View
                        NavigationLink(destination: StatisticsView()) {
                            Image("KYA_Statistics_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        //The About icon opens the AboutView as a slide over view
                        Button(action: {showAboutView.toggle()})
                        {
                            Image("KYA_About_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.sheet(isPresented: $showAboutView, content: {
                            AboutView()
                                .animation(.easeInOut, value: showAboutView)
                        })
                    } //end HStack - second row of menu buttons
                }//end VStack
                .frame(width: 800, alignment: .center)
                
                //if the settings view is supposed to be visible...
                if(self.showSettingsView)
                {
                    //display the settings in a SideMenu view
                    SideMenu(width: 370,
                             isOpen: self.showSettingsView, isLeftSide: userSettings.isLeftHandMode,
                             menuClose: self.openMenu)
                    .transition(.move(edge: sideMenuEdgeAlignment))
                }
            }//end ZStack
            .padding()
            .frame(minWidth: 800, maxWidth: .infinity, minHeight: 1000, maxHeight: .infinity, alignment: .center)
            .onAppear(perform: {
                //when the view appears, set the alignment based on whether the user is left or right-handed.
                sideMenuEdgeAlignment = userSettings.isLeftHandMode ? .trailing : .leading
            })
        }//end Navigation View
        .navigationViewStyle(StackNavigationViewStyle())
    } //end body
    
    func openMenu() {
        self.showSettingsView.toggle()
    }//end openMenu function
    
    func compileProblems(){
        modelData.resetLoadedProblems()
        //if the user doesn't want radians, filter out the radian problems
        if (!userSettings.radians)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.unitsOfAngle != .radians)
            }
        }
        
        //if the user doesn't want degrees, filter out the degree problems
        if (!userSettings.degrees)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.unitsOfAngle != .degrees)
            }
        }
        
        if(!userSettings.quadrantals)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.problemQuadrant != .quadrantal)
            }
        }
        
        if(!userSettings.quadI)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.problemQuadrant != .I)
            }
        }
        
        if(!userSettings.quadII)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.problemQuadrant != .II)
            }
        }
        
        if(!userSettings.quadIII)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.problemQuadrant != .III)
            }
        }
        
        if(!userSettings.quadIV)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.problemQuadrant != .IV)
            }
        }
        
        if(!userSettings.sine)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "sine")}
        }
        
        if(!userSettings.cosine)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "cosine")}
        }
        
        if(!userSettings.tangent)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "tangent")}
        }
        
        if(!userSettings.cosecant)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "cosecant")}
        }
        
        if(!userSettings.secant)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "secant")}
        }
        
        if(!userSettings.cotangent)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "cotangent")}
        }
        
        if(!userSettings.arcsine)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "arcsine")}
        }
        
        if(!userSettings.arccosine)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "arccosine")}
        }
        
        if(!userSettings.arctangent)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "arctangent")}
        }
        
        if(!userSettings.arccosecant)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "arccosecant")}
        }
        
        if(!userSettings.arcsecant)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "arcsecant")}
        }
        
        if(!userSettings.arccotangent)
        {
            modelData.allProblems = modelData.allProblems.filter {
                problem in (problem.typeOfProblem != "arccotangent")}
        }
        
        //set the current Problem to the first problem in the list
        modelData.currentProblem = modelData.allProblems[0]
    }//end compileProblems function
}//end MenuView

//struct for the Settings options that appear in the Side Menu
struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let isLeftSide :  Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .onTapGesture {
                self.menuClose()
            }
            
            GeometryReader { geo in
                if(!isLeftSide)
                {
                    SettingsView()
                        .frame(width: self.width)
                        .offset(x: self.isOpen ? geo.size.width-self.width : geo.size.width+self.width)
                        .animation(.default, value: isOpen)
                }
                else
                {
                    SettingsView()
                        .frame(width: self.width)
                        .offset(x: self.isOpen ? 0 : -self.width)
                        .animation(.default, value: isOpen)
                }
            }
            
        }
    }
}//end SideMenu

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
            .environmentObject(UserSettings())
    }
}
