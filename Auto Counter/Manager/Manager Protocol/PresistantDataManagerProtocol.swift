//
//  PresistantDataManagerProtocol.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/28/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import RealmSwift
protocol PresitantDataManagerProtocol{
    
   
    
    func persistCounter(counter: Counter) -> Bool!
    
    func persistAndUpdateCounter(counter: Counter) ->  Bool!
    
    func fetchListOfCounters()-> Results<Counter>!
    
    func fetchCounter(id:String) -> Counter!
    
    func checkIfinDb(counter:Counter) -> Bool!
    
    func deleteCounter(id:String) -> Bool!
    
    func isFirstVisit()-> Bool!
    
}
