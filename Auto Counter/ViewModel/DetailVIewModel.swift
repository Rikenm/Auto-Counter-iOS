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
    
    
    var mCounter:Counter
    var mCounterManager:CounterManager
    
    init(counter: Counter){
        mCounter = counter
        
        mCounterManager = CounterManager()
        countObservable =  BehaviorSubject<String>(value: String(counter.mCount))
        mCounterManager.addListener(countlistener: self)
        mCounterManager.configureManager(currentValue: Int(counter.mCount) )
       
        
    }
    
   func addCounter(){
        // vc triggers to add . u add and send it to the views
//        mCounter.mCount += 1
//        passValue(value: mCounter.mCount)
        
        mCounterManager.startCounter(mTypeOfCounter: .manaul)
        
        
    }
    
    
    
    
   
    func passValue(value: Int) {
        // send value to the views/VC
//         print(value)
        countObservable.onNext(String(value))
        
       //view.show(value)
    }
    
    
    
    
    
    
}
