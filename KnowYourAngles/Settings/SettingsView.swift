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
    
    var body: some View {
        //check if device has a compatible iOS version
        if #available(iOS 16.0, *) {
            //Form is needed so that the view is scrollable
            Form {
                //Group is needed so that the background on all of the rows in the Form can have the same background color
                Group {
                    //VStack groups the Category with its setting options
                    Section {
                        Text("User Preferences:")
                            .font(.title)
                            .lineLimit(2)
                        
                        Toggle(isOn: $userSettings.isLeftHandMode) {
                            Text("Left-Hand Mode")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .font(.title2)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                        .toggleStyle(SwitchStyle())
                        .lineLimit(1)
                    } // end User Preferences Section
                    .minimumScaleFactor(0.01)
                    .scaledToFit()
                    
                    /* Settings for Angle Units
                     * At least one angle unit must be selected
                     */
                   Section {
                        Text("Angle Units:")
                           .font(.title)
                           .lineLimit(2)
                        
                        Group {
                            Toggle(isOn: $userSettings.degrees) {
                                Text("Degrees")
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onChange(of: userSettings.radians, perform: { _ in
                                if (!userSettings.degrees && !userSettings.radians)
                                {
                                    userSettings.degrees.toggle()
                                    UserDefaults.standard.set(true, forKey: "degrees")
                                }
                            })
                        }
                        .font(.title2)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                        .toggleStyle(SwitchStyle())
                        .lineLimit(1)
                    } // end Angle Units Section
                   .minimumScaleFactor(0.01)
                   .scaledToFit()
                    
                    /* Settings for Quadrants
                     * At least one quadrant must be selected
                     */
                    Section {
                        Text("Quadrants:")
                            .font(.title)
                        
                        Group {
                            Toggle(isOn: $userSettings.quadrantals) {
                                Text("Quadrantals")
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onChange(of: userSettings.quadIV, perform: { _ in
                                if (areNoQuadrantsSelected())
                                {
                                    userSettings.quadrantals.toggle()
                                    UserDefaults.standard.set(true, forKey: "quadrantals")
                                }
                            })
                        }
                        .font(.title2)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                        .toggleStyle(SwitchStyle())
                    } // end Quadrants Section
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    
                    /* Settings for Trig Functions
                     * At least one trig function must be selected
                     */
                    Section {
                        Text("Trig Functions")
                            .font(.title)
                            .lineLimit(2)
                        
                        Group {
                            Toggle(isOn: $userSettings.sine) {
                                Text("sine")
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onChange(of: userSettings.cotangent, perform: { _ in
                                if (areNoFunctionsSelected())
                                {
                                    userSettings.arcsine.toggle()
                                    UserDefaults.standard.set(true, forKey: "arcsine")
                                }
                            })
                        }
                        .font(.title2)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                        .toggleStyle(SwitchStyle())
                        .lineLimit(1)
                    } // end Trig Functions Section
                    .minimumScaleFactor(0.01)
                    
                    Section {
                        Text("Inverse Trig Functions")
                            .font(.title)
                            .lineLimit(3)
                       
                        Group {
                            
                            Toggle(isOn: $userSettings.arcsine) {
                                Text("arcsine")
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
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
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .onChange(of: userSettings.arccotangent, perform: { _ in
                                if (areNoFunctionsSelected())
                                {
                                    userSettings.sine.toggle()
                                    UserDefaults.standard.set(true, forKey: "sine")
                                }
                            })
                        } //end Group
                        .font(.title2)
                        .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                        .toggleStyle(SwitchStyle())
                        .lineLimit(1)
                    } //end Inverse Trig Functions Section
                }
                .listRowBackground(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255))
            }//end Form
            .background(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255))
            .scrollContentBackground(.hidden)
            .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
            .font(.system(size: 48, weight: .bold, design: .serif))
            .padding(.horizontal)
        }
        else {
            // Fallback on earlier versions
            Text("You need iOS 16.0 or higher")
        }
        
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
