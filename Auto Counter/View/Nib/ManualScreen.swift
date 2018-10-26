//
//  ManualScreen.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/23/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

protocol ManualViewListener {
    func addCountManual()
}

@IBDesignable
 class ManualScreen: UIView {
    
    
    
    
    var mManualViewListener:ManualViewListener!
    
//    override func awakeFromNib() {
//
//    }
//
//

    required init?(coder aDecoder: NSCoder) {   // 2 - storyboard initializer
        super.init(coder: aDecoder)

    }
    
    override init(frame: CGRect) {   // 3 - programmatic initializer
        super.init(frame: CGRect.zero)  // 4.
        
        print("initing manual screen")
//       xibSetup() // 6.
        
    }
    
    @IBOutlet weak var counterLabel: UILabel!

    
    @IBAction func addButton(_ sender: UIButton) {
        
        
        if(mManualViewListener != nil){
            print("insdie the listener counting")
            mManualViewListener.addCountManual()
        }else{
            print("listener is nil")
        }
        
    }
    
   func addListener(manualViewListener:ManualViewListener){
    
      print("adding listener")
       mManualViewListener = manualViewListener
    
      
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    

}
