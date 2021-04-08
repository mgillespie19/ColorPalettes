//
//  BackButtonUp.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/24/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct BackButtonUp: View {
    
    @Binding var goBack: Bool
    
    var body: some View {
        Button(action: {
            self.goBack.toggle()
        }, label: {
            Image("back")
                .rotationEffect(.degrees(90))
                .padding(.leading)
        })
    }
}

//struct BackButtonUp_Previews: PreviewProvider {
//    static var previews: some View {
//        BackButtonUp()
//    }
//}
