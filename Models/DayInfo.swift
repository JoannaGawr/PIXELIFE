import SwiftUI

class DayInfo: ObservableObject {
    let date: Date
    let dayNumber: Int
    let monthName: String
    let yearNumber: Int
    @Published var selectedColor: Color
    var description: String = ""
    var photo: UIImage? = nil


    init(date: Date, dayNumber: Int, monthName: String, yearNumber: Int, selectedColor: Color = DayRating.grayColor) {
        self.date = date
        self.dayNumber = dayNumber
        self.monthName = monthName
        self.yearNumber = yearNumber
        self.selectedColor = selectedColor
    }
}
