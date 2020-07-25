//
//  TableViewCell.swift
//  Register
//
//  Created by Sambit Das on 02/04/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewCell: UITableViewCell {
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var pEmail: UILabel!
    @IBOutlet weak var pNumber: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
