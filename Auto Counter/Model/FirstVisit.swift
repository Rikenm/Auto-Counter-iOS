//
//  FirstVisit.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/30/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import RealmSwift

class FirstVisit: Object{
    
    @objc dynamic var isFirstVisit: Bool = true
}
