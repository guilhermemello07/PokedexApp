//
//  StatsView.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import SwiftUI

struct StatsView: View {
    let statValue: CGFloat
    
    var body: some View {
        Capsule()
            .fill(.secondary)
            .frame(width: 180, height: 14)
            .overlay(alignment: .leading) {
                Capsule()
                    .fill(.green)
                    .frame(width: statValue, height: 16)
            }
    }
}

#Preview {
    StatsView(statValue: 51)
}
