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
    
    @State var r: Double = 1
    @State var g: Double = 1
    @State var b: Double = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack{
                    Text("R: ")
                        .font(.largeTitle)
                    Slider(value: self.$r)
                        .padding()
                }.padding()
                
                HStack{
                    Text("G: ")
                        .font(.largeTitle)
                    Slider(value: self.$g)
                        .padding()
                }.padding()
                
                HStack{
                    Text("B: ")
                        .font(.largeTitle)
                    Slider(value: self.$b)
                        .padding()
                }.padding()
                
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color(red: self.r, green: self.g, blue: self.b))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Dr1p Dr0p")
            .navigationBarItems(trailing:                     Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        self.viewModel.addColor(color: Color(red: self.r, green: self.g, blue: self.b))
                    }
            )
        }
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(viewModel: PaletteViewModel())
    }
}
