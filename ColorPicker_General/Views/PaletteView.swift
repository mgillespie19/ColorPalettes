//
//  AllColors.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteView: View {
    @ObservedObject var viewModel: PaletteViewModel
    @State var editingMode = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                HStack {
                    VStack {
                        ForEach(self.viewModel.Rcolors) { c in
                            ColorTile(backgroundColor: Color(red: c.r, green: c.g, blue: c.b), foregroundColor: c.textColor, hexID: c.hex, showDeleteButton: self.editingMode)
                        }
                    }
                    Spacer()
                    
                    VStack {
                        ForEach(self.viewModel.Lcolors) { c in
                            ColorTile(backgroundColor: Color(red: c.r, green: c.g, blue: c.b), foregroundColor: c.textColor, hexID: c.hex, showDeleteButton: self.editingMode)
                        }
                    }
                    
                }
                .padding()
            }
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView(viewModel: PaletteViewModel(name: "Palette"))
    }
}
