//
//  MessagesManager.swift
//  Chat App
//
//  Created by Lenny Wachira on 20/09/2024.
//

import Foundation
import FirebaseFirestore

class MessagesManager :ObservableObject {
    @Published private(set) var messages: [Message]  = []
    @Published private(set) var lastMessageId = ""
    
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages() {
        db.collection("Messages").addSnapshotListener{ QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else {
                print("Error fetching document \(String(describing:error))")
                return
            }
            self.messages = documents.compactMap{ document -> Message? in
                do{
                    return try document.data(as : Message.self)
                } catch{
                    print("Error recording document into message \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }
        
    }
    
    func sendMessages(text: String){
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("Messages").document().setData(from: newMessage)
        } catch{
            print("Error sending message to Firestore: \(error)")
        }
    }
}
