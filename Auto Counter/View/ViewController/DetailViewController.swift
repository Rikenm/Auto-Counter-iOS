//
//  DetailViewController.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/23/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ManualViewListener, Storyboarded {
    
    
    @IBOutlet weak var segmentedControl: SegmentedControl!
    var coordinator:Coordinator!
    
    @IBOutlet weak var segmentedWidthControl: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    var mDetailViewModel: DetailViewModel!
    
    var mManualScreen:ManualScreen!
    
    var mCounter: Counter!{
        didSet{
            mDetailViewModel = DetailViewModel(counter: mCounter)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   DispatchQueue.main.async {
    
    self.segmentedWidthControl.constant = UIScreen.main.bounds.width/2
    self.segmentedControl.layoutIfNeeded()
//    self.segmentedControl.setNeedsUpdateConstraints()
    }
        addManualScreen()
        mDetailViewModel?.countObservable.subscribe(onNext: { count in
            print(count)
            self.mManualScreen.counterLabel.text = count
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func customSegmentedControlValueChanged(_ sender: SegmentedControl) {
        
        switch(sender.selectSegmentIndex){
        case 0:
            

            
             addManualScreen()
             break
            
        case 1:
           

             addManualScreen()
             break
            
            
        default:
            break
        }
        
    }
    
    
    func addCount() {
        mDetailViewModel.addCounter()
    }
    
    
    func addManualScreen(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        if(mManualScreen == nil){
            
            mManualScreen = UIView.fromNib()
            mManualScreen.addListener(manualViewListener: self)
            
            
        }
         mManualScreen.addListener(manualViewListener: self)
        containerView.subviews.forEach { $0.removeFromSuperview()}
        
        containerView.addSubview(mManualScreen)
        mManualScreen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mManualScreen.topAnchor.constraint(equalTo: containerView.topAnchor),
            mManualScreen.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            mManualScreen.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            mManualScreen.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        
        
        
        // inside the observable closure
        if(mManualScreen.counterLabel != nil){
            mManualScreen.counterLabel.text = String(mDetailViewModel.mCounter.mCount)
        }else{
            print("manual screen is nil")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
