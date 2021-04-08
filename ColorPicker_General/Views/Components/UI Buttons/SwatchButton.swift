//
//  SwatchButton.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/24/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct SwatchButton: View {
    
    @Binding var showPalette: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.showPalette.toggle()
            }, label: {
                Image("swatch")
            })
            
            Spacer()
        }
    }
}

//struct SwatchButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SwatchButton()
//    }
//}
