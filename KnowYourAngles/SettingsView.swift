//
//  SettingsView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/9/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userSettings : UserSettings
    
    init()
    {
        UITableView.appearance().backgroundColor = UIColor(red: 25.0/255, green: 127.0/255, blue: 124.0/255, alpha: 1.0)
    }
    
    var body: some View {
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
                
                /* Settings for Angle Units
                 * At least one angle unit must be selected
                 */
                Section(header: Text("Angle Units:")) {
                    Group {
                        Toggle(isOn: $userSettings.degrees) {
                            Text("Degrees")
                        }
                        .onChange(of: userSettings.degrees, perform: { _ in
                            if (!userSettings.degrees && !userSettings.radians)
                            {
                                userSettings.radians.toggle()
                                UserDefaults.standard.set(true, forKey: "radians")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.radians) {
                            Text("Radians")
                        }
                        .onChange(of: userSettings.radians, perform: { _ in
                            if (!userSettings.degrees && !userSettings.radians)
                            {
                                userSettings.degrees.toggle()
                                UserDefaults.standard.set(true, forKey: "degrees")
                            }
                        })
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                }
                
                /* Settings for Quadrants
                 * At least one quadrant must be selected
                 */
                Section(header: Text("Quadrants:")) {
                    Group {
                        Toggle(isOn: $userSettings.quadrantals) {
                            Text("Quadrantals")
                        }
                        .onChange(of: userSettings.quadrantals, perform: { _ in
                            if (areNoQuadrantsSelected())
                            {
                                userSettings.quadI.toggle()
                                UserDefaults.standard.set(true, forKey: "quadI")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.quadI) {
                            Text("Quadrant I")
                        }
                        .onChange(of: userSettings.quadI, perform: { _ in
                            if (areNoQuadrantsSelected())
                            {
                                userSettings.quadII.toggle()
                                UserDefaults.standard.set(true, forKey: "quadII")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.quadII) {
                            Text("Quadrant II")
                        }
                        .onChange(of: userSettings.quadII, perform: { _ in
                            if (areNoQuadrantsSelected())
                            {
                                userSettings.quadIII.toggle()
                                UserDefaults.standard.set(true, forKey: "quadIII")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.quadIII) {
                            Text("Quadrant III")
                        }
                        .onChange(of: userSettings.quadIII, perform: { _ in
                            if (areNoQuadrantsSelected())
                            {
                                userSettings.quadIV.toggle()
                                UserDefaults.standard.set(true, forKey: "quadIV")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.quadIV) {
                            Text("Quadrant IV")
                        }
                        .onChange(of: userSettings.quadIV, perform: { _ in
                            if (areNoQuadrantsSelected())
                            {
                                userSettings.quadrantals.toggle()
                                UserDefaults.standard.set(true, forKey: "quadrantals")
                            }
                        })
                    }
                    .font(.system(size: 36, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .fixedSize()
                    .toggleStyle(SwitchStyle())
                }
                
                /* Settings for Trig Functions
                 * At least one trig function must be selected
                 */
                Section(header: Text("Trig Functions")) {
                    Group {
                        Toggle(isOn: $userSettings.sine) {
                            Text("sine")
                        }
                        .onChange(of: userSettings.sine, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.cosine.toggle()
                                UserDefaults.standard.set(true, forKey: "cosine")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.cosine) {
                            Text("cosine")
                        }
                        .onChange(of: userSettings.cosine, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.tangent.toggle()
                                UserDefaults.standard.set(true, forKey: "tangent")
                            }
                        })
                        
                        
                        Toggle(isOn: $userSettings.tangent) {
                            Text("tangent")
                        }
                        .onChange(of: userSettings.tangent, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.cosecant.toggle()
                                UserDefaults.standard.set(true, forKey: "cosecant")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.cosecant) {
                            Text("cosecant")
                        }
                        .onChange(of: userSettings.cosecant, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.secant.toggle()
                                UserDefaults.standard.set(true, forKey: "secant")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.secant) {
                            Text("secant")
                        }
                        .onChange(of: userSettings.secant, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.cotangent.toggle()
                                UserDefaults.standard.set(true, forKey: "cotangent")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.cotangent) {
                            Text("cotangent")
                        }
                        .onChange(of: userSettings.cotangent, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.arcsine.toggle()
                                UserDefaults.standard.set(true, forKey: "arcsine")
                            }
                        })
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
                        .onChange(of: userSettings.arcsine, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.arccosine.toggle()
                                UserDefaults.standard.set(true, forKey: "arccosine")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.arccosine) {
                            Text("arccosine")
                        }
                        .onChange(of: userSettings.arccosine, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.arctangent.toggle()
                                UserDefaults.standard.set(true, forKey: "arctangent")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.arctangent) {
                            Text("arctangent")
                        }
                        .onChange(of: userSettings.arctangent, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.arccosecant.toggle()
                                UserDefaults.standard.set(true, forKey: "arccosecant")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.arccosecant) {
                            Text("arccosecant")
                        }
                        .onChange(of: userSettings.arccosecant, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.arcsecant.toggle()
                                UserDefaults.standard.set(true, forKey: "arcsecant")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.arcsecant) {
                            Text("arcsecant")
                        }
                        .onChange(of: userSettings.arcsecant, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.arccotangent.toggle()
                                UserDefaults.standard.set(true, forKey: "arccotangent")
                            }
                        })
                        
                        Toggle(isOn: $userSettings.arccotangent) {
                            Text("arccotangent")
                        }
                        .onChange(of: userSettings.arccotangent, perform: { _ in
                            if (areNoFunctionsSelected())
                            {
                                userSettings.sine.toggle()
                                UserDefaults.standard.set(true, forKey: "sine")
                            }
                        })
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
    
    func areNoQuadrantsSelected() -> Bool {
        return !userSettings.quadrantals && !userSettings.quadI && !userSettings.quadII && !userSettings.quadIII && !userSettings.quadIV
    }
    
    func areNoFunctionsSelected() -> Bool {
        return !userSettings.sine && !userSettings.cosine && !userSettings.tangent && !userSettings.cosecant && !userSettings.secant && !userSettings.cotangent && !userSettings.arcsine && !userSettings.arccosine && !userSettings.arctangent && !userSettings.arccosecant && !userSettings.arcsecant && !userSettings.arccotangent
    }
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
        SettingsView().environmentObject(UserSettings())
    }
}
