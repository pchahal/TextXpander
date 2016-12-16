//
//  Preferences.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-13.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import Carbon.HIToolbox



extension DefaultsKeys {
    static let expandAbbreviations = DefaultsKey<Bool>("expandAbbreviations")
    static let playSound = DefaultsKey<Bool>("playSound")
    static let expandAt = DefaultsKey<expandPosition?>("expandAt")
    static let delimeters = DefaultsKey<[Int]>("delimeters")
    
    
    
    static let caseSensitive = DefaultsKey<Bool>("caseSensitive")
    static let capitalizeSentences = DefaultsKey<Bool>("capitalizeSentences")
    static let showInMenu = DefaultsKey<Bool>("showInMenu")
    static let hideInDock = DefaultsKey<Bool>("hideInDock")
    static let launchAtLogin = DefaultsKey<Bool>("launchAtLogin")
    static let checkForUpdates = DefaultsKey<Bool>("checkForUpdates")
    
    
}

extension UserDefaults {
    subscript(key: DefaultsKey<expandPosition?>) -> expandPosition? {
        get { return unarchive(key) }
        set { archive(key, newValue) }
    }
}


enum expandPosition: Int {
    case Immediately = 0
    case AfterDelimeterRetain = 1
    case AfterDelimeterDestroy = 2
}

class Preferences {
    static let sharedInstance = Preferences()
    
    //---------------Expansion
    var expandAbbreviations: Bool {
        get {
            if !Defaults.hasKey(.expandAbbreviations)
            {
                Defaults[.expandAbbreviations] = true
                return Defaults[.expandAbbreviations]
            }
            else
            {
                return Defaults[.expandAbbreviations]
            }
        }
        set {
            Defaults[.expandAbbreviations] = newValue
        }
    }
    var expandAt: expandPosition {
        get {
            if  !Defaults.hasKey(.expandAt)
            {
                Defaults[.expandAt] = expandPosition.Immediately
                return Defaults[.expandAt]!
            }
            else
            {
                return Defaults[.expandAt]!
            }
        }
        set {
            Defaults[.expandAt] = newValue
        }
    }
    var delimeters:  [Int]
    {
        get {
            if  !Defaults.hasKey(.delimeters)
            {
                Defaults[.delimeters] = [kVK_Space,kVK_Tab]
                return Defaults[.delimeters]
            }
            else
            {
                return Defaults[.delimeters]
            }
        }
        set {
            Defaults[.delimeters] = newValue
        }
    }
    var playSound: Bool {
        get {
            if !Defaults.hasKey(.playSound)
            {
                Defaults[.playSound] = true
                return Defaults[.playSound]
            }
            else
            {
                return Defaults[.playSound]
            }
        }
        set {
            Defaults[.playSound] = newValue
        }
    }
    var caseSensitive: Bool {
        get {
            if !Defaults.hasKey(.caseSensitive)
            {
                Defaults[.caseSensitive] = true
                return Defaults[.caseSensitive]
            }
            else
            {
                return Defaults[.caseSensitive]
            }
        }
        set {
            Defaults[.caseSensitive] = newValue
        }
    }

    
    //----------------Options
    var capitalizeSentences: Bool {
        get {
            if !Defaults.hasKey(.capitalizeSentences)
            {
                Defaults[.capitalizeSentences] = true
                return Defaults[.capitalizeSentences]
            }
            else
            {
                return Defaults[.capitalizeSentences]
            }
        }
        set {
            Defaults[.capitalizeSentences] = newValue
        }
    }

    
    //Appearance
    var showInMenu: Bool {
        get {
            if !Defaults.hasKey(.showInMenu)
            {
                Defaults[.showInMenu] = true
                return Defaults[.showInMenu]
            }
            else
            {
                return Defaults[.showInMenu]
            }
        }
        set {
            Defaults[.showInMenu] = newValue
        }
    }
    var hideInDock: Bool {
        get {
            if !Defaults.hasKey(.hideInDock)
            {
                Defaults[.hideInDock] = true
                return Defaults[.hideInDock]
            }
            else
            {
                return Defaults[.hideInDock]
            }
        }
        set {
            Defaults[.hideInDock] = newValue
        }
    }
    var launchAtLogin: Bool {
        get {
            if !Defaults.hasKey(.launchAtLogin)
            {
                Defaults[.launchAtLogin] = true
                return Defaults[.launchAtLogin]
            }
            else
            {
                return Defaults[.launchAtLogin]
            }
        }
        set {
            Defaults[.launchAtLogin] = newValue
        }
    }
    var checkForUpdates: Bool {
        get {
            if !Defaults.hasKey(.checkForUpdates)
            {
                Defaults[.checkForUpdates] = true
                return Defaults[.checkForUpdates]
            }
            else
            {
                return Defaults[.checkForUpdates]
            }
        }
        set {
            Defaults[.checkForUpdates] = newValue
        }
    }
 
    func Print()
    {
        print(expandAbbreviations)
        print(Defaults[.playSound])
        print(expandAt)
        
        for i in delimeters {print (i)}
        print(playSound)
        print(caseSensitive)
        print(capitalizeSentences)
        print(showInMenu)
        print(hideInDock)
        print(launchAtLogin)
        print(checkForUpdates)
        
    }
    
    
}




