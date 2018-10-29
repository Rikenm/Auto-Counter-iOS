//
//  PresistantDataManager.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/27/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import RealmSwift

class PersistantDataManager: PresitantDataManagerProtocol{
    
    
 
    // initiliaze realm object
     lazy var realm: Realm = try! Realm()
    
    init(){
      
    }
    

    
    func persistCounter(counter: Counter) -> Bool! {
         print("counterManager")
        
            do {
                try realm.write {
                    realm.add(counter, update: true)
                }
            }catch{
                return false
                
            }
            
            return true
        
        
    }
    
    func fetchListOfCounters() -> Results<Counter>! {
        
        
        return realm.objects(Counter.self)
    }
    
    func fetchCounter(id:String) -> Counter! {
        
        // only one element so I am sure
        
         return realm.objects(Counter.self).filter(NSPredicate(format: "mId = %@", id)).first
    }
    
    func checkIfinDb(counter:Counter) -> Bool!{
        
        if(fetchCounter(id: counter.mId) == nil){
            return false
        }else{
            return true
        }
    }
    
    func deleteCounter(id: String) -> Bool! {
        
        let item = realm.objects(Counter.self).filter(NSPredicate(format: "mId = %@", id)).first
        do{
            try realm.write {
                if let foundItem =  item{
                     realm.delete(foundItem)
                }
               
            }
            
        }catch{
            return false
        }
        
        
        return true
    }
    
    
    
    
    
    
}
