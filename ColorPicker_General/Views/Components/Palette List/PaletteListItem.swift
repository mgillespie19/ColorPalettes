//
//  PaletteListItem.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 3/28/20.
//  Copyright © 2020 Max Gillespie. All rights reserved.
//

import SwiftUI

struct PaletteListItem: View {
    
    // MARK:- variables passed in
    @ObservedObject var palette: PaletteViewModel
    
    var callback: (PaletteViewModel) -> ()
    
    // MARK:- state tracking
    @State var showPaletteActions = false
        
    var body: some View {
        VStack (alignment: .leading) {
            HorizontalPaletteColorsView(paletteColors: palette.allColors)
            
            HStack {
                Text(palette.PaletteName)
                    .font(.custom("Maven Pro", size: 18))
                    .fontWeight(.ultraLight)
                
                Spacer()
                
                Button(action: {
                    showPaletteActions.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .frame(width: 25, height: 5)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                })
            }
            .padding(.leading)
            .padding(.trailing)
            
            Divider()
                .padding(.trailing)
        }
        .frame(height: 135)
        .background(Color.white)
        .actionSheet(isPresented: $showPaletteActions) {
            ActionSheet( title: Text("Palette options"),
                         message: nil,
                         buttons: [
                            .default(
                                Text("Delete palette")
                                    .foregroundColor(.red),
                                action: {
                                    print("Deleting palette at \(palette.id)")
                                    callback(palette)
                                }),
                            .cancel()
                         ])
        }
    }
}

//struct PaletteListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        PaletteListItem(palette: PaletteViewModel())
//    }
//}
