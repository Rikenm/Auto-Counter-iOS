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
    
    
    @IBOutlet weak var muteImage: UIButton!
    
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var speedBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let mScreenSize = UIScreen.main.bounds
        let mSeparatorHeight = CGFloat(10.0) // Change height of speatator as you want
        let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
        mAddSeparator.backgroundColor = UIColor.init(displayP3Red: 22/255, green: 32/255, blue: 43/255, alpha: 1)// Change backgroundColor of separator
        self.addSubview(mAddSeparator)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
