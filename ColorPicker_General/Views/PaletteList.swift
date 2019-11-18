//
//  PaletteList.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteList: View {
    @ObservedObject var viewModel: PaletteListViewmodel
    
    @State var showPaletteDetail = false
    @State var selectedPalette: PaletteViewModel?
    
    var body: some View {
        NavigationView {
            List(viewModel.palettes) { palette in
                NavigationLink (destination:
                    PaletteContainer(viewModel: self.selectedPalette ?? PaletteViewModel())
                ) {
                    Button(action:  {
                        self.showPaletteDetail.toggle()
                        self.selectedPalette = palette
                    }, label: {
                        Text("Palette")
                            .font(.title)
                            .padding(.top)
                            .padding(.bottom)
                    } )
                }
            }.navigationBarTitle("My Palettes")
                .navigationBarItems(trailing: Button(action: {
                    self.viewModel.addPalette()
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 25, height: 25)
                }))
        }
        //        .sheet(isPresented: $showPaletteDetail, content: { PaletteView(viewModel: self.selectedPalette) })
        //        .sheet(isPresented: $showPaletteDetail, content: { PaletteContainer(viewModel: self.selectedPalette) })
        
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}
