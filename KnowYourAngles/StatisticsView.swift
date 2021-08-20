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
            
            Text("Under Construction")
                .font(.system(size: 80, weight: .heavy, design: .serif))
                .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
