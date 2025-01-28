//
//  User.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-12-30.
//

import Foundation


struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

