//
//  Extensions.swift
//  PIXELife
//
//  Created by Joanna Gawryszewska on 2024-12-30.
//

import Foundation



extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
            
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch{
            return[:]
            
        }
    }
}
