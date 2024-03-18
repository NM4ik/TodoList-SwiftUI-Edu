//
//  ListView.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 11.01.2024.
//

import SwiftUI

struct ListView : View {
    
    
    @EnvironmentObject var listViewModel : ListViewModel
    
   
    
    var body : some View {
        List {
            ForEach(listViewModel.items) {
                item in ListTile(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.onDeleteItem)
            .onMove(perform: listViewModel.onMoveItem)
        }.navigationTitle("List of todos ✏️").toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddView()) {
                    Text("Add")
                }
            }
            
            
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        })
    }
    
    
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

