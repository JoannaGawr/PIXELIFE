//
//  PIXELifeApp.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-09-16.
//

import SwiftUI
import Firebase

@main
struct PIXELifeApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
