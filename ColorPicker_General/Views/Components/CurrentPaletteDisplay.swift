//
//  CurrentPaletteDisplay.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 3/28/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct CurrentPaletteDisplay: View {
    
    var viewModel: PaletteViewModel
    
    @Binding var showCurrentPalette: Bool
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    
    @State var paletteColors: [ColorCell] = []
    
    var body: some View {
        VStack {
            Divider()
                .padding(.leading)
                .padding(.trailing)
            
            Button(action: {
                self.showCurrentPalette.toggle()
            }, label: {
                HStack {
                    Text("Current Palette")
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .animation(.default)
                        .rotationEffect(self.showCurrentPalette ? Angle(degrees: -90.0) : Angle(degrees: 90.0))
                }
            })
            .padding()
            
            VStack {
                InteractableCurrentPaletteView(paletteColors: $paletteColors, r: $r, g: $g, b: $b, showBorder: true)
            }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading)
                .padding(.trailing)
                .labelsHidden()
                .opacity(self.showCurrentPalette ? 1 : 0)
                .frame(height: self.showCurrentPalette ? 40 : 0)
            
            Spacer()
        }
        .animation(.default)
        .offset(y: -30)
        .onAppear {
            self.paletteColors = self.viewModel.sortColorsDescending()
        }
    }
}

//struct CurrentPaletteDisplay_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentPaletteDisplay()
//    }
//}
