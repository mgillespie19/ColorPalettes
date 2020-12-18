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
    
    // variable tracking
    @State var numPalettes = 10
    @State var numSaves = 14
    @State var numFollowers = 223
    
    var body: some View {
        HStack() {
            Spacer()
            FeedHeaderTile(selected: $feedSelected, num: $numPalettes, selectionColor: Color(red: 255/255, green: 190/255, blue: 21/255, opacity: 1.0), title: "palettes")
                .onTapGesture {
                    self.feedSelected = true
                    self.savesSelected = false
                    self.followersSelected = false
                }
            Spacer()
            FeedHeaderTile(selected: $savesSelected, num: $numSaves, selectionColor: Color(red: 101/255, green: 134/255, blue: 250/255, opacity: 1.0), title: "saves")
                .onTapGesture {
                    self.feedSelected = false
                    self.savesSelected = true
                    self.followersSelected = false
                }
            Spacer()
            FeedHeaderTile(selected: $followersSelected, num: $numFollowers, selectionColor: Color(red: 255/255, green: 97/255, blue: 97/255, opacity: 1.0), title: "followers")
                .onTapGesture {
                    self.feedSelected = false
                    self.savesSelected = false
                    self.followersSelected = true
                }
            Spacer()
        }
    }
}

struct FeedHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeader()
    }
}
