//
//  MainWindowController.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-30.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    convenience init()
    {
        self.init(windowNibName: "MainMenu")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
