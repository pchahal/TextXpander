//
//  AppDelegate.swift
//  expander
//
//  Created by Pardeep Chahal on 2016-12-10.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Cocoa
import SwiftyBeaver

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        Test()
        
         
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    func Test()
    {
        
        /* var length = 0
         var expansion = TextManager.sharedInstance.getTextExpansion(key: 65, &length )
         expansion = TextManager.sharedInstance.getTextExpansion(key: 66, &length )
         
         
         
         return;*/
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

