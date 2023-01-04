
//  toDoADD.swift
//  ToDoList
//
//  Created by Sherif samy on 11/24/22.
//  Copyright © 2022 Sherif samy. All rights reserved.
//

import UIKit

protocol todoItems {
    func addNewItems(item :getToDo)
}

class AdditemsVC: UIViewController {
    
 //MARK: - Outlets
    
    @IBOutlet weak var addButtonOutlet: UIButton!{
        didSet{
            addButtonOutlet.setCustomButton()
        }
    }
    @IBOutlet weak var toDoTF: UITextField!

    
     //MARK: - Constants
    
    var delegate : todoItems?
    var myList : getToDo?
    static var flag = 0
    
    
     //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
       super.viewWillDisappear(animated)
        if AdditemsVC.flag == 1 {
        delegate?.addNewItems(item: myList!)
        AdditemsVC.flag = 0
            
        }
    }
    

   //MARK: -:- IbACtions:-
    
    @IBAction func addNewItemBtnPressed(_ sender: UIButton) {
        if toDoTF.text != "" {
            
            myList = getToDo(list: toDoTF.text!)
            AdditemsVC.flag = 1
            self.navigationController?.popViewController(animated: true)
            
        }else{
            
            let alert = UIAlertController(title: "Error", message: "Enetr item please ", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK:- Helper Functions :
    
    func setupUI(){
        navigationController?.navigationBar.prefersLargeTitles = false
    }

}
