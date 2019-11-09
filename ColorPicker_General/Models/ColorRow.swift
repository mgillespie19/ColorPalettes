//
//  ColorRow.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/9/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import SwiftUI

class ColorRow: Identifiable {
    let color1: Color
    var color2: Color
    
    init(Color1: Color, Color2: Color) {
        self.color1 = Color1
        self.color2 = Color2
    }
}
