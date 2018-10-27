//
//  Counter.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/21/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation

enum SpeedState: Float{
    case normal = 5.0
    case fast = 1.0
    case slow = 10.0
    
}


enum SoundState: Int{
    
    
    
    case mute = 0
    case unmute = 1
}

struct CounterState{
    var mSpeed: SpeedState
    var mSound: SoundState
    
    init(speed:SpeedState,sound:SoundState ){
        mSpeed = speed
        mSound = sound
    }
    
}



struct Counter{
    // model
    // data type
    
    var mTitle: String
    var mCount: Int
    var mId: Int
    var mCounterState: CounterState
    
    
    //add speedState and soundstate
    
    init(title:String,count:Int, id: Int, counterState: CounterState){
        mTitle = title
        mCount = count
        mId = id
       mCounterState = counterState
    }
    
}
