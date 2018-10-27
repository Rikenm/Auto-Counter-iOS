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
    func playButtonClicked()
    func pauseButtonClicked()
    func stateChangedSpeed(speed:SpeedState)
    func stateChangedSound(mute:SoundState)
}

enum PlayState{
    
    case play
    case pause
}





class AutomaticScreen: UIView {


    
    @IBOutlet weak var tortoiseButton: UIButton!
    
    @IBOutlet weak var lightingButton: UIButton!
    
    @IBOutlet weak var soundButton: UIButton!
    
    @IBOutlet weak var normalImage: UIImageView!
    
    @IBOutlet weak var containerLabelView: UIView!
    
    var mAutomaticViewListener:AutomaticViewListener!
    var toggleState:PlayState = .play
    
    var speedState: SpeedState!{
        didSet{
          
        }
    }
    var muteState: SoundState!{
        didSet{
            
        }
    }
    
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
         let playBtn = sender as UIButton
        
        if toggleState == .play {
            play()
            toggleState = .pause
            playBtn.setImage(UIImage(named:"Pause"),for:.normal)
        } else {
            pause()
            toggleState = .play
            playBtn.setImage(UIImage(named: "Play"),for:.normal)
        }
        
        
        
    }
    
    
    func play(){
        addPulse(timerInterval: 1.0)   // remove this
        if(mAutomaticViewListener != nil){
            
            mAutomaticViewListener.addCountAutomatic()
        }
    }
    
    func pause(){
        
        if(mAutomaticViewListener != nil){
            
            mAutomaticViewListener.pauseButtonClicked()
        }
        
    }
    
    
    
    func addPulseFromVC(timerInterval:Float){
        addPulse(timerInterval: timerInterval)
    }
    
    
    
  
    @IBAction func speedDecrease(_ sender: UIButton) {
        // change the state
        
        
            speedState = SpeedState.slow
            tortoiseButton.setImage(UIImage(named: "tortoise"), for: .normal)
            lightingButton.setImage(UIImage(named: "lightingunselected"), for: .normal)
            normalImage.image = nil
      
       
        
        
      
    }
    
    
    
 
    @IBAction func speedIncrease(_ sender: UIButton) {
        // change the state in the viewmodel
        
        speedState = SpeedState.fast
         lightingButton.setImage(UIImage(named: "lightingselected"), for: .normal)
        tortoiseButton.setImage(UIImage(named: "tortoise-512"), for: .normal)
        normalImage.image = nil
        
        
    }
    
    
    @IBAction func normalSpeed(_ sender: Any) {
        
        
        normalImage.image = UIImage(named: "Target")
        speedState = SpeedState.normal
        lightingButton.setImage(UIImage(named: "lightingunselected"), for: .normal)
         tortoiseButton.setImage(UIImage(named: "tortoise-512"), for: .normal)
        
        
        
    }
    @IBAction func mute(_ sender: UIButton) {
         //mute and unmute
        
      if(muteState == SoundState.mute)
      {
        sender.setImage(UIImage(named: "Mute"), for: .normal)
        muteState = SoundState.unmute
        
      }else {
        sender.setImage(UIImage(named: "Sound"), for: .normal)
         muteState = SoundState.mute
        }
        
    }
    
    
    @IBAction func muteButton(_ sender: Any) {
        if(muteState == SoundState.mute)
        {
            soundButton.setImage(UIImage(named: "Mute"), for: .normal)
            muteState = SoundState.unmute
            
        }else {
            soundButton.setImage(UIImage(named: "Sound"), for: .normal)
            muteState = SoundState.mute
        }
    }
    
    
    @IBAction func refreshButton(_ sender: UIButton) {
        
    }
    
    
    func addPulse(timerInterval: Float){
        let pulse = Pulsing(numberOfPulse: Float.infinity, radius: 100, position: counterLabel.center)
        pulse.animationDuration = TimeInterval(timerInterval)
        pulse.backgroundColor = UIColor.init(red: 38/255, green: 190/255, blue: 242/255, alpha: 1).cgColor

        self.layer.insertSublayer(pulse, below: counterLabel.layer)
    }
    
    
    func stopPulse(){
        
        
        self.layer.sublayers?.forEach { $0.removeAllAnimations() }

//        
    }
    
    
    func addAutomaticViewListener(automaticViewListener: AutomaticViewListener){
        
        mAutomaticViewListener = automaticViewListener
    }
    
    
   

}
