//
//  PIXELifeButton.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-21.
//

import SwiftUI

struct PIXELifeButton: View {
    let title: String
    let textcolor: Color
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(textcolor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(background)
                .cornerRadius(50)
        }
            }
        }
    


#Preview {
    PIXELifeButton(title: "Value",textcolor: .white, background: .pink, action: { //action
    })
        
    
}


