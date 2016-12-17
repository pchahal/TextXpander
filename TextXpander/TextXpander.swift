//
//  EventManager.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-13.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//
import Foundation

class TextXpander{
    
    static let sharedInstance = TextXpander()
    var currentWord: String
    
    init()
    {
        currentWord = ""
    }
    
    
    func getTextExpansion(key: Int64, modifier: CGEventFlags, _ expansionLength: inout Int, _ shortcutLength: inout Int) -> UnsafeMutablePointer<UniChar>?
    {
    let keyStr = KeyCodeMap.sharedInstance.getUnicodeFromKey(key: key, modifier: modifier)
        currentWord += keyStr
        
        if KeyCodeMap.sharedInstance.isDelimeterKey(keyStr: keyStr)
        {
            currentWord = ""
            Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")
            return nil
        }
        else if KeyCodeMap.sharedInstance.isDelKey(key: key) && currentWord.characters.count > 0
        {
            currentWord.remove(at: currentWord.index(before: currentWord.endIndex))
            Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")

            return nil
        }
        else{
            Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")
        }
        
        if let expansion = Snippets.sharedInstance.snippetsDict[currentWord]?.expansion
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
