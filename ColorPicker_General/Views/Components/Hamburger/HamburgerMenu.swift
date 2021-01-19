//
//  HamburgerMenu.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct HamburgerMenu: View {
    
    @Binding var showHamburger: Bool
    
    var body: some View {
        VStack {
            Text("Paint Chips")
            Divider()
            Text("your profile/create account")
            Divider()
            Text("About/how to")
            Divider()
            Text("upgrade")
            Divider()
            Text("c 2021 myEHR LLC")
        }
        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.9)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 8)
        .animation(.easeInOut(duration: 0.2))
        .offset(x: self.showHamburger ? 8 : -UIScreen.main.bounds.width * 0.6, y: self.showHamburger ? 0 : -28)    }
}

//struct HamburgerMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        HamburgerMenu()
//    }
//}
