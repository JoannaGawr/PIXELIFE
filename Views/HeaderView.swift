//
//  HeaderView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-21.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let titleFont: Font
    let subtitleFont: Font
    
    
    var body: some View {
     
            
            VStack{
                Text (title)
                    .font(titleFont)  // Use the custom titleFont here
                    .foregroundColor(DayRating.logoColor)
                Text (subtitle)
                    .foregroundColor(DayRating.logoColor)
                    .font(subtitleFont)
                }
            .padding(.top, 80)
        Spacer()
        }
       
    
        
    
    
}

#Preview {
                    HeaderView( title: "Title",
                                subtitle: "Subtitle",
                                titleFont: .custom("Minecraft", size: 50),
                                subtitleFont: .custom("Helvetica Neue", size: 22))
}
