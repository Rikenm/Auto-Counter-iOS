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
    func stateChangedSound(mute:SoundState, play:PlayState)
}

@IBDesignable
 class ManualScreen: UIView {
    
    
    
    var muteState: SoundState!{
        didSet{
            mManualViewListener.stateChangedSound(mute: muteState, play: .pause)
        }
    }
    
    
    @IBOutlet weak var muteButton: UIButton!
    
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
    
    @IBAction func muteButton(_ sender: UIButton) {
        if(muteState == SoundState.mute)
        {
            muteButton.setImage(UIImage(named: "Mute"), for: .normal)
            muteState = SoundState.unmute
            
        }else {
            muteButton.setImage(UIImage(named: "Sound"), for: .normal)
            muteState = SoundState.mute
        }
    }
    
    
    @IBAction func muteView(_ sender: Any) {
        if(muteState == SoundState.mute)
        {
            muteButton.setImage(UIImage(named: "Mute"), for: .normal)
            muteState = SoundState.unmute
            
        }else {
            muteButton.setImage(UIImage(named: "Sound"), for: .normal)
            muteState = SoundState.mute
        }
        
    }
    
    
    @IBAction func refreshButton(_ sender: UIButton) {
        
    }
    
    
    func changeSoundIcon(soundState: SoundState){
        
        if(soundState == SoundState.mute)
        {
            muteButton.setImage(UIImage(named: "Mute"), for: .normal)
            
            
        }else {
            muteButton.setImage(UIImage(named: "Sound"), for: .normal)
            
        }
        
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    

}
