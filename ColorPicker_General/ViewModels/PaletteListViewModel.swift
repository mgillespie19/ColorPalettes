//
//  PaletteListViewModel.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import Foundation
import Combine

class PaletteListViewmodel: ObservableObject {
    @Published private(set) var palettes: [PaletteViewModel]
    
    private var TAG = "PLVM:"
    private var cancellable: AnyCancellable?
    
    init() {
        print(TAG, "init called")
        palettes = []
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addPalette() {
        self.palettes.append(PaletteViewModel())
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
