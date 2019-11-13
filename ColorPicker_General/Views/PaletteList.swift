//
//  PaletteList.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteList: View {
    @ObservedObject var viewModel: PaletteListViewmodel
    
    @State var showPaletteDetail = false
    @State var selectedPalette: PaletteViewModel = PaletteViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.palettes) { palette in
                Text("Palette")
                    .onTapGesture {
                        self.showPaletteDetail.toggle()
                        self.selectedPalette = palette
                }
            }
        }
        .sheet(isPresented: $showPaletteDetail, content: { PaletteView(viewModel: self.selectedPalette) })
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}
