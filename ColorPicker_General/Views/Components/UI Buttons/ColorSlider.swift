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
                .font(.title)
                
            Slider(value: self.$color)
        }
        .padding()
    }
}

//struct ColorSlider_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorSlider()
//    }
//}
