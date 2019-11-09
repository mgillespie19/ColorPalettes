//
//  ColorTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorTile: View {
    @State var show = false
    var backgroundColor: Color
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                self.show.toggle()
            }
        }) {
            VStack() {
                Spacer()
            }
            .padding()
            .frame(width: show ? 300 : 175, height: show ? 700 : 175)
            .background(self.backgroundColor)
        }
        .cornerRadius(30)
        .animation(.spring())
        .shadow(color: Color(red: 0.88, green: 0.88, blue: 0.88), radius: 10)
    }
}

struct ColorTile_Previews: PreviewProvider {
    static var previews: some View {
        ColorTile(backgroundColor: Color.white)
    }
}
