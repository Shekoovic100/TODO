//
//  UIButton + Extension.swift
//  ToDoList
//
//  Created by Sherif samy on 11/24/22.
//  Copyright © 2022 Sherif samy. All rights reserved.
//

import Foundation
import UIKit



extension UIButton{
    
    func setCustomButton() {
        self.layer.cornerRadius = self.frame.height / 5
        self.layer.borderWidth = 1
        self.backgroundColor = #colorLiteral(red: 1, green: 0.7568627451, blue: 0.7137254902, alpha: 1)
        self.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    }
}
