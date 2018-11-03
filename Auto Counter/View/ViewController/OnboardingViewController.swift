//
//  Onboarding.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/30/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit


class OnBoarding: UIViewController, Storyboarded, OnBoardingListener{
    
    
    
    var coordinator: Coordinator!
    
    
    var onBoardingScreens = [Onboarding]()
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        
        onBoardingScreens = createOnboardingScreens()
        
        
        
        setupScrollView(listofScreens: onBoardingScreens)
        
        
        pageControl.currentPage = 0
        
        pageControl.numberOfPages = 3
        
        
        
        
    }
    
    
    func createOnboardingScreens() -> [Onboarding] {
        
        let screen1: Onboarding = UIView.fromNib()
        
        screen1.addOnBoardingListener(onBoardingListner: self)
        
        screen1.imageView.image = UIImage(named: "onboarding-1")
        
        screen1.mainLabel.text = "Simply Create Counters"
        
        screen1.bodyLabel.text = "Start Counting using manual or automatic counts"
        
        screen1.skipBtn.isHidden = false
        
        //
        
        
        
        let screen2: Onboarding = UIView.fromNib()
        
        screen2.imageView.image = UIImage(named: "onboarding-2")
        screen2.addOnBoardingListener(onBoardingListner: self)
        
        screen2.mainLabel.text = "Automatic Counter"
        
        screen2.bodyLabel.text = "Some fixed timed periodic activities can be counted using timer."
        
        screen2.skipBtn.isHidden = false
        
        
        
        //
        
        
        let screen3: Onboarding = UIView.fromNib()
        
        screen3.imageView.image = UIImage(named: "onboarding-3")
        
        screen3.addOnBoardingListener(onBoardingListner: self)
        
        screen3.mainLabel.text = "Count with Sound"
        
        screen3.bodyLabel.text = "Just so that you know which step you are at "
        
        screen3.skipBtn.isHidden = false
        
        
        
        
        return [screen1,screen2,screen3]
        
        
        
        
        
        
        
        
    }
    
    
    func skippedClicked() {
        coordinator.start()
    }
    
    
    
    
    func setupScrollView(listofScreens: [Onboarding]){
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - UIScreen.main.bounds.height * 0.1)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(listofScreens.count), height: view.frame.height - UIScreen.main.bounds.height * 0.1)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< listofScreens.count {
            listofScreens[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height - UIScreen.main.bounds.height * 0.1)
            scrollView.addSubview(listofScreens[i])
        }
    }
    
}


extension OnBoarding: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        
        pageControl.currentPage = Int(pageIndex)
        
    }
}
