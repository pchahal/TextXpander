import Foundation

/*  TODO

 
 
 FUTURE 
 
 json file for snippets
 nsuserdefaults for prefs
 insert time
 insert date
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
    
    
    


    
    //return empty string if no match
    //par -> pardeep
    func getTextExpansion(key: Int64, modifier: CGEventFlags, _ expansionLength: inout Int, _ shortcutLength: inout Int) -> UnsafeMutablePointer<UniChar>?
    {

       
       
        let keyStr = KeyCode.sharedInstance.getUnicodeFromKey(key: key, modifier: modifier)
        currentWord += keyStr
        Logger.sharedInstance.log.verbose("key=\(key) curentword=\(currentWord)")

        if KeyCode.sharedInstance.isDelimeterKey(key: key)
        {
            currentWord = ""
            return nil
        }
        if KeyCode.sharedInstance.isDelKey(key: key) && currentWord.characters.count > 0
        {
            currentWord.remove(at: currentWord.index(before: currentWord.endIndex))
            return nil
        }
        
        
        
        if let expansion = expansions[currentWord]
        {
            AudioManager.sharedInstance.playSound()
            let array: [UInt16] = Array(expansion.utf16)
            shortcutLength = currentWord.characters.count
            expansionLength = array.count
            
            Logger.sharedInstance.log.verbose("key=\(key)  curentword=\(currentWord) expansion=\(expansion)  expansionLength=\(expansionLength)    shortcutLength=\(shortcutLength)")
        
            
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
