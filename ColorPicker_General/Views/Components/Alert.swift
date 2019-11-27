//
//  Alert.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 11/25/19.
//  Copyright © 2019 Max Gillespie. All rights reserved.
//

import SwiftUI

struct Alert: View {
    @ObservedObject var viewModel: PaletteListViewmodel
    @Binding var show: Bool
    @State var paletteName: String
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Name your new palette")
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.leading)
                .padding(.trailing)
            
            TextField("Palette \(viewModel.palettes.count + 1)", text: $paletteName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Divider()
            
            HStack {
                Spacer()
                Button(action: {
                    if (self.paletteName != "") {
                        self.viewModel.addPalette(newName: self.paletteName)
                    } else {
                        self.viewModel.addPalette(newName: "Palette \(self.viewModel.palettes.count + 1)")
                    }
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                    self.show.toggle()
                    UIApplication.shared.endEditing()
                    self.paletteName = ""
                }) {
                    Text("Done")
                }
                Spacer()

                Divider()

                Spacer()
                Button(action: {
                    UIApplication.shared.windows[0].rootViewController?.dismiss(animated: true, completion: {})
                    self.show.toggle()
                    UIApplication.shared.endEditing()
                }) {
                    Text("Cancel")
                }
                Spacer()
            }.padding(0)
        }
        .background(Color.white)
        .opacity(0.97)
        .frame(width: 300, height: 185)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.45), radius: 12)
    }
}

//struct Alert_Previews: PreviewProvider {
//    static var previews: some View {
//        Alert(viewModel: PaletteListViewmodel(), show: true, paletteName: "")
//    }
//}

extension UIApplication {
       func endEditing() {
           sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
       }
   }
