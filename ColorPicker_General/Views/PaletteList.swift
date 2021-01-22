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
    @State var hideProfile = false
    @State var hideAbout = false
    @State var hideHowTo = false
    @State var hideRate = false
    @State var hideLeaveFeedback = false
    @State var hideUpgrade = false
    
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
                        FeedHeader(showHamburger: $showHamburger, numPalettes: viewModel.numPalettes, numSaves: 0, numFollowers: 1140)
                        
                        // MARK:- List items
                        ForEach(viewModel.palettes) { palette in
                            PaletteListItem(palette: palette)
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
                        
                        // MARK:- Google Ads
                        // GADListItem()
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
                
                HamburgerMenu(showHamburger: $showHamburger, showHamburgerDetail: $showHamburgerDetail, hideProfile: $hideProfile, hideAbout: $hideAbout, hideHowTo: $hideHowTo, hideRate: $hideRate, hideLeaveFeedback: $hideLeaveFeedback, hideUpgrade: $hideUpgrade, callback: self.updateActiveView)
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
    
    private func deselectHamburger() {
        self.showHamburger = false
        self.showHamburgerDetail = false
        updateActiveView(viewId: -1)
    }
    
    func updateActiveView(viewId: Int) -> Void {
        print("updating active view")
        
        setAllStates(value: true)
        
        switch viewId {
        case 1:
            print("showing profile info")
            showHamburgerDetail = true
            break
        case 2:
            print("showing about info")
            showHamburgerDetail = true
            break
        case 3:
            print("showing how to info")
            showHamburgerDetail = true
            break
        case 4:
            print("showing rate info")
            showHamburgerDetail = true
            break
        case 5:
            print("showing leave feedback info")
            showHamburgerDetail = true
            break
        case 6:
            print("showing upgrade info")
            showHamburgerDetail = true
            break
        default:
            // if we get any other value just reset all values
            setAllStates(value: false)
            showHamburgerDetail = false
        }
    }
    
    func setAllStates(value: Bool) {
        hideProfile = value
        hideAbout = value
        hideHowTo = value
        hideRate = value
        hideLeaveFeedback = value
        hideUpgrade = value
    }
}

struct PaletteList_Previews: PreviewProvider {
    static var previews: some View {
        PaletteList(viewModel: PaletteListViewmodel())
    }
}
