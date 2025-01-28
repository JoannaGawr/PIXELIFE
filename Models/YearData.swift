//
//  YearData.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-15.
//

import Foundation
import SwiftUI

class YearData: ObservableObject {
    @Published var ratings: [Date: Color] = [:]
    
    func setRating(_ color: Color, for date: Date) {
        ratings[date] = color
    }
    
    func getRating(for date: Date) -> Color {
        return ratings[date] ?? DayRating.greatColor
    }
}
