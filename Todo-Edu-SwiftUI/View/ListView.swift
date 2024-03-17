//
//  ListView.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 11.01.2024.
//

import SwiftUI

struct ListView : View {
    
    
    @State var todos: [String] = [
        "Go to Dune 2",
        "Go to docter",
        "Play Valorant Today",
        "Cook eat",
    ]
    
    
    var body : some View {
        List {
            ForEach(todos, id: \.self) {
                item in ListTile(title: item, isCompleted: true)
            }
        }.navigationTitle("List of todos ✏️").toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddView()) {
                    Text("Add")
                }
            }
            
            
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: Text("Edit Todo")) {
                    Text("Edit")
                }
            }
        })
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}

