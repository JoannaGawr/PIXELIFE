//
//  ContentView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-16.
//
import FirebaseCore
import SwiftUI

class DayInfoModel: ObservableObject {
    @Published var dayInfo: DayInfo // Default color for the square
    @Published var selectedColor: Color = DayRating.grayColor
    init(dayInfo: DayInfo = DayInfo(date: Date(), dayNumber: Calendar.current.component(.day, from: Date()), monthName: DateFormatter().monthSymbols[Calendar.current.component(.month, from: Date()) - 1], yearNumber: Calendar.current.component(.year, from: Date())),
         selectedColor: Color = DayRating.grayColor) {
            self.dayInfo = dayInfo
            self.selectedColor = selectedColor
        }
}


class YearInfoModel: ObservableObject {
    @Published var days: [DayInfo]

    init(year: Int) {
        var tempDays: [DayInfo] = []
        let calendar = Calendar.current

        for month in 1...12 {
            guard let monthDate = calendar.date(from: DateComponents(year: year, month: month)),
                  let daysInMonth = calendar.range(of: .day, in: .month, for: monthDate) else {
                continue
            }

            for day in daysInMonth {
                if let dayDate = calendar.date(from: DateComponents(year: year, month: month, day: day)) {
                    tempDays.append(
                        DayInfo(
                            date: dayDate,
                            dayNumber: day,
                            monthName: DateFormatter().monthSymbols[month - 1],
                            yearNumber: year
                        )
                    )
                }
            }
        }

        self.days = tempDays
    }
}



struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @StateObject private var yearInfoModel = YearInfoModel(year: 2024)

    var body: some View {
        Group {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
            } else {
                LoginView()
            }
        }
        .animation(.easeInOut, value: viewModel.isSignedIn) // Smooth transition
    }

    @ViewBuilder
    var accountView: some View {
        TabView {
            YearInPixelsView(yearInfoModel: yearInfoModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            NavigationStack {
                DescriptionsListView(yearInfoModel: yearInfoModel)
            }
            .tabItem {
                Label("Memories", systemImage: "book")
            }

            NavigationStack {
                ProfileView()}
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(DayRating.brownColor)
    }
}

#Preview {
    MainView()
}

    







