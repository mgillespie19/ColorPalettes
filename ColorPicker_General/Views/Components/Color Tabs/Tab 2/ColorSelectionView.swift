//
//  ColorSelectionView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 12/5/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorSelectionView: View {
    
    // MARK:- passed in through constructor
    
    @ObservedObject var viewModel: PaletteViewModel
    
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    
    // MARK:- state tracking
    @State var showPalette = false
        
    // MARK:- helper class
    var helper = Helper()

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            ZStack (alignment: .bottom) {
                VerticalPaletteDisplay(paletteColors: $viewModel.allColors, r: $r, g: $g, b: $b, showPalette: $showPalette)
                
                ColorPickerSwatchTile(r: $r, g: $g, b: $b, showPalette: $showPalette)
                
                SwatchButton(showPalette: $showPalette)
            }
            
            Spacer()
            
            VStack {
                ColorSlider(label: "R: ", color: self.$r)
                
                ColorSlider(label: "G: ", color: self.$g)

                ColorSlider(label: "B: ", color: self.$b)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
    }
}

//struct ColorSelectionView_Previews: PreviewProvider {
//    @State static var r: Double = 0
//    @State static var g: Double = 0
//    @State static var b: Double = 0
//
//    static var h = Helper()
//
//    static var previews: some View {
//        ColorSelectionView(viewModel: <#PaletteViewModel#>, r: $r, g: $g, b: $b, helper: h)
//    }
//}
