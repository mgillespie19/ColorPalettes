//
//  FeedHeaderTile.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 12/15/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct FeedHeaderTile: View {
    
    // instance variables
    @Binding var selected: Bool
    @Binding var num: Int
    var selectionColor: Color
    var title: String
    
    // local variables
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(self.num)")
                .foregroundColor(selected ? Color.white : selectionColor)
                .font(.title)
                .padding(.top, 4)
            
            Text(title)
                .foregroundColor(selected ? Color.white : Color.black)
                .font(.headline)
                .padding(.bottom, 4)
                .padding(.trailing, 8)
        }
        .padding()
        .background(selected ? selectionColor : Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 1))
        .cornerRadius(20)
        .frame(minWidth: 100, idealWidth: 100, maxWidth: .infinity, minHeight: 90, idealHeight: 90, maxHeight: 90)
        .shadow(color: selected ? selectionColor : Color.clear, radius: 10, x: 0, y: 0)
        .animation(.default)
    }
    
}

//struct FeedHeaderTile_Previews: PreviewProvider {
//    
//    @State static var selected = true
//    
//    static var previews: some View {
//        FeedHeaderTile(selected: $selected, selectionColor: Color.blue, num: 10)
//    }
//}
