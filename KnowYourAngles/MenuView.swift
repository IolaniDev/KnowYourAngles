//
//  MenuView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/18/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @State private var showAboutView = false
    
    var body: some View {
            ZStack {
                BackgroundColor()
                VStack{
                    Text("Know Your Angles")
                        .font(.system(size: 80, weight: .heavy, design: .serif))
                        .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                    HStack{
                        Image("KYA_Start_Icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image("KYA_Settings_Icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
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
                        })
                    }
                    
                }
                .frame(width: 800, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(minWidth: 800, maxWidth: .infinity, minHeight: 1000, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}



struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
