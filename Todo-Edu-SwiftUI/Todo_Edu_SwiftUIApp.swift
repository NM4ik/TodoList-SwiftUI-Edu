//
//  Todo_Edu_SwiftUIApp.swift
//  Todo-Edu-SwiftUI
//
//  Created by Никита Михайлов on 11.01.2024.
//

import SwiftUI

@main
struct TodoEduSwiftUIApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
