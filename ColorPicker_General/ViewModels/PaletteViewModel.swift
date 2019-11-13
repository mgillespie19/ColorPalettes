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

class PaletteViewModel: ObservableObject {
//    @Published private(set) var colors: [ColorRow] = [ColorRow(Color1: Color.white, Color2: Color.blue), ColorRow(Color1: Color.red, Color2: Color.black)]
    @Published private(set) var Rcolors: [ColorCell]
    @Published private(set) var Lcolors: [ColorCell]
    
    private var TAG = "CVM:"
    private var cancellable: AnyCancellable?
    
    init() {
        print(TAG, "init called")
        Rcolors = []
        Lcolors = []
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addColor(color: Color) {
        if (Rcolors.count <= Lcolors.count) {
            Rcolors.append(ColorCell(c: color))
        } else {
            Lcolors.append(ColorCell(c: color))
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
