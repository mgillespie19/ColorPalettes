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
            FeedHeaderTile(selected: $feedSelected, num: $numPalettes, selectionColor: Color.blue, title: "palettes")
                .onTapGesture {
                    self.feedSelected = true
                    self.savesSelected = false
                    self.followersSelected = false
                }
            Spacer()
            FeedHeaderTile(selected: $savesSelected, num: $numSaves, selectionColor: Color.blue, title: "saves")
                .onTapGesture {
                    self.feedSelected = false
                    self.savesSelected = true
                    self.followersSelected = false
                }
            Spacer()
            FeedHeaderTile(selected: $followersSelected, num: $numFollowers, selectionColor: Color.blue, title: "followers")
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
