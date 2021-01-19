//
//  PLHeader.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PLHeader: View {
    
    @Binding var showHamburger: Bool
    @Binding var showNewPaletteAlert: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                self.showHamburger.toggle()
            }
            , label: {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding()
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            Button(action: {
                if (self.showHamburger) {
                    self.showHamburger.toggle()
                } else {
                    self.showNewPaletteAlert.toggle()
                }
            }
            , label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
                    .foregroundColor(.black)
            })
        }

    }
}

//struct PLHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        PLHeader()
//    }
//}
