//
//  ProgressSymbol.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/21/21.
//  Updated by Erin Nagoshi on 7/15/23.
//  Copyright © 2023 Iolani School. All rights reserved.
//

import SwiftUI

struct ProgressSymbol: View {
    var name : String
    
    var body: some View {
        Image(name)
            .aspectRatio(1,contentMode: .fill)
    }//end body
}//end ProgressSymbol

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSymbol(name: "KYA_Star_Icon")
    }
}
