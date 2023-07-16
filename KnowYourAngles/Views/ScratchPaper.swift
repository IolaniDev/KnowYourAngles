//
//  ScratchPaper.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 2/22/23.
//  Updated by Erin Nagoshi on 7/14/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//
//  "Scratch Paper" feature based on https://www.youtube.com/watch?v=P0OdY9MVu_g

import SwiftUI

//struct for drawing lines on the scratch paper
struct Line {
    var points = [CGPoint]()
    var color: Color = .black
    var lineWidth: Double = 1.5
}//end Line struct

struct ScratchPaper: View {
    
    @State private var currentLine = Line()
    @Binding public var lines: [Line]
    @Binding public var isLeftSide : Bool
    @State private var thickness: Double = 1.0
    
    @State var clearButtonAlignment :Alignment = .bottom
    
    var body: some View {
        
        ZStack (alignment: clearButtonAlignment){
           
            BackgroundColor()
            
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }//end Canvas
            .frame(minWidth: 400, minHeight: 400)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                        self.lines.append(currentLine)
                    })
                        .onEnded({ value in
                            self.lines.append(currentLine)
                            self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                        })
                )
            
            Text("Clear")
                .font(.system(size: 50))
                .foregroundColor(Color(red: 127.0/255, green: 255.0/255, blue: 250.0/255, opacity: 1.0))
                .padding()
                .onTapGesture {
                    lines = []
                }
        }//end ZStack
        .onAppear(perform: {
            //set the alignment of the "clear scratch paper button" based on if the user is left-handed or right-handed
            clearButtonAlignment = isLeftSide ? .bottomLeading : .bottomTrailing
        })
    }//end body
}//end ScratchPaper View
