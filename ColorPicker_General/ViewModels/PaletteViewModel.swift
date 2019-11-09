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
    @Published private(set) var colors: [ColorRow] = [ColorRow(Color1: Color.white, Color2: Color.blue), ColorRow(Color1: Color.red, Color2: Color.black)]
    
    private var TAG = "CVM:"
    private var cancellable: AnyCancellable?
    
    init() {
        print(TAG, "init called")
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addColor(color: Color) {
        if (self.colors.last?.color2 == Color.clear) {
            self.colors.last?.color2 = color
        } else {
            self.colors.append(ColorRow(Color1: color, Color2: Color.clear))
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
