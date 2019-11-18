//
//  ColorRow.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/9/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import SwiftUI

class ColorCell: Codable, Identifiable {
    var color: Color
    var hex: String
    var textColor: Color
    
    init(c: Color, h: String, tc: Color) {
        self.color = c
        self.hex = h
        self.textColor = tc
    }
    
    enum CodingKeys: String, CodingKey {
        case color
        case hex
        case textColor
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        hex = try container.decode(String.self, forKey: .hex)
        
        let colorData = try container.decode(Data.self, forKey: .color)
        color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? Color ?? Color.white
        
        let textColorData = try container.decode(Data.self, forKey: .textColor)
        textColor = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(textColorData) as? Color ?? Color.black
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hex, forKey: .hex)
        
        let colorData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        try container.encode(colorData, forKey: .color)
        
        let textColorData = try NSKeyedArchiver.archivedData(withRootObject: textColor, requiringSecureCoding: false)
        try container.encode(textColorData, forKey: .textColor)
    }
}
