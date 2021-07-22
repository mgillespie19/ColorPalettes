//
//  ColorPicker.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/8/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct ColorPicker: View {
    
    // MARK:- passed in
    @ObservedObject var viewModel: PaletteViewModel
    
    @Binding var selectedTab: Int
    @Binding var goBack: Bool
    
    var helper: Helper
    
    // MARK:- state tracking
    @State var show = false
    @State var showCurrentPalette = false
    @State var r: Double = 1
    @State var g: Double = 1
    @State var b: Double = 1
    
    var body: some View {
        VStack {
            HStack {
                BackButtonUp(goBack: $goBack)
                
                Spacer()
                
                PlusButton(show: $show, callback: addColor)
            }
            .padding()
            
            ColorSelectionView(viewModel: viewModel, r: $r, g: $g, b: $b, helper: helper)
                .padding(.bottom)
        }
    }
    
    func addColor() {
        self.viewModel.addColor(r: self.r, g: self.g, b: self.b)
        self.show.toggle()

        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()

        selectedTab = 1
    }
}

//struct ColorPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorPicker(viewModel: PaletteViewModel(name: "New Palette", parentVM: PaletteListViewmodel()), helper: Helper(), selectedTab: <#T##Binding<Int>#>)
//    }
//}
