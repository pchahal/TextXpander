//
//  KeyCode.swift
//  expander
//
//  Created by Pardeep Chahal on 2016-12-11.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Foundation
import Carbon.HIToolbox


class KeyCode{
    static let sharedInstance = KeyCode()
    
    func getUnicodeFromKey(key: Int64) -> String{
        
      
        
        if let code = keyDict[Int(key)]
        {
            return code
        }
        else
        {
            return ""
        }
    }

    let keyDict = [
        kVK_ANSI_A: "A",
        kVK_ANSI_S: "S",
        kVK_ANSI_D: "D",
        kVK_ANSI_F: "F",
        kVK_ANSI_H: "H",
        kVK_ANSI_G: "G",
        kVK_ANSI_Z: "Z",
        kVK_ANSI_X: "X",
        kVK_ANSI_C: "C",
        kVK_ANSI_V: "V",
        kVK_ANSI_B: "B",
        kVK_ANSI_Q: "Q",
        kVK_ANSI_W: "W",
        kVK_ANSI_E: "E",
        kVK_ANSI_R: "R",
        kVK_ANSI_Y: "Y",
        kVK_ANSI_T: "T",
        kVK_ANSI_1: "1",
        kVK_ANSI_2: "2",
        kVK_ANSI_3: "3",
        kVK_ANSI_4: "4",
        kVK_ANSI_6: "6",
        kVK_ANSI_5: "5",
        kVK_ANSI_Equal: "=",
        kVK_ANSI_9: "9",
        kVK_ANSI_7: "7",
        kVK_ANSI_Minus: "-",
        kVK_ANSI_8: "8",
        kVK_ANSI_0: "0",
        kVK_ANSI_RightBracket:"]",
        kVK_ANSI_O: "0",
        kVK_ANSI_U: "U",
        kVK_ANSI_LeftBracket:"[",
        kVK_ANSI_I: "I",
        kVK_ANSI_P: "P",
        kVK_ANSI_L: "L",
        kVK_ANSI_J: "J",
        kVK_ANSI_Quote:"'",
        kVK_ANSI_K: "K",
        kVK_ANSI_Semicolon:";",
        kVK_ANSI_Backslash:"",
        kVK_ANSI_Comma: ",",
        kVK_ANSI_Slash: "",
        kVK_ANSI_N: "N",
        kVK_ANSI_M: "M",
        kVK_ANSI_Period:".",
        kVK_ANSI_Grave: "`",
        kVK_ANSI_KeypadDecimal:".",
        kVK_ANSI_KeypadMultiply: "*",
        kVK_ANSI_KeypadPlus: "+",
        kVK_ANSI_KeypadClear: "",
        kVK_ANSI_KeypadDivide: "",
        kVK_ANSI_KeypadEnter: "",
        kVK_ANSI_KeypadMinus: "-",
        kVK_ANSI_KeypadEquals: "=",
        kVK_ANSI_Keypad0: "0",
        kVK_ANSI_Keypad1: "1",
        kVK_ANSI_Keypad2: "2",
        kVK_ANSI_Keypad3: "3",
        kVK_ANSI_Keypad4: "4",
        kVK_ANSI_Keypad5: "5",
        kVK_ANSI_Keypad6: "6",
        kVK_ANSI_Keypad7: "7",
        kVK_ANSI_Keypad8: "8",
        kVK_ANSI_Keypad9: "9",
    ]
}

