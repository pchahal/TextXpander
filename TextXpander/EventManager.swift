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
    func getTextExpansion(key: Int64,_ length: inout Int) -> UnsafeMutablePointer<UniChar>?
    {

        
        Logger.sharedInstance.log.verbose("key=\(key)   curentword=\(currentWord)")
       
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
            currentWord = ""
            AudioManager.sharedInstance.playSound()
            Logger.sharedInstance.log.verbose("expansion=\(expansion)")

           let array: [UInt16] = Array(expansion.utf16)
            length = array.count
            var aStr = UnsafeMutablePointer<UniChar>.allocate(capacity: length)
          
            for character in array
            {
                aStr.initialize(to: character)
                aStr = aStr.advanced(by: 1)
            
            }
            
           aStr =  aStr.advanced(by: -array.count)
            
             return aStr
           
        }
        
        else
        {
          
            return nil
            }
        
    }
    
    
  }
