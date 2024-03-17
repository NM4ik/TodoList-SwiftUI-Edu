//
//  TodoTile.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 11.01.2024.
//

import SwiftUI



struct ListTile: View {
    let title : String
    let isCompleted: Bool
    
    var body: some View {
        HStack{
            
            
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}



struct ListTile_Previews: PreviewProvider {
    static var previews: some View {
        ListTile(title: "New Todo", isCompleted: false)
    }
}


