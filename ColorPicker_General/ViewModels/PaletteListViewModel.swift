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
    
    @Published private(set) var palettes: [PaletteViewModel] = []
    
    private var TAG = "PLVM:"
    private var cancellable: AnyCancellable?
    
    let defaults = UserDefaults.standard
    
    init() {
        print(TAG, "init called")
        
        if let paletteData = self.defaults.object(forKey: "palettes") as? Data {
            guard let localPalettes = NSKeyedUnarchiver.unarchiveObject(with: paletteData) as? [String: [ColorCell]] else {
                print ("\(self.TAG)ERROR in creating user profile from data")

                return
            }
            
            var paletteIndex = 0
            localPalettes.keys.forEach { paletteName in
                self.palettes.append(PaletteViewModel(name: paletteName))
                
                localPalettes[paletteName]?.forEach { color in
                    self.palettes[paletteIndex].addColor(r: color.r, g: color.g, b: color.b)
                }
                
                paletteIndex += 1
            }

            print("\(self.TAG) profile user fetch successful.")
        } else {
            print("\(self.TAG)ERROR in receive profile data from user defaults")
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func addPalette(newName: String) {
        print("adding palette!")
        self.palettes.append(PaletteViewModel(name: newName))
        
        uploadPalettes()
    }
    
    func deletePalette(atIndex: Int) {
        self.palettes.remove(at: atIndex)
        
        uploadPalettes()
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    func uploadPalettes() {
        var paletteArchive: [String: [ColorCell]] = [:]
        
        self.palettes.forEach { palette in
            paletteArchive[palette.PaletteName] = []
            
            palette.Rcolors.forEach { color in
                paletteArchive[palette.PaletteName]?.append(color)
            }
            
            palette.Lcolors.forEach { color in
                paletteArchive[palette.PaletteName]?.append(color)
            }
        }
        
        let paletteData = NSKeyedArchiver.archivedData(withRootObject: paletteArchive)
        self.defaults.set(paletteData, forKey: "palettes")
    }
}
