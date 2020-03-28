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
    
    var PaletteName: String
    var parentViewModel: PaletteListViewmodel
    
    @Published private(set) var Rcolors: [ColorCell] = []
    @Published private(set) var Lcolors: [ColorCell] = []
    var idCounter = 0
    
    private var TAG = "PVM:"
    private var cancellable: AnyCancellable?
    
    init(name: String, parentVM: PaletteListViewmodel) {
        print(TAG, "init called")
        PaletteName = name
        parentViewModel = parentVM
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addColor(r: Double, g: Double, b: Double) {
        let r_str = String(format:"%02X", Int(r * 255))
        let g_str = String(format:"%02X", Int(g * 255))
        let b_str = String(format:"%02X", Int(b * 255))
        let helper = Helper()
        
        if (Rcolors.count <= Lcolors.count) {
            Rcolors.append(ColorCell(ID: idCounter, R: r, G: g, B: b, h: "\(r_str)\(g_str)\(b_str)", tc: helper.evalTileFontColor(r: r, g: g, b: b), ShouldDelete: false))
        } else {
            Lcolors.append(ColorCell(ID: idCounter, R: r, G: g, B: b, h: "\(r_str)\(g_str)\(b_str)", tc: helper.evalTileFontColor(r: r, g: g, b: b), ShouldDelete: false))
        }
        
        idCounter += 1
        
        self.parentViewModel.uploadPalettes()
    }
    
    func editPalette() {
        
    }
    
    func deleteColor(ID: Int) {
        for i in 0..<Rcolors.count {
            if (Rcolors[i].id == ID) {
                print(TAG, "deleting color from right side...")
                Rcolors.remove(at: i)
                
                self.parentViewModel.uploadPalettes()
                return
            }
        }
        for i in 0...Lcolors.count {
            if (Lcolors[i].id == ID) {
                print(TAG, "deleting color from left side...")
                Lcolors.remove(at: i)
                
                self.parentViewModel.uploadPalettes()
                return
            }
        }
    }
    
    func numColors() -> Int {
        return (Rcolors.count + Lcolors.count)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    func sortColorsAscending() -> [ColorCell] {
        var returnList: [ColorCell] = []
        
        for color in Rcolors {
            returnList.append(color)
        }
        for color in Lcolors {
            returnList.append(color)
        }
        
        return returnList.sorted(by: >)
    }
    
    func sortColorsDescending() -> [ColorCell] {
        var returnList: [ColorCell] = []
        
        for color in Rcolors {
            returnList.append(color)
        }
        for color in Lcolors {
            returnList.append(color)
        }
        
        return returnList.sorted(by: <)
    }
}
