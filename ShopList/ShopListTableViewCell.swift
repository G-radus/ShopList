//
//  ShopListTableViewCell.swift
//  ShopList
//
//  Created by Rustam Gradov on 22/05/2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelItem: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPieces: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
