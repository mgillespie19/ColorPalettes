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
                PaletteView(viewModel: self.viewModel).tabItem {
                    Text("Colors")
                    Image(systemName: "paintbrush.fill")
                }.tag(1)
                    .navigationBarTitle("Palette 1 :)")
                
                ColorPicker(viewModel: self.viewModel).tabItem {
                    Text("RGB")
                    Image(systemName: "eyedropper.full")
                }.tag(2)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PaletteContainer_Previews: PreviewProvider {
    static var previews: some View {
        PaletteContainer(viewModel: PaletteViewModel())
    }
}
