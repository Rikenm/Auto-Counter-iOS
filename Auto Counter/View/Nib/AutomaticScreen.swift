//
//  AutomaticScreen.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/24/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class AutomaticScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {   // 2 - storyboard initializer
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {   // 3 - programmatic initializer
        super.init(frame: CGRect.zero)  // 4.
        
        print("initing automatic  screen")
        //       xibSetup() // 6.
        
    }
    
    
    @IBAction func startButton(_ sender: UIButton) {
        // this starts the automatic counter
    }
    
    
    
  
    @IBAction func speedDecrease(_ sender: UIButton) {
    }
    
    
    
 
    @IBAction func speedIncrease(_ sender: UIButton) {
        
    }
    
    
    @IBAction func mute(_ sender: UIButton) {
        
    }
    
   

}
