//
//  TitleRow.swift
//  Chat App
//
//  Created by Lenny Wachira on 14/09/2024.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string:"https://images.unsplash.com/reserve/Af0sF2OS5S5gatqrKzVP_Silhoutte.jpg?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Nancy"
    var online_status = "Online"
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: imageUrl){image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                Text(online_status)
                    .font(.caption)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone")
                .foregroundStyle(.gray)
                .padding(10)
                .background(.white)
                .clipShape(Circle())
        }
        .padding()
    }
}

#Preview {
    TitleRow()
        .background(Color("Peach"))
}
