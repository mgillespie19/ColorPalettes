//
//  PaletteContainer.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteContainer: View {
    @ObservedObject var viewModel: PaletteViewModel
    @State var selectedView = 1
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedView) {
                ColorPicker(viewModel: self.viewModel).tabItem {
                    Text("RGB")
                    Image(systemName: "eyedropper.full")
                }.tag(1)
                
                PaletteView(viewModel: self.viewModel).tabItem {
                    Text("Colors")
                    Image(systemName: "paintbrush.fill")
                }.tag(2)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PaletteContainer_Previews: PreviewProvider {
    static var previews: some View {
        PaletteContainer(viewModel: PaletteViewModel(name: "New Palette"))
    }
}
