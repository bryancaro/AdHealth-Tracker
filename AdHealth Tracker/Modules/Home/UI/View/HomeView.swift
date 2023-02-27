//
//  HomeView.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 26/2/23.
//  
//

import SwiftUI

struct HomeView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = HomeViewModel()
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                Text("API REQUEST")
                Color.blue.frame(width: 50, height: 50)
                    .onTapGesture {
                        Task {
                            await viewModel.repository.getHealthGoals()
                        }
                        
                    }
                
                Text("WRITE TO CORE DATA")
                Color.yellow.frame(width: 50, height: 50)
                    .onTapGesture {
                        viewModel.repository.writeToCoreData()
                    }
                
                Text("READ FROM CORE DATA")
                Color.green.frame(width: 50, height: 50)
                    .onTapGesture {
                        viewModel.repository.getHealtGoalsCoreData()
                    }
                
                Text("REMOVE ALL FROM CORE DATA")
                Color.red.frame(width: 50, height: 50)
                    .onTapGesture {
                        viewModel.repository.deleteAllCoreData()
                    }
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension HomeView {}

//  MARK: - Local Components
extension HomeView {}

//  MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

/*
 import SwiftUI
 import CoreData

 struct HomeView: View {
     //  MARK: - Observed Object
     @Environment(\.managedObjectContext) private var viewContext
     
     @StateObject private var viewModel = HomeViewModel()
     
     
     @FetchRequest(
         entity: HealthGoalsEntity.entity(),
         sortDescriptors: [NSSortDescriptor(keyPath: \HealthGoalsEntity.name, ascending: true)])
     private var items: FetchedResults<HealthGoalsEntity>
     
     //  MARK: - Variables
     //  MARK: - Principal View
     var body: some View {
         ZStack {
             VStack {
                 ForEach(items) { value in
                     
                     Text(value.name ?? "No value")
                 }
                 
                 Color.red.frame(width: 50, height: 50).onTapGesture {
                     saveItems()
                 }
             }
         }
         .onAppear(perform: viewModel.onAppear)
         .onDisappear(perform: viewModel.onDisappear)
     }
 }

 //  MARK: - Actions
 extension HomeView {
     private func saveItems() {
         let newItem = HealthGoalsEntity(context: viewContext)
         newItem.name = "Gaby"
         
         save()
     }
     
     private func updateItem(item: HealthGoalsEntity) {
         let currentName = item.name ?? ""
         let newName = currentName + "20"
         item.name = newName
         save()
     }
     
     private func deleteItem(index: Int) {
         guard items.indices.contains(index) else { return }
         
         let item = items[index]
         viewContext.delete(item)
         save()
     }
     
     private func save() {
         do {
             try viewContext.save()
         } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
             let nsError = error as NSError
             fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
         }
     }
 }

 //  MARK: - Local Components
 extension HomeView {}

 //  MARK: - Preview
 struct HomeView_Previews: PreviewProvider {
     static var previews: some View {
         HomeView()
             .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
     }
 }

 */
