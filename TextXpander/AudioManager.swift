//
//  AudioManager.swift
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
    let url: URL
    
    init()
    {
        url = Bundle.main.url(forResource: "Pop", withExtension: "aiff", subdirectory:"Sounds")!
    }
    
    func playSound() {
        
        print(Preferences.sharedInstance.playSound)
        if (Preferences.sharedInstance.playSound)
        {
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
    
}

