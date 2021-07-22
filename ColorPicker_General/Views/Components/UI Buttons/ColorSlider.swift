//
//  ColorSlider.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/24/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorSlider: View {
    
    var label: String
    
    @Binding var color: Double
    
    var body: some View {
        HStack{
            Text(label)
                .font(.headline)
                
            Slider(value: self.$color)
        }
        .padding(.top)
        .padding(.leading)
        .padding(.trailing)
    }
}

//struct ColorSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorSlider()
//    }
//}
