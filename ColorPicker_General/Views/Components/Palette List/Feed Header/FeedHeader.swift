//
//  FeedHeader.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 12/16/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct FeedHeader: View {
    
    // selection
    @State var feedSelected = true
    @State var savesSelected = false
    @State var followersSelected = false
    @State var headerText = "My palettes"
    
    // variable tracking
    @Binding var showHamburger: Bool
    var numPalettes: Int
    var numSaves: Int
    var numFollowers: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Spacer()
                FeedHeaderTile(selected: $feedSelected, num: numPalettes, selectionColor: Color(red: 255/255, green: 190/255, blue: 21/255, opacity: 1.0), title: "palettes")
                    .onTapGesture {
                        if (showHamburger) {
                            showHamburger.toggle()
                        } else {
                            self.feedSelected = true
                            self.savesSelected = false
                            self.followersSelected = false
                            self.headerText = "My palettes"
                        }
                    }
                Spacer()
                FeedHeaderTile(selected: $savesSelected, num: numSaves, selectionColor: Color(red: 101/255, green: 134/255, blue: 250/255, opacity: 1.0), title: "saves")
                    .onTapGesture {
                        if (showHamburger) {
                            showHamburger.toggle()
                        } else {
                            self.feedSelected = false
                            self.savesSelected = true
                            self.followersSelected = false
                            self.headerText = "My saves"
                        }
                    }
                Spacer()
                FeedHeaderTile(selected: $followersSelected, num: numFollowers, selectionColor: Color(red: 255/255, green: 97/255, blue: 97/255, opacity: 1.0), title: "followers")
                    .onTapGesture {
                        if (showHamburger) {
                            showHamburger.toggle()
                        } else {
                            self.feedSelected = false
                            self.savesSelected = false
                            self.followersSelected = true
                            self.headerText = "My followers"
                        }
                    }
                Spacer()
            }
            
            Text(self.headerText)
                .font(.headline)
                .padding()
                .animation(.none)
        }
    }
}

//struct FeedHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedHeader()
//    }
//}
