//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Sherif samy on 11/24/22.
//  Copyright © 2022 Sherif samy. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
 //MARK: - Outlets
    
    @IBOutlet weak var lblitems: UILabel!
    @IBOutlet weak var upBtnOutlet: UIButton!
    @IBOutlet weak var downBtnOutlet: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
