//
//  PlusButton.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/24/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PlusButton: View {
    
    @Binding var show: Bool
    
    var callback: () -> Void
    
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .rotationEffect(show ? Angle(degrees: 180) : Angle(degrees: -180))
            .animation(.spring())
            .onTapGesture {
                callback()
        }
        .padding(.trailing)
    }
}

//struct PlusButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PlusButton()
//    }
//}
