//
//  RateTheDayView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-10.
//
//

import SwiftUI

struct RateTheDayView: View {
    @Binding var selectedColor: Color
    @Binding var description: String
    @Binding var photo: UIImage?
    let dayIndex: Int
    let dayInfo: DayInfo
    @Environment(\.dismiss) private var dismiss
    @State private var showNotesView = false
    @State private var showPhotoPicker = false

    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            HStack {
                // Align only the date to the left
                HStack {
                    
                    Image(systemName: "calendar")
                        .font(.largeTitle)
                        .foregroundColor(DayRating.brownColor)
                    Text("\(String(dayInfo.monthName).prefix(3))")
                        .font(.title.bold())
                        .foregroundStyle(DayRating.brownColor)
                    
                    // Display the day with ordinal suffix
                    Text(ordinalSuffix(for: dayInfo.dayNumber))
                        .font(.title.bold())
                        .foregroundStyle(DayRating.brownColor)
                    
                    // Break the year into two parts
                    Text("\(String(dayInfo.yearNumber).prefix(4))")
                        .font(.title.bold())
                        .foregroundStyle(DayRating.brownColor)
                    
                    
                         
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Align date to the left
            }

            VStack(alignment: .center, spacing: 15) {
                Button(action: { selectedColor = DayRating.greatColor; dismiss() }) {
                    ratingButton(color: DayRating.greatColor)
                }
                Button(action: { selectedColor = DayRating.goodColor; dismiss() }) {
                    ratingButton(color: DayRating.goodColor)
                }
                Button(action: { selectedColor = DayRating.okayColor; dismiss() }) {
                    ratingButton(color: DayRating.okayColor)
                }
                Button(action: { selectedColor = DayRating.badColor; dismiss() }) {
                    ratingButton(color: DayRating.badColor)
                }
            }

            Spacer()

            HStack(spacing: 30) {
                // Notes Button
                Button(action: { showNotesView = true }) {
                    VStack {
                        Image(systemName: "square.and.pencil")
                            .font(.largeTitle)
                            .foregroundColor(DayRating.brownColor)
                    }
                }
                .sheet(isPresented: $showNotesView) {
                    NotesView(description: $description)
                }

                // Photo Button
                Button(action: { showPhotoPicker = true }) {
                    VStack {
                        Image(systemName: "camera")
                            .font(.largeTitle)
                            .foregroundColor(DayRating.brownColor)
                    }
                }
                .sheet(isPresented: $showPhotoPicker) {
                    PhotoPickerView(selectedImage: $photo)
                }
            }
            Spacer()
        }
        .padding()
    }

    private func ratingButton(color: Color) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: 60, height: 60)
            .padding(10)
    }

    // Corrected helper function for ordinal suffix
    func ordinalSuffix(for day: Int) -> String {
        let suffixes = ["th", "st", "nd", "rd"]
        let remainder = day % 100
        var suffixIndex: Int
        
        if remainder >= 11 && remainder <= 13 {
            suffixIndex = 0  // "th" for 11th, 12th, 13th
        } else {
            suffixIndex = (day % 10) < 4 ? (day % 10) : 0
        }
        
        return "\(day)\(suffixes[suffixIndex])"
    }
}

// Notes View remains the same
struct NotesView: View {
    @Binding var description: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("Add Notes")
                .font(.headline)
                .padding()
                .foregroundColor(DayRating.brownColor)

            TextEditor(text: $description)
                .frame(height: 200)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding()
                .disableAutocorrection(true)

            Button("Save") {
                dismiss()
            }
                .foregroundColor(.white)
                .padding()
                .background(DayRating.brownColor)
                .cornerRadius(10)
        }
        .padding()
    }
}

// Preview
struct RateTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        RateTheDayView(
            selectedColor: .constant(DayRating.grayColor),
            description: .constant(""),
            photo: .constant(nil),
            dayIndex: 0,
            dayInfo: DayInfo(
                date: Date(),
                dayNumber: 1,
                monthName: "January",
                yearNumber: 2024
            )
        )
    }
}




