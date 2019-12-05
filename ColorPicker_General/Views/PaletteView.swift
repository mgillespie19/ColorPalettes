//
//  AllColors.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteView: View {
    @ObservedObject var viewModel: PaletteViewModel
    @State var editingMode = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack (alignment: .center) {
                    Text("edit")
                        .padding()
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 45)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0.92, green: 0.92, blue: 0.92), radius: 10)
                        .onTapGesture {
                            self.editingMode.toggle()
                    }
                    
                    ZStack (alignment: .top) {
                        HStack {
                            VStack {
                                ForEach(self.viewModel.Rcolors) { c in
                                    ColorTile(id: c.id, backgroundColor: Color(red: c.r, green: c.g, blue: c.b), foregroundColor: c.textColor, hexID: c.hex, showDeleteButton: self.$editingMode, viewModel: self.viewModel)
                                }
                            }
                            Spacer()
                            
                            VStack {
                                ForEach(self.viewModel.Lcolors) { c in
                                    ColorTile(id: c.id, backgroundColor: Color(red: c.r, green: c.g, blue: c.b), foregroundColor: c.textColor, hexID: c.hex, showDeleteButton: self.$editingMode, viewModel: self.viewModel)
                                }
                            }
                        }
                        
                        Image("Colors_Empty")
                        .resizable()
                        .frame(height: 500)
                        .padding()
                        .opacity((viewModel.numColors() > 0) ? 0 : 1)
                    }
                }
                .padding(.leading)
                .padding(.trailing)
            }
        }.onDisappear {
            self.editingMode = false
        }
    }
}

struct AllColors_Previews: PreviewProvider {
    static var previews: some View {
        PaletteView(viewModel: PaletteViewModel(name: "Palette"))
    }
}
