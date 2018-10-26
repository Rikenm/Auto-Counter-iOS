//
//  AppDelegate.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/20/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: RootCoordinator?

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
//        UIApplication.shared.statusBarStyle = .lightContent
        let navController = UINavigationController()
        
        navController.navigationBar.barTintColor = UIColor.init(displayP3Red: 74/255, green: 73/255, blue: 73/255, alpha: 1)
        
        navController.navigationBar.isTranslucent = false
        
        
//        navController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
//        navController.navigationBar.topItem?.title = "Counter"
//
//        navController.navigationItem.title = "Counter"
        
//        let firstAttr: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 16),
//                                                       .foregroundColor: UIColor.blue]
//
//        let titleLabel = UILabel()
//
//        let attrString = NSMutableAttributedString(string: "Navigation", attributes: firstAttr)
//
//        titleLabel.attributedText = attrString
//
//        //finding the bounds of the attributed text and resizing the label accordingly
//        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: .greatestFiniteMagnitude)
//        titleLabel.frame.size = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size
//
        
        
//        navController.navigationItem.title = "Counter"
        navController.navigationBar.topItem?.title = "Counter"
        
//        let titleLabel = UILabel()
//
//        //attributes for the first part of the string
//        let firstAttr: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 16),
//                                                       .foregroundColor: UIColor.blue]
//
//        //attributes for the second part of the string
//        let secondAttr: [NSAttributedStringKey: Any] = [.font: UIFont.systemFont(ofSize: 16),
//                                                        .foregroundColor: UIColor.red]
//
//        //initializing the attributed string and appending the two parts together
//        let attrString = NSMutableAttributedString(string: "Navigation", attributes: firstAttr)
//        let secondAttrString = NSAttributedString(string: " Bar Title", attributes: secondAttr)
//        attrString.append(secondAttrString)
//
//        //setting the attributed string as an attributed text
//        titleLabel.attributedText = attrString
//
//        //finding the bounds of the attributed text and resizing the label accordingly
//        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: .greatestFiniteMagnitude)
//        titleLabel.frame.size = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size
//
//        //setting the label as the title view of the navigation bar
////        navigationItem.titleView = titleLabel
//
//
//
//        navController.navigationItem.titleView = titleLabel
        
        // send that into our coordinator so that it can display view controllers
        coordinator = RootCoordinator(navigationController: navController)
        
        // tell the coordinator to take over control
        coordinator?.start()
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    @objc func addTapped(){
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

