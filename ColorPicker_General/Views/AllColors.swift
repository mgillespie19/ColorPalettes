//
//  AllColors.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct AllColors: View {
    var body: some View {
        NavigationView {
            ScrollView {
                //            ColorPicker()
                HStack {
                    ColorTile()
                    Spacer()
                    ColorTile()
                }
                .padding()
                
                HStack {
                        ColorTile()
                        Spacer()
                        ColorTile()
                    }
                .padding()
            }.navigationBarTitle("Title")
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        AllColors()
    }
}
