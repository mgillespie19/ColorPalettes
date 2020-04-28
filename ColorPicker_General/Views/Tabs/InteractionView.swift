//
//  InteractionView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 4/27/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct InteractionView: View {
    
    @ObservedObject var viewModel: PaletteViewModel
    
    var body: some View {
        Text("Interactions view")
    }
}

struct InteractionView_Previews: PreviewProvider {
    static var previews: some View {
        InteractionView(viewModel: PaletteViewModel(name: "Palette", parentVM: PaletteListViewmodel()))
    }
}
