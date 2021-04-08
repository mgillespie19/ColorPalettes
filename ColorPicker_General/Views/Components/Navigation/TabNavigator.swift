//
//  TabNavigator.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct TabNavigator: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Divider()
                .offset(y: -8)
            
            HStack {
                Button(action: {
                    self.selectedTab = 1
                }, label: {
                    Image(self.selectedTab == 1 ? "palette" : "palette_light")
                        .frame(width: UIScreen.main.bounds.width/2, height: 60)
                })
                
                Button(action: {
                    self.selectedTab = 2
                }, label: {
                    Image(self.selectedTab == 2 ? "dropper" : "dropper_light")
                        .frame(width: UIScreen.main.bounds.width/2, height: 60)
                })
                
                Spacer()
            }
        }
    }
}

//struct TabNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        TabNavigator()
//    }
//}
