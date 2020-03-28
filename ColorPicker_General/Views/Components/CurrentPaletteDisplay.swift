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
                CurrentPaletteView(paletteColors: $paletteColors, showShadow: false)
            }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading)
                .padding(.trailing)
                .labelsHidden()
                .opacity(self.showCurrentPalette ? 1 : 0)
                .frame(height: self.showCurrentPalette ? 50 : 0)

            Divider()
                .padding()
            
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
