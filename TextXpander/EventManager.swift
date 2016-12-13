import Foundation


func myCGEventCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    
    if [.keyDown , .keyUp].contains(type) {
        
        let keyCode = event.getIntegerValueField(.keyboardEventKeycode)
       
       

       var expansionLength = 0
          if let aStr = TextManager.sharedInstance.getTextExpansion(key: keyCode,&expansionLength)
          {
            let k = CGEvent.init(keyboardEventSource: nil, virtualKey: 0, keyDown: true)
            k!.keyboardSetUnicodeString(stringLength: expansionLength, unicodeString: aStr)
            k!.tapPostEvent(proxy)
            
            
            return nil
            }
        else
          {
            return Unmanaged.passRetained(event)
            
        }
        
    }
    
    return Unmanaged.passRetained(event)
}






class TextManager{
    
    static let sharedInstance = TextManager()
    
    let expansions = ["AB":"BA","par":"pardeep", "cha":"chahal", "email":"pschahal@msn.com","thx":"Thank You", "ABC":"CBA"]
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
        
        currentWord += keyStr
        if let expansion = expansions[currentWord]
        {
            
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
    
    
    func Test()
    {
        
       let eventMask = (1 << CGEventType.keyDown.rawValue)
        guard let eventTap = CGEvent.tapCreate(tap: .cgSessionEventTap,
                                               place: .headInsertEventTap,
                                               options: .defaultTap,
                                               eventsOfInterest: CGEventMask(eventMask),
                                               callback: myCGEventCallback,
                                               userInfo: nil) else {
                                                print("failed to create event tap")
                                                exit(1)
        }
        
        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: eventTap, enable: true)
        CFRunLoopRun()
       
    }
}
