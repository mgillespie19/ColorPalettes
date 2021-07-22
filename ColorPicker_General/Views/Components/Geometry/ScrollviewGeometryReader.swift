//
//  ScrollviewGeometryReader.swift
//  nft-app
//
//  Created by Max Gillespie on 2/24/21.
//

import SwiftUI

struct ScrollviewGeometryReader: View {
    var body: some View {
        GeometryReader { geo in
            let offset = geo.frame(in: .global).minY
            Color.clear.preference(key: OffsetPreferenceKey.self, value: offset)
        }
    }
}

struct ScrollviewGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ScrollviewGeometryReader()
    }
}
