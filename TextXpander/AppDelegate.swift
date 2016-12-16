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
        
           // HandleKeyPressEvents()
       
        
 
        Preferences.sharedInstance.Print()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    func HandleKeyPressEvents()
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



func myCGEventCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    
    if [.keyDown , .keyUp].contains(type) {
        
        let keyCode = event.getIntegerValueField(.keyboardEventKeycode)
      
        var expansionLength = 0
        var shortcutLength = 0
        if let aStr = TextManager.sharedInstance.getTextExpansion(key: keyCode, modifier: event.flags, &expansionLength, &shortcutLength)
        {
            
            //del shortcut number of characters,   example email->john@mail.com,  need to delete 5chars
            for _ in 0..<shortcutLength-1
            {
                let kv = CGEvent.init(keyboardEventSource: nil, virtualKey: 51, keyDown: true)
                kv!.tapPostEvent(proxy)               
            }
       
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

