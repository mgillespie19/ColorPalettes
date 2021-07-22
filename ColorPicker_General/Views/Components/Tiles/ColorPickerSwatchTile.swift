//
//  ColorPickerSwatchTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/24/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorPickerSwatchTile: View {
    
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    @Binding var showPalette: Bool
    
    var helper = Helper()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .foregroundColor(Color(red: self.r, green: self.g, blue: self.b))
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.width * 0.8)
                .shadow(color: Color(red: 0.94, green: 0.94, blue: 0.94), radius: 12)
            
            Text(helper.rgbToHex(r: self.r, g: self.g, b: self.b))
                .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                .padding()
        }
        .offset(x: self.showPalette ? UIScreen.main.bounds.width / 8 : 0)
    }
}

//struct ColorPickerSwatchTile_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorPickerSwatchTile()
//    }
//}
