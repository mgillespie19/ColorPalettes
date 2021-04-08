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
    
    // MARK:- Hamburger state tracking
    @State var showHamburger = false
    @State var showHamburgerDetail = false
    @State var selectedHamburgerTab = 0 // 0 is root option
    
    @State var newPaletteName = ""
    @State var selectedPalette: PaletteViewModel = PaletteViewModel(name: "error", parentVM: PaletteListViewmodel())
    @State var selectedTab = 1
    @State var showDeletePaletteAlert = false
    @State var paletteViewSelected = 1
        
    private let helper = Helper()
    
    var body: some View {
        ZStack(alignment: .center) {
            ZStack(alignment: .leading) {
                ScrollView {
                    VStack(spacing: 30) {
                        
                        // MARK:- Header components
                        PLHeader(showHamburger: $showHamburger, showNewPaletteAlert: $showNewPaletteAlert)
                        FeedHeader(paletteViewSelected: $paletteViewSelected, showHamburger: $showHamburger, numPalettes: viewModel.numPalettes, numSaves: 0, numFollowers: 1140)
                        
                        // MARK:- List items
                        ZStack {
                            VStack {
                                ForEach(viewModel.palettes) { palette in
                                    PaletteListItem(palette: palette, callback: deletePalette(p:))
                                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                    .onTapGesture {
                                        if (self.showHamburger) {
                                            self.deselectHamburger()
                                        } else {
                                            loadPalette(selectedPalette: palette)
                                        }
                                    }
                                    .onLongPressGesture {
                                        self.showDeletePaletteAlert.toggle()
                                    }
                                }
                            }
                            .opacity(self.paletteViewSelected == 1 ? 1 : 0)

                            Text("saves")
                                .opacity(self.paletteViewSelected == 2 ? 1 : 0)
                            
                            Text("following")
                                .opacity(self.paletteViewSelected == 3 ? 1 : 0)
                        }
                        .animation(.none)
                    }
                }
                .onTapGesture {
                    self.deselectHamburger()
                }
                .blur(radius: (self.showNewPaletteAlert || self.showHamburger) ? 4 : 0)
                .frame(width: UIScreen.main.bounds.width)
                .disabled(self.showNewPaletteAlert)
                .animation(Animation.default)
                .offset(y: showPaletteDetail ? -UIScreen.main.bounds.height : 0)
                
                HamburgerMenu(showHamburger: $showHamburger, showHamburgerDetail: $showHamburgerDetail, selectedHamburgerTab: $selectedHamburgerTab, callback: self.updateActiveView)
            }
            
            VStack {
                ZStack(alignment: .bottom) {
                    PaletteView(viewModel: selectedPalette, goBack: self.$showPaletteDetail)
                        .opacity(selectedTab == 1 ? 1 : 0)
                    
                    ColorPicker(viewModel: selectedPalette, selectedTab: $selectedTab, goBack: self.$showPaletteDetail, helper: helper)
                        .opacity(selectedTab == 2 ? 1 : 0)
                }
                
                // GADListItem()
                
                TabNavigator(selectedTab: self.$selectedTab)
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
            viewModel.deletePaletteAtIndex(index: indexSet.first!)
        }
    }
    
    private func loadPalette(selectedPalette: PaletteViewModel) {
        showPaletteDetail.toggle()
        self.selectedPalette = selectedPalette
    }
    
    private func deselectHamburger() {
        self.showHamburger = false
        self.showHamburgerDetail = false
        updateActiveView(viewId: -1)
    }
    
    func updateActiveView(viewId: Int) -> Void {
        print("updating active view")
        
        if (viewId == 1 || viewId == 2 || viewId == 3 || viewId == 4 || viewId == 5 || viewId == 6) {
            showHamburgerDetail = true
            selectedHamburgerTab = viewId
        } else {
            showHamburgerDetail = false
            selectedHamburgerTab = 0
        }
    }
    
    func deletePalette(p: PaletteViewModel) {
        viewModel.deletePalette(paletteToDelete: p)
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}
