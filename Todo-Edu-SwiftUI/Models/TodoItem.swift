//
//  TodoItem.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 17.03.2024.
//

import Foundation


struct TodoItemModel : Identifiable{
    let id: String = UUID().uuidString
    let title : String
    let isCompleted : Bool
    let isDissmised : Bool
    
}
