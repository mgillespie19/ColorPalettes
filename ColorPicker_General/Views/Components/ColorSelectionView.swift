//
//  ColorSelectionView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 12/5/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorSelectionView: View {
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    
    var helper: Helper

    var body: some View {
        VStack {
            Spacer()
            
            HStack{
                Text("R: ")
                    .font(.largeTitle)
                    .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                Slider(value: self.$r)
//                    .padding()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            .padding(.bottom)
            
            HStack{
                Text("G: ")
                    .font(.largeTitle)
                    .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                Slider(value: self.$g)
//                    .padding()
                
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            .padding(.bottom)
            
            HStack{
                Text("B: ")
                    .font(.largeTitle)
                    .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                Slider(value: self.$b)
//                    .padding()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(red: self.r, green: self.g, blue: self.b))
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
    }
}

struct ColorSelectionView_Previews: PreviewProvider {
    @State static var r: Double = 0
    @State static var g: Double = 0
    @State static var b: Double = 0
    
    static var h = Helper()
    
    static var previews: some View {
        ColorSelectionView(r: $r, g: $g, b: $b, helper: h)
    }
}
