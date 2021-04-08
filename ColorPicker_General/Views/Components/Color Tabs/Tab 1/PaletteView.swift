//
//  AllColors.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteView: View {
    
    // MARK:- Observed object passed through constructor
    @ObservedObject var viewModel: PaletteViewModel
    
    @Binding var goBack: Bool
    
    // MARK:- Local state editing
    @State var editingMode = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack {
                BackButtonUp(goBack: $goBack)
                
                Spacer()
            }
            .padding()
            
            HStack {
                Spacer()
                
                VStack(alignment: .center) {
                    ForEach(self.viewModel.Rcolors) { c in
                        ColorTile(id: c.id, r: c.r, g: c.g, b:c.b, hexID: c.hex, showEditButtons: self.$editingMode, viewModel: self.viewModel)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    ForEach(self.viewModel.Lcolors) { c in
                        ColorTile(id: c.id, r: c.r, g: c.g, b:c.b, hexID: c.hex, showEditButtons: self.$editingMode, viewModel: self.viewModel)
                    }
                }
                
                Spacer()
            }
        }
        .onDisappear {
            self.editingMode = false
        }
    }
}

//struct AllColors_Previews: PreviewProvider {
//    static var previews: some View {
//        PaletteView(viewModel: PaletteViewModel(name: "Palette", parentVM: PaletteListViewmodel()))
//    }
//}
