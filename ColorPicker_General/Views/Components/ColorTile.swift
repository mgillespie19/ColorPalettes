//
//  ColorTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorTile: View {
    // local variables
    @State var expand = false
    
    // instance variables
    var id: Int
    var backgroundColor: Color
    var foregroundColor: Color
    var hexID: String
    @State var showDeleteButton: Bool
    @ObservedObject var viewModel: PaletteViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                withAnimation {
                    self.expand.toggle()
                }
            }) {
                VStack() {
                    Spacer()
                    Text (hexID)
                        .foregroundColor(self.foregroundColor)
                        .font(.headline)
                        .fontWeight(.light)
                        .frame(width: 175)
                }
                .padding()
                .frame(width: 175, height: expand ? 365 : 175)
                .background(self.backgroundColor)
            }
            .cornerRadius(30)
            .animation(.spring())
            .shadow(color: Color(red: 0.88, green: 0.88, blue: 0.88), radius: 10)
            .padding(.top)
            
            Button(action: {
                withAnimation {
                    self.showDeleteButton.toggle()
                    self.viewModel.deleteColor(ID: self.id)
                }
            }) {
                Image(systemName: "minus.rectangle.fill")
                    .resizable()
                    .offset(x: -5)
                    .frame(width: showDeleteButton ? 45 : 0, height: showDeleteButton ? 40 : 0)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ColorTile_Previews: PreviewProvider {
    static var previews: some View {
        ColorTile(id: 1, backgroundColor: Color.white, foregroundColor: Color.black, hexID: "FFFFFF", showDeleteButton: true, viewModel: PaletteViewModel(name: "Palette!"))
    }
}
