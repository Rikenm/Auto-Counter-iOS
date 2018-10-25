//
//  Counter.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/21/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation

struct Counter{
    // model
    // data type
    
    var mTitle: String
    var mCount: Int
    var mId: Int
    
    init(title:String,count:Int, id: Int){
        mTitle = title
        mCount = count
        mId = id;
    }
    
}
