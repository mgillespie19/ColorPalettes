//
//  AboutHamburgerView.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 7/12/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import SwiftUI

struct AboutHamburgerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shortly after being sent home from my senior year of college during covid, I was looking for a new project to work on.")
                .font(.body)
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
            
            Text("I'd had a couple of ideas, but was struggling to come up with a good looking palette for any of them. I kept dragging squares around in different Adobe files, but that got old pretty fast.")
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
            
            Text("I initially made this app with myself in mind as the main customer. I hope you enjoy using it! If you want to reach out, please don't hesitate to contact me through any of the ways below.")
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
            
            Text("- Max")
                .padding(.leading)
                .padding(.leading)
            
            Button(action: {
                if let url = URL(string: "https://www.linkedin.com/in/max-gillespie/") {
                    UIApplication.shared.open(url)
                }
            }, label: {
                Text("LinkedIn")
                    .foregroundColor(.blue)
                    .padding(.top)
                    .padding(.leading)
            })
            
            Button(action: {
                if let url = URL(string: "mailto:max@maxgillespie.com") {
                    UIApplication.shared.open(url)
                }
            }, label: {
                Text("Email")
                    .foregroundColor(.blue)
                    .padding(.top)
                    .padding(.leading)
            })
        }
        
    }
}

struct AboutHamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        AboutHamburgerView()
    }
}
