//
//  HamburgerLineItemStack.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/22/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct HamburgerLineItemStack: View {
    
    @Binding var selectedTab: Int
    @Binding var showHamburgerDetail: Bool
    
    var callback: (Int) -> ()
    
    var body: some View {
        VStack {
//            HamburgerLineItem(hidden: $showHamburgerDetail, viewId: 1, title: "Profile", systemImageName: "person.crop.square.fill")
//                .onTapGesture {
//                    callback(1)
//                }

            HamburgerLineItem(hidden: $showHamburgerDetail, viewId: 2, title: "About", systemImageName: "questionmark.circle.fill")
                .onTapGesture {
                    callback(2)
                }

//            HamburgerLineItem(hidden: $showHamburgerDetail, viewId: 3, title: "How to", systemImageName: "info.circle.fill")
//                .onTapGesture {
//                    callback(3)
//                }

            HamburgerLineItem(hidden: $showHamburgerDetail, viewId: 4, title: "Leave a review", systemImageName: "star.fill")
                .onTapGesture {
                    // callback(4)
                    if let url = URL(string: "https://apps.apple.com/us/app/paint-chips/id1502792725") {
                        UIApplication.shared.open(url)
                    }
                }

            HamburgerLineItem(hidden: $showHamburgerDetail, viewId: 5, title: "How can we improve?", systemImageName: "doc.on.clipboard")
                .onTapGesture {
                    // callback(5)
                    if let url = URL(string: "mailto:max@maxgillespie.com") {
                      if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url)
                      } else {
                        UIApplication.shared.openURL(url)
                      }
                    }
                }

//            HamburgerLineItem(hidden: $showHamburgerDetail, viewId: 6, title: "Upgrade", systemImageName: "globe")
//                .onTapGesture {
//                    callback(6)
//                }
        }

    }
}

//struct HamburgerLineItemStack_Previews: PreviewProvider {
//    static var previews: some View {
//        HamburgerLineItemStack()
//    }
//}
