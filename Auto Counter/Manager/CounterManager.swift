//
//  CounterManager.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/23/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation


protocol Countlistener{
    
    func passValue(value:Int);
    
    
}

enum TypeOfCounter{
    case automatic
    case manaul
    
}

class CounterManager{
    
    
    var mCurrentValue: Int!
    var listeners: Countlistener!
    
    var timer: Timer!
    
    init(){
        
        
    }
    
   func configureManager(currentValue:Int){
        
        self.mCurrentValue = currentValue;
    
    }
    
    func addListener(countlistener:Countlistener){
     listeners=countlistener
    }
    
    func startCounter(mTypeOfCounter:TypeOfCounter,time:Int=0){
        
        switch (mTypeOfCounter){
        case .automatic:
            
            
            timer = Timer(timeInterval: TimeInterval(time), repeats: true, block: { [unowned self] (timer) in
                
               self.add()
                
            })
            
            
            
        case .manaul:
            add()
            
           
        }
        
        
    }
    
    func stopCounter(){
        timer = nil
        
        
    }
    
    
    func add(){
        
        if  self.mCurrentValue != nil{
            self.mCurrentValue!  += 1
            
        }
        if(self.listeners != nil){
            self.listeners.passValue(value:self.mCurrentValue!)
        }
        
        
    }
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
