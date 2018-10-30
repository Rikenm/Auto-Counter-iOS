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
        mCounter = Counter()
        mCounter.mCount = counter.mCount
        mCounter.mId = counter.mId
        mCounter.mCounterState = counter.mCounterState
        
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

        let time: Int = mTypeOfCounter == .automatic ? mCounter.mCounterState.mSpeed.rawValue : 0
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
          updatePersistantContainer()
    }
    
    
    func stateChangedSpeed(speed: SpeedState, playState: PlayState) {
        
        let counterState = CounterState()
        counterState.mSound = mCounter.mCounterState.mSound
        counterState.mSpeed = speed
        
        mCounter.mCounterState = counterState
        
       mCounter.mCounterState.mSpeed = speed
        singalStateToView.onNext(mCounter.mCounterState)
        onPause()
          mCounterManager.configureManager(currentValue: Int(mCounter.mCount))
        
        
        
        if(playState == .play){
            onPlay()
            
        }
        updatePersistantContainer()
       
    }
    
    func stateChangedSound(mute: SoundState, playState: PlayState) {
        let counterState = CounterState()
        counterState.mSound = mute
        counterState.mSpeed = mCounter.mCounterState.mSpeed

        mCounter.mCounterState = counterState
        
        
         singalStateToView.onNext(mCounter.mCounterState)
        onPause()
          mCounterManager.configureManager(currentValue: Int(mCounter.mCount) )
        
        if(playState == .play){
            onPlay()
            
        }
        updatePersistantContainer()
        
    }

    func resetCounter(playState: PlayState){
        onPause()
        mCounter.mCount = 0
        countObservable.onNext(String(0))
         mCounterManager.configureManager(currentValue: Int(0))
        
        if(playState == .play){
            onPlay()
            
        }
        
        
        updatePersistantContainer()
        
    }
    
    
    func updatePersistantContainer(){
        
        let persistantDataSingleton = PersistantDataManager.shared
        
       _ =  persistantDataSingleton.persistAndUpdateCounter(counter: mCounter)
        
        
        
    }

}
