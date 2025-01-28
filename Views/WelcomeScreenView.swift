//
//  WelcomeScreenView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-21.
//

import SwiftUI

struct WelcomeScreenView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "Pixelife",
                           subtitle: "life in pixels",
                           titleFont: .custom("minecraft", size: 40),
                           subtitleFont: .system(.title2))
                    .padding(.top, 50)
                
                Spacer()
                
                // Login
                VStack {
                    NavigationLink(destination: LoginView()) {
                        PIXELifeButton(
                            title: "Sign In",
                            textcolor: .white,
                            background: DayRating.logoColor,
                            action: {
                 viewModel.login()
             })
                    }
                }
                .padding()
                
                // Create Account
                VStack {
                    Text("New around here?")
                        .padding(2)
                    NavigationLink(destination: RegisterView()) {
                        Text("Create an account")
                            .foregroundColor(DayRating.logoColor)
                    }
                }
                
                Spacer()
                    .padding()
            }
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
