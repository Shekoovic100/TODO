//
//  CardView.swift
//  ToDoList
//
//  Created by sherif on 04/01/2023.
//  Copyright © 2023 Sherif samy. All rights reserved.
//

import UIKit

class CardView:UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }
    
    func viewSetup(){
        self.layer.cornerRadius = self.frame.height / 5
        self.backgroundColor = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.7137254902, alpha: 1)
        self.layer.shadowOpacity = 0.1
        
    }
    
    
    
    
}
