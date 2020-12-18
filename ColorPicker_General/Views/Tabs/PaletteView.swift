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
                    Spacer()
                    
                    VStack(alignment: .center) {
                        ForEach(self.viewModel.Rcolors) { c in
                            ColorTile(id: c.id, r: c.r, g: c.g, b:c.b, foregroundColor: c.textColor, hexID: c.hex, showEditButtons: self.$editingMode, viewModel: self.viewModel)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        ForEach(self.viewModel.Lcolors) { c in
                            ColorTile(id: c.id, r: c.r, g: c.g, b:c.b, foregroundColor: c.textColor, hexID: c.hex, showEditButtons: self.$editingMode, viewModel: self.viewModel)
                        }
                    }
                    
                    Spacer()
                }
            }
            HStack(alignment: .center) {
                Spacer()
                GADBannerViewController()
                    .onAppear {
                        print("banner should reload!")
                    }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 60, alignment: .bottom)
            .padding(.bottom, -10)
            .padding(.leading)
        }
        .onDisappear {
            self.editingMode = false
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView(viewModel: PaletteViewModel(name: "Palette", parentVM: PaletteListViewmodel()))
    }
}
