//
//  ListViewModel.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 17.03.2024.
//

import Foundation


class ListViewModel : ObservableObject {
    @Published var items : [TodoItemModel] = []  {
        didSet {
            saveItems()
        }
    }
    
    let storageKey : String = "todos"
    
    init() {
        getItems();
    }
    
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: storageKey),
                let savedItems = try? JSONDecoder().decode([TodoItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
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
    
    func updateItem(item: TodoItemModel) {
        if  let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateComplete()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: storageKey)
        }
    }
}
