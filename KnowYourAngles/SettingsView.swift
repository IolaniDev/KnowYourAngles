//
//  SettingsView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/9/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var userSettings = UserSettings()
    
    init()
    {
        UITableView.appearance().backgroundColor = UIColor(red: 25.0/255, green: 127.0/255, blue: 124.0/255, alpha: 1.0)
    }
    
    var body: some View {
        //ScrollView {
        //ZStack {
        Form {
            Group {
                Section(header: Text("User Preferences:")) {
                    
                    Toggle(isOn: $userSettings.isLeftHandMode) {
                        Text("Left-Hand Mode")
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                }
                
                Section(header: Text("Angle Units:")) {
                    Group {
                        Toggle(isOn: $userSettings.degrees) {
                            Text("Degrees")
                        }
                        
                        Toggle(isOn: $userSettings.radians) {
                            Text("Radians")
                        }
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                }
                
                
                Section(header: Text("Quadrants:")) {
                    Group {
                        Toggle(isOn: $userSettings.quadrantals) {
                            Text("Quadrantals")
                        }
                        
                        Toggle(isOn: $userSettings.quadI) {
                            Text("Quadrant I")
                        }
                        
                        Toggle(isOn: $userSettings.quadII) {
                            Text("Quadrant II")
                        }
                        
                        
                        Toggle(isOn: $userSettings.quadIII) {
                            Text("Quadrant III")
                        }
                        
                        Toggle(isOn: $userSettings.quadIV) {
                            Text("Quadrant IV")
                        }
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                }
                
                Section(header: Text("Trig Functions")) {
                    Group {
                        Toggle(isOn: $userSettings.sine) {
                            Text("sine")
                        }
                        
                        Toggle(isOn: $userSettings.cosine) {
                            Text("cosine")
                        }
                        
                        
                        Toggle(isOn: $userSettings.tangent) {
                            Text("tangent")
                        }
                        
                        Toggle(isOn: $userSettings.cosecant) {
                            Text("cosecant")
                        }
                        
                        Toggle(isOn: $userSettings.secant) {
                            Text("secant")
                        }
                        
                        Toggle(isOn: $userSettings.cotangent) {
                            Text("cotangent")
                        }
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                    .frame(alignment: .trailing)
                }
                
                Section(header: Text("Inverse Trig Functions")) {
                    Group {
                        
                        Toggle(isOn: $userSettings.arcsine) {
                            Text("arcsine")
                        }
                        
                        Toggle(isOn: $userSettings.arccosine) {
                            Text("arccosine")
                        }
                        
                        Toggle(isOn: $userSettings.arctangent) {
                            Text("arctangent")
                        }
                        
                        Toggle(isOn: $userSettings.arccosecant) {
                            Text("arccosecant")
                        }
                        
                        Toggle(isOn: $userSettings.arcsecant) {
                            Text("arcsecant")
                        }
                        
                        Toggle(isOn: $userSettings.arccotangent) {
                            Text("arccotangent")
                        }
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                    .frame(alignment: .trailing)
                }
                
            }
            .background(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255))
            .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
            .font(.system(size: 48, weight: .regular, design: .serif))
            .listRowBackground(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255))
        }//end Form
        .background(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255))
    } //end View
} //end Struct

struct SwitchStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return HStack {
            
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 30 , height: 30)
                .foregroundColor( Color(red:51.0/255, green: 255.0/255, blue: 247.0/255))
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            Spacer()
            
            configuration.label
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
