//
//  EventManager.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-13.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//
import Foundation

/*  TODO


 
 FUTURE 
 insert time
 insert date/Users/par/Desktop/Settings.textexpander
 set delimeters
 Group Snippets
 kctranslatekey
 update software
 
 VERSION 2.O
 sort snippets
 filter snippets
 drm
 expansions in select apps
 iCloud sync
 image support
 emoji
 dictation
*/


class TextManager{
    
    static let sharedInstance = TextManager()
    
    let expansions = ["ab":"ba","par":"pardeep", "cha":"chahal", "email":"pschahal@msn.com","THX":"Thank You", "ABC":"cba","A":"B"]
    var currentWord: String
    
    
    init()
    {
        currentWord = ""
    }
    
    
    func getTextExpansion(key: Int64, modifier: CGEventFlags, _ expansionLength: inout Int, _ shortcutLength: inout Int) -> UnsafeMutablePointer<UniChar>?
    {
    let keyStr = KeyCode.sharedInstance.getUnicodeFromKey(key: key, modifier: modifier)
        currentWord += keyStr
        
        if KeyCode.sharedInstance.isDelimeterKey(key: key)
        {
            currentWord = ""
            Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")
            return nil
        }
        else if KeyCode.sharedInstance.isDelKey(key: key) && currentWord.characters.count > 0
        {
            currentWord.remove(at: currentWord.index(before: currentWord.endIndex))
            Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")

            return nil
        }
        else{
            Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")
        }
        
        if let expansion = expansions[currentWord]
        {
            AudioManager.sharedInstance.playSound()
            let array: [UInt16] = Array(expansion.utf16)
            shortcutLength = currentWord.characters.count
            expansionLength = array.count
            
            Logger.sharedInstance.log.verbose("key=\(key)  expansion=\(expansion)  expansionLength=\(expansionLength)    shortcutLength=\(shortcutLength)")
        
            
            var aStr = UnsafeMutablePointer<UniChar>.allocate(capacity: expansionLength)
          
            for character in array
            {
                aStr.initialize(to: character)
                aStr = aStr.advanced(by: 1)
            
            }
            
           aStr =  aStr.advanced(by: -array.count)
            
          currentWord = ""
            
          return aStr
        }
        
        else
        {
            return nil
        }
        
    }
    
    
  }
