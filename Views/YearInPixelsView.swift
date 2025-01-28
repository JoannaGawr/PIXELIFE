//
//  YearInPixelsView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-10.
//

import SwiftUI

struct YearInPixelsView: View {
    @ObservedObject var yearInfoModel: YearInfoModel

    let months = ["", "J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]

    var body: some View {
        NavigationStack {
            VStack {
                Text("How was your day?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                    .foregroundStyle(DayRating.brownColor)

                GeometryReader { geometry in
                    HStack(spacing: 10) {
                        let gridWidth = geometry.size.width * 0.69
                        let totalSpacing = CGFloat(12) * 5
                        let squareSize = (gridWidth - totalSpacing) / 13
                        let fontSize = max(squareSize * 0.5, 8)

                        ScrollView {
                            LazyVGrid(columns: Array(repeating: GridItem(.fixed(squareSize), spacing: 5), count: 13), spacing: 5) {
                                // Month headers
                                ForEach(months.indices, id: \.self) { index in
                                    ZStack {
                                        Rectangle()
                                            .cornerRadius(3)
                                            .foregroundColor(.clear)
                                            .aspectRatio(1, contentMode: .fit)

                                        Text(months[index])
                                            .foregroundStyle(index == 0 ? .clear : DayRating.brownColor)
                                            .font(.system(size: fontSize, weight: .bold))
                                    }
                                }

                                // Day grid
                                ForEach(0..<31) { rowIndex in
                                    ForEach(0..<13) { columnIndex in
                                        if columnIndex == 0 {
                                            // Day numbers column
                                            ZStack {
                                                Rectangle()
                                                    .cornerRadius(3)
                                                    .foregroundColor(.clear)
                                                    .aspectRatio(1, contentMode: .fit)

                                                Text("\(rowIndex + 1)")
                                                    .foregroundStyle(DayRating.brownColor)
                                                    .font(.system(size: fontSize, weight: .bold))
                                            }
                                        } else {
                                            let monthIndex = columnIndex - 1
                                            let dayIndex = calculateDayIndex(month: monthIndex, day: rowIndex + 1)

                                            if isValidDay(rowIndex, columnIndex) {
                                                // Render valid days
                                                NavigationLink(
                                                    destination: RateTheDayView(
                                                        selectedColor: $yearInfoModel.days[dayIndex].selectedColor,
                                                        description: $yearInfoModel.days[dayIndex].description,
                                                        photo: $yearInfoModel.days[dayIndex].photo,
                                                        dayIndex: dayIndex,
                                                        dayInfo: yearInfoModel.days[dayIndex]
                                                    ),
                                                    label: {
                                                        ZStack {
                                                            Rectangle()
                                                                .cornerRadius(3)
                                                                .foregroundColor(yearInfoModel.days[dayIndex].selectedColor)
                                                                .aspectRatio(1, contentMode: .fit)
                                                        }
                                                    }
                                                )
                                            } else {
                                                // Render unused days as clear
                                                ZStack {
                                                    Rectangle()
                                                        .cornerRadius(3)
                                                        .foregroundColor(.clear)
                                                        .aspectRatio(1, contentMode: .fit)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        .frame(width: gridWidth)

                        // Legend
                        VStack(spacing: 20) {
                            legendItem(text: "Great", color: DayRating.greatColor)
                            legendItem(text: "Good", color: DayRating.goodColor)
                            legendItem(text: "Okay", color: DayRating.okayColor)
                            legendItem(text: "Bad", color: DayRating.badColor)
                        }
                        .frame(width: geometry.size.width * 0.25)
                    }
                }

               
              
            }
        }
        .tint(DayRating.brownColor)
        .padding()
    }

    func legendItem(text: String, color: Color) -> some View {
        HStack {
            Text(text)
                .font(.system(size: 13))
                .foregroundStyle(DayRating.brownColor)
            Rectangle()
                .cornerRadius(3.0)
                .foregroundColor(color)
                .frame(width: 25, height: 25)
        }
    }

    func isValidDay(_ rowIndex: Int, _ columnIndex: Int) -> Bool {
        let month = columnIndex - 1
        let day = rowIndex + 1
        let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        return month >= 0 && month < 12 && day <= daysInMonth[month]
    }

    func calculateDayIndex(month: Int, day: Int) -> Int {
        let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        let cumulativeDays = daysInMonth.prefix(month).reduce(0, +)
        return cumulativeDays + day - 1
    }
}


// Preview
struct YearInPixelsView_Previews: PreviewProvider {
    static var previews: some View {
        YearInPixelsView(yearInfoModel: YearInfoModel(year: 2024))
    }
}

