//
//  HamburgerLineItem.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/22/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct HamburgerLineItem: View {
    
    @Binding var hidden: Bool
    
    let viewId: Int
    let title: String
    let systemImageName: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.body)
                
                Spacer()
                
                Image(systemName: systemImageName)
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
            }
            .padding()
            
            Divider()
        }
        .background(Color.white)
        .opacity(self.hidden ? 0 : 1)
    }
}

//struct HamburgerLineItem_Previews: PreviewProvider {
//    
//    @State static var hidden = false
//    static var title = "sample line item"
//    static var imageName = "person.crop.square.fill"
//
//    static var previews: some View {
//        HamburgerLineItem(hidden: $hidden, title: self.title, systemImageName: imageName)
//    }
//}
