//
//  TodoItem.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 17.03.2024.
//

import Foundation


struct TodoItemModel : Identifiable , Codable{
    let id: String
    let title : String
    let isCompleted : Bool
    let isDissmised : Bool
    
    init(id: String = UUID().uuidString,  title: String, isCompleted: Bool, isDissmised: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.isDissmised = isDissmised
    }
    
    func updateComplete() -> TodoItemModel {
        return TodoItemModel(id: id, title: title, isCompleted: !isCompleted, isDissmised: false)
    }
}
