//
//  AddView.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 16.03.2024.
//

import Foundation
import SwiftUI


struct AddView : View {
    
    
    @EnvironmentObject var listViewModel : ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var todoTitleState: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    var body : some View {
        ScrollView{
            VStack {
                TextField("ToDo Title", text: $todoTitleState).padding(.horizontal).frame(height: 55).background(Color(.systemGray6)).cornerRadius(10)
                
                
                Button (
                    action: onSavePressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)  .font(.headline)
                            .frame(height: 55).frame(maxWidth:  .infinity)
                            .background(Color.accentColor).cornerRadius(10)
                    }
                )
            }.padding(14)
            
            
            
        }
        .navigationTitle("Add Todo")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func onSavePressed() {
        if textAppropriate() {
            listViewModel.onAddItem(title: todoTitleState)
            presentationMode.wrappedValue.dismiss()
        }else {
            alertTitle = "Wrong text!"
            showAlert.toggle()
        }
        
    }
    
    func textAppropriate() -> Bool {
        if(todoTitleState.count < 3) {
            return false
        }
        
        return true
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
    }
}
