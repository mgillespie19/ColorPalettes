//
//  Helpers.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import SwiftUI

class Helpers {
    func evalTileFontColor(r: Double, g: Double, b: Double) -> Color {
        if ((r + g + b) > 2.2) {
            return Color.black
        }
        return Color.white
    }
}
