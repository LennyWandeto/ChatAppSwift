//
//  MessageTextField.swift
//  Chat App
//
//  Created by Lenny Wachira on 19/09/2024.
//

import SwiftUI

struct MessageTextField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    var body: some View {
        HStack{
            CustomTextField(placeholder: Text("Type..."), text: $message)
            Button{
                messagesManager.sendMessages(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Grayy"))
        .clipShape(.rect(cornerRadius: 50))
        .padding()
        
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View{
        MessageTextField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

#Preview {
    MessageTextField()
}
