import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "Pixelife",
                           subtitle: "life in pixels",
                           titleFont: .custom("minecraft", size: 40),
                           subtitleFont: .system(.title2))
                Image("PixelLIFE")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .padding(.top, 50)
                
                    
                
               
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                  
                    PIXELifeButton(title: "Login",
                                   textcolor: .white,
                                   background: DayRating.logoColor,
                                   action: {
                        viewModel.login()
                    })
                    
                    .padding()
                }
                Spacer()
                
                VStack{
                    
                    Text("First time here?")
                    NavigationLink(destination: RegisterView()) {
                        Text("Create an account")
                            .foregroundColor(Color(red: 135/255, green: 206/255, blue: 235/255))
                            .padding()
                            
                           
                           
                    }
                    
                    
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


