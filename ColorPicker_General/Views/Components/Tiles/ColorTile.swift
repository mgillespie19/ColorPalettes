//
//  ColorTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorTile: View {
    
    // MARK:- instance variables
    var id: Int
    @State var r: Double = 1
    @State var g: Double = 1
    @State var b: Double = 1
    var hexID: String
    @Binding var showEditButtons: Bool
    @State var showEditButton = false
    @State var showDeleteColorAlert = false
    @ObservedObject var viewModel: PaletteViewModel
    
    // MARK:- local variables
    @State var expand = false
    @State var showEditWindow = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack() {
                Spacer()
                Text (hexID)
                    .foregroundColor(Helper().evalTileFontColor(r: self.r, g: self.g, b: self.b))
                    .font(.headline)
                    .fontWeight(.light)
                .frame(width: UIScreen.main.bounds.width * 0.43)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.45, height: expand ? UIScreen.main.bounds.width * 0.96 : UIScreen.main.bounds.width * 0.45)
            .background(Color(red: self.r, green: self.g, blue: self.b))
            .cornerRadius(1)
            .animation(.spring())
            .shadow(color: Color(red: 0.88, green: 0.88, blue: 0.88), radius: 4)
            .padding(.bottom)
            .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
            }
            .onLongPressGesture {
                self.showDeleteColorAlert.toggle()
                
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
        }
        .alert(isPresented: $showDeleteColorAlert) {
            Alert(title: Text("Delete color?"), message: Text("You can't undo this action"), primaryButton: .destructive(Text("Delete")) {
                    self.viewModel.deleteColor(ID: self.id)
            }, secondaryButton: .cancel())
        }
    }
    
    // TODO: implement delete functionality
    func deleteColor() {
        self.viewModel.deleteColor(ID: self.id)
    }
}


struct ColorTile_Previews: PreviewProvider {
    @State static var showEdit = true
    
    static var previews: some View {
        ColorTile(id: 1, hexID: "FFFFFF", showEditButtons: $showEdit, viewModel: PaletteViewModel(name: "Palette!", parentVM: PaletteListViewmodel()))
    }
}
