//
//  RegisterView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-16.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()

    
    var body: some View {
        VStack {
            //Header
            NavigationStack{
                HeaderView(title: "Pixelife",
                           subtitle: "life in pixels",
                           titleFont: .custom("minecraft", size: 40),
                           subtitleFont: .system(.title2))
                    .padding(.top, 50)
                
                Form{
                    TextField ("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField ("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField ("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    PIXELifeButton(
                        title: "Register",
                        textcolor: .white,
                        background: DayRating.greatColor,
                        action: {
             viewModel.register()
         })
                    
                }
                .offset(y: -50)
                
                Spacer()
              
            }
         
        }
    }
}
    
#Preview {
    RegisterView()
}
