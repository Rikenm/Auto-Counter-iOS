//
//  Counter.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/21/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import RealmSwift

@objc enum SpeedState: Int{
    
    case normal = 4
    case fast = 2
    case slow = 8
    
}


@objc enum SoundState: Int{
    
    
    
    case mute = 0
    case unmute = 1
}




class CounterState: Object{
    @objc dynamic  var mSpeed: SpeedState = .normal
     @objc dynamic var mSound: SoundState = .unmute
    // at this rate int over here
    @objc dynamic var  rateState: Int =  1
    
//    init(speed:SpeedState,sound:SoundState ){
//        mSpeed = speed
//        mSound = sound
//    }
    
    
}



class Counter: Object{
    // model
    // data type
    
    @objc dynamic var mTitle: String = ""
     @objc dynamic var mCount: Int = 0
     @objc dynamic var mId = UUID().uuidString
     @objc dynamic var mCounterState: CounterState!
    override static func primaryKey() -> String? {
        return "mId"
    }
    
    
    //add speedState and soundstate
    
//    init(title:String,count:Int, id: Int, counterState: CounterState){
//        mTitle = title
//        mCount = count
//        mId = id
//       mCounterState = counterState
//    }

}

