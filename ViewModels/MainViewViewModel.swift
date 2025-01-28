//
//  MainViewViewModel.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-12-30.
//


import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?

    init() {
        // Listen for authentication state changes
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }

    deinit {
        // Clean up the auth state listener
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }

    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}


