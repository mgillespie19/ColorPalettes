//
//  ContentView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PaletteList(viewModel: PaletteListViewmodel()).tabItem {
            Text("Colors")
            Image(systemName: "paintbrush.fill")
            .resizable()
            .frame(width: 45, height: 45)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
