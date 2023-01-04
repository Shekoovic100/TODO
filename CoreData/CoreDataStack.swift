//
//  CoreDataStack.swift
//  ToDoList
//
//  Created by sherif on 04/01/2023.
//  Copyright © 2023 Sherif samy. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class CoreDataStack {
    
    
    // save data
    
    static func saveData(todo:getToDo){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let manageContext = appDelegate.persistentContainer.viewContext
        guard let Entity = NSEntityDescription.entity(forEntityName: "ToDo", in: manageContext) else {return}
        let toDoObject = NSManagedObject.init(entity: Entity, insertInto: manageContext)
        
        toDoObject.setValue(todo.list, forKey: "list")
        
        do {
            try manageContext.save()
            print("success")
        }catch{
            print("Error !!!")
        }
    }
    
    // reterieve data
    
    static func getToDO()->[getToDo] {
        
       var  toDos:[getToDo] = []
        
       guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return [] }
       let context = appDelegate.persistentContainer.viewContext
       let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDo")
        
        do {
            let result  = try context.fetch(fetchData) as! [NSManagedObject]
            
            for todo in result {
                let list = todo.value(forKey: "list") as? String
                let todo =  getToDo(list:list ?? "")
                toDos.append(todo)
            }
        }catch{
            print("Error !!!")
        }
        return toDos
    }
    
    // Delete data
    
    static func deleteToDo(index:Int){
        
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let fetchdata = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDo")
        
        do {
            let result = try context.fetch(fetchdata) as! [NSManagedObject]
            let deleteToDo = result[index]
            context.delete(deleteToDo)
            try context.save()
        }catch{
            print("Error !!!!")
        }
    }
    
}
