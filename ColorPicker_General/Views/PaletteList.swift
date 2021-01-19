//
//  PaletteList.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/13/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct PaletteList: View {
    @ObservedObject var viewModel: PaletteListViewmodel
    
    @State var paletteList: [PaletteViewModel] = []
    @State var showPaletteDetail = false
    @State var showNewPaletteAlert = false
    @State var showHamburger = false
    @State var newPaletteName = ""
    @State var selectedPalette: PaletteViewModel = PaletteViewModel(name: "error", parentVM: PaletteListViewmodel())
    @State var selectedTab = 1
    @State var showDeletePaletteAlert = false
        
    private let helper = Helper()
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack(alignment: .leading) {
                ScrollView {
                    VStack(spacing: 30) {
                        
                        // MARK:- Header components
                        PLHeader(showHamburger: $showHamburger, showNewPaletteAlert: $showNewPaletteAlert)
                        FeedHeader(showHamburger: $showHamburger, numPalettes: viewModel.numPalettes, numSaves: 0, numFollowers: 223)
                        
                        // MARK:- List items
                        ForEach(viewModel.palettes) { palette in
                            PaletteListItem(palette: palette)
                                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .onTapGesture {
                                if (self.showHamburger) {
                                    self.showHamburger.toggle()
                                } else {
                                    loadPalette(selectedPalette: palette)
                                }
                            }
                            .onLongPressGesture {
                                self.showDeletePaletteAlert.toggle()
                            }
                        }
                        
                        // MARK:- Google Ads
                        // GADListItem()
                    }
                }
                .onTapGesture {
                    self.showHamburger = false
                }
                .blur(radius: (self.showNewPaletteAlert || self.showHamburger) ? 4 : 0)
                .frame(width: UIScreen.main.bounds.width)
                .disabled(self.showNewPaletteAlert)
                .animation(Animation.default)
                .offset(y: showPaletteDetail ? -UIScreen.main.bounds.height : 0)
                
                HamburgerMenu(showHamburger: $showHamburger)
            }
            
            ZStack(alignment: .bottom) {
                PaletteView(viewModel: selectedPalette)
                    .opacity(selectedTab == 1 ? 1 : 0)
                
                ColorPicker(viewModel: selectedPalette, selectedTab: $selectedTab, helper: helper)
                    .opacity(selectedTab == 2 ? 1 : 0)
                
                TabNavigator(goBack: self.$showPaletteDetail, selectedTab: self.$selectedTab)
            }
            .frame(width: UIScreen.main.bounds.width)
            .animation(Animation.default)
            .offset(y: showPaletteDetail ? 0 : UIScreen.main.bounds.height)
            
            PaintChipsAlert(viewModel: self.viewModel, show: $showNewPaletteAlert, paletteName: newPaletteName)
                .opacity(self.showNewPaletteAlert ? 1 : 0)
                .animation(.easeInOut)
        }
    }
    
    private func delete(with indexSet: IndexSet) {
        if (indexSet.count > 0) {
            viewModel.deletePalette(atIndex: indexSet.first!)
        }
    }
    
    private func loadPalette(selectedPalette: PaletteViewModel) {
        showPaletteDetail.toggle()
        self.selectedPalette = selectedPalette
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}
