//
//  StatisticsView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/19/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct StatisticsView: View {
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
                
                //Spacer()
                
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
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()
                
                Spacer()
                
                //second row - includes sin, cos, tan
                VStack {
                    HStack {
                        Text("sine")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("cosine")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("tangent")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                .padding()
                
                Spacer()
                
                //third row - includes csc, sec, cotan
                VStack {
                    HStack {
                        Text("cosecant")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("secant")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("cotangent")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .font(.system(size: 60, weight: .heavy, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    
                    HStack {
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("0.0%")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(.system(size: 60, weight: .regular, design: .serif))
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                }
                Spacer()
                
                Text("reset")
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 40.0/255, green: 204.0/255, blue: 198.0/255))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
            .padding(.top, 100)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
