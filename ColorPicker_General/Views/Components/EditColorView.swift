//
//  EditColorView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 12/5/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct EditColorView: View {
    var backgroundColor: Color
    var foregroundColor: Color
    var hexID: String
    
    var body: some View {
        VStack {
            Text("Edit Color!")
                .foregroundColor(foregroundColor)
        }
        .background(backgroundColor)
    }
}

struct EditColorView_Previews: PreviewProvider {
    static var previews: some View {
        EditColorView(backgroundColor: Color.white, foregroundColor: Color.black, hexID: "000000")
    }
}
