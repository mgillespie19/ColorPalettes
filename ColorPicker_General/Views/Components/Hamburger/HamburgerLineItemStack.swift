//
//  HamburgerLineItemStack.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/22/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct HamburgerLineItemStack: View {
    
    @Binding var hideProfile: Bool
    @Binding var hideAbout: Bool
    @Binding var hideHowTo: Bool
    @Binding var hideRate: Bool
    @Binding var hideLeaveFeedback: Bool
    @Binding var hideUpgrade: Bool
    
    var callback: (Int) -> ()
    
    var body: some View {
        VStack {
            HamburgerLineItem(hidden: $hideProfile, viewId: 1, title: "Profile", systemImageName: "person.crop.square.fill")
                .onTapGesture {
                    callback(1)
                }

            HamburgerLineItem(hidden: $hideAbout, viewId: 2, title: "About", systemImageName: "questionmark.circle.fill")
                .onTapGesture {
                    callback(2)
                }

            HamburgerLineItem(hidden: $hideHowTo, viewId: 3, title: "How to", systemImageName: "info.circle.fill")
                .onTapGesture {
                    callback(3)
                }

            HamburgerLineItem(hidden: $hideRate, viewId: 4, title: "Leave a review", systemImageName: "star.fill")
                .onTapGesture {
                    callback(4)
                }

            HamburgerLineItem(hidden: $hideLeaveFeedback, viewId: 5, title: "How can we improve?", systemImageName: "doc.on.clipboard")
                .onTapGesture {
                    callback(5)
                }

            HamburgerLineItem(hidden: $hideUpgrade, viewId: 6, title: "Upgrade", systemImageName: "globe")
                .onTapGesture {
                    callback(6)
                }
        }

    }
}

//struct HamburgerLineItemStack_Previews: PreviewProvider {
//    static var previews: some View {
//        HamburgerLineItemStack()
//    }
//}
