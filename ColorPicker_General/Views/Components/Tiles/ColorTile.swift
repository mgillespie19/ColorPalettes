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
    @State var showEditButton = false
    @State var showDeleteColorAlert = false
    @ObservedObject var viewModel: PaletteViewModel
    
    // local variables
    @State var expand = false
    @State var showEditWindow = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack() {
                Spacer()
                Text (hexID)
                    .foregroundColor(self.foregroundColor)
                    .font(.headline)
                    .fontWeight(.light)
                .frame(width: UIScreen.main.bounds.width * 0.43)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.45, height: expand ? UIScreen.main.bounds.width * 0.96 : UIScreen.main.bounds.width * 0.45)
            .background(Color(red: self.r, green: self.g, blue: self.b))
            .cornerRadius(5)
            .animation(.spring())
            .shadow(color: Color(red: 0.94, green: 0.94, blue: 0.94), radius: 8)
            .padding(.bottom)
            .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
            }
            .onLongPressGesture {
//                self.showEditButtons.toggle()
                self.showDeleteColorAlert.toggle()
                
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        self.viewModel.deleteColor(ID: self.id)
                    }
                }) {
                    Text("DELETE")
                        .padding(.leading)
                        .padding(.trailing)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .background(Color(UIColor.systemRed))
                        .cornerRadius(20)
                        .opacity(showEditButton ? 1 : 0)
                        .animation(.easeIn)
                        .offset(x: 5, y:5)
                }
                
                Spacer()
            }
            .frame(width: 185)
            .offset(x: -5)
        }
        .sheet(isPresented: $showEditWindow, content: {
            EditColorView(foregroundColor: self.foregroundColor, hexID: self.hexID, r: self.$r, g: self.$g, b: self.$b)
        })
        .alert(isPresented: $showDeleteColorAlert) {
            Alert(title: Text("Delete color?"), message: Text("You can't undo this action"), primaryButton: .destructive(Text("Delete")) {
                    self.viewModel.deleteColor(ID: self.id)
            }, secondaryButton: .cancel())
        }
    }
}


struct ColorTile_Previews: PreviewProvider {
    @State static var showEdit = true
    
    static var previews: some View {
        ColorTile(id: 1,foregroundColor: Color.black, hexID: "FFFFFF", showEditButtons: $showEdit, viewModel: PaletteViewModel(name: "Palette!", parentVM: PaletteListViewmodel()))
    }
}
