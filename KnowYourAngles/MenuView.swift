//
//  MenuView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/18/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menuViewDelegate : AppDelegate
    @EnvironmentObject var modelData : ModelData
    @State private var showAboutView = false
    @State private var showPlayView = false
    @State private var showSettingsView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColor()
                VStack{
                    Text("Know Your Angles")
                        .font(.system(size: 80, weight: .heavy, design: .serif))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                    HStack{
                        NavigationLink(destination: PlayView().environmentObject(modelData)) {
                            Image("KYA_Start_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.navigationBarHidden(true)
                        
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
                        /*NavigationLink(destination: SettingsView()
                         .animation(.easeInOut)) {
                         Image("KYA_Settings_Icon")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         }.navigationBarHidden(true)*/
                    }
                    .frame(width: 800, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    HStack{
                        Image("KYA_Statistics_Icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Button(action: {showAboutView = true})
                        {
                            Image("KYA_About_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.sheet(isPresented: $showAboutView, content: {
                            AboutView()
                                .animation(.easeInOut)
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
                    .animation(.default)
            }
            
        }//.animation(Animation.easeInOut.delay(1))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
    }
}
