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
        print("adding palette!")
        if (self.palettes.count > 0) {
            print("previous c1: \(String(describing: self.palettes.first?.Lcolors.count))")
        }
        self.palettes.append(PaletteViewModel())
        print("new c1: \(self.palettes.first?.Lcolors.count)")
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
