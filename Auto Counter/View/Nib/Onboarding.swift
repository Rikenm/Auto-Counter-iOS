//
//  Onboaring.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/30/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class Onboarding: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    @IBOutlet weak var skipBtn: UIButton!
    
    
    @IBAction func skipBtnAction(_ sender: UIButton) {
        
       
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {  
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        print("initing automatic  screen")
       
        
    }
    
    
    
    
    
    
    
}