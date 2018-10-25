//
//  RootCoordinator.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/20/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class RootCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
      
       
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: false)
        
    }
    
    func listToDetail(counter:Counter) {
        let vc = DetailViewController.instantiate()
        vc.coordinator = self
        vc.mCounter = counter
        navigationController.pushViewController(vc, animated: true)
        
    
    }
    
    
    
    

}
