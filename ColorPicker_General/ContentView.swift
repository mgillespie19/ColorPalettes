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
        PaletteList(viewModel: PaletteListViewmodel()).tabItem {
            Text("Colors")
            Image(systemName: "paintbrush.fill")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
