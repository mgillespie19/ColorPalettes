//
//  EditColorView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 12/5/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct EditColorView: View {
    var foregroundColor: Color
    var hexID: String
    
    @Binding var r: Double
    @Binding var g: Double
    @Binding var b: Double
    
    var body: some View {
        VStack {
            ColorSelectionView(r: $r, g: $g, b: $b, helper: Helper())
        }
    }
}

struct EditColorView_Previews: PreviewProvider {
    @State static var r: Double = 0
    @State static var g: Double = 0
    @State static var b: Double = 0
    
    static var previews: some View {
        EditColorView(foregroundColor: Color.black, hexID: "000000", r: $r, g: $g, b:$b)
    }
}
