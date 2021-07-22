//
//  ListHeader.swift
//  nft-app
//
//  Created by Max Gillespie on 2/23/21.
//

import SwiftUI

struct ListHeader: View {
    
    @Binding var showHeader: Bool
    var headerTitle: String
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Rectangle()
                .foregroundColor(Color("OffWhite"))
                .frame(width: UIScreen.main.bounds.width, height: 132)
                .shadow(radius: 0.5)
            
            Text(headerTitle)
                .font(.headline)
                .padding()
        }
        .opacity(showHeader ? 1 : 0)
        .animation(.default)
    }
}

//struct ListHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ListHeader()
//    }
//}
