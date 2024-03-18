//
//  TodoTile.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 11.01.2024.
//

import SwiftUI


struct ListTile: View {
    let item : TodoItemModel
    
    var body: some View {
        
        
        let  color : Color = item.isCompleted ? .green : item.isDissmised ? .red : .black
        let icon: String = item.isCompleted ? "checkmark.circle" : item.isDissmised ? "circle.slash" : "circle"
        
        
        HStack{
            Image(systemName: icon).foregroundColor(color)
            Text(item.title)
            Spacer()
        }.font(.title2).padding(.vertical,8)
    }
}


struct ListTile_Previews: PreviewProvider {
    
    static var item1 = TodoItemModel(title: "Test Item 1", isCompleted: true, isDissmised: true)
    static var item2 = TodoItemModel(title: "Test Item 2", isCompleted: true, isDissmised: true)
    
    static var previews: some View {
        Group{
            ListTile(item: item1)
            ListTile(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
