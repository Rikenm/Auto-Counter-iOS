//
//  DetailViewController.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/23/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ManualViewListener, AutomaticViewListener,Storyboarded {

    @IBOutlet weak var segmentedControl: SegmentedControl!
    var coordinator:Coordinator!
    
    @IBOutlet weak var segmentedWidthControl: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    var mDetailViewModel: DetailViewModel!
    
    var mManualScreen:ManualScreen!
    var mAutomaticScreen: AutomaticScreen!
    
    var mCounter: Counter!{
        didSet{
            mDetailViewModel = DetailViewModel(counter: mCounter)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        setupNavbar()
        setupViews()
        addAutomaticScreen()
        
        
        
       
        
        
        mDetailViewModel?.singalStateToView.subscribe(onNext:{
            mCounterState in
            print(" counter state")
            
            
//            self.mAutomaticScreen.
            // change mute/unmute icon in the both the views
            self.mAutomaticScreen.changeSoundIcon(soundState: mCounterState.mSound)
            self.mManualScreen?.changeSoundIcon(soundState: mCounterState.mSound)
            
            
            
            //change speedstate icon
            self.mAutomaticScreen.changeSpeedIcon(speedState: mCounterState.mSpeed)
            
            
            
        })
  
        
    }
    
    func setupViews(){
        if(mManualScreen == nil){
            
            mManualScreen = UIView.fromNib()
            mManualScreen.addListener(manualViewListener: self)
            mDetailViewModel?.countObservable.subscribe(onNext: { count in
                print("manual",count)
                self.mManualScreen.counterLabel.text = count
                
            })
            
            
        }
        
        if(mAutomaticScreen == nil){
            
            mAutomaticScreen = UIView.fromNib()
            mAutomaticScreen.addAutomaticViewListener(automaticViewListener: self)
            mDetailViewModel?.countObservable.subscribe(onNext: { count in
                print("automatic",count)
                self.mAutomaticScreen.counterLabel.text = count
            })
            
        }
        
        
    
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func customSegmentedControlValueChanged(_ sender: SegmentedControl) {
        
        switch(sender.selectSegmentIndex){
        case 0:
            

             addAutomaticScreen()
             break
            
        case 1:
           
              pauseButtonClicked()
             addManualScreen()
             break
            
            
        default:
            break
        }
        
    }
    /**  TODO:
     -Method from  View and ViewControl protocol.
     **/
    
    func addCountManual() {
        mDetailViewModel.addCounter(mTypeOfCounter:.manaul)
    }
    
    
    /**  TODO:
     -Method from View and ViewControl protocol.
     **/
    func addCountAutomatic(){
        
        mDetailViewModel.addCounter(mTypeOfCounter:.automatic)
    }
    

    func addManualScreen(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
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
    
    
    
    func addAutomaticScreen(){
      setupViews()
      
        containerView.subviews.forEach { $0.removeFromSuperview()}
        
        containerView.addSubview(mAutomaticScreen)
        mAutomaticScreen.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mAutomaticScreen.topAnchor.constraint(equalTo: containerView.topAnchor),
            mAutomaticScreen.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            mAutomaticScreen.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            mAutomaticScreen.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        
        
        
//         inside the observable closure
        if(mAutomaticScreen.counterLabel != nil){
            mAutomaticScreen.counterLabel.text = String(mDetailViewModel.mCounter.mCount)
        }else{
            print("manual screen is nil")
        }
    }
    
    public func setupNavbar(){
        
        
      
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        let titleLabel = UILabel()
        
        //attributes for the first part of the string
        let firstAttr: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 20),
                                                        .foregroundColor: UIColor.white]
        
        
        let attrString = NSMutableAttributedString(string: mDetailViewModel?.mCounter.mTitle ?? "Item", attributes: firstAttr)
        
        titleLabel.attributedText = attrString
        
        //finding the bounds of the attributed text and resizing the label accordingly
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: .greatestFiniteMagnitude)
        titleLabel.frame.size = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size
        
        //setting the label as the title view of the navigation bar
        navigationItem.titleView = titleLabel
    }
    
    func playButtonClicked() {
        //get from view to vc
      mDetailViewModel.onPlay()
        
       
    }
    
    func pauseButtonClicked() {
        //get from view to vc
        // called when view events or when we change the segmented control
        mDetailViewModel.onPause()
        mAutomaticScreen.stopPulse()
    }
    
    func stateChangedSpeed(speed: SpeedState, play: PlayState) {
        mDetailViewModel?.stateChangedSpeed(speed: speed, playState: play)
    }
    
    func stateChangedSound(mute: SoundState,play: PlayState) {
        mDetailViewModel?.stateChangedSound(mute: mute, playState: play)
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // call the pause in the view model
        pause()
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
