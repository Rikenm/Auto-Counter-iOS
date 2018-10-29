//
//  CounterListViewModel.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/21/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation


struct CounterListViewModel{
   
    var mListofCounters : [Counter]
    
//    init( listofCounter: [Counter]){
//
//        mListofCounters = listofCounter
//    }
    
    
    
//
    
    init(){
        // get this model from the realm database and convert it into this model
        var listofCounter = [Counter]()
        let counter = Counter()
        counter.mTitle = "Push Up"
        counter.mCounterState = CounterState()
        
        
        listofCounter.append(counter)
        
        
        
//
//        listofCounter.append(Counter(title: "Push up", count: 1, id: 0, counterState: CounterState(speed: .normal, sound: .mute)))
//        listofCounter.append(Counter(title: "Sit up", count: 10, id: 0, counterState: CounterState(speed: .fast, sound: .mute)))
//        listofCounter.append(Counter(title: "Pull up", count: 22, id: 0, counterState: CounterState(speed: .normal, sound: .mute)))
//        listofCounter.append(Counter(title: "Push up", count: 2, id: 0, counterState: CounterState(speed: .normal, sound: .mute)))
//        listofCounter.append(Counter(title: "Curls", count: 40, id: 0, counterState: CounterState(speed: .normal, sound: .mute)))
//        listofCounter.append(Counter(title: "Run A Mile", count: 100, id: 0, counterState: CounterState(speed: .normal, sound: .mute)))
//
        mListofCounters = listofCounter
    }
    
    
    
    // getter and setter
    
    public func getTitle()->[String]{
        
        return mListofCounters.map { (counter) -> String in
            return counter.mTitle
        }
        
    }
    
    public func getCount()->[Int]{
        
        return mListofCounters.map { (counter) -> Int in
            return counter.mCount
        }
        
    }
    
    
    public func getTotalCounter()->Int {
        return mListofCounters.count
        
    }
    
   
    
    
    
    
}
