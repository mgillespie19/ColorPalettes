//
//  Palette.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/15/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import Foundation

class Palette: NSObject, NSCoding, Identifiable, Comparable {
    
    var id: Int!
    var name: String!
    var colors: [ColorCell]!
    var lastEdited: Date!
    
    private let CODING_KEY_PALETTE_ID = "PALETTE_ID"
    private let CODING_KEY_PALETTE_NAME = "PALETTE_NAME"
    private let CODING_KEY_PALETTE_COLORS = "PALETTE_COLORS"
    private let CODING_KEY_PALETTE_LAST_EDITED = "PALETTE_LAST_EDITED"
    
    override init() {
        
    }
    
    init(paletteId: Int, paletteName: String, paletteColors: [ColorCell], paletteLastEdited: Date) {
        self.id = paletteId
        self.name = paletteName
        self.colors = paletteColors
        self.lastEdited = paletteLastEdited
    }
    
    // MARK:- NSCoding
    required convenience init?(coder decoder: NSCoder) {
        let id = decoder.decodeObject(forKey: "PALETTE_ID") as! Int
        let name = decoder.decodeObject(forKey: "PALETTE_NAME") as! String
        let colors = decoder.decodeObject(forKey: "PALETTE_COLORS") as! [ColorCell]
        let lastEdited = decoder.decodeObject(forKey: "PALETTE_LAST_EDITED") as! Date
        
        self.init(
            paletteId: id,
            paletteName: name,
            paletteColors: colors,
            paletteLastEdited: lastEdited
        )
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: CODING_KEY_PALETTE_ID)
        coder.encode(self.name, forKey: CODING_KEY_PALETTE_NAME)
        coder.encode(self.colors, forKey: CODING_KEY_PALETTE_COLORS)
        coder.encode(self.lastEdited, forKey: CODING_KEY_PALETTE_LAST_EDITED)
    }
    
    // MARK:- Comparison
    
    // function to compare palettes based on the date each was last edited
    static func < (lhs: Palette, rhs: Palette) -> Bool {
        return lhs.lastEdited < rhs.lastEdited
    }
    
}
