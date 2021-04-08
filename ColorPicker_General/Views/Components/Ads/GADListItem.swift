//
//  GADListItem.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct GADListItem: View {    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            GADBannerViewController()
                .onAppear {
                    
                }
            Spacer()
        }
    }
}

struct GADListItem_Previews: PreviewProvider {
    static var previews: some View {
        GADListItem()
    }
}
