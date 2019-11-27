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
                        .onDelete(perform: deleteRight)
                    }
                    Spacer()
                    
                    VStack {
                        ForEach(self.viewModel.Lcolors) { c in
                            ColorTile(backgroundColor: Color(red: c.r, green: c.g, blue: c.b), foregroundColor: c.textColor, hexID: c.hex, showDeleteButton: self.editingMode)
                        }
                        .onDelete(perform: deleteLeft)
                    }
                    
                }
                .padding()
            }
        }
    }
    
    private func deleteRight(with indexSet: IndexSet) {
        if (indexSet != nil && indexSet.count > 0) {
            viewModel.deleteRColor(atIndex: indexSet.first!)
        }
    }
    
    private func deleteLeft(with indexSet: IndexSet) {
        if (indexSet != nil && indexSet.count > 0) {
            viewModel.deleteLColor(atIndex: indexSet.first!)
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView(viewModel: PaletteViewModel(name: "Palette"))
    }
}
