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
    var r: Double
    var g: Double
    var b: Double
    var hex: String
    var textColor: Color
    var shouldDelete: Bool
    
    init(R: Double, G: Double, B: Double, h: String, tc: Color, ShouldDelete: Bool) {
        self.r = R
        self.g = G
        self.b = B
        self.hex = h
        self.textColor = tc
        self.shouldDelete = ShouldDelete
    }
    
    enum CodingKeys: String, CodingKey {
        case color
        case hex
        case textColor
    }
}
