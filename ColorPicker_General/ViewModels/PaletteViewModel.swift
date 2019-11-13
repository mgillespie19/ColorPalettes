//
//  ColorsViewModel.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/9/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import Combine
import UIKit
import SwiftUI

class PaletteViewModel: Identifiable, ObservableObject {
    @Published private(set) var Rcolors: [ColorCell]
    @Published private(set) var Lcolors: [ColorCell]
    
    private var TAG = "PVM:"
    private var cancellable: AnyCancellable?
    
    init() {
        print(TAG, "init called")
        Rcolors = []
        Lcolors = []
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addColor(r: Double, g: Double, b: Double) {
        let r_str = String(format:"%02X", Int(r * 255))
        let g_str = String(format:"%02X", Int(g * 255))
        let b_str = String(format:"%02X", Int(b * 255))
        let helper = Helpers()
        
        
        if (Rcolors.count <= Lcolors.count) {
            Rcolors.append(ColorCell(c: Color(red: r, green: g, blue: b), h: "\(r_str)\(g_str)\(b_str)", tc: helper.evalTileFontColor(r: r, g: g, b: b)))
        } else {
            Lcolors.append(ColorCell(c: Color(red: r, green: g, blue: b), h: "\(r_str)\(g_str)\(b_str)", tc: helper.evalTileFontColor(r: r, g: g, b: b)))
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
