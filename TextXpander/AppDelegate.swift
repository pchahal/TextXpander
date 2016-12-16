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
        
        KeyboardEvents().HandleKeyPressEvents()
       
       // Preferences.sharedInstance.Print()
       // Snippets.sharedInstance
        
    
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
}
