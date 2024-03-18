//
//  ListViewModel.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 17.03.2024.
//

import Foundation


class ListViewModel : ObservableObject {
    @Published var items : [TodoItemModel] = []
    
    init() {
        getItems();
    }
    
    
    func getItems() {
        let newItems : [TodoItemModel] = [
            TodoItemModel(title: "Do one valoGame", isCompleted: false, isDissmised: false),
            TodoItemModel(title: "Sleep 7h", isCompleted: true, isDissmised: false),
            TodoItemModel(title: "Go to work" , isCompleted: false, isDissmised: true),
        ]
        
        items.append(contentsOf:  newItems)
    }
    
    
    func onDeleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func onMoveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func onAddItem(title: String) {
        items.append(TodoItemModel(title: title, isCompleted: false, isDissmised:false))
    }
}
