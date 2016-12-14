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
    
    func getUnicodeFromKey(key: Int64, modifier: CGEventFlags) -> String{
        
        let shiftModifier = modifier.contains(CGEventFlags.maskShift)
        let controlModifier = modifier.contains(CGEventFlags.maskControl)
        let altModifier = modifier.contains(CGEventFlags.maskAlternate)
        let capsModifier = modifier.contains(CGEventFlags.maskAlphaShift)
        
 
        
        //Logger.sharedInstance.log.verbose("********** shift=\(shiftModifier) control=\(controlModifier) alt=\(altModifier) caps=\(capsModifier) ")

        
        if let code = keyDict[Int.init(exactly: key)!]
        {
            if (shiftModifier||capsModifier)
            {
                return code.uppercased()
            }
            else
            {
                return code
            }
        }
        else
        {
            return ""
        }
    }
    
    func isDelKey(key: Int64) -> Bool
    {
        if Int(key) == kVK_Delete
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func isDelimeterKey(key: Int64) -> Bool
    {
        if Int(key) == kVK_Space
        {
            return true
        }
        else
        {
            return false
        }
    }


    let keyDict = [
        kVK_ANSI_A: "a",
        kVK_ANSI_S: "s",
        kVK_ANSI_D: "d",
        kVK_ANSI_F: "f",
        kVK_ANSI_H: "h",
        kVK_ANSI_G: "g",
        kVK_ANSI_Z: "z",
        kVK_ANSI_X: "x",
        kVK_ANSI_C: "c",
        kVK_ANSI_V: "v",
        kVK_ANSI_B: "b",
        kVK_ANSI_Q: "q",
        kVK_ANSI_W: "w",
        kVK_ANSI_E: "e",
        kVK_ANSI_R: "r",
        kVK_ANSI_Y: "y",
        kVK_ANSI_T: "t",
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
        kVK_ANSI_U: "u",
        kVK_ANSI_LeftBracket:"[",
        kVK_ANSI_I: "i",
        kVK_ANSI_P: "p",
        kVK_ANSI_L: "l",
        kVK_ANSI_J: "j",
        kVK_ANSI_Quote:"'",
        kVK_ANSI_K: "k",
        kVK_ANSI_Semicolon:";",
        kVK_ANSI_Backslash:"",
        kVK_ANSI_Comma: ",",
        kVK_ANSI_Slash: "",
        kVK_ANSI_N: "n",
        kVK_ANSI_M: "m",
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
        
        //
    /* keycodes for keys that are independent of keyboard layout*/
    
    //kVK_Return:
    //kVK_Tab:
    kVK_Space:  " ",
    kVK_Delete: "",
   /* kVK_Escape:
    kVK_Command:  
    kVK_Shift:  
    kVK_CapsLock:  
    kVK_Option:  
    kVK_Control:  
    kVK_RightCommand:  
    kVK_RightShift:  
    kVK_RightOption:  
    kVK_RightControl:  
    kVK_Function:  
    kVK_F17:  
    kVK_VolumeUp:  
    kVK_VolumeDown:  
    kVK_Mute:  
    kVK_F18:  
    kVK_F19:  
    kVK_F20:  
    kVK_F5:  
    kVK_F6:  
    kVK_F7:  
    kVK_F3:  
    kVK_F8:  
    kVK_F9:  
    kVK_F11:  
    kVK_F13:  
    kVK_F16:  
    kVK_F14:
    kVK_F10:  
    kVK_F12:  
    kVK_F15:  
    kVK_Help:  
    kVK_Home:  
    kVK_PageUp:  
    kVK_ForwardDelete:  
    kVK_F4:  
    kVK_End:  
    kVK_F2:  
    kVK_PageDown:  
    kVK_F1:  
    kVK_LeftArrow:  
    kVK_RightArrow:  
    kVK_DownArrow:  
    kVK_UpArrow:  */
]
    
}

