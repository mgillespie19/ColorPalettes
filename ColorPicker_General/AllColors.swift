//
//  AllColors.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct AllColors: View {
//    var allColors: [ColorRow] = [ColorRow(Color1: Color.white, Color2: Color.blue), ColorRow(Color1: Color.red, Color2: Color.black)]
    @ObservedObject var viewModel: PaletteViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(self.viewModel.colors) { row in
                    HStack {
                        ColorTile(backgroundColor: row.color1)
                        Spacer()
                        ColorTile(backgroundColor: row.color2)
                    }
                    .padding()
                }
            }.navigationBarTitle("Palette 1 :)")
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        AllColors(viewModel: PaletteViewModel())
    }
}
