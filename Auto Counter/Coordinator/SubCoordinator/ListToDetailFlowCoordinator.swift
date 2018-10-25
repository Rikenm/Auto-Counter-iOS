//
//  ListToDetailFlowCoordinator.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/24/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class ListToDetailFLowCoordinator: Coordinator{
    func start() {
        //do nothing
        print("Do nothing")
    }
    
    
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func listToDetail(counter:Counter) {
        let vc = DetailViewController.instantiate()
        vc.coordinator = self
        vc.mCounter = counter
        navigationController.pushViewController(vc, animated: false)
        
        
        print("start")
    }
    
    
    
}
