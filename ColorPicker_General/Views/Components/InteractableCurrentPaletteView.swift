//
//  InteractableCurrentPaletteView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 5/2/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct InteractableCurrentPaletteView: View {
    
    @Binding var paletteColors: [ColorCell]
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    var showBorder = true
    
    var body: some View {
        HStack {
            ForEach(paletteColors) { color in
                Rectangle().foregroundColor(Color(red: color.r, green: color.g, blue: color.b))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: self.showBorder ? 0.25 : 0)
                    )
                    .onTapGesture {
                        self.r = color.r
                        self.g = color.g
                        self.b = color.b
                }
            }
        }
    }
}

//struct InteractableCurrentPaletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        InteractableCurrentPaletteView()
//    }
//}
