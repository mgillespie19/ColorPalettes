//
//  GeometryTools.swift
//  nft-app
//
//  Created by Max Gillespie on 2/23/21.
//

import Foundation
import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
