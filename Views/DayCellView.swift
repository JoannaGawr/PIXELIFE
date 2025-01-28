//
//  DayCellView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-13.
//

import SwiftUI

struct DayCellView: View {
    let year: Int
    let month: Int
    let day: Int
    let dayRating: DayRating
    let isToday: Bool
    let brownColor: Color
    let colorForRating: (DayRating) -> Color

    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(3)
                .foregroundColor(colorForRating(dayRating))
                .aspectRatio(1, contentMode: .fit)

            if isToday {
                Rectangle()
                    .stroke(brownColor, lineWidth: 5)
                    .cornerRadius(3)
            }
        }
    }
}



