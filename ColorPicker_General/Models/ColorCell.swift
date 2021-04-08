//
//  ColorRow.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/9/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import SwiftUI

class ColorCell: NSObject, NSCoding, Identifiable, Comparable {
    
    // MARK:- Local variables
    var id: Int!
    var r: Double!
    var g: Double!
    var b: Double!
    var hex: String!
    
    override init() {
        
    }
    
    // MARK:- constructor
    init(ID: Int, R: Double, G: Double, B: Double, h: String) {
        self.id = ID
        self.r = R
        self.g = G
        self.b = B
        self.hex = h
    }
    
    // MARK:- NSCoding
    required convenience init?(coder decoder: NSCoder) {
        let id = decoder.decodeObject(forKey: "id") as! Int
        let r = decoder.decodeObject(forKey: "r") as! Double
        let g = decoder.decodeObject(forKey: "g") as! Double
        let b = decoder.decodeObject(forKey: "b") as! Double
        let hex = decoder.decodeObject(forKey: "hex") as! String
        
        self.init(
            ID: id,
            R: r,
            G: g,
            B: b,
            h: hex
        )
    }

    func encode(with coder: NSCoder) {
        print("encoding id: \(self.id)")
        coder.encode(self.id, forKey: "id")
        coder.encode(self.r, forKey: "r")
        coder.encode(self.g, forKey: "g")
        coder.encode(self.b, forKey: "b")
        coder.encode(self.hex, forKey: "hex")
    }

    // MARK:- Comparison
    static func < (lhs: ColorCell, rhs: ColorCell) -> Bool {
        let lhsSum = lhs.r + lhs.g + lhs.b
        let rhsSum = rhs.r + rhs.g + rhs.b
        
        return lhsSum <= rhsSum
    }
}
