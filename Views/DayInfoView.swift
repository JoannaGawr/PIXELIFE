// DayInfoView.swift
// PIXELife

import SwiftUI

struct DayInfoView: View {
    let dayInfo: DayInfo
    
    var body: some View {
        VStack {
            Text("Rate the day")
                .font(.title)
                .padding()
            
            Text("Day: \(dayInfo.dayNumber)")
            Text("Month: \(dayInfo.monthName)")
            Text("Year: \(dayInfo.yearNumber)")
            
            Rectangle()
                .cornerRadius(3.0)
                .foregroundColor(.red)
                .frame(width: 25, height: 25)
            
            Rectangle()
                .cornerRadius(3.0)
                .foregroundColor(.green)
                .frame(width: 25, height: 25)
            
            Spacer()
        }
        .padding()
    }
}


