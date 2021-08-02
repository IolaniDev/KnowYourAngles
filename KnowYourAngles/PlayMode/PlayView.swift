//
//  PlayView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/21/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var modelData : ModelData
    var body: some View {
        ZStack {
            BackgroundColor()
            VStack (alignment: .center, spacing: 60, content: {
                
                Text("00:00")
                    .font(.system(size: 80))
                
                ProgressSymbol(name: "KYA_Star_Icon")
                    .frame(width: 500, height: 500)
                    .scaleEffect(1.0 / 5.0)
                    .frame(width: 100, height: 100)
                
                Divider()
                
                Image(modelData.allProblems[0].id)
                Text(String(modelData.allProblems.count))
                ZStack {
                    Image("graphPattern")
                        .frame(width: 500, height: 300)
                        .scaleEffect(CGSize(width: 3.3, height: 2.0))
                    PlayViewController()
                        .frame(width: 500, height: 300, alignment: .center)
                }
                
                Spacer()
            })
            .padding()
            
        }
        
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
    }
}
