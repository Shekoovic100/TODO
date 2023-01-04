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
    
    
    static let appDelegate = UIApplication.shared.delegate as? AppDelegate
    static let manageContext = appDelegate?.persistentContainer.viewContext
    
    // save data
    
    static func saveData(todo:getToDo){
 
        guard let Entity = NSEntityDescription.entity(forEntityName: "ToDo", in: manageContext!) else {return}
        let toDoObject = NSManagedObject.init(entity: Entity, insertInto: manageContext)
        
        toDoObject.setValue(todo.list, forKey: "list")
        
        do {
            try manageContext!.save()
            print("success")
        }catch{
            print("Error !!!")
        }
    }
    
    // reterieve data
    
    static func getToDO()->[getToDo] {
        
       var  toDos:[getToDo] = []
       
       let fetchData = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDo")
        
        do {
            let result  = try manageContext?.fetch(fetchData) as! [NSManagedObject]
            
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
        
      
        let fetchdata = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDo")
        
        do {
            let result = try manageContext?.fetch(fetchdata) as! [NSManagedObject]
            let deleteToDo = result[index]
            manageContext?.delete(deleteToDo)
            try manageContext?.save()
        }catch{
            print("Error !!!!")
        }
    }
    
}
