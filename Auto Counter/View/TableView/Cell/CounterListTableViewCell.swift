//
//  CounterListTableViewCell.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/21/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class CounterListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mTitleCounter: UILabel!
    
    @IBOutlet weak var mCount: UILabel!
    
    
    
    @IBOutlet weak var imageCircle: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
