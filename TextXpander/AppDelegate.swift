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

    let statusItem = NSStatusBar.system().statusItem(withLength: -2)
    @IBOutlet weak var window: NSWindow!

   
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        AddMenu()
        
      // KeyboardEvents().HandleKeyPressEvents()
       
       // Preferences.sharedInstance.Print()
        //Snippets.sharedInstance
        
    
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your applicationPardeep pschahal@msn.com sfepar Pardeep
    }

    
    func AddMenu()
    {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = Selector(("printQuote:"))
        }
        let menu = NSMenu()
        
        
        menu.addItem(NSMenuItem(title: "Print Quote", action: #selector(AppDelegate.printQuote), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(AppDelegate.quit), keyEquivalent: "q"))
        
        statusItem.menu = menu

    }
    func printQuote() {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
        
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        
        
        
    }
    
    func quit()
    {
         NSApplication.shared().terminate(self)
    }

}
