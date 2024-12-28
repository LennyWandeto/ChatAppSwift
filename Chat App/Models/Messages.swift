//
//  Messages.swift
//  Chat App
//
//  Created by Lenny Wachira on 14/09/2024.
//

import Foundation

struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
