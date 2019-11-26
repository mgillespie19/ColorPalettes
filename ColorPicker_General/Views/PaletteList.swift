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
    
    @State var paletteList: [PaletteViewModel] = []
    @State var showPaletteDetail = false
    @State var showNewPaletteAlert = false
    @State var newPaletteName = ""
    @State var selectedPalette: PaletteViewModel?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.palettes) { palette in
                    NavigationLink (destination:
                        PaletteContainer(viewModel: palette)
                    ) {
                        Button(action:  {
                            self.showPaletteDetail.toggle()
                            self.selectedPalette = palette
                        }, label: {
                            Text(palette.PaletteName)
                                .font(.title)
                                .padding(.top)
                                .padding(.bottom)
                        })
                    }
                }.navigationBarTitle("My Palettes")
                    .navigationBarItems(trailing: Button(action: {
                        self.showNewPaletteAlert.toggle()
                    }
                        , label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                    })
                )
            }
            
            Alert(viewModel: self.viewModel, show: showNewPaletteAlert)
                .opacity(self.showNewPaletteAlert ? 1 : 0)
                .offset(y: self.showNewPaletteAlert ? -100 : 500)
                .animation(.easeInOut)
            //        .sheet(isPresented: $showNewPaletteAlert, content: {
            //            Alert(viewModel: self.viewModel)
            //        })
        }
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}
