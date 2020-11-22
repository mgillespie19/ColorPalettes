//
//  PaletteListItem.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 3/28/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteListItem: View {
    
    var palette: PaletteViewModel
    
    @State var paletteColors: [ColorCell] = []
    
    var body: some View {
        VStack (alignment: .leading) {
            CurrentPaletteView(paletteColors: $paletteColors)
            
            Text(palette.PaletteName)
                .font(.custom("Maven Pro", size: 20))
                .fontWeight(.ultraLight)
        }
        .frame(height: 135)
        .onAppear {
            self.paletteColors = self.palette.sortColorsDescending()
        }
    }
}

//struct PaletteListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PaletteListItem(palette: PaletteViewModel())
//    }
//}
