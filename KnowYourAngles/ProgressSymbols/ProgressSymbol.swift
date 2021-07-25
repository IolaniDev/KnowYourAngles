//
//  SwiftUIView.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/21/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI

struct ProgressSymbol: View {
    var name : String
    
    var body: some View {
        Image(name)
            .aspectRatio(1,contentMode: .fill)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSymbol(name: "KYA_Star_Icon")
        ProgressSymbol(name: "Correct")
    }
}
