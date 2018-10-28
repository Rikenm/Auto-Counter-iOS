//
//  DetailVIewModel.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/23/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import RxSwift




class DetailViewModel: Countlistener{

    let countObservable: BehaviorSubject<String>
    
    let singalStateToView: BehaviorSubject<CounterState>
    
    var mCounter:Counter
    
    var mCounterManager:CounterManager
    
    var mSoundManager: SoundManager
    
    init(counter: Counter){
        mCounter = counter
        
        mCounterManager = CounterManager()
        countObservable =  BehaviorSubject<String>(value: String(counter.mCount))
        singalStateToView = BehaviorSubject<CounterState>(value: counter.mCounterState)
        mSoundManager = SoundManager()
        mCounterManager.addListener(countlistener: self)
        mCounterManager.configureManager(currentValue: Int(counter.mCount))
       
  
    }
    
    /**  TODO:
     -Method from VM and View Contract Protocol. Standard communicaton contract protocol
     **/
    
    
   func addCounter(mTypeOfCounter:TypeOfCounter){
        // vc triggers to add . u add and send it to the views

    let time: Float = mTypeOfCounter == .automatic ? mCounter.mCounterState.mSpeed.rawValue : 0
    mCounterManager.startCounter(mTypeOfCounter: mTypeOfCounter, time: time)
        
        
    }
    

    /**  TODO:
         -Method from CounterListener Protocol. Count Managaer sends value to VM to send it to VC
         -Parameters:
                     value : int passed from the countManager
    **/
    
    
    func passValue(value: Int) {
   
        mCounter.mCount = value
        countObservable.onNext(String(value))
        
        if(mCounter.mCounterState.mSound == .unmute){
            
            mSoundManager.speak(stringToSpeak: String(value))
            
        }
        
    }
    
    
     /**  TODO:
     -Method from VM and View Contract Protocol. Standard communicaton contract protocol
     **/
    
    func onPlay(){
      // play the timer
       mCounterManager.startCounter(mTypeOfCounter: .automatic, time: mCounter.mCounterState.mSpeed.rawValue)
    }
    
    
    
    /**  TODO:
     -Method from VM and View Contract Protocol. Standard communicaton contract protocol
     **/
    
    func onPause(){
        mCounterManager.stopCounter()
    }
    
    
    func stateChangedSpeed(speed: SpeedState, playState: PlayState) {
       mCounter.mCounterState.mSpeed = speed
        singalStateToView.onNext(mCounter.mCounterState)
        onPause()
          mCounterManager.configureManager(currentValue: Int(mCounter.mCount))
        
        
        
        if(playState == .play){
            onPlay()
            
        }
       
    }
    
    func stateChangedSound(mute: SoundState, playState: PlayState) {
        mCounter.mCounterState.mSound = mute
         singalStateToView.onNext(mCounter.mCounterState)
        onPause()
          mCounterManager.configureManager(currentValue: Int(mCounter.mCount) )
        
        if(playState == .play){
            onPlay()
            
        }
        
    }
    
    
    
    

 
}
