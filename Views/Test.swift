//
//  Test.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-23.
//

import SwiftUI

struct Test: View {
    @StateObject private var yearInfoModel = YearInfoModel(year: 2024)

    var body: some View {
        VStack {
            // Display the color of the first day
            if let firstDay = yearInfoModel.days.first {
                DayView(dayInfo: firstDay)
            }

            // Other UI elements can go here
        }
        .padding()
    }
}

struct DayView: View {
    @ObservedObject var dayInfo: DayInfo

    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(dayInfo.selectedColor)
                .frame(width: 100, height: 100)

            Button("Change Color to Green") {
                dayInfo.selectedColor = .green
            }
        }
    }
}

#Preview {
    Test()
}
