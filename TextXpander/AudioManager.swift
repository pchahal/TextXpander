//
//  SoundEffects.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-13.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Foundation
import AVFoundation


class  AudioManager
{
    
    static let sharedInstance =  AudioManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        let url = Bundle.main.url(forResource: "Pop", withExtension: "aiff", subdirectory:"Sounds")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
}

