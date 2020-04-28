//
//  CurrentPaletteView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 3/28/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct CurrentPaletteView: View {
    
    @Binding var paletteColors: [ColorCell]
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
            }
        }
    }
}

//struct CurrentPaletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentPaletteView()
//    }
//}
