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
    @State var problemImageName = "Cos0"
    @State var currentProblemSet : ProblemSet
    @State var playViewController = PlayViewController()
    
    var body: some View {
        ZStack {
            BackgroundColor()
            VStack (alignment: .center, spacing: 60, content: {
                VStack (alignment: .center, spacing: 30, content: {
                    Text("00:00")
                        .font(.system(size: 80))
                    
                    ProgressSymbol(name: "KYA_Star_Icon")
                        .frame(width: 500, height: 500)
                        .scaleEffect(1.0 / 5.0)
                        .frame(width: 100, height: 100)
                })
                
                Divider()

                Image(problemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(idealWidth: 500, maxHeight: 300, alignment: .center)
                
                VStack {
                    ZStack (alignment: Alignment(horizontal: .trailing, vertical: .center)){
                        /*Image("graphPattern")
                         .scaleEffect(CGSize(width: 3.3, height: 2.0))*/
                        playViewController
                            .frame(width: 500, height: 300, alignment: .center)
                        VStack(alignment: .trailing)
                        {
                            Button(action: {
                                playViewController.editorViewController.editor.clear()
                            })
                            {
                                Text("Clear")
                            }
                            Spacer()
                            Button(action: {
                                problemImageName = currentProblemSet.getRandomProblem().id
                                print("new problem: " + problemImageName)
                            })
                            {
                                Text("Submit")
                            }
                        }.font(.system(size: 36, weight: .regular, design: .serif))
                        .foregroundColor(Color(red: 25.0/255, green: 127.0/255, blue: 124.0/255, opacity: 1.0))
                        .padding()
                    }.frame(width: 500, height: 300)
                }
                Spacer()
            })//end VStack
            .frame(width: 500, alignment: .center)
            .padding()
        }//end Zstack
    }//end View
}//end PlayView struct

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(currentProblemSet: ProblemSet(setOfProblems: ModelData().allProblems))
            .environmentObject(AppDelegate())
            .environmentObject(ModelData())
    }
}
