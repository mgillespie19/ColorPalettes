//
//  AllColors.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteView: View {
    //    var allColors: [ColorRow] = [ColorRow(Color1: Color.white, Color2: Color.blue), ColorRow(Color1: Color.red, Color2: Color.black)]
    @ObservedObject var viewModel: PaletteViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                VStack {
                    ForEach(self.viewModel.Rcolors) { c in
                        ColorTile(backgroundColor: c.color, foregroundColor: c.textColor, hexID: c.hex)
                    }
                }
                Spacer()
                
                VStack {
                    ForEach(self.viewModel.Lcolors) { c in
                        ColorTile(backgroundColor: c.color, foregroundColor: c.textColor, hexID: c.hex)
                    }
                }
                
            }
            .padding()
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView(viewModel: PaletteViewModel())
    }
}
