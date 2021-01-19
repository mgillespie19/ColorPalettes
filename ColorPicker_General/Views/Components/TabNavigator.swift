//
//  TabNavigator.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct TabNavigator: View {
    
    @Binding var goBack: Bool
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.goBack.toggle()
            }, label: {
                Text("back")
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .frame(width: 60, height: 60)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0.9))
                    .cornerRadius(30)
            })
            Button(action: {
                self.selectedTab = 1
            }, label: {
                Text("1")
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .frame(width: 60, height: 60)
                    .background(selectedTab == 1 ? Color(red: 0.75, green: 0.75, blue: 0.75, opacity: 0.9) : Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0.9))
                    .cornerRadius(30)
            })
            Button(action: {
                self.selectedTab = 2
            }, label: {
                Text("2")
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                    .frame(width: 60, height: 60)
                    .background(selectedTab == 2 ? Color(red: 0.75, green: 0.75, blue: 0.75, opacity: 0.9) : Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 0.9))
                    .cornerRadius(30)
            })
        }

    }
}

//struct TabNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        TabNavigator()
//    }
//}
