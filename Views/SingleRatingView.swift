//
//  SingleRatingView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-11-10.
//


import SwiftUI

struct SingleRatingView: View {
    
    let title: String
    let background: Color
    let description: String // New property for the description
    let textColor: Color
    let starColor: Color
    let amountOfStars: Int
  
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(background)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, minHeight: 60)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                .padding(15)
                
                
            
            VStack(spacing: 5) {
                HStack {
                    HStack {
                        ForEach(0..<amountOfStars, id: \.self) { index in  
                            Image(systemName: "star.fill")
                                .font(.system(size: 25))
                                .foregroundColor(starColor)
                        }
                    }
                    
                    Text(title)
                        .font(.title)
                        .textCase(.uppercase)
                        .foregroundColor(textColor)
                        .fontWeight(.semibold)
                }
                
                Rectangle()
                    .fill(Color.white.opacity(0.5))
                    .frame(height:2)
                    .padding(.vertical, 5)
                    
                
                Text(description)
                    .foregroundColor(textColor)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    
            }
            .padding()
        }
    }
}

#Preview {
    SingleRatingView(
        title: "good",
        background: .green,
        description: "joyful, motivated, happy,lovely day ",
        textColor: .white,
        starColor: .red,
        amountOfStars: 3
    )
}


