//
//  MessageBubble.swift
//  Chat App
//
//  Created by Lenny Wachira on 14/09/2024.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ?
                        Color("Grayy") :Color("Peach"))
                    .clipShape(.rect(cornerRadius: 50))
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture(perform: {
                showTime.toggle()
            })
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .padding(message.received ? .leading : .trailing)
            }
                    
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: Message(id: "307r0390984skd", text: "hey bb what are you doing today", received: true, timestamp: Date()))
}
