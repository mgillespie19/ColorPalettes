//
//  ColorRow.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/9/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import SwiftUI

class ColorCell: Identifiable {
    var color: Color
    var hex: String
    var textColor: Color
    
    init(c: Color, h: String, tc: Color) {
        self.color = c
        self.hex = h
        self.textColor = tc
    }
}
