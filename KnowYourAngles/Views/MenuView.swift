//
//  MenuView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/18/21.
//  Copyright © 2021 Iolani School. All rights reserved.
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
    
    @State private var showAboutView = false
    @State private var showPlayView = false
    @State private var showSettingsView = false
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColor()
                VStack{
                    Text("Know Your Angles")
                        .font(.system(size: 80, weight: .heavy, design: .serif))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                    HStack{
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                        NavigationLink(destination:
                                        PlayView()
                                        .environmentObject(modelData)
                                        .onAppear {
                                           compileProblems()
                                        })
                        {
                            Image("KYA_Start_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        if(!self.showSettingsView) {
                            Button(action: {
                                //showSettingsView = true
                                self.openMenu()
                            })
                            {
                                Image("KYA_Settings_Icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        else
                        {
                            Button(action: {
                                
                            })
                            {
                                Image("KYA_Settings_Icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                    .frame(width: 800, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    HStack{

                        NavigationLink(destination: StatisticsView()) {
                        
                            Image("KYA_Statistics_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Button(action: {showAboutView = true})
                        {
                            Image("KYA_About_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.sheet(isPresented: $showAboutView, content: {
                            AboutView()
                                .animation(.easeInOut, value: showAboutView)
                                //.animation(_:easeInOut:)
                        })
                    }
                }
                .frame(width: 800, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                if(self.showSettingsView)
                {
                    SideMenu(width: 370,
                             isOpen: self.showSettingsView,
                             menuClose: self.openMenu).transition(.move(edge: .trailing))
                }
            }
            .padding()
            .frame(minWidth: 800, maxWidth: .infinity, minHeight: 1000, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func openMenu() {
        self.showSettingsView.toggle()
    }
    
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
        
        modelData.currentProblem = modelData.allProblems[0]
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            //.animation(Animation.easeOut.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            GeometryReader { geo in
                SettingsView()
                    .frame(width: self.width)
                    .offset(x: self.isOpen ? geo.size.width-self.width : geo.size.width+self.width)
                    .animation(.default, value: isOpen)
            }
            
        }//.animation(Animation.easeInOut.delay(1))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
            .environmentObject(UserSettings())
    }
}
