//
//  ColorTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorTile: View {
    
    // instance variables
    var id: Int
    @State var r: Double = 1
    @State var g: Double = 1
    @State var b: Double = 1
    var foregroundColor: Color
    var hexID: String
    @Binding var showEditButtons: Bool
    @ObservedObject var viewModel: PaletteViewModel
    
    // local variables
    @State var expand = false
    @State var showEditWindow = false
    
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
                    .frame(width: 165, height: expand ? 365 : 165)
                    .background(Color(red: self.r, green: self.g, blue: self.b))
            }
            .cornerRadius(30)
            .animation(.spring())
            .shadow(color: Color(red: 0.88, green: 0.88, blue: 0.88), radius: 10)
            .padding(.top)
            
            HStack {
                Button(action: {
                    withAnimation {
                        self.viewModel.deleteColor(ID: self.id)
                    }
                }) {
                    Image(systemName: "minus.rectangle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .opacity(showEditButtons ? 1 : 0)
                        .foregroundColor(Color(UIColor.systemRed))
                        .animation(.easeIn)
                }
                
                Spacer()
                
//                Button(action: {
//                    self.showEditWindow.toggle()
//                }) {
//                    Image(systemName: "pencil.circle.fill")
//                        .resizable()
//                        .frame(width: 40, height: 40)
//                        .opacity(showEditButtons ? 1 : 0)
//                        .foregroundColor(Color(UIColor.systemGray))
//                        .animation(.easeIn)
//                }
            }
            .frame(width: 185)
            .offset(x: -5)
        }
        .sheet(isPresented: $showEditWindow, content: {
            EditColorView(foregroundColor: self.foregroundColor, hexID: self.hexID, r: self.$r, g: self.$g, b: self.$b)
        })
    }
}


struct ColorTile_Previews: PreviewProvider {
    @State static var showEdit = true
    
    static var previews: some View {
        ColorTile(id: 1,foregroundColor: Color.black, hexID: "FFFFFF", showEditButtons: $showEdit, viewModel: PaletteViewModel(name: "Palette!", parentVM: PaletteListViewmodel()))
    }
}
