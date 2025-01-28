//
//  DayRatingDescription.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-20.
//

import SwiftUI

struct DayRatingDescription: View {
    
    var body: some View {
        VStack(alignment: .leading) {
          

            VStack(spacing: 5) {
                SingleRatingView(title: "great",
                                 background: DayRating.greatColor,
                                 description: "Everything clicked, carefree moments",
                                 textColor: DayRating.goodColor,
                                 starColor: DayRating.goodColor,
                                 amountOfStars: 4)

                SingleRatingView(title: "good",
                                 background: DayRating.goodColor,
                                 description: "Smooth sailing, felt nice, peaceful mind",
                                 textColor: DayRating.greatColor,
                                 starColor: DayRating.greatColor,
                                 amountOfStars: 3)

                SingleRatingView(title: "okay",
                                 background: DayRating.okayColor,
                                 description: "Average vibes, manageable anxiety",
                                 textColor: DayRating.badColor,
                                 starColor: DayRating.badColor,
                                 amountOfStars: 2)

                SingleRatingView(title: "bad",
                                 background: DayRating.badColor,
                                 description: "Energy low, high anxiety, sadness",
                                 textColor: DayRating.okayColor,
                                 starColor: DayRating.okayColor,
                                 amountOfStars: 1)
            }
        }
        
        Spacer()
    }
}
#Preview {
    DayRatingDescription()
}
    

