//
//  Chat_AppApp.swift
//  Chat App
//
//  Created by Lenny Wachira on 14/09/2024.
//

import SwiftUI
import Firebase

@main
struct Chat_AppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject var messagesManager = MessagesManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(messagesManager)
        }
    }
}

