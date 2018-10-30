//
//  CounterListViewModel.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/21/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class CounterListViewModel{
   
//    var mListofCounters =  [Counter]()
    var mListofCounters : Results<Counter>{

        didSet{
            datatoVc.onNext(mListofCounters)
        }
    }
    
//    var mListofCounters = [Counter]()
    var datatoVc :BehaviorSubject<Results<Counter>>
    
 
    init(){
        // get this model from the realm database and convert it into this model
        
        let persistantDataSingelton = PersistantDataManager.shared

         mListofCounters = persistantDataSingelton.fetchListOfCounters()
         datatoVc = BehaviorSubject<Results<Counter>>(value:mListofCounters)
        
        
//        let counter = Counter()
//        counter.mTitle = "Love"
//
//        let counterState = CounterState()
//
//        counter.mCounterState = counterState
//
//
//        mListofCounters.append(counter)

        

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
        
        // error
        
//         let persistantDataSingelton = PersistantDataManager.shared
        
        
        return mListofCounters.count
        
    }
    
    public  func persistCounter(counter: Counter){
        
       let persistantDataSingelton = PersistantDataManager.shared
        
        persistantDataSingelton.persistCounter(counter: counter)
        
        fetchAllCounter()
        
    }
    
    public  func fetchAllCounter(){
        
        let persistantDataSingelton = PersistantDataManager.shared
        
        mListofCounters = persistantDataSingelton.fetchListOfCounters()
    }
    
    
    
    
   
    
    
    
    
}
