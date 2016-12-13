import Foundation

/*  TODO
 


 after succesful expansion send tapevent backspace*LengthOfExpansion
 bug Tab and arrow key is expanding
 
 
 
 
 
 
*/




class TextManager{
    
    static let sharedInstance = TextManager()
    
    let expansions = ["AB":"BA","PAR":"pardeep", "cha":"chahal", "email":"pschahal@msn.com","thx":"Thank You", "ABC":"CBA"]
    var currentWord: String
    
    
    init()
    {
        currentWord = ""
    }
    
    
    


    
    //return empty string if no match
    //par -> pardeep
    func getTextExpansion(key: Int64,_ expansionLength: inout Int, _ shortcutLength: inout Int) -> UnsafeMutablePointer<UniChar>?
    {

        
         Logger.sharedInstance.log.verbose("key=\(key)")
       
        let keyStr = KeyCode.sharedInstance.getUnicodeFromKey(key: key)
        if keyStr == " "
        {
            currentWord = ""
            return nil
        }
        if keyStr == "del" && currentWord.characters.count > 0
        {
            currentWord.remove(at: currentWord.index(before: currentWord.endIndex))
            return nil
        }
        
        
        currentWord += keyStr
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
