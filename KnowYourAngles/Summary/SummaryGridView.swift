//
//  SummaryGridItem.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 8/18/21.
//  Updated by Erin Nagoshi on 7/15/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import SwiftUI

struct SummaryGridView: View {
    @EnvironmentObject var summary : SummaryGrid
    
    var body: some View {
        
        ZStack {
            BackgroundColor()
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid (columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())],
                               alignment: .center, spacing: 20)
                    {
                        Group {
                            Text("Problem")
                                .lineLimit(1)
                            Text("Correct Answer")
                            Text("Your Answer")
                            Text("Right or Wrong")
                        }
                        .font(.system(size: 48, weight: .regular, design: .serif))
                        .foregroundColor(Color(red: 51.0/255, green: 255.0/255, blue: 247.0/255, opacity: 1.0))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding()
                        .minimumScaleFactor(0.1)
                        
                        ForEach(0..<summary.summaryElements.count, id: \.self) { index in
                            summary.summaryElements[index]
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 175, alignment: .center)
                        }
                    }
                    .border(Color.black, width: 2)
                }
                .alignmentGuide(VerticalAlignment.top, computeValue: { dimension in
                    125
                })
                .padding()
            }//end GeometryReader
        }//end ZStack
        .frame(width: 700, alignment: .top)
    }//end body
}//end SummaryGridView

struct SummaryGridItem_Previews: PreviewProvider {
    static var previews: some View {
        SummaryGridView()
    }
}
