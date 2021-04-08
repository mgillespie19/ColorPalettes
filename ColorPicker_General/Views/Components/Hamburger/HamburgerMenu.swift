//
//  HamburgerMenu.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct HamburgerMenu: View {
    
    // MARK:- bindings passed in through constructor
    
    // hamburger
    @Binding var showHamburger: Bool
    @Binding var showHamburgerDetail: Bool
    
    // specific tabs
    @Binding var selectedHamburgerTab: Int
    
    var callback: (Int) -> ()
    
    // MARK:- local state variables

    
    var body: some View {
        VStack {
            Text("Paint Chips")
                .font(.title)
                .padding()
            
            Divider()
            
            ZStack {
                Text("profile view")
                    .opacity(self.selectedHamburgerTab == 1 ? 1 : 0)
                
                Text("about view")
                    .opacity(self.selectedHamburgerTab == 2 ? 1 : 0)

                Text("how to view")
                    .opacity(self.selectedHamburgerTab == 3 ? 1 : 0)

                Text("rate view")
                    .opacity(self.selectedHamburgerTab == 4 ? 1 : 0)

                Text("leave feedback view")
                    .opacity(self.selectedHamburgerTab == 5 ? 1 : 0)

                Text("upgrade view")
                    .opacity(self.selectedHamburgerTab == 6 ? 1 : 0)

                // top of stack
                HamburgerLineItemStack(selectedTab: $selectedHamburgerTab, showHamburgerDetail: $showHamburgerDetail, callback: callback)
            }
            
            Spacer()
            
            Text("© 2021 Max Gillespie")
                .padding()
        }
        .frame(width: showHamburgerDetail ? UIScreen.main.bounds.width * 0.9 : UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.9)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 8)
        .animation(.easeInOut(duration: 0.3))
        .offset(x: self.showHamburger ? UIScreen.main.bounds.width * 0.05 : -UIScreen.main.bounds.width, y: self.showHamburger ? 0 : -28)
    }
}

//struct HamburgerMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        HamburgerMenu()
//    }
//}
