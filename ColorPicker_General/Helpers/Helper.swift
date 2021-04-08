//
//  Helpers.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import SwiftUI

class Helper {
    func evalTileFontColor(r: Double, g: Double, b: Double) -> Color {
        if ((r + g + b) > 1.9) {
            return Color.black
        }
        return Color.white
    }
    
    func rgbToHex(r: Double, g: Double, b: Double) -> String {
        let r_str = String(format:"%02X", Int(r * 255))
        let g_str = String(format:"%02X", Int(g * 255))
        let b_str = String(format:"%02X", Int(b * 255))
        
        return "\(r_str)\(g_str)\(b_str)"
    }
}
