//
//  ScratchPaper.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 2/22/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .black
    var lineWidth: Double = 1.5
}

struct ScratchPaper: View {
    
    @State private var currentLine = Line()
    @Binding public var lines: [Line]
    @State private var thickness: Double = 1.0
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            BackgroundColor()
            
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }.frame(minWidth: 400, minHeight: 400)
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
        }
    }
}

//struct ScratchPaper_Previews: PreviewProvider {
//    static var previews: some View {
//        ScratchPaper(lines: <#Binding<[Line]>#>)
//    }
//}
