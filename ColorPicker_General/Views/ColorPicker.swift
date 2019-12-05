//
//  ColorPicker.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorPicker: View {
    @ObservedObject var viewModel: PaletteViewModel
    
    @State var show = false
    @State var r: Double = 1
    @State var g: Double = 1
    @State var b: Double = 1
    
    var helper: Helper
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack{
                    Text("R: ")
                        .font(.largeTitle)
                        .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                    Slider(value: self.$r)
                        .padding()
                }.padding()
                
                HStack{
                    Text("G: ")
                        .font(.largeTitle)
                        .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                    Slider(value: self.$g)
                        .padding()
                    
                }.padding()
                
                HStack{
                    Text("B: ")
                        .font(.largeTitle)
                        .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                    Slider(value: self.$b)
                        .padding()
                }.padding()
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color(red: self.r, green: self.g, blue: self.b))
            .edgesIgnoringSafeArea(.all)
            
            Image(systemName: "plus.square")
                .resizable()
                .frame(width: 85, height: 85)
                .rotationEffect(show ? Angle(degrees: 180) : Angle(degrees: -180))
                .animation(.spring())
                .foregroundColor(helper.evalTileFontColor(r: self.r, g: self.g, b: self.b))
                .padding()
                .offset(y: 200)
                .onTapGesture {
                    self.viewModel.addColor(r: self.r, g: self.g, b: self.b)
                    self.show.toggle()
            }
        }
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(viewModel: PaletteViewModel(name: "New Palette"), helper: Helper())
    }
}
