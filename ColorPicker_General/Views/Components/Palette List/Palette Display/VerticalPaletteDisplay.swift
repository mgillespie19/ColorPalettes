//
//  InteractableCurrentPaletteView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 5/2/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct VerticalPaletteDisplay: View {
    
    @Binding var paletteColors: [ColorCell]
    
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    
    @Binding var showPalette: Bool
    
    var body: some View {
        VStack {
            ForEach(paletteColors) { color in
                Rectangle().foregroundColor(Color(red: color.r, green: color.g, blue: color.b))
                    .frame(height: UIScreen.main.bounds.width * 0.75 / CGFloat(paletteColors.count))
                    .onTapGesture {
                        self.r = color.r
                        self.g = color.g
                        self.b = color.b
                }
                .padding(.top, -8)
            }
        }
        .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width * 0.85)
        .offset(x: self.showPalette ? -UIScreen.main.bounds.width / 4 : 0)
        .padding(.bottom, -4)
    }
}

//struct InteractableCurrentPaletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        InteractableCurrentPaletteView()
//    }
//}
