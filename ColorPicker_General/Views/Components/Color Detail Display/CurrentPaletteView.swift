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
    
    var body: some View {
        HStack {
            ForEach(paletteColors) { color in
                Rectangle().foregroundColor(Color(red: color.r, green: color.g, blue: color.b))
                    .padding(.top, -15)
                    .padding(.leading, -16)
            }
        }
    }
}

//struct CurrentPaletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentPaletteView()
//    }
//}
