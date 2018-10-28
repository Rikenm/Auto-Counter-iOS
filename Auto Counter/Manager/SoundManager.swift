//
//  SoundManager.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/27/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import Foundation
import AVFoundation



class SoundManager{
    
   var mAVSpeechUtterance: AVSpeechUtterance!
    init(){
     
    }
    
    
    func speak(stringToSpeak: String){
        mAVSpeechUtterance = AVSpeechUtterance(string: stringToSpeak)
        mAVSpeechUtterance.rate = 0.50
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(mAVSpeechUtterance)
        
        
    }
    
    
    
}
