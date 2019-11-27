//
//  ColorTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorTile: View {
    @State var expand = false
    
    var id: ColorTile { self }
    var backgroundColor: Color
    var foregroundColor: Color
    var hexID: String
    @State var showDeleteButton: Bool
    
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
                }
            }) {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .offset(x:-15)
                    .frame(width: showDeleteButton ? 65 : 0, height: showDeleteButton ? 65 : 0)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ColorTile_Previews: PreviewProvider {
    static var previews: some View {
        ColorTile(backgroundColor: Color.white, foregroundColor: Color.black, hexID: "FFFFFF", showDeleteButton: true)
    }
}
