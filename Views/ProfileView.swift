//
//  ProfileView.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-16.
//



import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image("taylor") // Replace with your image
            .resizable()
            .foregroundColor(.gray)
            .opacity(0.8)
            .scaledToFill()
            .frame(width: 120, height: 120)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 5)
        
        // Info: Name, Email, Member since
        VStack(spacing: 20) {
            ProfileDetailRow(title: "Name", value: user.name)
            Divider().background(Color.gray)
            
            ProfileDetailRow(title: "Email", value: user.email)
            Divider().background(Color.gray)
            
            ProfileDetailRow(
                title: "Member since",
                value: "\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))"
            )
            Divider().background(Color.gray)
            
            Button("Log Out") {
                viewModel.logOut()
                    
            }
            .tint(.primary)
            
            Divider().background(Color.gray)
            
        }
        .padding()
        
        // Sign out button
      

        
        Spacer()
    }
}

// Moved ProfileDetailRow outside the @ViewBuilder scope
struct ProfileDetailRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 10) // Space between rows
    }
}

#Preview {
    ProfileView()
}
