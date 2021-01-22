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
    @Binding var showHamburgerDetail: Bool
    
    @Binding var hideProfile: Bool
    @Binding var hideAbout: Bool
    @Binding var hideHowTo: Bool
    @Binding var hideRate: Bool
    @Binding var hideLeaveFeedback: Bool
    @Binding var hideUpgrade: Bool
    
    var callback: (Int) -> ()
    
    var body: some View {
        VStack {
            Text("Paint Chips")
                .font(.title)
                .padding()
            
            Divider()
            
            HamburgerLineItemStack(hideProfile: $hideProfile, hideAbout: $hideAbout, hideHowTo: $hideHowTo, hideRate: $hideRate, hideLeaveFeedback: $hideLeaveFeedback, hideUpgrade: $hideUpgrade, callback: callback)
            
            Spacer()
            
            
            Text("c 2021 myEHR LLC")
                .padding()
        }
        .frame(width: showHamburgerDetail ? UIScreen.main.bounds.width * 0.9 : UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.9)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 8)
        .animation(.easeInOut(duration: 0.2))
        .offset(x: self.showHamburger ? UIScreen.main.bounds.width * 0.05 : -UIScreen.main.bounds.width * 0.6, y: self.showHamburger ? 0 : -28)
    }
}

//struct HamburgerMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        HamburgerMenu()
//    }
//}
