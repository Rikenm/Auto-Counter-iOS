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
    func stateChangedSpeed(speed:SpeedState, play: PlayState)
    func stateChangedSound(mute:SoundState, play:PlayState)
    func resetCounter(play:PlayState)
}

enum PlayState{
    case start
    case pause
    case play
}


class AutomaticScreen: UIView {


    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tortoiseButton: UIButton!
    
    @IBOutlet weak var lightingButton: UIButton!
    
    @IBOutlet weak var soundButton: UIButton!
    
    @IBOutlet weak var normalImage: UIImageView!
    
    @IBOutlet weak var containerLabelView: UIView!
    
    var mAutomaticViewListener:AutomaticViewListener!
    var toggleState:PlayState = .start
    
    var speedState: SpeedState!{
        didSet{
            
          mAutomaticViewListener.stateChangedSpeed(speed: speedState, play: toggleState)
        }
    }
    var muteState: SoundState!{
        didSet{
            mAutomaticViewListener.stateChangedSound(mute: muteState, play: toggleState)
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
        
        
        
        if toggleState == .pause {
            play()
            toggleState = .play
            playBtn.setImage(UIImage(named:"Pause"),for:.normal)
            
        }else if(toggleState == .start){
             playBtn.setImage(UIImage(named:"Pause"),for:.normal)
             play()
            toggleState = .play
            
            
        }
        else {
             print("play")
            pause()
            toggleState = .pause
            playBtn.setImage(UIImage(named: "Play"),for:.normal)
        }
        
        
        
    }
    
    
    
    func pauseFromVC(){
        
        toggleState = .pause
        playBtn.setImage(UIImage(named: "Play"),for:.normal)
        
    }
    
    
    func play(){
        addPulse(timerInterval: 1.0)   // remove this
        if(mAutomaticViewListener != nil){
            
            mAutomaticViewListener.addCountAutomatic()
        }else{
            print("automatic counter listener is null")
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

 
      
    }
    
    
    
 
    @IBAction func speedIncrease(_ sender: UIButton) {
        // change the state in the viewmodel
        
        speedState = SpeedState.fast

  
    }
    
    
    @IBAction func normalSpeed(_ sender: Any) {
        
        speedState = SpeedState.normal

    }
    @IBAction func mute(_ sender: UIButton) {
         //mute and unmute
        print("button mute")
     mute()
        
    }
    
    
    @IBAction func muteButton(_ sender: Any) {
         print("mute view")
       mute()
    }
    
    
    func mute(){
        if(muteState == SoundState.mute)
        {
//
            muteState = SoundState.unmute
            
        }else {
//
            muteState = SoundState.mute
        }
        
        
    }
    
    
    @IBAction func refreshButton(_ sender: UIButton) {
        
        mAutomaticViewListener.resetCounter(play: toggleState)
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
    

    // from vc to this view
    
    
    func changeSpeedIcon(speedState: SpeedState){
        
        
        if(speedState == SpeedState.fast){
            
            lightingButton.setImage(UIImage(named: "lightingselected"), for: .normal)
            tortoiseButton.setImage(UIImage(named: "tortoise-512"), for: .normal)
            normalImage.image = nil
            
            
        }else if(speedState == SpeedState.normal){
            normalImage.image = UIImage(named: "Target")
            lightingButton.setImage(UIImage(named: "lightingunselected"), for: .normal)
            tortoiseButton.setImage(UIImage(named: "tortoise-512"), for: .normal)
            
        }else{
          
            tortoiseButton.setImage(UIImage(named: "tortoise"), for: .normal)
            lightingButton.setImage(UIImage(named: "lightingunselected"), for: .normal)
            normalImage.image = nil
        }
    
    }
    
    
    func changeSoundIcon(soundState: SoundState){
        
        if(soundState == SoundState.mute)
        {
            soundButton.setImage(UIImage(named: "Mute"), for: .normal)
            
            
        }else {
            soundButton.setImage(UIImage(named: "Sound"), for: .normal)
            
        }
        
        
    }
    
    
   

}
