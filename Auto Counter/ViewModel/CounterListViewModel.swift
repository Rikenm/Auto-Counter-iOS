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
        
        listofCounter.append(Counter(title: "Push up", count: 12, id: 0))
        listofCounter.append(Counter(title: "Sit up", count: 9, id: 0))
        listofCounter.append(Counter(title: "Pull up", count: 10, id: 0))
        listofCounter.append(Counter(title: "Push up", count: 1, id: 0))
        listofCounter.append(Counter(title: "Curls", count: 0, id: 0))
        listofCounter.append(Counter(title: "Run Mile", count: 3, id: 0))
    
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
