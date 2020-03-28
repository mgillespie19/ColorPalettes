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
        ZStack (alignment: .topTrailing) {
            HStack {
                CurrentPaletteView(paletteColors: $paletteColors)
            }
            .frame(width: UIScreen.main.bounds.width * 0.88)
            
            HStack {
                Spacer()
            
                Text(palette.PaletteName)
                    .font(.custom("Source Sans", size: 20))
                    .fontWeight(.ultraLight)
                .padding()
                .background(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.4))
                .cornerRadius(3)
                .offset(x: -5, y: 5)
            }
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
