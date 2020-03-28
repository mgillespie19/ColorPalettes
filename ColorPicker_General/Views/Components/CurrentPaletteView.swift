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
    var showShadow = true
    
    var body: some View {
        HStack {
            ForEach(paletteColors) { color in
                Rectangle().foregroundColor(Color(red: color.r, green: color.g, blue: color.b))
                    .cornerRadius(4)
                    .shadow(color: self.showShadow ? Color(red: 0.92, green: 0.92, blue: 0.92) : Color(red: 1, green: 1, blue: 1).opacity(0), radius: 2, x: 0, y: 0)
            }
        }
    }
}

//struct CurrentPaletteView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentPaletteView()
//    }
//}
