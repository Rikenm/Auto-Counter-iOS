//
//  AutomaticScreen.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/24/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit



protocol AutomaticViewListener {
    func addCountAutomatic()
}


class AutomaticScreen: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    var mAutomaticViewListener:AutomaticViewListener!
    
    required init?(coder aDecoder: NSCoder) {   // 2 - storyboard initializer
        super.init(coder: aDecoder)
        
    }
    
    override init(frame: CGRect) {   // 3 - programmatic initializer
        super.init(frame: CGRect.zero)  // 4.
        
        print("initing automatic  screen")
        //       xibSetup() // 6.
        
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func startButton(_ sender: UIButton) {
        // this starts the automatic counter
        
        addPulse()
    }
    
    
    
  
    @IBAction func speedDecrease(_ sender: UIButton) {
    }
    
    
    
 
    @IBAction func speedIncrease(_ sender: UIButton) {
        
    }
    
    
    @IBAction func mute(_ sender: UIButton) {
        
    }
    
    
    func addPulse(){
        let pulse = Pulsing(numberOfPulse: 10, radius: 100, position: counterLabel.center)
        pulse.animationDuration = 1
        pulse.backgroundColor = UIColor.init(red: 38/255, green: 190/255, blue: 242/255, alpha: 1).cgColor

        self.layer.insertSublayer(pulse, below: counterLabel.layer)
    }
    
    
    func addAutomaticViewListener(automaticViewListener: AutomaticViewListener){
        
        mAutomaticViewListener = automaticViewListener
    }
    
    
   

}
