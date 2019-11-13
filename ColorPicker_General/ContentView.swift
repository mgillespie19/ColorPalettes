//
//  ContentView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PaletteViewModel = PaletteViewModel()
    
    @State var selectedView = 1

    var body: some View {
        ZStack {
            TabView(selection: $selectedView) {
                PaletteView(viewModel: self.viewModel).tabItem {
                    Text("Colors")
                    Image(systemName: "paintbrush.fill")
                }.tag(1)
                
                ColorPicker(viewModel: self.viewModel).tabItem {
                    Text("RGB")
                    Image(systemName: "eyedropper.full")
                }.tag(2)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
