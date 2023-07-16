//
//  AboutView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/20/21.
//  Updated by Erin Nagoshi on 7/14/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import SwiftUI

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}

struct AboutView: View {
    
    var body: some View {
        ZStack {
            
            BackgroundColor()
            
            VStack {
                //Spacer pushes text downwards for vertical alignment
                Spacer()
                
                Text("About Know Your Angles")
                    .underline()
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                Text("Created by Ms. Nagoshi")
                    .padding()
                Text("Version: \(UIApplication.appVersion ?? "0.0.0"))")
                    .padding()
                Text("Handwriting Recognition implemented using MyScript's Interactive Ink SDK 1.4")
                    .padding()
                Text("Navigation Icons created using Canva")
                
                //Spacer pushes text upwards for vertical alignment
                Spacer()
                
            }//end VStack
            .font(.system(size: 48, weight: .regular, design: .serif))
            .foregroundColor(Color(red: 51.0/255, green: 255.0/255, blue: 247.0/255, opacity: 1.0))
            .multilineTextAlignment(.center)
            .padding()
            
        }//end ZStack
    }//end body
}//end AboutView

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
